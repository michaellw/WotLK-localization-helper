import os
import re
import shutil
import sys
import mysql.connector
import pandas as pd
from config import config
from utils import create_pattern_table, insert_pattern, update_garbled_text

t_lang = config.T_LANG
db_config = config.DB_CONFIG
sql_dir = config.SQL_DIR

# Tables and columns to export
tables_and_columns = {
    'achievement_reward': ['ID', 'Subject', 'Body'],
    'achievement_reward_locale': ['ID', 'Subject', 'Text'],

    'acore_string': ['Entry', 'Content_Default'],
    'areatrigger_tavern': ['ID', 'Name'],
    'areatrigger_teleport': ['ID', 'Name'],

    'broadcast_text': ['ID', 'MaleText', 'FemaleText'],
    'broadcast_text_locale': ['ID', 'MaleText', 'FemaleText'],

    'creature_template': ['Entry', 'Name', 'Subname'],
    'creature_template_locale': ['Entry', 'Name', 'Title'],

    'creature_text': ['CreatureID', 'GroupID', 'ID', 'Text'],
    'creature_text_locale': ['CreatureID', 'GroupID', 'ID', 'Text'],

    'gameobject_template': ['Entry', 'Name', 'CastBarCaption'],
    'gameobject_template_locale': ['Entry', 'Name', 'CastBarCaption'],

    'gossip_menu_option': ['MenuID', 'OptionID', 'OptionText'],
    'gossip_menu_option_locale': ['MenuID', 'OptionID', 'OptionText'],

    'item_set_names': ['Entry', 'Name'],
    'item_set_names_locale': ['ID', 'Name'],

    'item_template': ['Entry', 'Name', 'Description'],
    'item_template_locale': ['ID', 'Name', 'Description'],

    'npc_text': [
        'ID', 'Text0_0', 'Text0_1', 'Text1_0', 'Text1_1', 'Text2_0', 'Text2_1',
        'Text3_0', 'Text3_1', 'Text4_0', 'Text4_1', 'Text5_0', 'Text5_1',
        'Text6_0', 'Text6_1', 'Text7_0', 'Text7_1'
    ],
    'npc_text_locale': [
        'ID', 'Text0_0', 'Text0_1', 'Text1_0', 'Text1_1', 'Text2_0', 'Text2_1',
        'Text3_0', 'Text3_1', 'Text4_0', 'Text4_1', 'Text5_0', 'Text5_1',
        'Text6_0', 'Text6_1', 'Text7_0', 'Text7_1'
    ],

    'page_text': ['ID', 'Text'],
    'page_text_locale': ['ID', 'Text'],

    'pet_name_generation': ['ID', 'Word'],
    'pet_name_generation_locale': ['ID', 'Word'],

    'points_of_interest': ['ID', 'Name'],
    'points_of_interest_locale': ['ID', 'Name'],

    'quest_greeting': ['ID', 'Greeting'],
    'quest_greeting_locale': ['ID', 'Greeting'],

    'quest_offer_reward': ['ID', 'RewardText'],
    'quest_offer_reward_locale': ['ID', 'RewardText'],

    'quest_request_items': ['ID', 'CompletionText'],
    'quest_request_items_locale': ['ID', 'CompletionText'],

    'quest_template': [
        'ID', 'LogTitle', 'LogDescription', 'QuestDescription', 'AreaDescription',
        'QuestCompletionLog', 'ObjectiveText1', 'ObjectiveText2', 'ObjectiveText3',
        'ObjectiveText4'
    ],
    'quest_template_locale': [
        'ID', 'Title', 'Objectives', 'Details', 'EndText', 'CompletedText',
        'ObjectiveText1', 'ObjectiveText2', 'ObjectiveText3', 'ObjectiveText4'
    ]
}

def fix_garbled_text_in_database():
    print(f"Fixing garbled code...")
    conn = mysql.connector.connect(**db_config)
    create_pattern_table(conn)

    # Insert common garbled patterns
    patterns = [
        '%å%', '%æ%', '%è%', '%ç%', '%ñ%', '%ø%', '%ð%', '%þ%', '%ì%',
        '%ÐŸ%', '%Ð¾%', '%Ð¼%', '%Ð³%', '%Ð¸%', '%Ñ‚%', '%Ðµ%'
    ]
    for pattern in patterns:
        insert_pattern(conn, pattern)

    locale_tables = {
        table: columns for table, columns in tables_and_columns.items() if table.endswith('locale')
    }

    for table, columns in locale_tables.items():
        update_garbled_text(conn, table, columns, t_lang)

    conn.close()

def escape_string(value):
    return value.replace("'", "''") if value else value

def fetch_data(table, columns):
    conn = mysql.connector.connect(**db_config)
    columns_str = ', '.join(columns)
    if table.endswith('_locale'):
        if table.startswith("creature_text"):
            query = (
                f"SELECT {columns_str} FROM {table} "
                f"WHERE locale='{t_lang}' AND {columns[1]}={columns[1]} "
                f"AND {columns[2]}={columns[2]} "
                f"ORDER BY {columns[0]}"
            )
        elif table.startswith("gossip_menu_option"):
            query = (
                f"SELECT {columns_str} FROM {table} "
                f"WHERE locale='{t_lang}' AND {columns[1]}={columns[1]} "
                f"ORDER BY {columns[0]}"
            )
        else:
            query = (
                f"SELECT {columns_str} FROM {table} "
                f"WHERE locale='{t_lang}' "
                f"ORDER BY {columns[0]}"
            )
    else:
        if table == "creature_text":
            query = (
                f"SELECT {columns_str} FROM {table} "
                f"WHERE {columns[1]}={columns[1]} AND {columns[2]}={columns[2]} "
                f"ORDER BY {columns[0]}"
            )
        elif table == "gossip_menu_option":
            query = (
                f"SELECT {columns_str} FROM {table} "
                f"WHERE {columns[1]}={columns[1]} "
                f"ORDER BY {columns[0]}"
            )
        else:
            query = f"SELECT {columns_str} FROM {table} ORDER BY {columns[0]}"

    with conn.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    return results

def format_sql_statements(table, columns, results):
    if table.startswith("creature_text"):
        update_statements = [
            f"UPDATE {table} SET " +
            ', '.join([
                f"{col}='{escape_string(value)}'"
                for col, value in zip(columns[3:], row[3:])
            ]) +
            f" WHERE {columns[0]}={row[0]} AND {columns[1]}={row[1]} AND {columns[2]}={row[2]};"
            for row in results
        ]
    elif table.startswith("gossip_menu_option"):
        update_statements = [
            f"UPDATE {table} SET " +
            ', '.join([
                f"{col}='{escape_string(value)}'"
                for col, value in zip(columns[2:], row[2:])
            ]) +
            f" WHERE {columns[0]}={row[0]} AND {columns[1]}={row[1]};"
            for row in results]
    else:
        update_statements = [
            f"UPDATE {table} SET " +
            ', '.join([
                f"{col}='{escape_string(value)}'"
                for col, value in zip(columns[1:], row[1:])
            ]) +
            f" WHERE {columns[0]}={row[0]};"
            for row in results]
    return update_statements

def save_to_sql_file(update_statements, file_path):
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    with open(file_path, 'w', encoding='utf-8') as file:
        file.writelines(statement + '\n' for statement in update_statements)

def process_locale_file(locale_file, non_locale_table, non_locale_columns):
    t_lang_file = locale_file.replace('locale', f'{t_lang}')
    shutil.move(locale_file, t_lang_file)
    with open(t_lang_file, 'r', encoding='utf-8') as t_lang_file:
        content = t_lang_file.read()

    # Replace column names
    for loc_col, non_loc_col in zip(
        tables_and_columns[non_locale_table + '_locale'],
        non_locale_columns):
        content = content.replace(f"{loc_col}=", f"{non_loc_col}=")

    # Replace table name
    content = content.replace(non_locale_table + '_locale', non_locale_table)

    # Fix 'zhTW' string escaping
    if t_lang == 'zhTW':
        content = content.replace("\\'", "'")

    with open(t_lang_file.name, 'w', encoding='utf-8') as t_lang_file:
        t_lang_file.write(content)

    print(f"Successfully exported {t_lang_file.name}")

def export_localized_tables():
    os.makedirs(sql_dir, exist_ok=True)
    print(f"Exporting the localized tables...")

    for table, columns in tables_and_columns.items():
        results = fetch_data(table, columns)

        # Export as SQL file
        update_statements = format_sql_statements(table, columns, results)
        sql_file = os.path.join(sql_dir, f"{table}.sql")
        save_to_sql_file(update_statements, sql_file)

        if table.endswith('_locale'):
            base_table = table.replace('_locale', '')
            if base_table in tables_and_columns:
                process_locale_file(sql_file, base_table, tables_and_columns[base_table])

def split_statements(sql):
    return re.split(
        r';\s*(?=\b(?:CREATE|ALTER|DROP|INSERT|UPDATE|DELETE|SELECT|CALL|BEGIN|END)\b)',
        sql
    )

def import_sql_files(all=False):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    files = os.listdir(sql_dir)
    if all:
        files = [
            file for file in files
            if file.endswith('.sql') and not file.endswith(f'_{t_lang}.sql')
        ]
    else:
        files = [file for file in files if file.endswith(f'_{t_lang}.sql')]
    total_files = len(files)
    processed_files = 0
    for file in files:
        file_path = os.path.join(sql_dir, file)
        print(f"Importing: {file}")

        with open(file_path, 'r', encoding='utf-8') as file:
            sql = file.read()

        statements = split_statements(sql)
        for statement in statements:
            if statement.strip():
                cursor.execute(statement)

        conn.commit()

        processed_files += 1
        sys.stdout.write(f"\r({processed_files}/{total_files}) {os.path.basename(file.name)} \
            imported successfully!.\n")
        sys.stdout.flush()

    cursor.close()
    conn.close()

def run_export_locale_tables():
    if t_lang in ['zhCN', 'zhTW', 'ruRU', 'koKR']:
        fix_garbled_text_in_database()
    export_localized_tables()

def import_all_sql_files():
    import_sql_files(all=True)

def export_tables_and_columns_to_csv():
    conn = mysql.connector.connect(**db_config)
    os.makedirs(sql_dir, exist_ok=True)

    for table, columns in tables_and_columns.items():
        # Construct the query statement
        columns_str = ', '.join(columns)
        query = f"SELECT {columns_str} FROM {table}"

        df = pd.read_sql(query, conn)
        first_column = df.columns[0]
        df = df.sort_values(by=first_column)

        csv_file = f"{sql_dir}/{table}.csv"
        df.to_csv(csv_file, index=False)
        print(f"Successfully exported {csv_file}.")

    conn.close()

alias_to_function = {
    'export': run_export_locale_tables,
    'import': import_sql_files,
    'import_all': import_all_sql_files,
    'export_csv': export_tables_and_columns_to_csv,
    'fix': fix_garbled_text_in_database
}

if __name__ == "__main__":
    if len(sys.argv) > 1:
        alias = sys.argv[1]
        func = alias_to_function.get(alias)
        if func:
            func()
        else:
            print(f"Alias '{alias}' not found.")
    else:
        print("Please provide an alias as an argument.")

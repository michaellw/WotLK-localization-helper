import json
import os
import re
import pandas as pd
import shutil
from datetime import datetime
from typing import List, Dict, Optional
from mysql.connector import Error
from config import config

t_lang = config.T_LANG
c_lang = config.C_LANG
ref_build = config.REF_BUILD
string_searching_dict = config.STRING_SEARCHING_DICT

def filter_and_save_csv_files(source_dir, target_dir, locales, listfile):
    print(f"Filtering CSV files...")
    os.makedirs(target_dir, exist_ok=True)
    os.makedirs(os.path.dirname(listfile), exist_ok=True)
    saved_files = []

    for filename in os.listdir(source_dir):
        if filename.endswith('.csv'):
            file_path = os.path.join(source_dir, filename)
            df = pd.read_csv(file_path, low_memory=False)

            # Check if the column names contain '_lang' or any of the locales from the list
            contains_lang = any('_lang' in col.lower() for col in df.columns)
            contains_locale = any(any(locale in col for locale in locales) for col in df.columns)
            if contains_lang or contains_locale:
                target_path = os.path.join(target_dir, filename)
                df.to_csv(target_path, index=False)
                file_name_without_ext = os.path.splitext(filename)[0]
                saved_files.append(file_name_without_ext)

    with open(listfile, 'w') as file:
        for name in saved_files:
            file.write(f"{name}\n")

    print(f"The files has been saved to {target_dir}.")

def get_csv_files(listfile):
    with open(listfile, 'r') as file:
        lines = file.readlines()

    items = [line.strip() for line in lines]
    return items

def get_target_lang_end(t_lang):
    lang_mapping = {
        'enUS': '_enUS',
        'zhCN': '_deDE',
        'zhTW': '_enCN',
        'deDE': '_frFR',
        'esES': '_zhCN',
        'esMX': '_enTW',
        'frFR': '_koKR',
        'koKR': '_enGB',
        'ruRU': '_zhTW',
    }
    return lang_mapping.get(t_lang, '')

def find_and_remove_duplicate_definitions(lua_file):
    with open(lua_file, 'r', encoding='utf-8') as file:
        lua_content = file.readlines()

    # Regex matching for Lua parameter definition
    pattern = re.compile(r'(\w+)\s*=\s*"(.*)";')

    param_dict = {}
    lines_to_remove = []
    has_duplicate = False

    for line_num, line in enumerate(lua_content):
        match = pattern.match(line)
        if match:
            param_name, param_value = match.groups()
            param_name = param_name.strip()
            param_value = param_value.strip()

            if param_name in param_dict:
                if param_dict[param_name]['value'] == param_value:
                    lines_to_remove.append(line_num)
                else:
                    has_duplicate = True
                    print(f"{param_name} is defined multiple times with different values:")
                    print(f"Def-1: {param_dict[param_name]['definition']} on \
                        line {param_dict[param_name]['line'] + 1}")
                    print(f"Def-2: {line.strip()} on line {line_num + 1}")
            else:
                param_dict[param_name] = {
                    'value': param_value,
                    'definition': line.strip(),
                    'line': line_num
                }

    for line_num in sorted(lines_to_remove, reverse=True):
        del lua_content[line_num]

    with open(lua_file, 'w', encoding='utf-8') as file:
        file.writelines(lua_content)

    return has_duplicate

def read_lua_file(lua_file):
    """
    Read the Lua file and return a dictionary of parameter names and parameter values.
    """
    with open(lua_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    params = {}
    for line in lines:
        line = line.strip()
        if line.startswith("--") or line == "":
            continue
        match = re.match(r'(\w+)\s*=\s*"(.*)";', line)
        if match:
            param_name = match.group(1)
            param_value = match.group(2)
            params[param_name] = param_value
    return lines, params

def compare_and_generate_diff(
    c_lang_retail,
    c_lang_repack,
    t_lang_retail,
    t_lang_repack,
    diff_json,
    lang):

    def backup_diff_file(diff_json):
        if os.path.exists(diff_json):
            last_modified_time = os.path.getmtime(diff_json)
            backup_suffix = datetime.fromtimestamp(last_modified_time).strftime('_%Y%m%d_%H%M')
            backup_file = diff_json.replace('.json', backup_suffix + '.json')

            file_dir, file_name = os.path.split(diff_json)
            file_base_name = file_name.replace('.json', '')
            timestamp_pattern = re.compile(f'{file_base_name}_(\\d{{8}}_\\d{{4}})\\.json')

            backup_files = [
                f for f in os.listdir(file_dir) 
                if timestamp_pattern.match(f)
            ]
            latest_backup_file = None

            if backup_files:
                latest_backup = max(
                    backup_files, 
                    key=lambda f: datetime.strptime(
                        timestamp_pattern.match(f).group(1),
                        '%Y%m%d_%H%M'
                    )
                )
                latest_backup_file = os.path.join(file_dir, latest_backup)

            # Check if 'diff_json' is backed up, if not then back it up
            if not latest_backup_file or latest_backup_file != backup_file:
                shutil.copy2(diff_json, backup_file)

            with open(backup_file, 'r', encoding='utf-8') as backup_json_file:
                return json.load(backup_json_file)
        return []

    def find_and_update_param(
        param_name,
        search_value,
        c_lang_retail_params,
        t_lang_retail_params,
        string_searching_dict,
        diff_params):

        match_value = ''
        if param_name in c_lang_retail_params:
            if search_value == c_lang_retail_params[param_name]:
                return t_lang_retail_params.get(param_name, search_value)
            else:
                match_value = find_value_in_csv('GlobalStrings.lua', string_searching_dict, search_value)
                if match_value:
                    return match_value
                else:
                    diff_params.append({
                        "text": param_name,
                        f"{c_lang}_retail": c_lang_retail_params[param_name],
                        f"{lang}_retail": t_lang_retail_params.get(param_name, ""),
                        f"{c_lang}": search_value,
                        f"{lang}": ""  # Your localized texts
                    })
        else:
            match_value = find_value_in_csv('GlobalStrings.lua', string_searching_dict, search_value)
            if match_value:
                return match_value
            else:
                diff_params.append({
                    "text": param_name,
                    f"{c_lang}": search_value,
                    f"{lang}": ""  # Your localized texts
                })
        return search_value

    os.makedirs(os.path.dirname(diff_json), exist_ok=True)
    os.makedirs(os.path.dirname(t_lang_repack), exist_ok=True)

    old_params = backup_diff_file(diff_json)

    _, c_lang_retail_params = read_lua_file(c_lang_retail)
    _, c_lang_repack_params = read_lua_file(c_lang_repack)
    _, t_lang_retail_params = read_lua_file(t_lang_retail)

    diff_params = []

    for param_name, search_value in c_lang_repack_params.items():
        if old_params:
            for old_param in old_params:
                if (
                    old_param.get(f"{c_lang}") == search_value 
                    and old_param.get("text") == param_name
                ):
                    diff_params.append(old_param)
                    break
            else:
                c_lang_repack_params[param_name] = find_and_update_param(
                    param_name,
                    search_value,
                    c_lang_retail_params,
                    t_lang_retail_params,
                    string_searching_dict,
                    diff_params
                )
        else:
            c_lang_repack_params[param_name] = find_and_update_param(
                param_name,
                search_value,
                c_lang_retail_params,
                t_lang_retail_params,
                string_searching_dict,
                diff_params
            )

    diff_params_sorted = sorted(
        diff_params,
        key=lambda x: list(c_lang_repack_params.keys()).index(x["text"])
    )

    if diff_params_sorted != old_params:
        with open(diff_json, 'w', encoding='utf-8') as json_file:
            json.dump(diff_params_sorted, json_file, indent=4, ensure_ascii=False)

        with open(t_lang_repack, 'w', encoding='utf-8') as lua_file:
            for param_name, value in c_lang_repack_params.items():
                lua_file.write(f'{param_name} = "{value}";\n')

        print(f"Parameters are extracted to {diff_json}.")
    else:
        print("No change in parameters.")

def update_lua_file_in_place(lua_file, diff_json, lang):
    with open(diff_json, 'r', encoding='utf-8') as json_file:
        changes = json.load(json_file)

    lines, params = read_lua_file(lua_file)

    # Update the Lua file based on the JSON file
    for change in changes:
        param_name = change['text']
        t_lang_value = change[f'{lang}']
        c_lang_value = change[f'{c_lang}']
        new_value = t_lang_value if t_lang_value else c_lang_value

        if param_name in params:
            params[param_name] = new_value

    # Write the updated content back to the Lua file
    with open(lua_file, 'w', encoding='utf-8') as file:
        for line in lines:
            line = line.strip()
            match = re.match(r'(\w+)\s*=\s*"(.*)";', line)
            if match:
                param_name = match.group(1)
                if param_name in params:
                    file.write(f'{param_name} = "{params[param_name]}";\n')
                else:
                    file.write(line + '\n')
            else:
                file.write(line + '\n')

    print(f"Update of {lua_file} completed.")

def csv_to_dict(csv_file: str, lang: str) -> Dict:
    """
    Convert the CSV file to a dictionary.
    """
    df = pd.read_csv(csv_file, low_memory=False)
    new_columns = {col: f"{col}_{lang}" if col != 'ID' else col for col in df.columns}
    df.rename(columns=new_columns, inplace=True)
    return df.to_dict(orient='list')

def merge_dicts(dict1: Dict, dict2: Dict) -> Dict:
    """
    Merge two dictionaries by adding all key-value pairs into a single dictionary.
    """
    merged_dict = dict1.copy()
    for key, value in dict2.items():
        merged_dict[key] = value  # Add or update key-value pairs
    return merged_dict

def load_groups(files: List[str]) -> List[Dict]:
    """
    Load multiple CSV files and merge them into a dictionary.
    """
    merged_dicts = []
    c_lang_csv_dir = f'./Data/Retail/{ref_build}/{c_lang}'
    t_lang_csv_dir = f'./Data/Retail/{ref_build}/{t_lang}'
    for file in files:
        c_lang_file = os.path.join(c_lang_csv_dir, file)
        t_lang_file = os.path.join(t_lang_csv_dir, file)
        if os.path.exists(c_lang_file) and os.path.exists(t_lang_file):
            dict_c_lang = csv_to_dict(c_lang_file, c_lang)
            dict_t_lang = csv_to_dict(t_lang_file, t_lang)
            merged_dict = merge_dicts(dict_c_lang, dict_t_lang)
            merged_dicts.append(merged_dict)
    return merged_dicts

def find_value_in_groups(groups: List[Dict], search_value: str, column: str) -> List[str]:
    """
    Search for the specified value in multiple merged dictionaries and \
    return the corresponding 't_lang' value.
    """
    results = []
    for group in groups:
        column_t_lang = column.replace(f'{c_lang}', f'{t_lang}')
        if column in group and column_t_lang in group:
            indices = [i for i, value in enumerate(group[column]) if value == search_value]
            for index in indices:
                results.append(group[column_t_lang][index])
    return results

def find_first_value_in_groups(groups: List[Dict], search_value: str, column: str) -> Optional[str]:
    """
    Search for the first occurrence of the specified value in multiple merged dictionaries and \
    return the corresponding 't_lang' value.
    """
    for group in groups:
        column_t_lang = column.replace(f'{c_lang}', f'{t_lang}')
        if column in group and column_t_lang in group:
            for index, value in enumerate(group[column]):
                if value == search_value:
                    return group[column_t_lang][index]

def find_value_in_csv(c_lang_file, string_searching_dict, search_value):
    for file, search_files_info in string_searching_dict.items():
        if file == c_lang_file:
            for search_file, column in search_files_info.items():
                c_lang_file_path = f'./Data/Retail/{ref_build}/{c_lang}/{search_file}'
                t_lang_file_path = f'./Data/Retail/{ref_build}/{t_lang}/{search_file}'

                df_c_lang = pd.read_csv(c_lang_file_path, low_memory=False)
                df_t_lang = pd.read_csv(t_lang_file_path, low_memory=False)

                for index, value in enumerate(df_c_lang[column]):
                    if value == search_value:
                        return df_t_lang.at[index, column]

def create_pattern_table(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS garbled_patterns (
            id INT AUTO_INCREMENT PRIMARY KEY,
            pattern VARCHAR(10) UNIQUE
        ) COLLATE utf8mb4_general_ci
        """)
        connection.commit()
        print("A garbled mode table has been created or already exists.")
    except Error as e:
        print(f"Error creating garbled mode table: {e}")
    finally:
        if cursor:
            cursor.close()

def insert_pattern(connection, pattern):
    try:
        cursor = connection.cursor()
        cursor.execute("INSERT IGNORE INTO garbled_patterns (pattern) VALUES (%s)", (pattern,))
        connection.commit()
        print(f"Garbled mode '{pattern}' has been inserted or already exists.")
    except Error as e:
        print(f"Error inserting garbled mode: {e}")
    finally:
        if cursor:
            cursor.close()

def update_garbled_text(connection, table_name, columns, locale):
    try:
        cursor = connection.cursor()
        for column in columns:
            query = f"""
            UPDATE {table_name} t
            SET {column} = CONVERT(CAST(CONVERT({column} USING latin1) AS BINARY) USING utf8mb4)
            WHERE locale = '{locale}' AND EXISTS (
                SELECT 1 FROM garbled_patterns p
                WHERE t.{column} COLLATE utf8mb4_general_ci LIKE p.pattern
            )
            """
            cursor.execute(query)
            connection.commit()
            print(f"Update on {table_name}.{column} ({locale} locale) completed. \
                {cursor.rowcount} rows affected.")
    except Error as e:
        print(f"Error updating garbled text in {table_name}.{column}: {e}")
    finally:
        if cursor:
            cursor.close()

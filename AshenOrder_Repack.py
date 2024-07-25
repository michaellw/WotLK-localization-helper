import os
import re
import sys
import pandas as pd
from config import config

####################################################################################################
# Override default parameter definitions for the Ashen Order repack
####################################################################################################

config.SPECIFIC_MPQ_FILE = 'Patch-Y.mpq'
# For extra custom content localization
config.REF_BUILD = '11.0.2.55522'

# Dictionary for csv value matching
config.CSV_VALUE_MATCHING_DICT = {
    'Spell.csv': ['Spell.csv', 'SpellName.csv']
}

# Dictionary for string searching
config.STRING_SEARCHING_DICT = {
    'GlobalStrings.lua': {
        'GlobalStrings.csv': 'TagText_lang',
        'ChrClasses.csv': 'Name_lang',
        'ChrRaces.csv': 'Name_lang',
        'Creature.csv': 'Name_lang',
        'ChrCustomizationReq.csv': 'ReqSource_lang',
        'UiMapGroupMember.csv': 'Name_lang'
    },
    'ChrRaces.csv': {
        'ChrClasses.csv': 'Name_lang',
        'ChrRaces.csv': 'Name_lang',
        'Creature.csv': 'Name_lang',
        'ChrCustomizationReq.csv': 'ReqSource_lang'
    }
}


####################################################################################################

from client_localization import (
    run_export_dbc,
    run_export_csv,
    clean_csv_files,
    update_localized_csv,
    import_csv_to_dbc,
    add_files_to_mpq
)

from utils import (
    find_and_remove_duplicate_definitions,
    compare_and_generate_diff,
    update_lua_file_in_place,
    find_value_in_csv
)

repack_data_dir = './Data/AshenOrder_Repack/V1'
build = config.BUILD
t_lang = config.T_LANG
csv_dir = config.CSV_DIR
string_searching_dict = config.STRING_SEARCHING_DICT

global_strings_files = [
    'Interface/FrameXML/GlobalStrings.lua',
    'Interface/GlueXML/GlueStrings.lua'
]

locales = [
    'deDE',
    'esES',
    'esMX',
    'frFR',
    'koKR',
    'ruRU',
    'zhCN',
    'zhTW'
]

def run_AshenOrder_localization():
    repack_spec_files_dirs =[
        f'{repack_data_dir}/common',
        f'{repack_data_dir}/{t_lang}'
    ]
    repack_spec_files = {
        f'{repack_data_dir}/common': [
            'Interface/GlueXML/GlueXML.toc',
            'Interface/GlueXML/Config_de_Parche.lua',
            'Interface/GlueXML/CharacterCreate.lua',
            'Interface/GlueXML/CharacterSelect.lua',
            'Interface/GlueXML/AccountLogin.xml',
            'Interface/GlueXML/CharacterSelect.xml'
        ],
        f'{repack_data_dir}/{t_lang}': global_strings_files + [
            #''
        ]
    }

    mapping_global_strings()
    update_global_strings()
    update_localized_csv()
    fix_race_name()
    import_csv_to_dbc()
    add_files_to_mpq(repack_spec_files_dirs, repack_spec_files)

    print('Client localization complete!!!')

def run_AshenOrder_extraction(default=True):
    run_export_dbc(default)
    run_export_csv(default)
    clean_csv_files(default=default)

def mapping_global_strings(locale=None):
    lang = locale if locale else t_lang
    for file in global_strings_files:
        c_lang_retail = f'./Data/Retail/{build}/enUS/{file}'
        c_lang_repack = f'{repack_data_dir}/enUS/{file}'
        t_lang_retail = f'./Data/Retail/{build}/{lang}/{file}'
        t_lang_repack = f'{repack_data_dir}/{lang}/{file}'
        diff_json = f'{repack_data_dir}/{lang}/{file.replace('.lua', '_diff.json')}'

        compare_and_generate_diff(
            c_lang_retail,
            c_lang_repack,
            t_lang_retail,
            t_lang_repack,
            diff_json,
            lang
        )

def update_global_strings(locale=None):
    lang = locale if locale else t_lang
    for file in global_strings_files:
        t_lang_repack = f'{repack_data_dir}/{lang}/{file}'
        diff_json = f'{repack_data_dir}/{lang}/{file.replace('.lua', '_diff.json')}'

        update_lua_file_in_place(t_lang_repack, diff_json, lang)

def check_global_strings_files():
    for file in global_strings_files:
        find_and_remove_duplicate_definitions(f'{repack_data_dir}/enUS/{file}')

def fix_race_name():
    # Fix race names for localization
    race_name_mapping = {
        "High Elf": "High Elf",
        "Pandaren|cffc41f3b|r": "Pandaren",
        "Man'ari Eredar": "Man'ari Eredar",
        "Lightforged": "Lightforged Draenei",
        "Demon Hunter|cff0070de|r": "Demon Hunter",
        "Demon Hunter|cffc41f3b|r": "Demon Hunter"
    }
    file = os.path.join(csv_dir['c_lang_localized'], 'ChrRaces.csv')
    df = pd.read_csv(file, low_memory=False)
    column = 'Name_Lang_enUS'

    for key, value in race_name_mapping.items():
        current_value = key
        search_value = value
        match_value = find_value_in_csv('ChrRaces.csv', string_searching_dict, search_value)
        target_value = replace_extracted_text(current_value, match_value)
        df.loc[df[column] == current_value, column] = target_value

    df.to_csv(file, index=False)

def replace_extracted_text(input_string, replacement):
    match = re.match(r'([^|]*)', input_string)
    if match:
        extracted_text = match.group(1)
    else:
        extracted_text = input_string

    replaced_string = input_string.replace(extracted_text, replacement, 1)
    return replaced_string

def run_mapping_global_strings():
    for locale in locales:
        mapping_global_strings(locale)

def run_update_global_strings():
    for locale in locales:
        update_global_strings(locale)

alias_to_function = {
    'check': check_global_strings_files,
    'mapping': run_mapping_global_strings,
    'update': run_update_global_strings
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

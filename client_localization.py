import os
import pandas as pd
import shutil
import subprocess
import sys
from config import config
from utils import (
    filter_and_save_csv_files,
    get_csv_files,
    get_target_lang_end,
    load_groups,
    find_first_value_in_groups
)

build = config.BUILD
version = config.VERSION
MPQEditor = config.MPQEDITOR
WDBXEditor = config.WDBXEDITOR
t_lang = config.T_LANG
c_lang = config.C_LANG
t_lang_client_dir = config.T_LANG_CLIENT_DIR
c_lang_client_dir = config.C_LANG_CLIENT_DIR
specific_mpq_file = config.SPECIFIC_MPQ_FILE
t_lang_default_csv_dir = config.T_LANG_DEFAULT_CSV_DIR
c_lang_default_csv_dir = config.C_LANG_DEFAULT_CSV_DIR
dbc_dir = config.DBC_DIR
csv_dir = config.CSV_DIR
csv_value_matching_dict = config.CSV_VALUE_MATCHING_DICT

def export_dbc_files(locale, client_dir, dbc_output_dir, mpq_files, dbc_file_list):
    print(f"Starting export of {locale} DBC files...")
    os.makedirs(dbc_output_dir, exist_ok=True)

    total_files = len(mpq_files) * len(dbc_file_list)
    processed_files = 0

    for mpq_file in mpq_files:
        mpq_file_path = os.path.join(client_dir, 'Data', mpq_file)

        if dbc_file_list == []:
            command = [
                MPQEditor,
                'extract',
                mpq_file_path,
                'DBFilesClient/*.dbc',
                dbc_output_dir
            ]

            try:
                subprocess.run(
                    command,
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    text=True
                )
            except subprocess.CalledProcessError as e:
                print(f"\nCommand failed: {mpq_file}, error: {e.stderr}")
        else:
            for dbc_file in dbc_file_list:
                command = [
                    MPQEditor,
                    'extract',
                    mpq_file_path,
                    f'DBFilesClient/{dbc_file}.dbc',
                    dbc_output_dir
                ]

                try:
                    subprocess.run(
                        command,
                        check=True,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True
                    )
                except subprocess.CalledProcessError as e:
                    print(f"\nCommand failed: {mpq_file} / {dbc_file}.dbc, error: {e.stderr}")

                processed_files += 1
                progress = (processed_files / total_files) * 100
                sys.stdout.write(f"\rProgress: {progress:.2f}%")
                sys.stdout.flush()

            print(f"\nExported dbc files from {mpq_file} completed.")
    print(f"Export of {locale} DBC files completed.")

def run_export_dbc(default=True):
    t_lang_mpq_files = [
        f'{t_lang}/locale-{t_lang}.MPQ',
        f'{t_lang}/patch-{t_lang}.MPQ',
        f'{t_lang}/patch-{t_lang}-2.MPQ',
        f'{t_lang}/patch-{t_lang}-3.MPQ',
        # f'{t_lang}/patch-{t_lang}-4.MPQ'
    ]

    c_lang_mpq_files = [
        f'{c_lang}/locale-{c_lang}.MPQ',
        f'{c_lang}/patch-{c_lang}.MPQ',
        f'{c_lang}/patch-{c_lang}-2.MPQ',
        f'{c_lang}/patch-{c_lang}-3.MPQ',
        f'{c_lang}/patch-{c_lang}-4.MPQ'
    ] + [specific_mpq_file]

    # List of dbc files to be localized
    listfile = f'./Data/Retail/listfiles/{build}.txt'
    dbc_file_list = get_csv_files(listfile)

    if not default:
        if not os.path.exists(t_lang_client_dir):
            raise Exception("Please check the 'target_lang_client_dir' setting!!!")

        # Export 't_lang' client dbc files
        export_dbc_files(
            t_lang,
            t_lang_client_dir,
            dbc_dir['t_lang'],
            t_lang_mpq_files,
            dbc_file_list
        )

    # Export 'c_lang' client dbc files
    export_dbc_files(
        c_lang,
        c_lang_client_dir,
        dbc_dir['c_lang'],
        c_lang_mpq_files,
        dbc_file_list
    )

def export_dbc_to_csv(locale, dbc_dir, csv_output_dir):
    print(f"Exporting {locale} DBC to CSV files...")
    os.makedirs(csv_output_dir, exist_ok=True)

    dbc_files = [f for f in os.listdir(dbc_dir) if f.endswith('.dbc')]
    total_files = len(dbc_files)
    processed_files = 0

    for dbc_file in dbc_files:
        dbc_file_path = os.path.join(dbc_dir, dbc_file)
        csv_file_path = os.path.join(
            csv_output_dir, os.path.splitext(dbc_file)[0] + '.csv'
        )

        command = [
            WDBXEditor,
            '-export',
            '-f', dbc_file_path,
            '-b', version,
            '-o', csv_file_path
        ]

        try:
            subprocess.run(
                command,
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
        except subprocess.CalledProcessError as e:
            print(f"\nCommand failed: {dbc_file}, error: {e.stderr}")

        processed_files += 1
        sys.stdout.write(f"\rProcessed {processed_files}/{total_files} files.")
        sys.stdout.flush()

    print(f"\nExported {locale} csv files completed.")

def run_export_csv(default=True):
    if not default:
        if not os.path.exists(dbc_dir['t_lang']):
            raise Exception(f"Please export the {t_lang} dbc files first!!!")

        # Export csv files from 't_lang' client dbc files
        export_dbc_to_csv(
            t_lang,
            dbc_dir['t_lang'],
            csv_dir['t_lang']
        )

    if not os.path.exists(dbc_dir['c_lang']):
        raise Exception(f"Please export the {c_lang} dbc files first!!!")

    # Export csv files from 'c_lang' client dbc files
    export_dbc_to_csv(
        c_lang,
        dbc_dir['c_lang'],
        csv_dir['c_lang']
    )

def clean_csv_files(csv_dir=None, cleaned_csv_output_dir=None, locale=None, default=True):
    if not default:
        if not csv_dir:
            csv_dir = csv_dir['t_lang']
            cleaned_csv_output_dir = csv_dir['t_lang_cleaned']

            if not os.path.exists(csv_dir):
                raise Exception(f"Please export {t_lang} csv files first!!!")
        os.makedirs(cleaned_csv_output_dir, exist_ok=True)

        csv_files = [f for f in os.listdir(csv_dir) if f.endswith('.csv')]

        for csv_file in csv_files:
            csv_file_path = os.path.join(csv_dir, csv_file)

            try:
                df = pd.read_csv(csv_file_path, low_memory=False)

                # Check if there are columns ending with 't_lang'
                if locale:
                    # This is weird
                    t_lang_end = get_target_lang_end(locale)
                else:
                    # This is weird
                    t_lang_end = get_target_lang_end(t_lang)

                columns_to_process = [col for col in df.columns if col.endswith(t_lang_end)]

                if columns_to_process:
                    # Get all column names
                    all_columns = df.columns.tolist()

                    # Columns to keep: 'ID' and columns ending with 't_lang'
                    columns_to_keep = [
                        col for col in all_columns if col == 'ID' or \
                        col.endswith(t_lang_end)
                    ]

                    # Keep only the required columns
                    df_filtered = df[columns_to_keep]

                    # Sort by 'ID' column in ascending order
                    df_sorted = df_filtered.sort_values(by='ID')

                    # Construct the path for the cleaned csv file,
                    # output to the specified folder
                    cleaned_csv_file_path = os.path.join(cleaned_csv_output_dir, csv_file)

                    # Save the cleaned data to a new csv file
                    df_sorted.to_csv(cleaned_csv_file_path, index=False)
                else:
                    pass

            except Exception as e:
                print(f"Error processing file: {csv_file}, error message: {e}")

        if locale:
            print(f"Cleaning {locale} csv files completed.")
        else:
            print(f"Cleaning {t_lang} csv files completed.")
    else:
        print(f"Using default {t_lang} csv files, no cleaning needed.")

def export_files_from_mpq(locale, client_dir, mpq_files, files_to_export, output_dir):
    print(f"Starting export of {locale} extra files...")
    os.makedirs(output_dir, exist_ok=True)

    total_files = len(mpq_files)
    processed_files = 0

    for mpq_file in mpq_files:
        mpq_file_path = os.path.join(client_dir, 'Data', mpq_file)

        for file in files_to_export[mpq_file]:
            command = [
                MPQEditor,
                'extract',
                mpq_file_path,
                f'{file}',
                output_dir,
                '/fp'
            ]

            try:
                subprocess.run(
                    command,
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    text=True
                )
            except subprocess.CalledProcessError as e:
                print(f"\nCommand failed: {mpq_file}, file: {file}, error: {e.stderr}")

        processed_files += 1
        progress = (processed_files / total_files) * 100
        sys.stdout.write(f"\rProgress: {progress:.2f}%")
        sys.stdout.flush()

    print(f"\nExport of {locale} extra files completed.")

def export_client_files():
    locales = [
        'enUS',
        'deDE',
        'esES',
        'esMX',
        'frFR',
        'koKR',
        'ruRU',
        'zhCN',
        'zhTW'
    ]

    for locale in locales:
        t_lang_mpq_files = [
            f'{locale}/locale-{locale}.MPQ',
            f'{locale}/patch-{locale}.MPQ',
            f'{locale}/patch-{locale}-2.MPQ',
            f'{locale}/patch-{locale}-3.MPQ',
            # f'{locale}/patch-{locale}-4.MPQ'
        ]

        dbc_output_dir = f'./Data/Retail_original/{build}/{locale}/DBFilesClient'
        csv_output_dir = dbc_output_dir
        cleaned_csv_output_dir = f'./Data/Retail/{build}/{locale}/DBFilesClient'
        listfile = f'./Data/Retail/listfiles/{build}.txt'

        if locale == 'enUS':
            # Exporting and filtering client dbc files
            dbc_all = f'./Data/Retail_original/{build}/{locale}/DBFilesClient_all'
            csv_all = dbc_all
            os.makedirs(dbc_all, exist_ok=True)
            export_dbc_files(
                locale,
                t_lang_client_dir,
                dbc_all,
                t_lang_mpq_files,
                []
            )
            export_dbc_to_csv(locale, dbc_all, csv_all)
            filter_and_save_csv_files(csv_all, csv_output_dir, locales, listfile)
        else:
            os.makedirs(dbc_output_dir, exist_ok=True)
            export_dbc_files(
                locale,
                t_lang_client_dir,
                dbc_output_dir,
                t_lang_mpq_files,
                get_csv_files(listfile)
            )
            export_dbc_to_csv(locale, dbc_output_dir, csv_output_dir)

        clean_csv_files(
            csv_output_dir,
            cleaned_csv_output_dir,
            locale,
            default=False
        )

        # Export extra files
        mpq_files = [
            f'{locale}/patch-{locale}-2.MPQ',
            f'{locale}/patch-{locale}-3.MPQ',
        ]
        files_to_export = {
            f'{locale}/patch-{locale}-2.MPQ': [
                'Interface/FrameXML/GlobalStrings.lua',
                'Interface/GlueXML/GlueStrings.lua'
            ],
            f'{locale}/patch-{locale}-3.MPQ': [
                'Interface/FrameXML/GlobalStrings.lua',
                'Interface/GlueXML/GlueStrings.lua'
            ]
        }
        output_dir = f'./Data/Retail/{build}/{locale}'
        export_files_from_mpq(
            locale,
            t_lang_client_dir,
            mpq_files,
            files_to_export,
            output_dir
        )

def update_localized_csv():
    print(f"Updating {c_lang} CSV files...")
    if not os.path.exists(csv_dir['t_lang_cleaned']):
        t_lang_cleaned_csv_dir = t_lang_default_csv_dir
    else:
        t_lang_cleaned_csv_dir = csv_dir['t_lang_cleaned']

    c_lang_csv_dir = csv_dir['c_lang']
    if not os.path.exists(c_lang_csv_dir):
        raise Exception(f"Please run 'run_extraction' first!!!")
    c_lang_localized_csv_dir = csv_dir['c_lang_localized']

    os.makedirs(c_lang_localized_csv_dir, exist_ok=True)

    c_lang_csv_files = [f for f in os.listdir(c_lang_csv_dir) if f.endswith('.csv')]
    total_files = len(c_lang_csv_files)
    processed_files = 0

    for csv_file in c_lang_csv_files:
        t_lang_cleaned_csv_file_path = os.path.join(t_lang_cleaned_csv_dir, csv_file)
        c_lang_csv_file_path = os.path.join(c_lang_csv_dir, csv_file)
        c_lang_default_csv_file_path = os.path.join(c_lang_default_csv_dir, csv_file)
        c_lang_localized_csv_file_path = os.path.join(c_lang_localized_csv_dir, csv_file)
        df_t_lang = pd.read_csv(t_lang_cleaned_csv_file_path, low_memory=False)
        df_c_lang = pd.read_csv(c_lang_csv_file_path, low_memory=False)
        df_ref_lang = pd.read_csv(c_lang_default_csv_file_path, low_memory=False)
        files_to_search = csv_value_matching_dict.get(csv_file, [csv_file])
        groups = load_groups(files_to_search)

        # Ensure the dataframe is sorted by the 'ID' column
        df_t_lang.set_index('ID', inplace=True)
        df_c_lang.set_index('ID', inplace=True)
        df_ref_lang.set_index('ID', inplace=True)

        # Iterate through each column of the 'c_lang' CSV file
        for col in df_c_lang.columns:
            if col.endswith(f'_{c_lang}'):
                t_lang_end = get_target_lang_end(t_lang)
                t_lang_col = col.replace(f'_{c_lang}', t_lang_end)

                # Iterate through each row of the 'c_lang' CSV file
                for index, row in df_c_lang.iterrows():
                    c_lang_value = row[col]
                    # Find the corresponding row in the 'ref_lang' CSV file based on the 'ID' number
                    if index in df_ref_lang.index and index in df_t_lang.index:
                        ref_lang_row = df_ref_lang.loc[index]
                        t_lang_row = df_t_lang.loc[index]
                        # Retrieve the column value
                        ref_lang_value = ref_lang_row[col]
                        t_lang_value = t_lang_row[t_lang_col]

                        # If the value in the 'c_lang' is valid and matches the 'ref_lang' value,
                        # update all identical values in the 'c_lang' CSV file to the 't_lang' value
                        if pd.notna(c_lang_value) and c_lang_value == ref_lang_value:
                            df_c_lang.at[index, col] = t_lang_value
                        elif pd.notna(c_lang_value) and c_lang_value != ref_lang_value:
                            match_value = find_first_value_in_groups(
                                groups,
                                c_lang_value,
                                col.replace('Lang', 'lang')
                            )
                            if match_value:
                                df_c_lang.at[index, col] = match_value
                    # If it is a new row
                    else:
                        if pd.notna(c_lang_value):
                            match_value = find_first_value_in_groups(
                                groups,
                                c_lang_value,
                                col.replace('Lang', 'lang')
                            )
                            if match_value:
                                df_c_lang.at[index, col] = match_value

        df_c_lang.sort_values(by='ID').to_csv(c_lang_localized_csv_file_path, index=True)

        processed_files += 1
        sys.stdout.write(f"\rProcessed {processed_files}/{total_files} files")
        sys.stdout.flush()

    print(f"\nLocalization of {c_lang} csv files completed.")

def import_csv_to_dbc():
    print(f"Updating {c_lang} DBC files...")
    localized_csv_dir = csv_dir['c_lang_localized']
    localized_dbc_dir = dbc_dir['c_lang_localized']

    headerRow = 'true'  # sets whether csv has header row
    updateMode = '1'  # updateMode (0:Insert|1:Update|2:Replace)
    idImportMode = '1'  # idImportMode (1:FixIds|2:TakeNewest)

    os.makedirs(localized_dbc_dir, exist_ok=True)

    localized_csv_files = [f for f in os.listdir(localized_csv_dir) if f.endswith('.csv')]
    total_files = len(localized_csv_files)
    processed_files = 0

    for localized_csv_file in localized_csv_files:
        csv_file_path = os.path.join(localized_csv_dir, localized_csv_file)
        dbc_file_path = os.path.join(
            dbc_dir['c_lang'],
            os.path.splitext(localized_csv_file)[0] + '.dbc'
        )
        localized_dbc_file_path = os.path.join(
            localized_dbc_dir,
            os.path.splitext(localized_csv_file)[0] + '.dbc'
        )

        shutil.copy(dbc_file_path, localized_dbc_file_path)

        command = [
            WDBXEditor,
            '-import',
            '-f', localized_dbc_file_path,
            '-b', version,
            '-c', csv_file_path,
            '-h', headerRow,
            '-u', updateMode,
            '-i', idImportMode
        ]

        try:
            subprocess.run(
                command,
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            # Compare the size of the dbc file before and after import
            # If the sizes are different, it may indicate a failed import
            dbc_file_size = os.path.getsize(dbc_file_path)
            localized_dbc_file_size = os.path.getsize(localized_dbc_file_path)
            if dbc_file_size != localized_dbc_file_size:
                pass
            else:
                print(f"\nPossible import failure, please check dbc file: {localized_csv_file}")
        except subprocess.CalledProcessError as e:
            print(f"Command failed: {localized_csv_file}, error: {e.stderr}")

        processed_files += 1
        sys.stdout.write(f"\rProcessed {processed_files}/{total_files} files")
        sys.stdout.flush()

    print(f"\nImporting localized csv files to {c_lang} dbc files completed.")

def add_files_to_mpq(repack_spec_files_dirs=None, repack_spec_files=None):
    mpq_file = specific_mpq_file
    dbc_files_dir = dbc_dir['c_lang_localized']
    extra_files_dir = f'./Data/Retail/{build}/{t_lang}'
    mpq_file_path = os.path.join(c_lang_client_dir, 'Data', mpq_file)

    # Backup the original mpq file
    print(f"Backup the original {mpq_file} -> {mpq_file}.backup.")
    mpq_backup_file_path = mpq_file_path.replace('.mpq', '.mpq.backup')
    if not os.path.isfile(mpq_backup_file_path):
        shutil.copyfile(mpq_file_path, mpq_backup_file_path)
    else:
        print(f"{mpq_file}.backup already exists.")

    print(f"Updating {mpq_file} ...")
    dbc_files = [f for f in os.listdir(dbc_files_dir) if f.endswith('.dbc')]
    extra_files = [
        'Interface/FrameXML/GlobalStrings.lua',
        'Interface/GlueXML/GlueStrings.lua'
    ]
    total_files = len(dbc_files)

    command = [
        MPQEditor,
        'add',
        mpq_file_path,
        f'{dbc_files_dir}/*.dbc',
        'DBFilesClient',
        '/auto'
    ]

    try:
        subprocess.run(
            command,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error adding files to MPQ: {e.stderr}")

    sys.stdout.write(f"\rProcessed {total_files} files.")
    sys.stdout.flush()

    print("\nAdding extra files")
    total_files = len(extra_files)
    processed_files = 0

    for extra_file in extra_files:
        command = [
            MPQEditor,
            'add',
            mpq_file_path,
            f'{extra_files_dir}/{extra_file}',
            extra_file.replace('/', '\\'),
            '/auto'
        ]

        try:
            subprocess.run(
                command,
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
        except subprocess.CalledProcessError as e:
            print(f"Error adding files to MPQ: {e.stderr}")

        processed_files += 1
        sys.stdout.write(f"\rProcessed {processed_files}/{total_files} files.")
        sys.stdout.flush()

    if repack_spec_files_dirs:
        print("\nAdding repack spec files")
        total_files = sum(len(files) for files in repack_spec_files.values())
        processed_files = 0

        for repack_spec_files_dir in repack_spec_files_dirs:
            for repack_spec_file in repack_spec_files[repack_spec_files_dir]:
                command = [
                    MPQEditor,
                    'add',
                    mpq_file_path,
                    f'{repack_spec_files_dir}/{repack_spec_file}',
                    repack_spec_file.replace('/', '\\'),
                    '/auto'
                ]

                try:
                    subprocess.run(
                        command,
                        check=True,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True
                    )
                except subprocess.CalledProcessError as e:
                    print(f"Error adding files to MPQ: {e.stderr}")

                processed_files += 1
                sys.stdout.write(f"\rProcessed {processed_files}/{total_files} files.")
                sys.stdout.flush()

    print(f"\nMPQ file update completed: {mpq_file}.")

def run_extraction(default=True):
    run_export_dbc(default)
    run_export_csv(default)
    clean_csv_files(default=default)

def run_localization():
    update_localized_csv()
    import_csv_to_dbc()
    add_files_to_mpq()

alias_to_function = {
    'extract': run_extraction,
    'localize': run_localization,
    'export_dbc': run_export_dbc,
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

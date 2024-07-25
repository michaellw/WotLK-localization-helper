import os
import pandas as pd
import requests
import sys
from utils import filter_and_save_csv_files, get_csv_files

# Version and locales of dbc to download
builds = [
    #'1.15.3.55563',
    #'2.5.4.44833',
    #'3.4.3.55586',
    #'7.3.5.26972',
    '10.2.7.55664',
    #'11.0.2.55522'
]
locales = [
    'enUS',
    'deDE',
    'esES',
    'esMX',
    'frFR',
    'itIT',
    'koKR',
    'ptBR',
    'ruRU',
    'zhCN',
    'zhTW'
]

def generate_download_url(filename, locale, build):
    base_url = "https://wago.tools/db2/"
    if locale != 'enUS':
        build_param = f"csv?build={build}&locale={locale}"
    else:
        build_param = f"csv?build={build}"
    return f"{base_url}{filename}/{build_param}"

def download_file(url, save_path):
    response = requests.get(url)
    with open(save_path, 'wb') as f:
        f.write(response.content)

def batch_download_files(build, locales, target_dir, listfile):
    processed_locales = 0
    for locale in locales:
        processed_locales += 1
        print(f"({processed_locales}/{len(locales)}) {locale}...")
        csv_files = get_csv_files(listfile)

        processed_files = 0

        for csv_file in csv_files:
            # Generate download URL
            download_url = generate_download_url(csv_file, locale, build)

            locale_dir = os.path.join(target_dir, locale)
            if locale == 'enUS':
                locale_dir = os.path.join(target_dir, locale + '_all')
            os.makedirs(locale_dir, exist_ok=True)

            # Download the file and save it
            target_file_path = os.path.join(locale_dir, csv_file + '.csv')
            download_file(download_url, target_file_path)

            processed_files += 1
            progress = (processed_files / len(csv_files)) * 100
            sys.stdout.write(
                f"\rDownloading: ({processed_files}/{len(csv_files)} files) {progress:.2f}%."
            )
            sys.stdout.flush()

        print(f"\nDownload completed for {locale}.")

def clean_csv_files(locales, source_dir, target_dir):
    print(f"Cleaning CSV files...")
    os.makedirs(target_dir, exist_ok=True)

    processed_locales = 0
    for locale in locales:
        processed_locales += 1
        csv_files_dir = os.path.join(source_dir, locale)
        cleaned_csv_files_dir = os.path.join(target_dir, locale)
        os.makedirs(cleaned_csv_files_dir, exist_ok=True)
        csv_files = [f for f in os.listdir(csv_files_dir) if f.endswith('.csv')]

        for csv_file in csv_files:
            csv_file_path = os.path.join(csv_files_dir, csv_file)
            df = pd.read_csv(csv_file_path, low_memory=False)

            # Determine which ID column to use
            id_column = 'EventToastID' if 'UIEventToast' in csv_file else 'ID'

            # Select the 'ID' column and columns ending with '_lang'
            selected_columns = [id_column] + [col for col in df.columns if col.endswith('_lang')]

            # If the filename contains "GlobalStrings", keep the 'BaseTag' column
            if 'GlobalStrings' in csv_file:
                selected_columns.insert(1, 'BaseTag')

            # Reorder columns to ensure that the 'ID' column is the first column
            df = df[selected_columns]

            cleaned_csv_file = os.path.join(target_dir, locale, csv_file)
            if 'UIEventToast' in csv_file:
                df.sort_values(by='EventToastID').to_csv(cleaned_csv_file, index=False)
            else:
                df.sort_values(by='ID').to_csv(cleaned_csv_file, index=False)

        print(f"({processed_locales}/{len(locales)}) Cleaning completed for {locale}.")

    print(f"The CSV files has been cleaned.")

def download_csv():
    print(f"Download CSV files from https://wago.tools...")

    for build in builds:
        csv_dir = f'./Data/Retail_original/{build}'
        listfile_all = f'./Data/Retail_original/listfiles/{build}.txt'

        csv_all = f'{csv_dir}/{locales[0]}_all'
        csv_filtered = f'{csv_dir}/{locales[0]}'
        listfile_filtered = f'./Data/Retail/listfiles/{build}.txt'

        cleaned_csv_dir = f'./Data/Retail/{build}'

        print(f"Start downloading Build {build}...")
        if not os.path.exists(listfile_filtered):
            batch_download_files(build, locales[:1], csv_dir, listfile_all)
            filter_and_save_csv_files(csv_all, csv_filtered, locales, listfile_filtered)

        batch_download_files(build, locales[1:], csv_dir, listfile_filtered)
        print(f"Build {build} download completed.")

        clean_csv_files(locales, csv_dir, cleaned_csv_dir)

    print("Download and cleaning completed.")

if __name__ == "__main__":
    download_csv()

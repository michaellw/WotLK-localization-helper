import argparse
from AshenOrder_Repack import run_AshenOrder_localization, run_AshenOrder_extraction

from client_localization import (
    run_export_dbc,
    run_export_csv,
    clean_csv_files,
    run_extraction,
    update_localized_csv,
    import_csv_to_dbc,
    add_files_to_mpq,
    run_localization
)

from server_localization import run_export_locale_tables, import_sql_files, import_all_sql_files

def show_available_commands():
    print("Available commands:")
    print("Ashen_go: The Ashen Order Repack: One Click Localization.")
    print("Ashen_extract_client: The Ashen Order Repack: Perform client extraction tasks.")
    print("Ashen_update_client: The Ashen Order Repack: Update client localization.")
    print("Ashen_export_server: The Ashen Order Repack: Perform server data tables export.")
    print("Ashen_update_server: The Ashen Order Repack: Update server data tables.")
    print("go: One Click Localization.")
    print("run_extraction: Perform client extraction tasks.")
    print("run_localization: Perform localization tasks.")
    print("export_dbc: Export DBC files from client.")
    print("export_csv: Export CSV files from DBC.")
    print("clean_csv: Clean 'target_lang' CSV files.")
    print("update_csv: Update (localize) 'current_lang' csv files.")
    print("update_dbc: Update (localize) 'current_lang' dbc files.")
    print("update_mpq: Update (localize) 'current_lang' mpq files.")

def main():
    parser = argparse.ArgumentParser(
        description="Helper scripts for WotLK localization tasks."
    )
    parser.add_argument(
        'command',
        nargs='?',
        choices=[
            'Ashen_go',
            'Ashen_extract_client',
            'Ashen_update_client',
            'Ashen_export_server',
            'Ashen_update_server',
            'go',
            'run_extraction',
            'run_localization',
            'export_dbc',
            'export_csv',
            'clean_csv',
            'update_csv',
            'update_dbc',
            'update_mpq',
            'help'
        ],
        help='Command to execute'
    )
    parser.add_argument(
        '--default',
        type=lambda x: False if x.lower() == 'false' else True,
        default=True,
        help="Use default settings"
    )

    args = parser.parse_args()

    if args.command == 'help':
        show_available_commands()

    elif args.command == 'go':
        run_extraction(default=args.default)
        run_localization()

    elif args.command == 'Ashen_go':
        run_AshenOrder_extraction(default=args.default)
        run_AshenOrder_localization()
        run_export_locale_tables()
        import_sql_files()

        print('\nLocalization is complete and now you can launch the game!!!')

    elif args.command == 'Ashen_extract_client':
        run_AshenOrder_extraction(default=args.default)

    elif args.command == 'Ashen_update_client':
        run_AshenOrder_localization()

    elif args.command == 'Ashen_export_server':
        run_export_locale_tables()

    elif args.command == 'Ashen_update_server':
        import_all_sql_files()

    elif args.command == 'run_extraction':
        run_extraction(default=args.default)

    elif args.command == 'run_localization':
        run_localization()

    elif args.command == 'export_dbc':
        run_export_dbc(default=args.default)

    elif args.command == 'export_csv':
        run_export_csv(default=args.default)

    elif args.command == 'clean_csv':
        clean_csv_files(default=args.default)

    elif args.command == 'update_csv':
        update_localized_csv()

    elif args.command == 'update_dbc':
        import_csv_to_dbc()

    elif args.command == 'update_mpq':
        add_files_to_mpq()

    elif args.command is None:
        parser.print_help()

if __name__ == "__main__":
    main()

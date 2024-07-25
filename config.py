import os

####################################################################################################
# Configuration settings
####################################################################################################

settings = {
    'target_lang': 'zhCN',  # Localized language you want
    'current_lang': 'enUS',  # Current client language

    # Localization working directory, can be relative or absolute path
    'work_dir': './Work',

    # WoW client folder path
    # Set 'target_lang_client_dir' if you need to extract client dbc files yourself
    'target_lang_client_dir': 'your/target/lang/client/path',
    'current_lang_client_dir': 'E:/Others/AshenOrder/_Client',

    # Specific mpq file to safely add localized content
    'specific_mpq_file': 'Patch-Y.mpq',

    # For extra custom content localization
    'ref_build': '11.0.2.55522',
    # Dictionary for csv value matching
    'csv_value_matching_dict': {
        'Spell.csv': ['Spell.csv', 'SpellName.csv']
    },
    # Dictionary for string searching
    'string_searching_dict': {
        'GlobalStrings.lua': {
            'GlobalStrings.csv': 'TagText_lang'
        }
    },

    # Database connection information
    'db_config': {
        'user': 'acore',
        'password': 'acore',
        'host': '127.0.0.1',
        'database': 'acore_world',
        'port': '3306',
        'raise_on_warnings': True
    }
}


####################################################################################################

class Config:
    BUILD = '3.3.5.12340'  # WoW client version
    VERSION = '12340'  # for WDBX Editor
    MPQEDITOR = './Tools/MPQEditor.exe'
    WDBXEDITOR = './Tools/WDBXEditor/WDBX Editor.exe'

    def __init__(self, settings):
        self.T_LANG = settings['target_lang']
        self.C_LANG = settings['current_lang']
        self.WORK_DIR = settings['work_dir']
        self.initialize_paths()
        self.setup_directories()

        self.T_LANG_CLIENT_DIR = settings['target_lang_client_dir']
        self.C_LANG_CLIENT_DIR = settings['current_lang_client_dir']

        self.SPECIFIC_MPQ_FILE = settings['specific_mpq_file']

        self.REF_BUILD = settings['ref_build']
        self.CSV_VALUE_MATCHING_DICT = settings['csv_value_matching_dict']
        self.STRING_SEARCHING_DICT = settings['string_searching_dict']

        self.T_LANG_DEFAULT_CSV_DIR = (
            f'./Data/Retail/{self.BUILD}/{settings['target_lang']}/DBFilesClient'
        )
        self.C_LANG_DEFAULT_CSV_DIR = (
            f'./Data/Retail/{self.BUILD}/{settings['current_lang']}/DBFilesClient'
        )

        self.DB_CONFIG = settings['db_config']
        self.SQL_DIR = os.path.join(self.WORK_DIR, 'sql')

    def setup_directories(self):
        self.DBC_DIR = {
            't_lang': os.path.join(self.WORK_DIR, f'dbc_{self.T_LANG}'),
            'c_lang': os.path.join(self.WORK_DIR, f'dbc_{self.C_LANG}'),
            'c_lang_localized': os.path.join(self.WORK_DIR, f'dbc_{self.C_LANG}_localized')
        }

        self.CSV_DIR = {
            't_lang': os.path.join(self.WORK_DIR, f'csv_{self.T_LANG}'),
            't_lang_cleaned': os.path.join(self.WORK_DIR, f'csv_{self.T_LANG}_cleaned'),
            'c_lang': os.path.join(self.WORK_DIR, f'csv_{self.C_LANG}'),
            'c_lang_localized': os.path.join(self.WORK_DIR, f'csv_{self.C_LANG}_localized')
        }

    def initialize_paths(self):
        if not os.path.isabs(self.WORK_DIR):
            os.chdir(os.path.dirname(os.path.abspath(__file__)))
            self.WORK_DIR = os.path.abspath(self.WORK_DIR)

        if not os.path.exists(self.WORK_DIR):
            try:
                os.makedirs(self.WORK_DIR)
            except OSError as e:
                print(f"Failed to create directory '{self.WORK_DIR}': {e}")

config = Config(settings)

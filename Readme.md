## Note: This tool does not achieve 100% localization. It just:

1. Extracts text from the retail client in the target language and replaces text in the current repack client.
2. Extracts text in the target language (if available) from the locale tables of the acore server and replaces the text in the corresponding tables.
3. Currently, maps and sounds replacements are not supported but are planned.

## How to use:

1. Install Python

2. `pip install -r requirements.txt`

3. In the `config.py` file change `'target_lang'` to your desired language and `'current_lang_client_dir'` to yuor wow client folder path

```python
# config.py

settings = {
    'target_lang': 'zhCN',  # Localized language you want
    
	'current_lang_client_dir': 'E:/Others/AshenOrder/_Client',

...
```

4. Modify other parameters in the `config.py` file according to your situation. If you don't know what you're doing, just leave them unchanged.

5. Start MySQL database.

6. Run the `python helper.py Ashen_go` command to localize the client and server with One Click.

Other available commands：

```
    Ashen_extract_client: Perform client extraction tasks.
    Ashen_update_client: Update client localization.
    Ashen_export_server: Perform server data tables export.
    Ashen_update_server: Update server data tables.

```
and see helper.py for more...

## Many of the new contents come from higher version clients. Due to the large amount of data, I have made them available for separate download. You only need to download the language you require, then place it in the Data folder and either overwrite or merge it.

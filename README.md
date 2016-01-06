#Oracle APEX Region Plugin - Dropzone
Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads.
It is based on JS Framework dropzone.js (https://github.com/enyo/dropzone).

##Changelog
####1.1 - added options to limit uploading of declared file types (file endings, mime_types, wildcards) / clear dropzone area after uploading of all files finished

####1.0 - Initial Release

####Beta - In development

##Install
- Import plugin file "region_type_plugin_de_danielh_dropzone.sql.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

##Plugin Settings
The plugin settings are highly customizable and you can change:
- **Width** - default width of Dropzone area. Valid values are px and % data
- **Height** - default height of Dropzone area. Valid values are px and % data
- **Display message** - Enter the text that would be displayed in the Dropzone area.
- **max. Filesize in MB** - max. file size that is allowed per file. If a file is bigger, it will be removed
- **Clickable** - If true, the dropzone element itself will be clickable, if false nothing will be clickable
- **Remove files after upload** - If true, clears all files from Dropzone area if uploading them is finished
- **Accepted file types** - limit uploading of declared file types (file endings, mime_types, wildcards)
- **Page Items to submit** - Page Items that should be set into session state.
- **PLSQL Code** - PLSQL code which saves the files to database tables or collections
- **Logging** - Whether to log events in the console

## How to use
- Create a Dropzone region on target page
- Choose best fitting plugin attributes (help included)

####Save to DB using PL/SQL
For saving files to DB you can use a PL/SQL function like this:

```language-sql
DECLARE
  --
  l_collection_name VARCHAR2(100);
  l_clob            CLOB;
  l_clob_base64     CLOB;
  l_blob            BLOB;
  l_filename        VARCHAR2(100);
  l_mime_type       VARCHAR2(100);
  --
BEGIN
  -- get defaults
  -- x01: file name
  -- x02: mime_type
  -- Column clob001 of CLOB_CONTENT collection: base64 file content
  l_collection_name := 'DROPZONE_UPLOAD';
  l_filename        := apex_application.g_x01;
  l_mime_type       := apex_application.g_x02;
  -- get CLOB from APEX special collection
  SELECT clob001
    INTO l_clob
    FROM apex_collections
   WHERE collection_name = 'CLOB_CONTENT';
  --
  -- escape special chars (not really required)
  l_clob_base64 := REPLACE(REPLACE(REPLACE(l_clob,
                                           chr(10),
                                           ''),
                                   chr(13),
                                   ''),
                           chr(9),
                           '');
  -- convert base64 CLOB to BLOB
  l_blob := apex_web_service.clobbase642blob(p_clob => l_clob_base64);
  --
  -- create own collection
  -- check if exist
  IF NOT
      apex_collection.collection_exists(p_collection_name => l_collection_name) THEN
    apex_collection.create_collection(l_collection_name);
  END IF;
  -- add collection member (only if BLOB not null)
  IF dbms_lob.getlength(lob_loc => l_blob) IS NOT NULL THEN
    apex_collection.add_member(p_collection_name => l_collection_name,
                               p_c001            => l_filename, -- filename
                               p_c002            => l_mime_type, -- mime_type
                               p_d001            => SYSDATE, -- date created
                               p_blob001         => l_blob); -- BLOB file content
  END IF;
  --
END;
```

####Get files from default PL/SQL code
If you use the default PL/SQL code provided with this plugin, the files are saved in a APEX collection called "DROPZONE_UPLOAD". Select it like that:

```language-sql
SELECT c001    AS filename,
       c002    AS mime_type,
       d001    AS date_created,
       blob001 AS file_content
  FROM apex_collections
 WHERE collection_name = 'DROPZONE_UPLOAD';
 ```

##Demo Application
https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN

##Preview
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview.gif)
---

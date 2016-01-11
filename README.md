#Oracle APEX Region Plugin - Dropzone
Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads.
It is based on JS Framework dropzone.js (https://github.com/enyo/dropzone).

##Changelog
####1.8 - added option to select a default dropzone style (1: grey border / 2: blue dashed border) / added option to display file type preview images for common file types

####1.7 - solved lots of performance issues (file + base64 data get uploaded to server) / stability improvements

####1.6 - added number of parallel uploads option (1 or 2 concurrent) / performance improvements (base64 encoding when file was added instead of sending moment) / better error handling

####1.5 - performance improvements(removed redundant AJAX call) / split the clob into a 30k param array (OHS 32k limit for params) / added callback function to apex.server.plugin that processes the files queue

####1.4 - added option to refresh a chosen region (with REGION_STATIC_ID) after uploading of all files is complete / Copy&Paste support of images in modern Browsers (like Chrome)

####1.3 - set default for "max Files" to dropzone default of 256

####1.2 - added max files per upload option / added customizable messages for better multilingual support

####1.1 - added options to limit uploading of declared file types (file endings, mime_types, wildcards) / clear dropzone area after uploading of all files finished

####1.0 - Initial Release

####Beta - In development

##Install
- Import plugin file "region_type_plugin_de_danielh_dropzone.sql.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

##Plugin Settings
The plugin settings are highly customizable and you can change:
- **Dropzone Style** - Default style of Dropzone area (grey border / blue dashed border)
- **Width** - default width of Dropzone area. Valid values are px and % data
- **Height** - default height of Dropzone area. Valid values are px and % data
- **Display message** - Enter the text that would be displayed in the Dropzone area.
- **max. Filesize in MB** - max. file size that is allowed per file. If a file is bigger, it will be removed
- **Clickable** - If true, the dropzone element itself will be clickable, if false nothing will be clickable
- **Remove files after upload** - If true, clears all files from Dropzone area if uploading them is finished
- **max Files** - Maximum number of allowed files that can be uploaded at once
- **Parallel Uploads** - Number of parallel upload streams to the server (1 or 2 concurrent)
- **Show common file previews** - Show preview images for common file types when adding files
- **Accepted file types** - limit uploading of declared file types (file endings, mime_types, wildcards)
- **Refresh Region after upload (REGION_STATIC_ID)** - Region Static ID of the region which should be refreshed after uploading of all files is complete
- **Image copy&paste support** - Adds support for Copy&Paste of images in modern Browsers (like Chrome)
- **Wait in milliseconds** - Wait time between uploaded files in milliseconds
- **File too big message** - Message that is shown when a file is too big
- **Max files exceeded message** - If max Files is set, this will be the error message when it's exceeded
- **Page Items to submit** - Page Items that should be set into session state.
- **PLSQL Code** - PLSQL code which saves the files to database tables or collections
- **Logging** - Whether to log events in the console

##How to use
- Create a Dropzone region on target page
- Choose best fitting plugin attributes (help included)

####Save to DB using PL/SQL
For saving files to DB you can use a PL/SQL function like this:

```language-sql
DECLARE
  --
  l_collection_name VARCHAR2(100);
  l_clob            CLOB;
  l_blob            BLOB;
  l_filename        VARCHAR2(200);
  l_mime_type       VARCHAR2(100);
  l_token           VARCHAR2(32000);
  --
BEGIN
  -- get defaults from AJAX Process
  l_filename  := apex_application.g_x01;
  l_mime_type := apex_application.g_x02;
  -- build CLOB from f01 30k Array
  dbms_lob.createtemporary(l_clob,
                           FALSE,
                           dbms_lob.session);

  FOR i IN 1 .. apex_application.g_f01.count LOOP
    l_token := wwv_flow.g_f01(i);
  
    IF length(l_token) > 0 THEN
      dbms_lob.writeappend(l_clob,
                           length(l_token),
                           l_token);
    END IF;
  END LOOP;
  -- convert base64 CLOB to BLOB
  l_blob := apex_web_service.clobbase642blob(p_clob => l_clob);
  --
  -- create own collection (here starts custom part (for example a Insert statement))
  -- collection name
  l_collection_name := 'DROPZONE_UPLOAD';
  -- check if collection exist
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

####Preview Copy&Paste
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview_copy_paste.gif)
---

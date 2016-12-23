# Oracle APEX Region Plugin - Dropzone
Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads.
It is based on JS Framework dropzone.js (https://github.com/enyo/dropzone).

## Changelog
#### 1.9.5 - fully compatible with APEX 5.1 / Delete files inside Dropzone / General Code Cleanup / New Plugin Events

#### 1.9.4 - updated dropzone library to 4.3.0 / added a much more detailed upload progress bar per file

#### 1.9.3 - solved performance issues when converting larger files from base64 CLOB to BLOB

#### 1.9.2 - added a random file id to APEX collection (better identification of file by it´s id) / empty file mime types now set to "application/octet-stream" / code cleanup

#### 1.9.1 - added more file preview images / more structured file paths / APEX event triggers on Region (not body) / no global js functions any more, wrapped code in namespace "apexDropzone" / cleaned up js code

#### 1.9 - added option to include a custom callback javascript function which get executed on chosen events (added file & upload completed) + added APEX events for added file & upload completed to trigger Dynamic Actions

#### 1.8 - added option to select a default dropzone style (1: grey border / 2: blue dashed border) / added option to display file type preview images for common file types / minified css/js files (full files for debug mode)

#### 1.7 - solved lots of performance issues (file + base64 data get uploaded to server) / stability improvements

#### 1.6 - added number of parallel uploads option (1 or 2 concurrent) / performance improvements (base64 encoding when file was added instead of sending moment) / better error handling

#### 1.5 - performance improvements(removed redundant AJAX call) / split the clob into a 30k param array (OHS 32k limit for params) / added callback function to apex.server.plugin that processes the files queue

#### 1.4 - added option to refresh a chosen region (with REGION_STATIC_ID) after uploading of all files is complete / Copy&Paste support of images in modern Browsers (like Chrome)

#### 1.3 - set default for "max Files" to dropzone default of 256

#### 1.2 - added max files per upload option / added customizable messages for better multilingual support

#### 1.1 - added options to limit uploading of declared file types (file endings, mime_types, wildcards) / clear dropzone area after uploading of all files finished

#### 1.0 - Initial Release

#### Beta - In development

## Install
- Import plugin file "region_type_plugin_de_danielh_dropzone.sql.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

## Plugin Settings
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
- **JavaScript Callback Function Event** - Event of the plugin you want a custom javascript function fired (added file / upload complete)
- **JavaScript Callback Function** - A valid javascript function that is executed on the event you selected
- **File too big message** - Message that is shown when a file is too big
- **Max files exceeded message** - If max Files is set, this will be the error message when it's exceeded
- **Page Items to submit** - Page Items that should be set into session state.
- **PLSQL Code (Upload)** - PLSQL code which saves the files to database tables or collections
- **Delete Files** - Possibility for end users to delete each file that was uploaded to the server
- **PLSQL Code (Delete)** - PLSQL code which deletes a file from database tables or collections
- **Cancel Upload Message** - If *Delete Files* is set, this will be the message of the link to cancel the upload of a file
- **Remove File Message** - If *Delete Files* is set, this will be the message of the link to remove a file
- **Logging** - Whether to log events in the console

## Plugin Events
- **Dropzone added file** - DA event that fires when a file gets added to the dropzone area
- **Dropzone upload completed** - DA event that fires when uploading all files completed
- **Dropzone upload file success** - DA event that fires when uploading all files completed
- **Dropzone upload file error** - DA event that fires when uploading all files completed
- **Dropzone delete file success** - DA event that fires when uploading all files completed
- **Dropzone delete file error** - DA event that fires when uploading all files completed

## How to use
- Create a Dropzone region on target page
- Choose best fitting plugin attributes (help included)

#### Save/Upload files to DB using PL/SQL
For saving files to DB you can use a PL/SQL function like this (Default):

```language-sql
DECLARE
  --
  l_collection_name VARCHAR2(100);
  l_blob            BLOB;
  l_filename        VARCHAR2(200);
  l_mime_type       VARCHAR2(100);
  l_token           VARCHAR2(32000);
  l_random_file_id  NUMBER;
  --
BEGIN
  -- get defaults from AJAX Process
  l_filename  := apex_application.g_x02;
  l_mime_type := nvl(apex_application.g_x03,
                     'application/octet-stream');
  -- random file id
  l_random_file_id := round(dbms_random.value(100000,
                                              99999999));
  -- build BLOB from f01 30k Array (base64 encoded)
  dbms_lob.createtemporary(l_blob,
                           FALSE,
                           dbms_lob.session);
  FOR i IN 1 .. apex_application.g_f01.count LOOP
    l_token := wwv_flow.g_f01(i);
    IF length(l_token) > 0 THEN
      dbms_lob.append(l_blob,
                      to_blob(utl_encode.base64_decode(utl_raw.cast_to_raw(l_token))));
    END IF;
  END LOOP;
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
                               p_n001            => l_random_file_id, -- random file id
                               p_blob001         => l_blob); -- BLOB file content
  END IF;
  --
END;
```

#### Get files from default PL/SQL code
If you use the default PL/SQL code provided with this plugin, the files are saved in a APEX collection called "DROPZONE_UPLOAD". Select it like that:

```language-sql
SELECT c001    AS filename,
       c002    AS mime_type,
       d001    AS date_created,
       n001    AS file_id,
       blob001 AS file_content
  FROM apex_collections
 WHERE collection_name = 'DROPZONE_UPLOAD';
 ```

#### Delete file from DB using PL/SQL
For deleting files from DB you can use a PL/SQL function like this (Default):

 ```language-sql
 DECLARE
   --
   l_collection_name VARCHAR2(100);
   l_filename        VARCHAR2(200);
   l_coll_seq_id     NUMBER;
   --
   CURSOR l_cur_files IS
     SELECT apex_collections.seq_id
       FROM apex_collections
      WHERE apex_collections.collection_name = l_collection_name
        AND apex_collections.c001 = l_filename;
   --
 BEGIN
   -- get defaults from AJAX Process
   l_filename := apex_application.g_x02;
   -- collection name
   l_collection_name := 'DROPZONE_UPLOAD';
   -- check if collection exist
   IF apex_collection.collection_exists(p_collection_name => l_collection_name) THEN
     -- get seq_id from files collection
     OPEN l_cur_files;
     FETCH l_cur_files
       INTO l_coll_seq_id;
     CLOSE l_cur_files;
     -- delete collection member (only if Seq-ID not null)
     IF l_coll_seq_id IS NOT NULL THEN
       apex_collection.delete_member(p_collection_name => l_collection_name,
                                     p_seq             => l_coll_seq_id);
     END IF;
   END IF;
   --
 END;
 ```

## Hint for ORDS and Tomcat users
If you have problems with uploading larger files, then it could be a issue with the max. allowed post size of Tomcat server (default is 2MB). To get around this issue please add the parameter **maxPostSize** with a byte value to your connector in server.xml file of tomcat.

For AJP connector:
```
<Connector port="8009" protocol="AJP/1.3" redirectPort="8443" address="127.0.0.1" maxPostSize="15728640" />
```

For HTTP connector:
```
<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" address="127.0.0.1" maxPostSize="15728640" />
```

This example sets maxPostSize to 15MB or 15728640 bytes.

## Demo Application
https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN

## Preview
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview.gif)

#### Preview Copy&Paste
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview_copy_paste.gif)
---

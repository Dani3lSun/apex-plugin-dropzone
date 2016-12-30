# Oracle APEX Region Plugin - Dropzone
Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads.
It is based on JS Framework dropzone.js (https://github.com/enyo/dropzone).

## Changelog

### 2.0.0 - Complete new Version built from ground up new. Now much easier to use and with more features

- Choose where to save the Files (APEX Collection or Custom Table)
- No more writing of custom PL/SQL Code inside the Plugin (much more Update save)
- More Events that Developers can use for custom Interactions
- Choose the Upload Method (Normal (1 Request) or Chunked (Multiple Requests))
- Improved Error Handling and Logging for the whole AJAX based Upload Process
- Possibility to delete Files which were accidentally uploaded to the Server
- Much better Internationalization and App Wide definition of Messages
- And of course all the "old" Features as well

*Upgrade Note: Thus the Plugin is rewritten from ground up, Version 2.0.0 is completely incompatible with prior Versions!
It is recommended to install Version 2.0.0 beside Version 1.XX and replace all Dropzone Regions in your App.
If you didn´t touch the default PL/SQL Code of Version 1.XX and used the default Settings then the Upgrade Process should be straight forward (APEX Collection is the same). If you used prior Plugin Events, you have to change these ones to the Events of Dropzone 2.*

---

<details>
  <summary>Changelog Version 1.XX</summary>

#### 1.9.6 - fixed issue #15 (Page Items to Submit) / Added new event "Dropzone max files exceeded" (issue #13)
*Update Note from v1.9.5: It may be required to renew the PL/SQL Code (Upload) to the default which is shipped with this plugin. Unfortunately Plugin Attributes are not updated automatically.*

#### 1.9.5 - fully compatible with APEX 5.1 / Delete files inside Dropzone / General Code Cleanup / New Plugin Events / Float number as max Filesize
*Update Note: It may be required to renew the PL/SQL Code (Upload) to the default which is shipped with this plugin. Unfortunately Plugin Attributes are not updated automatically.*

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

</details>

## Install
- Import plugin file "region_type_plugin_de_danielh_dropzone2.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to web servers folder (Inside the Plugin Settings).

## Plugin Settings
The plugin settings are highly customizable and you can change:

- **Storage Type**

Choose where the uploaded files are saved. You can either save your files to a APEX collection or to a custom table.

- **Collection / Table Name**

Name of the APEX Collection or of your Custom Table. Default APEX Collection: **DROPZONE_UPLOAD**

- **Filename Column**

Column of your custom Table which holds the information for the Filename. Only of **Storage Type** is set to **Custom Table**

- **Mime Type Column**

Column of your custom Table which holds the information for the File Mime-Type. Only of **Storage Type** is set to **Custom Table**

- **BLOB Column**

Column of your custom Table which holds the information for the File Content (BLOB). Only of **Storage Type** is set to **Custom Table**

- **Date Column**

Column of your custom Table which holds the information for the File Upload Date. Only of **Storage Type** is set to **Custom Table**

- **Upload Mechanism**

##### Normal
**AJAX:** Async Method

**Description:**

This Upload Method encodes the File into a Base64 String. This String is then split into an 30kb Array which sends the encoded/splitted File in **1 Request** to the Server. This Method works on all Web Servers including Oracle OHS, Oracle WebTier, Oracle ORDS, Apache, Tomcat. But for large Files the "maxPostSize" Parameter have to be increased on Tomcat Servers (Default 2MB).

##### Chunked
**AJAX:** Sync Method

**Description:**

This Upload Method encodes the File into a Base64 String. This String is then split into an 1MB Array which sends the encoded/splitted File in **Multiple Requests** (For every MB 1 Request) to the Server. This Method works best on modern Web Servers like ORDS, Tomcat or Apache, but not on Oracle OHS or Oracle WebTier! This Method is good, when you don´t have the possibility to configure Parameters of the Web Server like **maxPostSize**. If you can edit the Web Servers Config you should go with the *Normal* Mechanism. Thus this Method is using Synchronous AJAX Calls it blocks the page interaction while uploading is in progress.

- **Delete Files**

Possibility for end users to delete each file that was uploaded to the server. Only if no Page Refresh has occurred.

- **Dropzone Style**

UI Style of your Dropzone Region. You can choose either *Grey Border, Blue Dashed Border or Red Dashed Border*

- **Width**

Enter the default width of your Dropzone Region. Valid values are px and % data. E.g. 700px or 100%

- **Height**

Enter the default height of Dropzone Region. Valid values in px. E.g. 400px or 500px

- **max. Filesize in MB**

max. File Size (Float Number) that is allowed per File. If a File is larger, it will be removed.

- **max. Files**

Maximum number of allowed files that can be uploaded at once.

- **Parallel Uploads**

Number of parallel Upload Streams to the server. Choose a value between 1 and 2. **1 works most reliable!**

- **Accepted File Types**

If you only want that users can upload Files of declared types. Valid values: comma separated list of Mime-Types (with Wildcard support) or File endings: image/\*,application/pdf,.psd

- **Wait Time (ms)**

Wait time between several uploaded files in milliseconds.

- **Clickable**

If true, the Dropzone Region will be clickable, if false nothing will be clickable and only Drag & Drop is possible.

- **Show File Previews**

Show Preview Images for common File types when adding files. Image-Files got displayed with real content.
If you want to add more images or others just Copy/Upload the PNG Files to *img* directory. Naming: **<file-extension>.png**

- **Copy & Paste Support**

Adds support for Copy & Paste of Images in modern Browsers (like Chrome or Firefox > 50).

- **Remove Files after Upload**

If true, clears all Files from Dropzone Region after uploading has finished.

- **Display Message (Application Scope)**

Message that is displayed inside of the Dropzone Region

- **Fallback Message (Application Scope)**

Message that is displayed when your Browser doesn´t support HTML5 Drag & Drop File Uploads

- **File too Big Message (Application Scope)**

Message that is displayed per File, if the File is bigger than you allowed in the settings. You can use Placeholders like: **{{filesize}}** or **{{maxFilesize}}**

- **max. Files Message (Application Scope)**

Message that is displayed per File, if the uploaded Files exceed the max. Files settings. You can use Placeholders like: **{{maxFiles}}**

- **Remove File Message (Application Scope)**

Message that is displayed below a single File to remove the File. Only when **Delete Files** is set.

- **Cancel Upload Message (Application Scope)**

Message that is displayed below a single File to Cancel Uploading during the actual Upload Process. Only when **Delete Files** is set.

- **Cancel Upload Confirm Message (Application Scope)**

Message that is displayed in the Confirm Dialog if you clicked the Upload Cancel Link. Only when **Delete Files** is set.

- **Invalid File Type Message (Application Scope)**

Message that is displayed per File, if the File´s Mime-Type is in the Exclude List.


## Plugin Events
- **Dropzone added file**

DA event that fires when a single file was added to the Dropzone Region (Client Side)

- **Dropzone chunked upload file success (AJAX)**

DA event that fires when uploading 1 Chunk of a File was successful (Server Side) (Upload Mechanism **Chunked**)

- **Dropzone chunked upload file error (AJAX)**

DA event that fires when uploading 1 Chunk of a File has an error (Server Side) (Upload Mechanism **Chunked**)

- **Dropzone upload file success (AJAX)**

DA event that fires when uploading a File was successful (Server Side) (Upload Mechanism **Normal**)

- **Dropzone upload file error (AJAX)**

DA event that fires when uploading a File has an error (Server Side) (Upload Mechanism **Normal**)

- **Dropzone upload completed**

DA event that fires when uploading all files completed (Client Side)

- **Dropzone deleted file**

DA event that fires if the Remove File Link of a File is pressed (Client Side)

- **Dropzone delete file success (AJAX)**

DA event that fires when deleting a single files was successful (Server Side)

- **Dropzone delete file error (AJAX)**

DA event that fires when deleting a single files has an error (Server Side)

- **Dropzone max files exceeded**

DA event that fires per file when more files are added to the Dropzone than allowed (Client Side)

- **Dropzone Total Upload Progress**

DA that fires from time to time during upload of all files and return the Total Upload Progress (Client Side)


## How to use
- Create a Dropzone region on target page
- Choose best fitting Plugin Attributes (Help included)

#### Get files from APEX Collection
If you use the default Options provided with this Plugin, the files are saved in a APEX collection called **DROPZONE_UPLOAD**. Select it like that:

```language-sql
SELECT c001    AS filename,
       c002    AS mime_type,
       d001    AS date_created,
       n001    AS file_id,
       blob001 AS file_content
  FROM apex_collections
 WHERE collection_name = 'DROPZONE_UPLOAD';
 ```


## Hint for ORDS and Tomcat users
If you have Problems uploading larger Files **(only with prefered Upload Mechanism "Normal")**, then it could be a Issue with the max. allowed Post Size of Tomcat Server (default is 2MB). To get around this issue please add the Parameter **maxPostSize** with a Byte value to your Connector in server.xml file of Tomcat.

For AJP connector:
```
<Connector port="8009" protocol="AJP/1.3" redirectPort="8443" address="127.0.0.1" maxPostSize="15728640" />
```

For HTTP connector:
```
<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" address="127.0.0.1" maxPostSize="15728640" />
```

This example sets maxPostSize to 15MB or 15728640 bytes. Setting the maxPostSize attribute to a value less than zero (e.g -1) disables the whole limitation.
More about it in the [Tomcat 8 Documentation](https://tomcat.apache.org/tomcat-8.0-doc/config/http.html#Attributes)

## Demo Application
https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN

## Preview
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview.gif)

#### Preview Copy&Paste
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview_copy_paste.gif)
---

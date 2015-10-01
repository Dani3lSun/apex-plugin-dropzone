#Oracle Apex Region Plugin - Dropzone
Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads.
It is based on JS Framework dropzone.js (https://github.com/enyo/dropzone).

##Changelog
####Beta - In development

##Install
- Import plugin file "region_type_plugin_de_danielh_dropzone.sql.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

##Plugin Settings
The plugin settings are highly customizable and you can change:
- Choose Filebrowse Item: holds the file input data
- Choose Filename Item: holds the filenames of all uploaded files. Divided by ":"
- Width: Default width of Dropzone area
- Height: Default height of Dropzone area
- Display message: text that is displayed in the Dropzone area
- Handle Items with SSP: Include items on current page and page 0 that have SSP enabled into POST call against wwv_flow.accept
- Save file using Application Process: Should files be saved using a Application Process (On Demand) x01 parameter is used.
- Page Items in Session State: Page Items that should be set into session state

##Demo Application
https://apex.oracle.com/pls/apex/f?p=57743:11

##Preview
![](https://github.com/Dani3lSun/apex-plugin-dropzone/blob/master/preview.png)
---

At the moment the plugin has problems uploading files if items with Session State Protection (Checksums) are on current page or page 0.

set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>42937890966776491
,p_default_application_id=>600
,p_default_owner=>'APEX_PLUGIN'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/region_type/de_danielh_dropzone
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(43432289042189088)
,p_plugin_type=>'REGION TYPE'
,p_name=>'DE.DANIELH.DROPZONE'
,p_display_name=>'Dropzone'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * Dropzone Apex Plugin',
' * Version: 1.6 (10.01.2015)',
' * Author:  Daniel Hochleitner',
' *-------------------------------------',
'*/',
'FUNCTION render_dropzone(p_region              IN apex_plugin.t_region,',
'                         p_plugin              IN apex_plugin.t_plugin,',
'                         p_is_printer_friendly IN BOOLEAN)',
'  RETURN apex_plugin.t_region_render_result IS',
'  -- plugin attributes',
'  l_width                 VARCHAR2(50) := p_region.attribute_01;',
'  l_height                VARCHAR2(50) := p_region.attribute_02;',
'  l_display_message       VARCHAR2(500) := p_region.attribute_03;',
'  l_max_filesize_mb       NUMBER := p_region.attribute_04;',
'  l_dz_clickable          VARCHAR2(50) := p_region.attribute_05;',
'  l_items_submit          VARCHAR(1000) := p_region.attribute_06;',
'  l_plsql                 p_region.attribute_07%TYPE := p_region.attribute_07;',
'  l_logging               VARCHAR(50) := p_region.attribute_08;',
'  l_remove_uploaded_files VARCHAR(50) := p_region.attribute_09;',
'  l_accepted_files        VARCHAR(1000) := p_region.attribute_10;',
'  l_filetoobig_message    VARCHAR(500) := p_region.attribute_11;',
'  l_maxfiles_message      VARCHAR(500) := p_region.attribute_12;',
'  l_max_files             NUMBER := p_region.attribute_13;',
'  l_refresh_regionid      VARCHAR(100) := p_region.attribute_14;',
'  l_copy_paste_support    VARCHAR(50) := p_region.attribute_15;',
'  l_wait_time_ms          NUMBER := p_region.attribute_16;',
'  l_parallel_uploads      NUMBER := p_region.attribute_17;',
'  -- other variables',
'  l_region_id              VARCHAR2(200);',
'  l_width_esc              VARCHAR2(50);',
'  l_height_esc             VARCHAR2(50);',
'  l_display_message_esc    VARCHAR2(500);',
'  l_filetoobig_message_esc VARCHAR2(500);',
'  l_maxfiles_message_esc   VARCHAR2(500);',
'  l_refresh_regionid_esc   VARCHAR(100);',
'  --',
'BEGIN',
'  -- Debug',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_region(p_plugin => p_plugin,',
'                                  p_region => p_region);',
'  END IF;',
'  -- set variables and defaults',
'  l_region_id             := apex_escape.html_attribute(p_region.static_id ||',
'                                                        ''_dropzone'');',
'  l_max_filesize_mb       := nvl(l_max_filesize_mb,',
'                                 2);',
'  l_dz_clickable          := nvl(l_dz_clickable,',
'                                 ''true'');',
'  l_remove_uploaded_files := nvl(l_remove_uploaded_files,',
'                                 ''false'');',
'  l_max_files             := nvl(l_max_files,',
'                                 256);',
'  l_copy_paste_support    := nvl(l_copy_paste_support,',
'                                 ''false'');',
'  l_wait_time_ms          := nvl(l_wait_time_ms,',
'                                 600);',
'  l_parallel_uploads      := nvl(l_parallel_uploads,',
'                                 1);',
'  IF l_parallel_uploads > 2 THEN',
'    l_parallel_uploads := 2;',
'  ELSIF l_parallel_uploads = 0 THEN',
'    l_parallel_uploads := 1;',
'  END IF;',
'  l_filetoobig_message := nvl(l_filetoobig_message,',
'                              ''File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.'');',
'  l_maxfiles_message   := nvl(l_maxfiles_message,',
'                              ''You can not upload more than {{maxFiles}} files.'');',
'  l_logging            := nvl(l_logging,',
'                              ''false'');',
'  -- escape input',
'  l_width_esc              := sys.htf.escape_sc(l_width);',
'  l_height_esc             := sys.htf.escape_sc(l_height);',
'  l_display_message_esc    := sys.htf.escape_sc(l_display_message);',
'  l_filetoobig_message_esc := sys.htf.escape_sc(l_filetoobig_message);',
'  l_maxfiles_message_esc   := sys.htf.escape_sc(l_maxfiles_message);',
'  l_refresh_regionid_esc   := sys.htf.escape_sc(l_refresh_regionid);',
'  --',
'  -- add div for dropzone',
'  sys.htp.p(''<div id="'' || l_region_id ||',
'            ''" class="dropzone" style="border:5px solid grey;width:'' ||',
'            l_width_esc || '';height:'' || l_height_esc ||',
'            '';overflow:auto;"></div>'');',
'  --',
'  -- add dropzone js and apexdropzone',
'  apex_javascript.add_library(p_name           => ''dropzone.min'',',
'                              p_directory      => p_plugin.file_prefix,',
'                              p_version        => NULL,',
'                              p_skip_extension => FALSE);',
'  --',
'  apex_javascript.add_library(p_name           => ''apexdropzone'',',
'                              p_directory      => p_plugin.file_prefix,',
'                              p_version        => NULL,',
'                              p_skip_extension => FALSE);',
'  -- filereader for Copy&Paste support',
'  IF l_copy_paste_support = ''true'' THEN',
'    apex_javascript.add_library(p_name           => ''filereader'',',
'                                p_directory      => p_plugin.file_prefix,',
'                                p_version        => NULL,',
'                                p_skip_extension => FALSE);',
'  END IF;',
'  --',
'  -- add dropzone css',
'  apex_css.add_file(p_name      => ''dropzone.min'',',
'                    p_directory => p_plugin.file_prefix);',
'  --',
'  -- onload code',
'  apex_javascript.add_onload_code(p_code => ''apexDropzone('' ||',
'                                            apex_javascript.add_value(p_region.static_id) || ''{'' ||',
'                                            apex_javascript.add_attribute(''pageItems'',',
'                                                                          apex_plugin_util.page_item_names_to_jquery(l_items_submit)) ||',
'                                            apex_javascript.add_attribute(''ajaxIdentifier'',',
'                                                                          apex_plugin.get_ajax_identifier) ||',
'                                            apex_javascript.add_attribute(''maxFilesize'',',
'                                                                          l_max_filesize_mb) ||',
'                                            apex_javascript.add_attribute(''clickable'',',
'                                                                          l_dz_clickable) ||',
'                                            apex_javascript.add_attribute(''removeAfterUpload'',',
'                                                                          l_remove_uploaded_files) ||',
'                                            apex_javascript.add_attribute(''maxFiles'',',
'                                                                          l_max_files) ||',
'                                            apex_javascript.add_attribute(''acceptedFiles'',',
'                                                                          l_accepted_files) ||',
'                                            apex_javascript.add_attribute(''refreshRegionID'',',
'                                                                          l_refresh_regionid_esc) ||',
'                                            apex_javascript.add_attribute(''supportCopyPaste'',',
'                                                                          l_copy_paste_support) ||',
'                                            apex_javascript.add_attribute(''waitTime'',',
'                                                                          l_wait_time_ms) ||',
'                                            apex_javascript.add_attribute(''parallelUploads'',',
'                                                                          l_parallel_uploads) ||',
'                                            apex_javascript.add_attribute(''defaultMessage'',',
'                                                                          l_display_message_esc) ||',
'                                            apex_javascript.add_attribute(''fileTooBigMessage'',',
'                                                                          l_filetoobig_message_esc) ||',
'                                            apex_javascript.add_attribute(''maxFilesMessage'',',
'                                                                          l_maxfiles_message_esc,',
'                                                                          FALSE,',
'                                                                          FALSE) || ''},'' ||',
'                                            apex_javascript.add_value(l_logging,',
'                                                                      FALSE) || '');'');',
'  --',
'  RETURN NULL;',
'  --',
'END render_dropzone;',
'--',
'--',
'-- AJAX function',
'--',
'--',
'FUNCTION ajax_dropzone(p_region IN apex_plugin.t_region,',
'                       p_plugin IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_region_ajax_result IS',
'  --',
'  -- plugin attributes',
'  l_result apex_plugin.t_dynamic_action_ajax_result;',
'  l_plsql  p_region.attribute_07%TYPE := p_region.attribute_07;',
'  --',
'BEGIN',
'  -- execute PL/SQL',
'  apex_plugin_util.execute_plsql_code(p_plsql_code => l_plsql);',
'  --',
'  --',
'  RETURN NULL;',
'  --',
'END ajax_dropzone;'))
,p_render_function=>'render_dropzone'
,p_ajax_function=>'ajax_dropzone'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads. It is based on JS Framework dropzone.js.'
,p_version_identifier=>'1.6'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-dropzone'
,p_files_version=>566
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43433293411189089)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Width'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'700px'
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'700px<br>',
'100%'))
,p_help_text=>'Enter the default width of Dropzone area. Valid values are px and % data.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43433656583189089)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Height'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'400px'
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'400px<br>',
'50%'))
,p_help_text=>'Enter the default height of Dropzone area. Valid values are px and % data.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43434049053189090)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Display message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Drop files here or click to upload.'
,p_is_translatable=>false
,p_help_text=>'Enter the text that would be displayed in the Dropzone area.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43442720279876220)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'max. Filesize in MB'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'2'
,p_is_translatable=>false
,p_help_text=>'max. file size that is allowed per file. If a file is bigger, it will be removed.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43443074134882924)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Clickable'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'If true, the dropzone element itself will be clickable, if false nothing will be clickable.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43443313223883467)
,p_plugin_attribute_id=>wwv_flow_api.id(43443074134882924)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43443742958883930)
,p_plugin_attribute_id=>wwv_flow_api.id(43443074134882924)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43436201259189090)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>66
,p_prompt=>'Page Items to submit'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Page Items that should be set into session state.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43445821920039171)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'PLSQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>true
,p_default_value=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  --',
'  l_collection_name VARCHAR2(100);',
'  l_clob            CLOB;',
'  l_blob            BLOB;',
'  l_filename        VARCHAR2(200);',
'  l_mime_type       VARCHAR2(100);',
'  l_token           VARCHAR2(32000);',
'  --',
'BEGIN',
'  -- get defaults from AJAX Process',
'  l_filename  := apex_application.g_x01;',
'  l_mime_type := apex_application.g_x02;',
'  -- build CLOB from f01 30k Array',
'  dbms_lob.createtemporary(l_clob,',
'                           FALSE,',
'                           dbms_lob.session);',
'',
'  FOR i IN 1 .. apex_application.g_f01.count LOOP',
'    l_token := wwv_flow.g_f01(i);',
'  ',
'    IF length(l_token) > 0 THEN',
'      dbms_lob.writeappend(l_clob,',
'                           length(l_token),',
'                           l_token);',
'    END IF;',
'  END LOOP;',
'  -- convert base64 CLOB to BLOB',
'  l_blob := apex_web_service.clobbase642blob(p_clob => l_clob);',
'  --',
'  -- create own collection (here starts custom part (for example a Insert statement))',
'  -- collection name',
'  l_collection_name := ''DROPZONE_UPLOAD'';',
'  -- check if collection exist',
'  IF NOT',
'      apex_collection.collection_exists(p_collection_name => l_collection_name) THEN',
'    apex_collection.create_collection(l_collection_name);',
'  END IF;',
'  -- add collection member (only if BLOB not null)',
'  IF dbms_lob.getlength(lob_loc => l_blob) IS NOT NULL THEN',
'    apex_collection.add_member(p_collection_name => l_collection_name,',
'                               p_c001            => l_filename, -- filename',
'                               p_c002            => l_mime_type, -- mime_type',
'                               p_d001            => SYSDATE, -- date created',
'                               p_blob001         => l_blob); -- BLOB file content',
'  END IF;',
'  --',
'END;'))
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT c001    AS filename,<br>',
'       c002    AS mime_type,<br>',
'       d001    AS date_created,<br>',
'       blob001 AS file_content<br>',
'  FROM apex_collections<br>',
' WHERE collection_name = ''DROPZONE_UPLOAD'';'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'PLSQL code which saves the files to database tables or collections.<br>',
'Default to Collection "DROPZONE_UPLOAD".<br>',
'Column c001 => filename<br>',
'Column c002 => mime_type<br>',
'Column d001 => date created<br>',
'Column blob001 => BLOB of file<br>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43444551990947375)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Logging'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to log events in the console.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43444862611947964)
,p_plugin_attribute_id=>wwv_flow_api.id(43444551990947375)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43445242206948430)
,p_plugin_attribute_id=>wwv_flow_api.id(43444551990947375)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43521354248195893)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>52
,p_prompt=>'Remove files after upload'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'If true, clears all files from Dropzone area if uploading them is finished.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43521971465196493)
,p_plugin_attribute_id=>wwv_flow_api.id(43521354248195893)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43522346936197097)
,p_plugin_attribute_id=>wwv_flow_api.id(43521354248195893)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43532765611529910)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>56
,p_prompt=>'Accepted file types'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'If you only want that users can upload files of declared types.<br>',
'Default: all file types are allowed<br>',
'Valid values: comma separated list of mime_types (with wildcard support) or file endings: image/*,application/pdf,.psd'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43562167483245048)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>62
,p_prompt=>'File too big message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.'
,p_help_text=>'Message that is shown when the file is too big.<br>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43562740689263877)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>64
,p_prompt=>'Max files exceeded message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(43563373324271749)
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'You can not upload more than {{maxFiles}} files.'
,p_help_text=>'If max Files is set, this will be the error message when it''s exceeded.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43563373324271749)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>54
,p_prompt=>'max Files'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Maximum number of allowed files that can be uploaded at once.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43598624463037827)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>65
,p_prompt=>'Refresh Region after upload (STATIC_ID)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'MyRegionStaticID'
,p_help_text=>'Region Static ID of the region which should be refreshed after uploading of all files is complete.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43606354120852142)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>59
,p_prompt=>'Image copy&paste support'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'1) Open image file<br>',
'2) Copy file<br>',
'3) Paste it to the page which contains the dropzone area'))
,p_help_text=>'Adds support for Copy&Paste of images in modern Browsers (like Chrome).<br>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43606943996852759)
,p_plugin_attribute_id=>wwv_flow_api.id(43606354120852142)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43607334137853254)
,p_plugin_attribute_id=>wwv_flow_api.id(43606354120852142)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43721588949277439)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>60
,p_prompt=>'Wait in milliseconds'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'600'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Wait time between several uploaded files in milliseconds.<br>',
'In some environments Dropzone is faster than storing files in DB.<br>',
'Default: 600ms'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43786959801079598)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>55
,p_prompt=>'Parallel Uploads'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1'
,p_max_length=>1
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Number of parallel upload streams to the server.<br>',
'Choose a value between 1 and 2. 1 works most reliable.'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2866756E6374696F6E28297B76617220612C622C632C642C652C662C672C682C693D5B5D2E736C6963652C6A3D7B7D2E6861734F776E50726F70657274792C6B3D66756E6374696F6E28612C62297B66756E6374696F6E206328297B746869732E636F6E';
wwv_flow_api.g_varchar2_table(2) := '7374727563746F723D617D666F7228766172206420696E2062296A2E63616C6C28622C6429262628615B645D3D625B645D293B72657475726E20632E70726F746F747970653D622E70726F746F747970652C612E70726F746F747970653D6E657720632C';
wwv_flow_api.g_varchar2_table(3) := '612E5F5F73757065725F5F3D622E70726F746F747970652C617D3B673D66756E6374696F6E28297B7D2C623D66756E6374696F6E28297B66756E6374696F6E206128297B7D72657475726E20612E70726F746F747970652E6164644576656E744C697374';
wwv_flow_api.g_varchar2_table(4) := '656E65723D612E70726F746F747970652E6F6E2C612E70726F746F747970652E6F6E3D66756E6374696F6E28612C62297B72657475726E20746869732E5F63616C6C6261636B733D746869732E5F63616C6C6261636B737C7C7B7D2C746869732E5F6361';
wwv_flow_api.g_varchar2_table(5) := '6C6C6261636B735B615D7C7C28746869732E5F63616C6C6261636B735B615D3D5B5D292C746869732E5F63616C6C6261636B735B615D2E707573682862292C746869737D2C612E70726F746F747970652E656D69743D66756E6374696F6E28297B766172';
wwv_flow_api.g_varchar2_table(6) := '20612C622C632C642C652C663B696628643D617267756D656E74735B305D2C613D323C3D617267756D656E74732E6C656E6774683F692E63616C6C28617267756D656E74732C31293A5B5D2C746869732E5F63616C6C6261636B733D746869732E5F6361';
wwv_flow_api.g_varchar2_table(7) := '6C6C6261636B737C7C7B7D2C633D746869732E5F63616C6C6261636B735B645D29666F7228653D302C663D632E6C656E6774683B663E653B652B2B29623D635B655D2C622E6170706C7928746869732C61293B72657475726E20746869737D2C612E7072';
wwv_flow_api.g_varchar2_table(8) := '6F746F747970652E72656D6F76654C697374656E65723D612E70726F746F747970652E6F66662C612E70726F746F747970652E72656D6F7665416C6C4C697374656E6572733D612E70726F746F747970652E6F66662C612E70726F746F747970652E7265';
wwv_flow_api.g_varchar2_table(9) := '6D6F76654576656E744C697374656E65723D612E70726F746F747970652E6F66662C612E70726F746F747970652E6F66663D66756E6374696F6E28612C62297B76617220632C642C652C662C673B69662821746869732E5F63616C6C6261636B737C7C30';
wwv_flow_api.g_varchar2_table(10) := '3D3D3D617267756D656E74732E6C656E6774682972657475726E20746869732E5F63616C6C6261636B733D7B7D2C746869733B696628643D746869732E5F63616C6C6261636B735B615D2C21642972657475726E20746869733B696628313D3D3D617267';
wwv_flow_api.g_varchar2_table(11) := '756D656E74732E6C656E6774682972657475726E2064656C65746520746869732E5F63616C6C6261636B735B615D2C746869733B666F7228653D663D302C673D642E6C656E6774683B673E663B653D2B2B6629696628633D645B655D2C633D3D3D62297B';
wwv_flow_api.g_varchar2_table(12) := '642E73706C69636528652C31293B627265616B7D72657475726E20746869737D2C617D28292C613D66756E6374696F6E2861297B66756E6374696F6E206328612C62297B76617220652C662C673B696628746869732E656C656D656E743D612C74686973';
wwv_flow_api.g_varchar2_table(13) := '2E76657273696F6E3D632E76657273696F6E2C746869732E64656661756C744F7074696F6E732E7072657669657754656D706C6174653D746869732E64656661756C744F7074696F6E732E7072657669657754656D706C6174652E7265706C616365282F';
wwv_flow_api.g_varchar2_table(14) := '5C6E2A2F672C2222292C746869732E636C69636B61626C65456C656D656E74733D5B5D2C746869732E6C697374656E6572733D5B5D2C746869732E66696C65733D5B5D2C22737472696E67223D3D747970656F6620746869732E656C656D656E74262628';
wwv_flow_api.g_varchar2_table(15) := '746869732E656C656D656E743D646F63756D656E742E717565727953656C6563746F7228746869732E656C656D656E7429292C21746869732E656C656D656E747C7C6E756C6C3D3D746869732E656C656D656E742E6E6F646554797065297468726F7720';
wwv_flow_api.g_varchar2_table(16) := '6E6577204572726F722822496E76616C69642064726F707A6F6E6520656C656D656E742E22293B696628746869732E656C656D656E742E64726F707A6F6E65297468726F77206E6577204572726F72282244726F707A6F6E6520616C7265616479206174';
wwv_flow_api.g_varchar2_table(17) := '7461636865642E22293B696628632E696E7374616E6365732E707573682874686973292C746869732E656C656D656E742E64726F707A6F6E653D746869732C653D6E756C6C213D28673D632E6F7074696F6E73466F72456C656D656E7428746869732E65';
wwv_flow_api.g_varchar2_table(18) := '6C656D656E7429293F673A7B7D2C746869732E6F7074696F6E733D64287B7D2C746869732E64656661756C744F7074696F6E732C652C6E756C6C213D623F623A7B7D292C746869732E6F7074696F6E732E666F72636546616C6C6261636B7C7C21632E69';
wwv_flow_api.g_varchar2_table(19) := '7342726F77736572537570706F7274656428292972657475726E20746869732E6F7074696F6E732E66616C6C6261636B2E63616C6C2874686973293B6966286E756C6C3D3D746869732E6F7074696F6E732E75726C262628746869732E6F7074696F6E73';
wwv_flow_api.g_varchar2_table(20) := '2E75726C3D746869732E656C656D656E742E6765744174747269627574652822616374696F6E2229292C21746869732E6F7074696F6E732E75726C297468726F77206E6577204572726F7228224E6F2055524C2070726F76696465642E22293B69662874';
wwv_flow_api.g_varchar2_table(21) := '6869732E6F7074696F6E732E616363657074656446696C65732626746869732E6F7074696F6E732E61636365707465644D696D655479706573297468726F77206E6577204572726F722822596F752063616E27742070726F7669646520626F7468202761';
wwv_flow_api.g_varchar2_table(22) := '6363657074656446696C65732720616E64202761636365707465644D696D655479706573272E202761636365707465644D696D6554797065732720697320646570726563617465642E22293B746869732E6F7074696F6E732E61636365707465644D696D';
wwv_flow_api.g_varchar2_table(23) := '655479706573262628746869732E6F7074696F6E732E616363657074656446696C65733D746869732E6F7074696F6E732E61636365707465644D696D6554797065732C64656C65746520746869732E6F7074696F6E732E61636365707465644D696D6554';
wwv_flow_api.g_varchar2_table(24) := '79706573292C746869732E6F7074696F6E732E6D6574686F643D746869732E6F7074696F6E732E6D6574686F642E746F55707065724361736528292C28663D746869732E6765744578697374696E6746616C6C6261636B2829292626662E706172656E74';
wwv_flow_api.g_varchar2_table(25) := '4E6F64652626662E706172656E744E6F64652E72656D6F76654368696C642866292C746869732E6F7074696F6E732E7072657669657773436F6E7461696E6572213D3D2131262628746869732E7072657669657773436F6E7461696E65723D746869732E';
wwv_flow_api.g_varchar2_table(26) := '6F7074696F6E732E7072657669657773436F6E7461696E65723F632E676574456C656D656E7428746869732E6F7074696F6E732E7072657669657773436F6E7461696E65722C227072657669657773436F6E7461696E657222293A746869732E656C656D';
wwv_flow_api.g_varchar2_table(27) := '656E74292C746869732E6F7074696F6E732E636C69636B61626C65262628746869732E636C69636B61626C65456C656D656E74733D746869732E6F7074696F6E732E636C69636B61626C653D3D3D21303F5B746869732E656C656D656E745D3A632E6765';
wwv_flow_api.g_varchar2_table(28) := '74456C656D656E747328746869732E6F7074696F6E732E636C69636B61626C652C22636C69636B61626C652229292C746869732E696E697428297D76617220642C653B72657475726E206B28632C61292C632E70726F746F747970652E456D6974746572';
wwv_flow_api.g_varchar2_table(29) := '3D622C632E70726F746F747970652E6576656E74733D5B2264726F70222C22647261677374617274222C2264726167656E64222C2264726167656E746572222C22647261676F766572222C22647261676C65617665222C22616464656466696C65222C22';
wwv_flow_api.g_varchar2_table(30) := '616464656466696C6573222C2272656D6F76656466696C65222C227468756D626E61696C222C226572726F72222C226572726F726D756C7469706C65222C2270726F63657373696E67222C2270726F63657373696E676D756C7469706C65222C2275706C';
wwv_flow_api.g_varchar2_table(31) := '6F616470726F6772657373222C22746F74616C75706C6F616470726F6772657373222C2273656E64696E67222C2273656E64696E676D756C7469706C65222C2273756363657373222C22737563636573736D756C7469706C65222C2263616E63656C6564';
wwv_flow_api.g_varchar2_table(32) := '222C2263616E63656C65646D756C7469706C65222C22636F6D706C657465222C22636F6D706C6574656D756C7469706C65222C227265736574222C226D617866696C65736578636565646564222C226D617866696C657372656163686564222C22717565';
wwv_flow_api.g_varchar2_table(33) := '7565636F6D706C657465225D2C632E70726F746F747970652E64656661756C744F7074696F6E733D7B75726C3A6E756C6C2C6D6574686F643A22706F7374222C7769746843726564656E7469616C733A21312C706172616C6C656C55706C6F6164733A32';
wwv_flow_api.g_varchar2_table(34) := '2C75706C6F61644D756C7469706C653A21312C6D617846696C6573697A653A3235362C706172616D4E616D653A2266696C65222C637265617465496D6167655468756D626E61696C733A21302C6D61785468756D626E61696C46696C6573697A653A3130';
wwv_flow_api.g_varchar2_table(35) := '2C7468756D626E61696C57696474683A3132302C7468756D626E61696C4865696768743A3132302C66696C6573697A65426173653A3165332C6D617846696C65733A6E756C6C2C706172616D733A7B7D2C636C69636B61626C653A21302C69676E6F7265';
wwv_flow_api.g_varchar2_table(36) := '48696464656E46696C65733A21302C616363657074656446696C65733A6E756C6C2C61636365707465644D696D6554797065733A6E756C6C2C6175746F50726F6365737351756575653A21302C6175746F51756575653A21302C61646452656D6F76654C';
wwv_flow_api.g_varchar2_table(37) := '696E6B733A21312C7072657669657773436F6E7461696E65723A6E756C6C2C68696464656E496E707574436F6E7461696E65723A22626F6479222C636170747572653A6E756C6C2C6469637444656661756C744D6573736167653A2244726F702066696C';
wwv_flow_api.g_varchar2_table(38) := '6573206865726520746F2075706C6F6164222C6469637446616C6C6261636B4D6573736167653A22596F75722062726F7773657220646F6573206E6F7420737570706F72742064726167276E2764726F702066696C652075706C6F6164732E222C646963';
wwv_flow_api.g_varchar2_table(39) := '7446616C6C6261636B546578743A22506C6561736520757365207468652066616C6C6261636B20666F726D2062656C6F7720746F2075706C6F616420796F75722066696C6573206C696B6520696E20746865206F6C64656E20646179732E222C64696374';
wwv_flow_api.g_varchar2_table(40) := '46696C65546F6F4269673A2246696C6520697320746F6F2062696720287B7B66696C6573697A657D7D4D6942292E204D61782066696C6573697A653A207B7B6D617846696C6573697A657D7D4D69422E222C64696374496E76616C696446696C65547970';
wwv_flow_api.g_varchar2_table(41) := '653A22596F752063616E27742075706C6F61642066696C6573206F66207468697320747970652E222C64696374526573706F6E73654572726F723A2253657276657220726573706F6E6465642077697468207B7B737461747573436F64657D7D20636F64';
wwv_flow_api.g_varchar2_table(42) := '652E222C6469637443616E63656C55706C6F61643A2243616E63656C2075706C6F6164222C6469637443616E63656C55706C6F6164436F6E6669726D6174696F6E3A2241726520796F75207375726520796F752077616E7420746F2063616E63656C2074';
wwv_flow_api.g_varchar2_table(43) := '6869732075706C6F61643F222C6469637452656D6F766546696C653A2252656D6F76652066696C65222C6469637452656D6F766546696C65436F6E6669726D6174696F6E3A6E756C6C2C646963744D617846696C657345786365656465643A22596F7520';
wwv_flow_api.g_varchar2_table(44) := '63616E206E6F742075706C6F616420616E79206D6F72652066696C65732E222C6163636570743A66756E6374696F6E28612C62297B72657475726E206228297D2C696E69743A66756E6374696F6E28297B72657475726E20677D2C666F72636546616C6C';
wwv_flow_api.g_varchar2_table(45) := '6261636B3A21312C66616C6C6261636B3A66756E6374696F6E28297B76617220612C622C642C652C662C673B666F7228746869732E656C656D656E742E636C6173734E616D653D22222B746869732E656C656D656E742E636C6173734E616D652B222064';
wwv_flow_api.g_varchar2_table(46) := '7A2D62726F777365722D6E6F742D737570706F72746564222C673D746869732E656C656D656E742E676574456C656D656E747342795461674E616D65282264697622292C653D302C663D672E6C656E6774683B663E653B652B2B29613D675B655D2C2F28';
wwv_flow_api.g_varchar2_table(47) := '5E7C2029647A2D6D65737361676528247C20292F2E7465737428612E636C6173734E616D6529262628623D612C612E636C6173734E616D653D22647A2D6D65737361676522293B72657475726E20627C7C28623D632E637265617465456C656D656E7428';
wwv_flow_api.g_varchar2_table(48) := '273C64697620636C6173733D22647A2D6D657373616765223E3C7370616E3E3C2F7370616E3E3C2F6469763E27292C746869732E656C656D656E742E617070656E644368696C64286229292C643D622E676574456C656D656E747342795461674E616D65';
wwv_flow_api.g_varchar2_table(49) := '28227370616E22295B305D2C642626286E756C6C213D642E74657874436F6E74656E743F642E74657874436F6E74656E743D746869732E6F7074696F6E732E6469637446616C6C6261636B4D6573736167653A6E756C6C213D642E696E6E657254657874';
wwv_flow_api.g_varchar2_table(50) := '262628642E696E6E6572546578743D746869732E6F7074696F6E732E6469637446616C6C6261636B4D65737361676529292C746869732E656C656D656E742E617070656E644368696C6428746869732E67657446616C6C6261636B466F726D2829297D2C';
wwv_flow_api.g_varchar2_table(51) := '726573697A653A66756E6374696F6E2861297B76617220622C632C643B72657475726E20623D7B737263583A302C737263593A302C73726357696474683A612E77696474682C7372634865696768743A612E6865696768747D2C633D612E77696474682F';
wwv_flow_api.g_varchar2_table(52) := '612E6865696768742C622E6F707457696474683D746869732E6F7074696F6E732E7468756D626E61696C57696474682C622E6F70744865696768743D746869732E6F7074696F6E732E7468756D626E61696C4865696768742C6E756C6C3D3D622E6F7074';
wwv_flow_api.g_varchar2_table(53) := '576964746826266E756C6C3D3D622E6F70744865696768743F28622E6F707457696474683D622E73726357696474682C622E6F70744865696768743D622E737263486569676874293A6E756C6C3D3D622E6F707457696474683F622E6F70745769647468';
wwv_flow_api.g_varchar2_table(54) := '3D632A622E6F70744865696768743A6E756C6C3D3D622E6F7074486569676874262628622E6F70744865696768743D312F632A622E6F70745769647468292C643D622E6F707457696474682F622E6F70744865696768742C612E6865696768743C622E6F';
wwv_flow_api.g_varchar2_table(55) := '70744865696768747C7C612E77696474683C622E6F707457696474683F28622E7472674865696768743D622E7372634865696768742C622E74726757696474683D622E7372635769647468293A633E643F28622E7372634865696768743D612E68656967';
wwv_flow_api.g_varchar2_table(56) := '68742C622E73726357696474683D622E7372634865696768742A64293A28622E73726357696474683D612E77696474682C622E7372634865696768743D622E73726357696474682F64292C622E737263583D28612E77696474682D622E73726357696474';
wwv_flow_api.g_varchar2_table(57) := '68292F322C622E737263593D28612E6865696768742D622E737263486569676874292F322C627D2C64726F703A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D647261';
wwv_flow_api.g_varchar2_table(58) := '672D686F76657222297D2C6472616773746172743A672C64726167656E643A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D647261672D686F76657222297D2C647261';
wwv_flow_api.g_varchar2_table(59) := '67656E7465723A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E6164642822647A2D647261672D686F76657222297D2C647261676F7665723A66756E6374696F6E28297B72657475726E20746869';
wwv_flow_api.g_varchar2_table(60) := '732E656C656D656E742E636C6173734C6973742E6164642822647A2D647261672D686F76657222297D2C647261676C656176653A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F766528';
wwv_flow_api.g_varchar2_table(61) := '22647A2D647261672D686F76657222297D2C70617374653A672C72657365743A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D7374617274656422297D2C6164646564';
wwv_flow_api.g_varchar2_table(62) := '66696C653A66756E6374696F6E2861297B76617220622C642C652C662C672C682C692C6A2C6B2C6C2C6D2C6E2C6F3B696628746869732E656C656D656E743D3D3D746869732E7072657669657773436F6E7461696E65722626746869732E656C656D656E';
wwv_flow_api.g_varchar2_table(63) := '742E636C6173734C6973742E6164642822647A2D7374617274656422292C746869732E7072657669657773436F6E7461696E6572297B666F7228612E70726576696577456C656D656E743D632E637265617465456C656D656E7428746869732E6F707469';
wwv_flow_api.g_varchar2_table(64) := '6F6E732E7072657669657754656D706C6174652E7472696D2829292C612E7072657669657754656D706C6174653D612E70726576696577456C656D656E742C746869732E7072657669657773436F6E7461696E65722E617070656E644368696C6428612E';
wwv_flow_api.g_varchar2_table(65) := '70726576696577456C656D656E74292C6C3D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D6E616D655D22292C663D302C693D6C2E6C656E6774683B693E663B662B2B29623D6C5B665D2C';
wwv_flow_api.g_varchar2_table(66) := '622E74657874436F6E74656E743D612E6E616D653B666F72286D3D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D73697A655D22292C673D302C6A3D6D2E6C656E6774683B6A3E673B672B';
wwv_flow_api.g_varchar2_table(67) := '2B29623D6D5B675D2C622E696E6E657248544D4C3D746869732E66696C6573697A6528612E73697A65293B666F7228746869732E6F7074696F6E732E61646452656D6F76654C696E6B73262628612E5F72656D6F76654C696E6B3D632E63726561746545';
wwv_flow_api.g_varchar2_table(68) := '6C656D656E7428273C6120636C6173733D22647A2D72656D6F76652220687265663D226A6176617363726970743A756E646566696E65643B2220646174612D647A2D72656D6F76653E272B746869732E6F7074696F6E732E6469637452656D6F76654669';
wwv_flow_api.g_varchar2_table(69) := '6C652B223C2F613E22292C612E70726576696577456C656D656E742E617070656E644368696C6428612E5F72656D6F76654C696E6B29292C643D66756E6374696F6E2862297B72657475726E2066756E6374696F6E2864297B72657475726E20642E7072';
wwv_flow_api.g_varchar2_table(70) := '6576656E7444656661756C7428292C642E73746F7050726F7061676174696F6E28292C612E7374617475733D3D3D632E55504C4F4144494E473F632E636F6E6669726D28622E6F7074696F6E732E6469637443616E63656C55706C6F6164436F6E666972';
wwv_flow_api.g_varchar2_table(71) := '6D6174696F6E2C66756E6374696F6E28297B72657475726E20622E72656D6F766546696C652861297D293A622E6F7074696F6E732E6469637452656D6F766546696C65436F6E6669726D6174696F6E3F632E636F6E6669726D28622E6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(72) := '6469637452656D6F766546696C65436F6E6669726D6174696F6E2C66756E6374696F6E28297B72657475726E20622E72656D6F766546696C652861297D293A622E72656D6F766546696C652861297D7D2874686973292C6E3D612E70726576696577456C';
wwv_flow_api.g_varchar2_table(73) := '656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D72656D6F76655D22292C6F3D5B5D2C683D302C6B3D6E2E6C656E6774683B6B3E683B682B2B29653D6E5B685D2C6F2E7075736828652E6164644576656E744C69737465';
wwv_flow_api.g_varchar2_table(74) := '6E65722822636C69636B222C6429293B72657475726E206F7D7D2C72656D6F76656466696C653A66756E6374696F6E2861297B76617220623B72657475726E20612E70726576696577456C656D656E7426266E756C6C213D28623D612E70726576696577';
wwv_flow_api.g_varchar2_table(75) := '456C656D656E74292626622E706172656E744E6F64652E72656D6F76654368696C6428612E70726576696577456C656D656E74292C746869732E5F7570646174654D617846696C657352656163686564436C61737328297D2C7468756D626E61696C3A66';
wwv_flow_api.g_varchar2_table(76) := '756E6374696F6E28612C62297B76617220632C642C652C663B696628612E70726576696577456C656D656E74297B666F7228612E70726576696577456C656D656E742E636C6173734C6973742E72656D6F76652822647A2D66696C652D70726576696577';
wwv_flow_api.g_varchar2_table(77) := '22292C663D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D7468756D626E61696C5D22292C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C632E616C743D612E';
wwv_flow_api.g_varchar2_table(78) := '6E616D652C632E7372633D623B72657475726E2073657454696D656F75742866756E6374696F6E28297B72657475726E2066756E6374696F6E28297B72657475726E20612E70726576696577456C656D656E742E636C6173734C6973742E616464282264';
wwv_flow_api.g_varchar2_table(79) := '7A2D696D6167652D7072657669657722297D7D2874686973292C31297D7D2C6572726F723A66756E6374696F6E28612C62297B76617220632C642C652C662C673B696628612E70726576696577456C656D656E74297B666F7228612E7072657669657745';
wwv_flow_api.g_varchar2_table(80) := '6C656D656E742E636C6173734C6973742E6164642822647A2D6572726F7222292C22537472696E6722213D747970656F6620622626622E6572726F72262628623D622E6572726F72292C663D612E70726576696577456C656D656E742E71756572795365';
wwv_flow_api.g_varchar2_table(81) := '6C6563746F72416C6C28225B646174612D647A2D6572726F726D6573736167655D22292C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C672E7075736828632E74657874436F6E74656E743D62293B7265747572';
wwv_flow_api.g_varchar2_table(82) := '6E20677D7D2C6572726F726D756C7469706C653A672C70726F63657373696E673A66756E6374696F6E2861297B72657475726E20612E70726576696577456C656D656E74262628612E70726576696577456C656D656E742E636C6173734C6973742E6164';
wwv_flow_api.g_varchar2_table(83) := '642822647A2D70726F63657373696E6722292C612E5F72656D6F76654C696E6B293F612E5F72656D6F76654C696E6B2E74657874436F6E74656E743D746869732E6F7074696F6E732E6469637443616E63656C55706C6F61643A766F696420307D2C7072';
wwv_flow_api.g_varchar2_table(84) := '6F63657373696E676D756C7469706C653A672C75706C6F616470726F67726573733A66756E6374696F6E28612C62297B76617220632C642C652C662C673B696628612E70726576696577456C656D656E74297B666F7228663D612E70726576696577456C';
wwv_flow_api.g_varchar2_table(85) := '656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D75706C6F616470726F67726573735D22292C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C672E70757368282250524F475245';
wwv_flow_api.g_varchar2_table(86) := '5353223D3D3D632E6E6F64654E616D653F632E76616C75653D623A632E7374796C652E77696474683D22222B622B222522293B72657475726E20677D7D2C746F74616C75706C6F616470726F67726573733A672C73656E64696E673A672C73656E64696E';
wwv_flow_api.g_varchar2_table(87) := '676D756C7469706C653A672C737563636573733A66756E6374696F6E2861297B72657475726E20612E70726576696577456C656D656E743F612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D737563636573732229';
wwv_flow_api.g_varchar2_table(88) := '3A766F696420307D2C737563636573736D756C7469706C653A672C63616E63656C65643A66756E6374696F6E2861297B72657475726E20746869732E656D697428226572726F72222C612C2255706C6F61642063616E63656C65642E22297D2C63616E63';
wwv_flow_api.g_varchar2_table(89) := '656C65646D756C7469706C653A672C636F6D706C6574653A66756E6374696F6E2861297B72657475726E20612E5F72656D6F76654C696E6B262628612E5F72656D6F76654C696E6B2E74657874436F6E74656E743D746869732E6F7074696F6E732E6469';
wwv_flow_api.g_varchar2_table(90) := '637452656D6F766546696C65292C612E70726576696577456C656D656E743F612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D636F6D706C65746522293A766F696420307D2C636F6D706C6574656D756C7469706C';
wwv_flow_api.g_varchar2_table(91) := '653A672C6D617866696C657365786365656465643A672C6D617866696C6573726561636865643A672C7175657565636F6D706C6574653A672C616464656466696C65733A672C7072657669657754656D706C6174653A273C64697620636C6173733D2264';
wwv_flow_api.g_varchar2_table(92) := '7A2D7072657669657720647A2D66696C652D70726576696577223E5C6E20203C64697620636C6173733D22647A2D696D616765223E3C696D6720646174612D647A2D7468756D626E61696C202F3E3C2F6469763E5C6E20203C64697620636C6173733D22';
wwv_flow_api.g_varchar2_table(93) := '647A2D64657461696C73223E5C6E202020203C64697620636C6173733D22647A2D73697A65223E3C7370616E20646174612D647A2D73697A653E3C2F7370616E3E3C2F6469763E5C6E202020203C64697620636C6173733D22647A2D66696C656E616D65';
wwv_flow_api.g_varchar2_table(94) := '223E3C7370616E20646174612D647A2D6E616D653E3C2F7370616E3E3C2F6469763E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D22647A2D70726F6772657373223E3C7370616E20636C6173733D22647A2D75706C6F61642220646174';
wwv_flow_api.g_varchar2_table(95) := '612D647A2D75706C6F616470726F67726573733E3C2F7370616E3E3C2F6469763E5C6E20203C64697620636C6173733D22647A2D6572726F722D6D657373616765223E3C7370616E20646174612D647A2D6572726F726D6573736167653E3C2F7370616E';
wwv_flow_api.g_varchar2_table(96) := '3E3C2F6469763E5C6E20203C64697620636C6173733D22647A2D737563636573732D6D61726B223E5C6E202020203C7376672077696474683D223534707822206865696768743D2235347078222076696577426F783D2230203020353420353422207665';
wwv_flow_api.g_varchar2_table(97) := '7273696F6E3D22312E312220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B2220786D6C6E733A736B6574';
wwv_flow_api.g_varchar2_table(98) := '63683D22687474703A2F2F7777772E626F68656D69616E636F64696E672E636F6D2F736B657463682F6E73223E5C6E2020202020203C7469746C653E436865636B3C2F7469746C653E5C6E2020202020203C646566733E3C2F646566733E5C6E20202020';
wwv_flow_api.g_varchar2_table(99) := '20203C672069643D22506167652D3122207374726F6B653D226E6F6E6522207374726F6B652D77696474683D2231222066696C6C3D226E6F6E65222066696C6C2D72756C653D226576656E6F64642220736B657463683A747970653D224D535061676522';
wwv_flow_api.g_varchar2_table(100) := '3E5C6E20202020202020203C7061746820643D224D32332E352C33312E38343331343538204C31372E353835323431392C32352E39323833383737204331362E303234383235332C32342E333637393731312031332E343931303239342C32342E333636';
wwv_flow_api.g_varchar2_table(101) := '3833352031312E393238393332322C32352E39323839333232204331302E333730303133362C32372E343837383530382031302E333636353931322C33302E303233343435352031312E393238333837372C33312E35383532343139204C32302E343134';
wwv_flow_api.g_varchar2_table(102) := '373538312C34302E30373136313233204332302E353133333939392C34302E313730323534312032302E363135393331352C34302E323632363634392032302E373231383631352C34302E33343838343335204332322E323833353636392C34312E3837';
wwv_flow_api.g_varchar2_table(103) := '32353635312032342E3739343233342C34312E383632363230322032362E333436313536342C34302E33313036393738204C34332E333130363937382C32332E33343631353634204334342E383737313032312C32312E373739373532312034342E3837';
wwv_flow_api.g_varchar2_table(104) := '35383035372C31392E323438333838372034332E333133373038352C31372E36383632393135204334312E373534373839392C31362E313237333732392033392E323137363033352C31362E313235353432322033372E363533383433362C31372E3638';
wwv_flow_api.g_varchar2_table(105) := '3933303232204C32332E352C33312E38343331343538205A204D32372C3533204334312E333539343033352C35332035332C34312E333539343033352035332C3237204335332C31322E363430353936352034312E333539343033352C312032372C3120';
wwv_flow_api.g_varchar2_table(106) := '4331322E363430353936352C3120312C31322E3634303539363520312C32372043312C34312E333539343033352031322E363430353936352C35332032372C3533205A222069643D224F76616C2D3222207374726F6B652D6F7061636974793D22302E31';
wwv_flow_api.g_varchar2_table(107) := '393837393431353822207374726F6B653D2223373437343734222066696C6C2D6F7061636974793D22302E383136353139343735222066696C6C3D22234646464646462220736B657463683A747970653D224D53536861706547726F7570223E3C2F7061';
wwv_flow_api.g_varchar2_table(108) := '74683E5C6E2020202020203C2F673E5C6E202020203C2F7376673E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D22647A2D6572726F722D6D61726B223E5C6E202020203C7376672077696474683D223534707822206865696768743D22';
wwv_flow_api.g_varchar2_table(109) := '35347078222076696577426F783D22302030203534203534222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77';
wwv_flow_api.g_varchar2_table(110) := '332E6F72672F313939392F786C696E6B2220786D6C6E733A736B657463683D22687474703A2F2F7777772E626F68656D69616E636F64696E672E636F6D2F736B657463682F6E73223E5C6E2020202020203C7469746C653E4572726F723C2F7469746C65';
wwv_flow_api.g_varchar2_table(111) := '3E5C6E2020202020203C646566733E3C2F646566733E5C6E2020202020203C672069643D22506167652D3122207374726F6B653D226E6F6E6522207374726F6B652D77696474683D2231222066696C6C3D226E6F6E65222066696C6C2D72756C653D2265';
wwv_flow_api.g_varchar2_table(112) := '76656E6F64642220736B657463683A747970653D224D5350616765223E5C6E20202020202020203C672069643D22436865636B2D2B2D4F76616C2D322220736B657463683A747970653D224D534C6179657247726F757022207374726F6B653D22233734';
wwv_flow_api.g_varchar2_table(113) := '3734373422207374726F6B652D6F7061636974793D22302E313938373934313538222066696C6C3D2223464646464646222066696C6C2D6F7061636974793D22302E383136353139343735223E5C6E202020202020202020203C7061746820643D224D33';
wwv_flow_api.g_varchar2_table(114) := '322E363536383534322C3239204C33382E333130363937382C32332E33343631353634204333392E383737313032312C32312E373739373532312033392E383735383035372C31392E323438333838372033382E333133373038352C31372E3638363239';
wwv_flow_api.g_varchar2_table(115) := '3135204333362E373534373839392C31362E313237333732392033342E323137363033352C31362E313235353432322033322E363533383433362C31372E36383933303232204C32372C32332E33343331343538204C32312E333436313536342C31372E';
wwv_flow_api.g_varchar2_table(116) := '36383933303232204331392E373832333936352C31362E313235353432322031372E323435323130312C31362E313237333732392031352E363836323931352C31372E36383632393135204331342E313234313934332C31392E32343833383837203134';
wwv_flow_api.g_varchar2_table(117) := '2E313232383937392C32312E373739373532312031352E363839333032322C32332E33343631353634204C32312E333433313435382C3239204C31352E363839333032322C33342E36353338343336204331342E313232383937392C33362E3232303234';
wwv_flow_api.g_varchar2_table(118) := '37392031342E313234313934332C33382E373531363131332031352E363836323931352C34302E33313337303835204331372E323435323130312C34312E383732363237312031392E373832333936352C34312E383734343537382032312E3334363135';
wwv_flow_api.g_varchar2_table(119) := '36342C34302E33313036393738204C32372C33342E36353638353432204C33322E363533383433362C34302E33313036393738204333342E323137363033352C34312E383734343537382033362E373534373839392C34312E383732363237312033382E';
wwv_flow_api.g_varchar2_table(120) := '333133373038352C34302E33313337303835204333392E383735383035372C33382E373531363131332033392E383737313032312C33362E323230323437392033382E333130363937382C33342E36353338343336204C33322E363536383534322C3239';
wwv_flow_api.g_varchar2_table(121) := '205A204D32372C3533204334312E333539343033352C35332035332C34312E333539343033352035332C3237204335332C31322E363430353936352034312E333539343033352C312032372C31204331322E363430353936352C3120312C31322E363430';
wwv_flow_api.g_varchar2_table(122) := '3539363520312C32372043312C34312E333539343033352031322E363430353936352C35332032372C3533205A222069643D224F76616C2D322220736B657463683A747970653D224D53536861706547726F7570223E3C2F706174683E5C6E2020202020';
wwv_flow_api.g_varchar2_table(123) := '2020203C2F673E5C6E2020202020203C2F673E5C6E202020203C2F7376673E5C6E20203C2F6469763E5C6E3C2F6469763E277D2C643D66756E6374696F6E28297B76617220612C622C632C642C652C662C673B666F7228643D617267756D656E74735B30';
wwv_flow_api.g_varchar2_table(124) := '5D2C633D323C3D617267756D656E74732E6C656E6774683F692E63616C6C28617267756D656E74732C31293A5B5D2C663D302C673D632E6C656E6774683B673E663B662B2B297B623D635B665D3B666F72286120696E206229653D625B615D2C645B615D';
wwv_flow_api.g_varchar2_table(125) := '3D657D72657475726E20647D2C632E70726F746F747970652E676574416363657074656446696C65733D66756E6374696F6E28297B76617220612C622C632C642C653B666F7228643D746869732E66696C65732C653D5B5D2C623D302C633D642E6C656E';
wwv_flow_api.g_varchar2_table(126) := '6774683B633E623B622B2B29613D645B625D2C612E61636365707465642626652E707573682861293B72657475726E20657D2C632E70726F746F747970652E67657452656A656374656446696C65733D66756E6374696F6E28297B76617220612C622C63';
wwv_flow_api.g_varchar2_table(127) := '2C642C653B666F7228643D746869732E66696C65732C653D5B5D2C623D302C633D642E6C656E6774683B633E623B622B2B29613D645B625D2C612E61636365707465647C7C652E707573682861293B72657475726E20657D2C632E70726F746F74797065';
wwv_flow_api.g_varchar2_table(128) := '2E67657446696C6573576974685374617475733D66756E6374696F6E2861297B76617220622C632C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C633D302C643D652E6C656E6774683B643E633B632B2B29623D655B635D2C622E';
wwv_flow_api.g_varchar2_table(129) := '7374617475733D3D3D612626662E707573682862293B72657475726E20667D2C632E70726F746F747970652E67657451756575656446696C65733D66756E6374696F6E28297B72657475726E20746869732E67657446696C657357697468537461747573';
wwv_flow_api.g_varchar2_table(130) := '28632E515545554544297D2C632E70726F746F747970652E67657455706C6F6164696E6746696C65733D66756E6374696F6E28297B72657475726E20746869732E67657446696C65735769746853746174757328632E55504C4F4144494E47297D2C632E';
wwv_flow_api.g_varchar2_table(131) := '70726F746F747970652E676574416464656446696C65733D66756E6374696F6E28297B72657475726E20746869732E67657446696C65735769746853746174757328632E4144444544297D2C632E70726F746F747970652E67657441637469766546696C';
wwv_flow_api.g_varchar2_table(132) := '65733D66756E6374696F6E28297B76617220612C622C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C623D302C643D652E6C656E6774683B643E623B622B2B29613D655B625D2C28612E7374617475733D3D3D632E55504C4F4144';
wwv_flow_api.g_varchar2_table(133) := '494E477C7C612E7374617475733D3D3D632E515545554544292626662E707573682861293B72657475726E20667D2C632E70726F746F747970652E696E69743D66756E6374696F6E28297B76617220612C622C642C652C662C672C683B666F722822666F';
wwv_flow_api.g_varchar2_table(134) := '726D223D3D3D746869732E656C656D656E742E7461674E616D652626746869732E656C656D656E742E7365744174747269627574652822656E6374797065222C226D756C7469706172742F666F726D2D6461746122292C746869732E656C656D656E742E';
wwv_flow_api.g_varchar2_table(135) := '636C6173734C6973742E636F6E7461696E73282264726F707A6F6E652229262621746869732E656C656D656E742E717565727953656C6563746F7228222E647A2D6D65737361676522292626746869732E656C656D656E742E617070656E644368696C64';
wwv_flow_api.g_varchar2_table(136) := '28632E637265617465456C656D656E7428273C64697620636C6173733D22647A2D64656661756C7420647A2D6D657373616765223E3C7370616E3E272B746869732E6F7074696F6E732E6469637444656661756C744D6573736167652B223C2F7370616E';
wwv_flow_api.g_varchar2_table(137) := '3E3C2F6469763E2229292C746869732E636C69636B61626C65456C656D656E74732E6C656E677468262628643D66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E68696464656E46696C65496E70757426';
wwv_flow_api.g_varchar2_table(138) := '26612E68696464656E46696C65496E7075742E706172656E744E6F64652E72656D6F76654368696C6428612E68696464656E46696C65496E707574292C612E68696464656E46696C65496E7075743D646F63756D656E742E637265617465456C656D656E';
wwv_flow_api.g_varchar2_table(139) := '742822696E70757422292C612E68696464656E46696C65496E7075742E736574417474726962757465282274797065222C2266696C6522292C286E756C6C3D3D612E6F7074696F6E732E6D617846696C65737C7C612E6F7074696F6E732E6D617846696C';
wwv_flow_api.g_varchar2_table(140) := '65733E31292626612E68696464656E46696C65496E7075742E73657441747472696275746528226D756C7469706C65222C226D756C7469706C6522292C612E68696464656E46696C65496E7075742E636C6173734E616D653D22647A2D68696464656E2D';
wwv_flow_api.g_varchar2_table(141) := '696E707574222C6E756C6C213D612E6F7074696F6E732E616363657074656446696C65732626612E68696464656E46696C65496E7075742E7365744174747269627574652822616363657074222C612E6F7074696F6E732E616363657074656446696C65';
wwv_flow_api.g_varchar2_table(142) := '73292C6E756C6C213D612E6F7074696F6E732E636170747572652626612E68696464656E46696C65496E7075742E736574417474726962757465282263617074757265222C612E6F7074696F6E732E63617074757265292C612E68696464656E46696C65';
wwv_flow_api.g_varchar2_table(143) := '496E7075742E7374796C652E7669736962696C6974793D2268696464656E222C612E68696464656E46696C65496E7075742E7374796C652E706F736974696F6E3D226162736F6C757465222C612E68696464656E46696C65496E7075742E7374796C652E';
wwv_flow_api.g_varchar2_table(144) := '746F703D2230222C612E68696464656E46696C65496E7075742E7374796C652E6C6566743D2230222C612E68696464656E46696C65496E7075742E7374796C652E6865696768743D2230222C612E68696464656E46696C65496E7075742E7374796C652E';
wwv_flow_api.g_varchar2_table(145) := '77696474683D2230222C646F63756D656E742E717565727953656C6563746F7228612E6F7074696F6E732E68696464656E496E707574436F6E7461696E6572292E617070656E644368696C6428612E68696464656E46696C65496E707574292C612E6869';
wwv_flow_api.g_varchar2_table(146) := '6464656E46696C65496E7075742E6164644576656E744C697374656E657228226368616E6765222C66756E6374696F6E28297B76617220622C632C652C663B696628633D612E68696464656E46696C65496E7075742E66696C65732C632E6C656E677468';
wwv_flow_api.g_varchar2_table(147) := '29666F7228653D302C663D632E6C656E6774683B663E653B652B2B29623D635B655D2C612E61646446696C652862293B72657475726E20612E656D69742822616464656466696C6573222C63292C6428297D297D7D2874686973292928292C746869732E';
wwv_flow_api.g_varchar2_table(148) := '55524C3D6E756C6C213D28673D77696E646F772E55524C293F673A77696E646F772E7765626B697455524C2C683D746869732E6576656E74732C653D302C663D682E6C656E6774683B663E653B652B2B29613D685B655D2C746869732E6F6E28612C7468';
wwv_flow_api.g_varchar2_table(149) := '69732E6F7074696F6E735B615D293B72657475726E20746869732E6F6E282275706C6F616470726F6772657373222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E757064617465546F74616C55706C';
wwv_flow_api.g_varchar2_table(150) := '6F616450726F677265737328297D7D287468697329292C746869732E6F6E282272656D6F76656466696C65222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E757064617465546F74616C55706C6F61';
wwv_flow_api.g_varchar2_table(151) := '6450726F677265737328297D7D287468697329292C746869732E6F6E282263616E63656C6564222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E2862297B72657475726E20612E656D69742822636F6D706C657465222C62297D7D';
wwv_flow_api.g_varchar2_table(152) := '287468697329292C746869732E6F6E2822636F6D706C657465222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20303D3D3D612E676574416464656446696C657328292E6C656E6774682626303D3D3D612E';
wwv_flow_api.g_varchar2_table(153) := '67657455706C6F6164696E6746696C657328292E6C656E6774682626303D3D3D612E67657451756575656446696C657328292E6C656E6774683F73657454696D656F75742866756E6374696F6E28297B72657475726E20612E656D697428227175657565';
wwv_flow_api.g_varchar2_table(154) := '636F6D706C65746522297D2C30293A766F696420307D7D287468697329292C623D66756E6374696F6E2861297B72657475726E20612E73746F7050726F7061676174696F6E28292C612E70726576656E7444656661756C743F612E70726576656E744465';
wwv_flow_api.g_varchar2_table(155) := '6661756C7428293A612E72657475726E56616C75653D21317D2C746869732E6C697374656E6572733D5B7B656C656D656E743A746869732E656C656D656E742C6576656E74733A7B6472616773746172743A66756E6374696F6E2861297B72657475726E';
wwv_flow_api.g_varchar2_table(156) := '2066756E6374696F6E2862297B72657475726E20612E656D69742822647261677374617274222C62297D7D2874686973292C64726167656E7465723A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B72657475726E206228';
wwv_flow_api.g_varchar2_table(157) := '63292C612E656D6974282264726167656E746572222C63297D7D2874686973292C647261676F7665723A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B76617220643B7472797B643D632E646174615472616E736665722E';
wwv_flow_api.g_varchar2_table(158) := '656666656374416C6C6F7765647D63617463682865297B7D72657475726E20632E646174615472616E736665722E64726F704566666563743D226D6F7665223D3D3D647C7C226C696E6B4D6F7665223D3D3D643F226D6F7665223A22636F7079222C6228';
wwv_flow_api.g_varchar2_table(159) := '63292C612E656D69742822647261676F766572222C63297D7D2874686973292C647261676C656176653A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2862297B72657475726E20612E656D69742822647261676C65617665222C62';
wwv_flow_api.g_varchar2_table(160) := '297D7D2874686973292C64726F703A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B72657475726E20622863292C612E64726F702863297D7D2874686973292C64726167656E643A66756E6374696F6E2861297B72657475';
wwv_flow_api.g_varchar2_table(161) := '726E2066756E6374696F6E2862297B72657475726E20612E656D6974282264726167656E64222C62297D7D2874686973297D7D5D2C746869732E636C69636B61626C65456C656D656E74732E666F72456163682866756E6374696F6E2861297B72657475';
wwv_flow_api.g_varchar2_table(162) := '726E2066756E6374696F6E2862297B72657475726E20612E6C697374656E6572732E70757368287B656C656D656E743A622C6576656E74733A7B636C69636B3A66756E6374696F6E2864297B72657475726E2862213D3D612E656C656D656E747C7C642E';
wwv_flow_api.g_varchar2_table(163) := '7461726765743D3D3D612E656C656D656E747C7C632E656C656D656E74496E7369646528642E7461726765742C612E656C656D656E742E717565727953656C6563746F7228222E647A2D6D657373616765222929292626612E68696464656E46696C6549';
wwv_flow_api.g_varchar2_table(164) := '6E7075742E636C69636B28292C21307D7D7D297D7D287468697329292C746869732E656E61626C6528292C746869732E6F7074696F6E732E696E69742E63616C6C2874686973297D2C632E70726F746F747970652E64657374726F793D66756E6374696F';
wwv_flow_api.g_varchar2_table(165) := '6E28297B76617220613B72657475726E20746869732E64697361626C6528292C746869732E72656D6F7665416C6C46696C6573282130292C286E756C6C213D28613D746869732E68696464656E46696C65496E707574293F612E706172656E744E6F6465';
wwv_flow_api.g_varchar2_table(166) := '3A766F6964203029262628746869732E68696464656E46696C65496E7075742E706172656E744E6F64652E72656D6F76654368696C6428746869732E68696464656E46696C65496E707574292C746869732E68696464656E46696C65496E7075743D6E75';
wwv_flow_api.g_varchar2_table(167) := '6C6C292C64656C65746520746869732E656C656D656E742E64726F707A6F6E652C632E696E7374616E6365732E73706C69636528632E696E7374616E6365732E696E6465784F662874686973292C31297D2C632E70726F746F747970652E757064617465';
wwv_flow_api.g_varchar2_table(168) := '546F74616C55706C6F616450726F67726573733D66756E6374696F6E28297B76617220612C622C632C642C652C662C672C683B696628643D302C633D302C613D746869732E67657441637469766546696C657328292C612E6C656E677468297B666F7228';
wwv_flow_api.g_varchar2_table(169) := '683D746869732E67657441637469766546696C657328292C663D302C673D682E6C656E6774683B673E663B662B2B29623D685B665D2C642B3D622E75706C6F61642E627974657353656E742C632B3D622E75706C6F61642E746F74616C3B653D3130302A';
wwv_flow_api.g_varchar2_table(170) := '642F637D656C736520653D3130303B72657475726E20746869732E656D69742822746F74616C75706C6F616470726F6772657373222C652C632C64297D2C632E70726F746F747970652E5F676574506172616D4E616D653D66756E6374696F6E2861297B';
wwv_flow_api.g_varchar2_table(171) := '72657475726E2266756E6374696F6E223D3D747970656F6620746869732E6F7074696F6E732E706172616D4E616D653F746869732E6F7074696F6E732E706172616D4E616D652861293A22222B746869732E6F7074696F6E732E706172616D4E616D652B';
wwv_flow_api.g_varchar2_table(172) := '28746869732E6F7074696F6E732E75706C6F61644D756C7469706C653F225B222B612B225D223A2222297D2C632E70726F746F747970652E67657446616C6C6261636B466F726D3D66756E6374696F6E28297B76617220612C622C642C653B7265747572';
wwv_flow_api.g_varchar2_table(173) := '6E28613D746869732E6765744578697374696E6746616C6C6261636B2829293F613A28643D273C64697620636C6173733D22647A2D66616C6C6261636B223E272C746869732E6F7074696F6E732E6469637446616C6C6261636B54657874262628642B3D';
wwv_flow_api.g_varchar2_table(174) := '223C703E222B746869732E6F7074696F6E732E6469637446616C6C6261636B546578742B223C2F703E22292C642B3D273C696E70757420747970653D2266696C6522206E616D653D22272B746869732E5F676574506172616D4E616D652830292B272220';
wwv_flow_api.g_varchar2_table(175) := '272B28746869732E6F7074696F6E732E75706C6F61644D756C7469706C653F276D756C7469706C653D226D756C7469706C6522273A766F69642030292B27202F3E3C696E70757420747970653D227375626D6974222076616C75653D2255706C6F616421';
wwv_flow_api.g_varchar2_table(176) := '223E3C2F6469763E272C623D632E637265617465456C656D656E742864292C22464F524D22213D3D746869732E656C656D656E742E7461674E616D653F28653D632E637265617465456C656D656E7428273C666F726D20616374696F6E3D22272B746869';
wwv_flow_api.g_varchar2_table(177) := '732E6F7074696F6E732E75726C2B272220656E63747970653D226D756C7469706172742F666F726D2D6461746122206D6574686F643D22272B746869732E6F7074696F6E732E6D6574686F642B27223E3C2F666F726D3E27292C652E617070656E644368';
wwv_flow_api.g_varchar2_table(178) := '696C64286229293A28746869732E656C656D656E742E7365744174747269627574652822656E6374797065222C226D756C7469706172742F666F726D2D6461746122292C746869732E656C656D656E742E73657441747472696275746528226D6574686F';
wwv_flow_api.g_varchar2_table(179) := '64222C746869732E6F7074696F6E732E6D6574686F6429292C6E756C6C213D653F653A62297D2C632E70726F746F747970652E6765744578697374696E6746616C6C6261636B3D66756E6374696F6E28297B76617220612C622C632C642C652C663B666F';
wwv_flow_api.g_varchar2_table(180) := '7228623D66756E6374696F6E2861297B76617220622C632C643B666F7228633D302C643D612E6C656E6774683B643E633B632B2B29696628623D615B635D2C2F285E7C202966616C6C6261636B28247C20292F2E7465737428622E636C6173734E616D65';
wwv_flow_api.g_varchar2_table(181) := '292972657475726E20627D2C663D5B22646976222C22666F726D225D2C643D302C653D662E6C656E6774683B653E643B642B2B29696628633D665B645D2C613D6228746869732E656C656D656E742E676574456C656D656E747342795461674E616D6528';
wwv_flow_api.g_varchar2_table(182) := '6329292972657475726E20617D2C632E70726F746F747970652E73657475704576656E744C697374656E6572733D66756E6374696F6E28297B76617220612C622C632C642C652C662C673B666F7228663D746869732E6C697374656E6572732C673D5B5D';
wwv_flow_api.g_varchar2_table(183) := '2C643D302C653D662E6C656E6774683B653E643B642B2B29613D665B645D2C672E707573682866756E6374696F6E28297B76617220642C653B643D612E6576656E74732C653D5B5D3B666F72286220696E206429633D645B625D2C652E7075736828612E';
wwv_flow_api.g_varchar2_table(184) := '656C656D656E742E6164644576656E744C697374656E657228622C632C213129293B72657475726E20657D2829293B72657475726E20677D2C632E70726F746F747970652E72656D6F76654576656E744C697374656E6572733D66756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(185) := '7B76617220612C622C632C642C652C662C673B666F7228663D746869732E6C697374656E6572732C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29613D665B645D2C672E707573682866756E6374696F6E28297B76617220642C65';
wwv_flow_api.g_varchar2_table(186) := '3B643D612E6576656E74732C653D5B5D3B666F72286220696E206429633D645B625D2C652E7075736828612E656C656D656E742E72656D6F76654576656E744C697374656E657228622C632C213129293B72657475726E20657D2829293B72657475726E';
wwv_flow_api.g_varchar2_table(187) := '20677D2C632E70726F746F747970652E64697361626C653D66756E6374696F6E28297B76617220612C622C632C642C653B666F7228746869732E636C69636B61626C65456C656D656E74732E666F72456163682866756E6374696F6E2861297B72657475';
wwv_flow_api.g_varchar2_table(188) := '726E20612E636C6173734C6973742E72656D6F76652822647A2D636C69636B61626C6522297D292C746869732E72656D6F76654576656E744C697374656E65727328292C643D746869732E66696C65732C653D5B5D2C623D302C633D642E6C656E677468';
wwv_flow_api.g_varchar2_table(189) := '3B633E623B622B2B29613D645B625D2C652E7075736828746869732E63616E63656C55706C6F6164286129293B72657475726E20657D2C632E70726F746F747970652E656E61626C653D66756E6374696F6E28297B72657475726E20746869732E636C69';
wwv_flow_api.g_varchar2_table(190) := '636B61626C65456C656D656E74732E666F72456163682866756E6374696F6E2861297B72657475726E20612E636C6173734C6973742E6164642822647A2D636C69636B61626C6522297D292C746869732E73657475704576656E744C697374656E657273';
wwv_flow_api.g_varchar2_table(191) := '28297D2C632E70726F746F747970652E66696C6573697A653D66756E6374696F6E2861297B76617220622C632C642C652C662C672C682C693B696628643D302C653D2262222C613E30297B666F7228673D5B225442222C224742222C224D42222C224B42';
wwv_flow_api.g_varchar2_table(192) := '222C2262225D2C633D683D302C693D672E6C656E6774683B693E683B633D2B2B6829696628663D675B635D2C623D4D6174682E706F7728746869732E6F7074696F6E732E66696C6573697A65426173652C342D63292F31302C613E3D62297B643D612F4D';
wwv_flow_api.g_varchar2_table(193) := '6174682E706F7728746869732E6F7074696F6E732E66696C6573697A65426173652C342D63292C653D663B627265616B7D643D4D6174682E726F756E642831302A64292F31307D72657475726E223C7374726F6E673E222B642B223C2F7374726F6E673E';
wwv_flow_api.g_varchar2_table(194) := '20222B657D2C632E70726F746F747970652E5F7570646174654D617846696C657352656163686564436C6173733D66756E6374696F6E28297B72657475726E206E756C6C213D746869732E6F7074696F6E732E6D617846696C65732626746869732E6765';
wwv_flow_api.g_varchar2_table(195) := '74416363657074656446696C657328292E6C656E6774683E3D746869732E6F7074696F6E732E6D617846696C65733F28746869732E676574416363657074656446696C657328292E6C656E6774683D3D3D746869732E6F7074696F6E732E6D617846696C';
wwv_flow_api.g_varchar2_table(196) := '65732626746869732E656D697428226D617866696C657372656163686564222C746869732E66696C6573292C746869732E656C656D656E742E636C6173734C6973742E6164642822647A2D6D61782D66696C65732D726561636865642229293A74686973';
wwv_flow_api.g_varchar2_table(197) := '2E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D6D61782D66696C65732D7265616368656422297D2C632E70726F746F747970652E64726F703D66756E6374696F6E2861297B76617220622C633B612E646174615472616E7366';
wwv_flow_api.g_varchar2_table(198) := '6572262628746869732E656D6974282264726F70222C61292C623D612E646174615472616E736665722E66696C65732C746869732E656D69742822616464656466696C6573222C62292C622E6C656E677468262628633D612E646174615472616E736665';
wwv_flow_api.g_varchar2_table(199) := '722E6974656D732C632626632E6C656E67746826266E756C6C213D635B305D2E7765626B69744765744173456E7472793F746869732E5F61646446696C657346726F6D4974656D732863293A746869732E68616E646C6546696C657328622929297D2C63';
wwv_flow_api.g_varchar2_table(200) := '2E70726F746F747970652E70617374653D66756E6374696F6E2861297B76617220622C633B6966286E756C6C213D286E756C6C213D6126266E756C6C213D28633D612E636C6970626F61726444617461293F632E6974656D733A766F6964203029297265';
wwv_flow_api.g_varchar2_table(201) := '7475726E20746869732E656D697428227061737465222C61292C623D612E636C6970626F617264446174612E6974656D732C622E6C656E6774683F746869732E5F61646446696C657346726F6D4974656D732862293A766F696420307D2C632E70726F74';
wwv_flow_api.g_varchar2_table(202) := '6F747970652E68616E646C6546696C65733D66756E6374696F6E2861297B76617220622C632C642C653B666F7228653D5B5D2C633D302C643D612E6C656E6774683B643E633B632B2B29623D615B635D2C652E7075736828746869732E61646446696C65';
wwv_flow_api.g_varchar2_table(203) := '286229293B72657475726E20657D2C632E70726F746F747970652E5F61646446696C657346726F6D4974656D733D66756E6374696F6E2861297B76617220622C632C642C652C663B666F7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B';
wwv_flow_api.g_varchar2_table(204) := '642B2B29633D615B645D2C662E70757368286E756C6C213D632E7765626B69744765744173456E747279262628623D632E7765626B69744765744173456E7472792829293F622E697346696C653F746869732E61646446696C6528632E67657441734669';
wwv_flow_api.g_varchar2_table(205) := '6C652829293A622E69734469726563746F72793F746869732E5F61646446696C657346726F6D4469726563746F727928622C622E6E616D65293A766F696420303A6E756C6C213D632E676574417346696C653F6E756C6C3D3D632E6B696E647C7C226669';
wwv_flow_api.g_varchar2_table(206) := '6C65223D3D3D632E6B696E643F746869732E61646446696C6528632E676574417346696C652829293A766F696420303A766F69642030293B72657475726E20667D2C632E70726F746F747970652E5F61646446696C657346726F6D4469726563746F7279';
wwv_flow_api.g_varchar2_table(207) := '3D66756E6374696F6E28612C62297B76617220632C643B72657475726E20633D612E63726561746552656164657228292C643D66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B76617220642C652C663B666F7228653D302C';
wwv_flow_api.g_varchar2_table(208) := '663D632E6C656E6774683B663E653B652B2B29643D635B655D2C642E697346696C653F642E66696C652866756E6374696F6E2863297B72657475726E20612E6F7074696F6E732E69676E6F726548696464656E46696C65732626222E223D3D3D632E6E61';
wwv_flow_api.g_varchar2_table(209) := '6D652E737562737472696E6728302C31293F766F696420303A28632E66756C6C506174683D22222B622B222F222B632E6E616D652C612E61646446696C65286329297D293A642E69734469726563746F72792626612E5F61646446696C657346726F6D44';
wwv_flow_api.g_varchar2_table(210) := '69726563746F727928642C22222B622B222F222B642E6E616D65297D7D2874686973292C632E72656164456E747269657328642C66756E6374696F6E2861297B72657475726E22756E646566696E656422213D747970656F6620636F6E736F6C6526266E';
wwv_flow_api.g_varchar2_table(211) := '756C6C213D3D636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E6C6F673F636F6E736F6C652E6C6F672861293A766F696420307D297D2C632E70726F746F747970652E6163636570743D66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(212) := '2C62297B72657475726E20612E73697A653E313032342A746869732E6F7074696F6E732E6D617846696C6573697A652A313032343F6228746869732E6F7074696F6E732E6469637446696C65546F6F4269672E7265706C61636528227B7B66696C657369';
wwv_flow_api.g_varchar2_table(213) := '7A657D7D222C4D6174682E726F756E6428612E73697A652F313032342F31302E3234292F313030292E7265706C61636528227B7B6D617846696C6573697A657D7D222C746869732E6F7074696F6E732E6D617846696C6573697A6529293A632E69735661';
wwv_flow_api.g_varchar2_table(214) := '6C696446696C6528612C746869732E6F7074696F6E732E616363657074656446696C6573293F6E756C6C213D746869732E6F7074696F6E732E6D617846696C65732626746869732E676574416363657074656446696C657328292E6C656E6774683E3D74';
wwv_flow_api.g_varchar2_table(215) := '6869732E6F7074696F6E732E6D617846696C65733F286228746869732E6F7074696F6E732E646963744D617846696C657345786365656465642E7265706C61636528227B7B6D617846696C65737D7D222C746869732E6F7074696F6E732E6D617846696C';
wwv_flow_api.g_varchar2_table(216) := '657329292C746869732E656D697428226D617866696C65736578636565646564222C6129293A746869732E6F7074696F6E732E6163636570742E63616C6C28746869732C612C62293A6228746869732E6F7074696F6E732E64696374496E76616C696446';
wwv_flow_api.g_varchar2_table(217) := '696C6554797065297D2C632E70726F746F747970652E61646446696C653D66756E6374696F6E2861297B72657475726E20612E75706C6F61643D7B70726F67726573733A302C746F74616C3A612E73697A652C627974657353656E743A307D2C74686973';
wwv_flow_api.g_varchar2_table(218) := '2E66696C65732E707573682861292C612E7374617475733D632E41444445442C746869732E656D69742822616464656466696C65222C61292C746869732E5F656E71756575655468756D626E61696C2861292C746869732E61636365707428612C66756E';
wwv_flow_api.g_varchar2_table(219) := '6374696F6E2862297B72657475726E2066756E6374696F6E2863297B72657475726E20633F28612E61636365707465643D21312C622E5F6572726F7250726F63657373696E67285B615D2C6329293A28612E61636365707465643D21302C622E6F707469';
wwv_flow_api.g_varchar2_table(220) := '6F6E732E6175746F51756575652626622E656E717565756546696C65286129292C622E5F7570646174654D617846696C657352656163686564436C61737328297D7D287468697329297D2C632E70726F746F747970652E656E717565756546696C65733D';
wwv_flow_api.g_varchar2_table(221) := '66756E6374696F6E2861297B76617220622C632C643B666F7228633D302C643D612E6C656E6774683B643E633B632B2B29623D615B635D2C746869732E656E717565756546696C652862293B72657475726E206E756C6C7D2C632E70726F746F74797065';
wwv_flow_api.g_varchar2_table(222) := '2E656E717565756546696C653D66756E6374696F6E2861297B696628612E737461747573213D3D632E41444445447C7C612E6163636570746564213D3D2130297468726F77206E6577204572726F722822546869732066696C652063616E277420626520';
wwv_flow_api.g_varchar2_table(223) := '71756575656420626563617573652069742068617320616C7265616479206265656E2070726F636573736564206F72207761732072656A65637465642E22293B72657475726E20612E7374617475733D632E5155455545442C746869732E6F7074696F6E';
wwv_flow_api.g_varchar2_table(224) := '732E6175746F50726F6365737351756575653F73657454696D656F75742866756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E70726F63657373517565756528297D7D2874686973292C30293A766F696420';
wwv_flow_api.g_varchar2_table(225) := '307D2C632E70726F746F747970652E5F7468756D626E61696C51756575653D5B5D2C632E70726F746F747970652E5F70726F63657373696E675468756D626E61696C3D21312C632E70726F746F747970652E5F656E71756575655468756D626E61696C3D';
wwv_flow_api.g_varchar2_table(226) := '66756E6374696F6E2861297B72657475726E20746869732E6F7074696F6E732E637265617465496D6167655468756D626E61696C732626612E747970652E6D61746368282F696D6167652E2A2F292626612E73697A653C3D313032342A746869732E6F70';
wwv_flow_api.g_varchar2_table(227) := '74696F6E732E6D61785468756D626E61696C46696C6573697A652A313032343F28746869732E5F7468756D626E61696C51756575652E707573682861292C73657454696D656F75742866756E6374696F6E2861297B72657475726E2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(228) := '28297B72657475726E20612E5F70726F636573735468756D626E61696C517565756528297D7D2874686973292C3029293A766F696420307D2C632E70726F746F747970652E5F70726F636573735468756D626E61696C51756575653D66756E6374696F6E';
wwv_flow_api.g_varchar2_table(229) := '28297B72657475726E20746869732E5F70726F63657373696E675468756D626E61696C7C7C303D3D3D746869732E5F7468756D626E61696C51756575652E6C656E6774683F766F696420303A28746869732E5F70726F63657373696E675468756D626E61';
wwv_flow_api.g_varchar2_table(230) := '696C3D21302C746869732E6372656174655468756D626E61696C28746869732E5F7468756D626E61696C51756575652E736869667428292C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E5F70726F63';
wwv_flow_api.g_varchar2_table(231) := '657373696E675468756D626E61696C3D21312C612E5F70726F636573735468756D626E61696C517565756528297D7D28746869732929297D2C632E70726F746F747970652E72656D6F766546696C653D66756E6374696F6E2861297B72657475726E2061';
wwv_flow_api.g_varchar2_table(232) := '2E7374617475733D3D3D632E55504C4F4144494E472626746869732E63616E63656C55706C6F61642861292C746869732E66696C65733D6828746869732E66696C65732C61292C746869732E656D6974282272656D6F76656466696C65222C61292C303D';
wwv_flow_api.g_varchar2_table(233) := '3D3D746869732E66696C65732E6C656E6774683F746869732E656D69742822726573657422293A766F696420307D2C632E70726F746F747970652E72656D6F7665416C6C46696C65733D66756E6374696F6E2861297B76617220622C642C652C663B666F';
wwv_flow_api.g_varchar2_table(234) := '72286E756C6C3D3D61262628613D2131292C663D746869732E66696C65732E736C69636528292C643D302C653D662E6C656E6774683B653E643B642B2B29623D665B645D2C28622E737461747573213D3D632E55504C4F4144494E477C7C612926267468';
wwv_flow_api.g_varchar2_table(235) := '69732E72656D6F766546696C652862293B72657475726E206E756C6C7D2C632E70726F746F747970652E6372656174655468756D626E61696C3D66756E6374696F6E28612C62297B76617220633B72657475726E20633D6E65772046696C655265616465';
wwv_flow_api.g_varchar2_table(236) := '722C632E6F6E6C6F61643D66756E6374696F6E2864297B72657475726E2066756E6374696F6E28297B72657475726E22696D6167652F7376672B786D6C223D3D3D612E747970653F28642E656D697428227468756D626E61696C222C612C632E72657375';
wwv_flow_api.g_varchar2_table(237) := '6C74292C766F6964286E756C6C213D62262662282929293A642E6372656174655468756D626E61696C46726F6D55726C28612C632E726573756C742C62297D7D2874686973292C632E7265616441734461746155524C2861297D2C632E70726F746F7479';
wwv_flow_api.g_varchar2_table(238) := '70652E6372656174655468756D626E61696C46726F6D55726C3D66756E6374696F6E28612C622C632C64297B76617220653B72657475726E20653D646F63756D656E742E637265617465456C656D656E742822696D6722292C64262628652E63726F7373';
wwv_flow_api.g_varchar2_table(239) := '4F726967696E3D64292C652E6F6E6C6F61643D66756E6374696F6E2862297B72657475726E2066756E6374696F6E28297B76617220642C672C682C692C6A2C6B2C6C2C6D3B72657475726E20612E77696474683D652E77696474682C612E686569676874';
wwv_flow_api.g_varchar2_table(240) := '3D652E6865696768742C683D622E6F7074696F6E732E726573697A652E63616C6C28622C61292C6E756C6C3D3D682E7472675769647468262628682E74726757696474683D682E6F70745769647468292C6E756C6C3D3D682E7472674865696768742626';
wwv_flow_api.g_varchar2_table(241) := '28682E7472674865696768743D682E6F7074486569676874292C643D646F63756D656E742E637265617465456C656D656E74282263616E76617322292C673D642E676574436F6E746578742822326422292C642E77696474683D682E7472675769647468';
wwv_flow_api.g_varchar2_table(242) := '2C642E6865696768743D682E7472674865696768742C6628672C652C6E756C6C213D286A3D682E73726358293F6A3A302C6E756C6C213D286B3D682E73726359293F6B3A302C682E73726357696474682C682E7372634865696768742C6E756C6C213D28';
wwv_flow_api.g_varchar2_table(243) := '6C3D682E74726758293F6C3A302C6E756C6C213D286D3D682E74726759293F6D3A302C682E74726757696474682C682E747267486569676874292C693D642E746F4461746155524C2822696D6167652F706E6722292C622E656D697428227468756D626E';
wwv_flow_api.g_varchar2_table(244) := '61696C222C612C69292C6E756C6C213D633F6328293A766F696420307D7D2874686973292C6E756C6C213D63262628652E6F6E6572726F723D63292C652E7372633D627D2C632E70726F746F747970652E70726F6365737351756575653D66756E637469';
wwv_flow_api.g_varchar2_table(245) := '6F6E28297B76617220612C622C632C643B696628623D746869732E6F7074696F6E732E706172616C6C656C55706C6F6164732C633D746869732E67657455706C6F6164696E6746696C657328292E6C656E6774682C613D632C2128633E3D622926262864';
wwv_flow_api.g_varchar2_table(246) := '3D746869732E67657451756575656446696C657328292C642E6C656E6774683E3029297B696628746869732E6F7074696F6E732E75706C6F61644D756C7469706C652972657475726E20746869732E70726F6365737346696C657328642E736C69636528';
wwv_flow_api.g_varchar2_table(247) := '302C622D6329293B666F72283B623E613B297B69662821642E6C656E6774682972657475726E3B746869732E70726F6365737346696C6528642E73686966742829292C612B2B7D7D7D2C632E70726F746F747970652E70726F6365737346696C653D6675';
wwv_flow_api.g_varchar2_table(248) := '6E6374696F6E2861297B72657475726E20746869732E70726F6365737346696C6573285B615D297D2C632E70726F746F747970652E70726F6365737346696C65733D66756E6374696F6E2861297B76617220622C642C653B666F7228643D302C653D612E';
wwv_flow_api.g_varchar2_table(249) := '6C656E6774683B653E643B642B2B29623D615B645D2C622E70726F63657373696E673D21302C622E7374617475733D632E55504C4F4144494E472C746869732E656D6974282270726F63657373696E67222C62293B72657475726E20746869732E6F7074';
wwv_flow_api.g_varchar2_table(250) := '696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282270726F63657373696E676D756C7469706C65222C61292C746869732E75706C6F616446696C65732861297D2C632E70726F746F747970652E5F67657446696C6573576974';
wwv_flow_api.g_varchar2_table(251) := '685868723D66756E6374696F6E2861297B76617220622C633B72657475726E20633D66756E6374696F6E28297B76617220632C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C633D302C643D652E6C656E6774683B643E633B632B';
wwv_flow_api.g_varchar2_table(252) := '2B29623D655B635D2C622E7868723D3D3D612626662E707573682862293B72657475726E20667D2E63616C6C2874686973297D2C632E70726F746F747970652E63616E63656C55706C6F61643D66756E6374696F6E2861297B76617220622C642C652C66';
wwv_flow_api.g_varchar2_table(253) := '2C672C682C693B696628612E7374617475733D3D3D632E55504C4F4144494E47297B666F7228643D746869732E5F67657446696C65735769746858687228612E786872292C653D302C673D642E6C656E6774683B673E653B652B2B29623D645B655D2C62';
wwv_flow_api.g_varchar2_table(254) := '2E7374617475733D632E43414E43454C45443B666F7228612E7868722E61626F727428292C663D302C683D642E6C656E6774683B683E663B662B2B29623D645B665D2C746869732E656D6974282263616E63656C6564222C62293B746869732E6F707469';
wwv_flow_api.g_varchar2_table(255) := '6F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282263616E63656C65646D756C7469706C65222C64297D656C73652828693D612E737461747573293D3D3D632E41444445447C7C693D3D3D632E51554555454429262628612E73';
wwv_flow_api.g_varchar2_table(256) := '74617475733D632E43414E43454C45442C746869732E656D6974282263616E63656C6564222C61292C746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282263616E63656C65646D756C7469706C65222C5B';
wwv_flow_api.g_varchar2_table(257) := '615D29293B72657475726E20746869732E6F7074696F6E732E6175746F50726F6365737351756575653F746869732E70726F63657373517565756528293A766F696420307D2C653D66756E6374696F6E28297B76617220612C623B72657475726E20623D';
wwv_flow_api.g_varchar2_table(258) := '617267756D656E74735B305D2C613D323C3D617267756D656E74732E6C656E6774683F692E63616C6C28617267756D656E74732C31293A5B5D2C2266756E6374696F6E223D3D747970656F6620623F622E6170706C7928746869732C61293A627D2C632E';
wwv_flow_api.g_varchar2_table(259) := '70726F746F747970652E75706C6F616446696C653D66756E6374696F6E2861297B72657475726E20746869732E75706C6F616446696C6573285B615D297D2C632E70726F746F747970652E75706C6F616446696C65733D66756E6374696F6E2861297B76';
wwv_flow_api.g_varchar2_table(260) := '617220622C662C672C682C692C6A2C6B2C6C2C6D2C6E2C6F2C702C712C722C732C742C752C762C772C782C792C7A2C412C422C432C442C452C462C472C482C492C4A2C4B2C4C3B666F7228773D6E657720584D4C48747470526571756573742C783D302C';
wwv_flow_api.g_varchar2_table(261) := '423D612E6C656E6774683B423E783B782B2B29623D615B785D2C622E7868723D773B703D6528746869732E6F7074696F6E732E6D6574686F642C61292C753D6528746869732E6F7074696F6E732E75726C2C61292C772E6F70656E28702C752C2130292C';
wwv_flow_api.g_varchar2_table(262) := '772E7769746843726564656E7469616C733D2121746869732E6F7074696F6E732E7769746843726564656E7469616C732C733D6E756C6C2C673D66756E6374696F6E2863297B72657475726E2066756E6374696F6E28297B76617220642C652C663B666F';
wwv_flow_api.g_varchar2_table(263) := '7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B642B2B29623D615B645D2C662E7075736828632E5F6572726F7250726F63657373696E6728612C737C7C632E6F7074696F6E732E64696374526573706F6E73654572726F722E7265706C';
wwv_flow_api.g_varchar2_table(264) := '61636528227B7B737461747573436F64657D7D222C772E737461747573292C7729293B72657475726E20667D7D2874686973292C743D66756E6374696F6E2863297B72657475726E2066756E6374696F6E2864297B76617220652C662C672C682C692C6A';
wwv_flow_api.g_varchar2_table(265) := '2C6B2C6C2C6D3B6966286E756C6C213D6429666F7228663D3130302A642E6C6F616465642F642E746F74616C2C673D302C6A3D612E6C656E6774683B6A3E673B672B2B29623D615B675D2C622E75706C6F61643D7B70726F67726573733A662C746F7461';
wwv_flow_api.g_varchar2_table(266) := '6C3A642E746F74616C2C627974657353656E743A642E6C6F616465647D3B656C73657B666F7228653D21302C663D3130302C683D302C6B3D612E6C656E6774683B6B3E683B682B2B29623D615B685D2C28313030213D3D622E75706C6F61642E70726F67';
wwv_flow_api.g_varchar2_table(267) := '726573737C7C622E75706C6F61642E627974657353656E74213D3D622E75706C6F61642E746F74616C29262628653D2131292C622E75706C6F61642E70726F67726573733D662C622E75706C6F61642E627974657353656E743D622E75706C6F61642E74';
wwv_flow_api.g_varchar2_table(268) := '6F74616C3B696628652972657475726E7D666F72286D3D5B5D2C693D302C6C3D612E6C656E6774683B6C3E693B692B2B29623D615B695D2C6D2E7075736828632E656D6974282275706C6F616470726F6772657373222C622C662C622E75706C6F61642E';
wwv_flow_api.g_varchar2_table(269) := '627974657353656E7429293B72657475726E206D7D7D2874686973292C772E6F6E6C6F61643D66756E6374696F6E2862297B72657475726E2066756E6374696F6E2864297B76617220653B696628615B305D2E737461747573213D3D632E43414E43454C';
wwv_flow_api.g_varchar2_table(270) := '45442626343D3D3D772E72656164795374617465297B696628733D772E726573706F6E7365546578742C772E676574526573706F6E73654865616465722822636F6E74656E742D74797065222926267E772E676574526573706F6E736548656164657228';
wwv_flow_api.g_varchar2_table(271) := '22636F6E74656E742D7479706522292E696E6465784F6628226170706C69636174696F6E2F6A736F6E2229297472797B733D4A534F4E2E70617273652873297D63617463682866297B643D662C733D22496E76616C6964204A534F4E20726573706F6E73';
wwv_flow_api.g_varchar2_table(272) := '652066726F6D207365727665722E227D72657475726E207428292C3230303C3D28653D772E7374617475732926263330303E653F622E5F66696E697368656428612C732C64293A6728297D7D7D2874686973292C772E6F6E6572726F723D66756E637469';
wwv_flow_api.g_varchar2_table(273) := '6F6E28297B72657475726E2066756E6374696F6E28297B72657475726E20615B305D2E737461747573213D3D632E43414E43454C45443F6728293A766F696420307D7D2874686973292C723D6E756C6C213D28473D772E75706C6F6164293F473A772C72';
wwv_flow_api.g_varchar2_table(274) := '2E6F6E70726F67726573733D742C6A3D7B4163636570743A226170706C69636174696F6E2F6A736F6E222C2243616368652D436F6E74726F6C223A226E6F2D6361636865222C22582D5265717565737465642D57697468223A22584D4C48747470526571';
wwv_flow_api.g_varchar2_table(275) := '75657374227D2C746869732E6F7074696F6E732E68656164657273262664286A2C746869732E6F7074696F6E732E68656164657273293B666F72286820696E206A29693D6A5B685D2C692626772E7365745265717565737448656164657228682C69293B';
wwv_flow_api.g_varchar2_table(276) := '696628663D6E657720466F726D446174612C746869732E6F7074696F6E732E706172616D73297B483D746869732E6F7074696F6E732E706172616D733B666F72286F20696E204829763D485B6F5D2C662E617070656E64286F2C76297D666F7228793D30';
wwv_flow_api.g_varchar2_table(277) := '2C433D612E6C656E6774683B433E793B792B2B29623D615B795D2C746869732E656D6974282273656E64696E67222C622C772C66293B696628746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282273656E';
wwv_flow_api.g_varchar2_table(278) := '64696E676D756C7469706C65222C612C772C66292C22464F524D223D3D3D746869732E656C656D656E742E7461674E616D6529666F7228493D746869732E656C656D656E742E717565727953656C6563746F72416C6C2822696E7075742C207465787461';
wwv_flow_api.g_varchar2_table(279) := '7265612C2073656C6563742C20627574746F6E22292C7A3D302C443D492E6C656E6774683B443E7A3B7A2B2B296966286C3D495B7A5D2C6D3D6C2E67657441747472696275746528226E616D6522292C6E3D6C2E67657441747472696275746528227479';
wwv_flow_api.g_varchar2_table(280) := '706522292C2253454C454354223D3D3D6C2E7461674E616D6526266C2E68617341747472696275746528226D756C7469706C65222929666F72284A3D6C2E6F7074696F6E732C413D302C453D4A2E6C656E6774683B453E413B412B2B29713D4A5B415D2C';
wwv_flow_api.g_varchar2_table(281) := '712E73656C65637465642626662E617070656E64286D2C712E76616C7565293B656C736528216E7C7C22636865636B626F7822213D3D284B3D6E2E746F4C6F77657243617365282929262622726164696F22213D3D4B7C7C6C2E636865636B6564292626';
wwv_flow_api.g_varchar2_table(282) := '662E617070656E64286D2C6C2E76616C7565293B666F72286B3D463D302C4C3D612E6C656E6774682D313B4C3E3D303F4C3E3D463A463E3D4C3B6B3D4C3E3D303F2B2B463A2D2D4629662E617070656E6428746869732E5F676574506172616D4E616D65';
wwv_flow_api.g_varchar2_table(283) := '286B292C615B6B5D2C615B6B5D2E6E616D65293B72657475726E20746869732E7375626D69745265717565737428772C662C61297D2C632E70726F746F747970652E7375626D6974526571756573743D66756E6374696F6E28612C62297B72657475726E';
wwv_flow_api.g_varchar2_table(284) := '20612E73656E642862297D2C632E70726F746F747970652E5F66696E69736865643D66756E6374696F6E28612C622C64297B76617220652C662C673B666F7228663D302C673D612E6C656E6774683B673E663B662B2B29653D615B665D2C652E73746174';
wwv_flow_api.g_varchar2_table(285) := '75733D632E535543434553532C746869732E656D6974282273756363657373222C652C622C64292C746869732E656D69742822636F6D706C657465222C65293B72657475726E20746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626';
wwv_flow_api.g_varchar2_table(286) := '28746869732E656D69742822737563636573736D756C7469706C65222C612C622C64292C746869732E656D69742822636F6D706C6574656D756C7469706C65222C6129292C746869732E6F7074696F6E732E6175746F50726F6365737351756575653F74';
wwv_flow_api.g_varchar2_table(287) := '6869732E70726F63657373517565756528293A766F696420307D2C632E70726F746F747970652E5F6572726F7250726F63657373696E673D66756E6374696F6E28612C622C64297B76617220652C662C673B666F7228663D302C673D612E6C656E677468';
wwv_flow_api.g_varchar2_table(288) := '3B673E663B662B2B29653D615B665D2C652E7374617475733D632E4552524F522C746869732E656D697428226572726F72222C652C622C64292C746869732E656D69742822636F6D706C657465222C65293B72657475726E20746869732E6F7074696F6E';
wwv_flow_api.g_varchar2_table(289) := '732E75706C6F61644D756C7469706C65262628746869732E656D697428226572726F726D756C7469706C65222C612C622C64292C746869732E656D69742822636F6D706C6574656D756C7469706C65222C6129292C746869732E6F7074696F6E732E6175';
wwv_flow_api.g_varchar2_table(290) := '746F50726F6365737351756575653F746869732E70726F63657373517565756528293A766F696420307D2C637D2862292C612E76657273696F6E3D22342E322E30222C612E6F7074696F6E733D7B7D2C612E6F7074696F6E73466F72456C656D656E743D';
wwv_flow_api.g_varchar2_table(291) := '66756E6374696F6E2862297B72657475726E20622E6765744174747269627574652822696422293F612E6F7074696F6E735B6328622E676574417474726962757465282269642229295D3A766F696420307D2C612E696E7374616E6365733D5B5D2C612E';
wwv_flow_api.g_varchar2_table(292) := '666F72456C656D656E743D66756E6374696F6E2861297B69662822737472696E67223D3D747970656F662061262628613D646F63756D656E742E717565727953656C6563746F72286129292C6E756C6C3D3D286E756C6C213D613F612E64726F707A6F6E';
wwv_flow_api.g_varchar2_table(293) := '653A766F6964203029297468726F77206E6577204572726F7228224E6F2044726F707A6F6E6520666F756E6420666F7220676976656E20656C656D656E742E20546869732069732070726F6261626C79206265636175736520796F752772652074727969';
wwv_flow_api.g_varchar2_table(294) := '6E6720746F20616363657373206974206265666F72652044726F707A6F6E6520686164207468652074696D6520746F20696E697469616C697A652E20557365207468652060696E697460206F7074696F6E20746F20736574757020616E79206164646974';
wwv_flow_api.g_varchar2_table(295) := '696F6E616C206F6273657276657273206F6E20796F75722044726F707A6F6E652E22293B72657475726E20612E64726F707A6F6E657D2C612E6175746F446973636F7665723D21302C612E646973636F7665723D66756E6374696F6E28297B7661722062';
wwv_flow_api.g_varchar2_table(296) := '2C632C642C652C662C673B666F7228646F63756D656E742E717565727953656C6563746F72416C6C3F643D646F63756D656E742E717565727953656C6563746F72416C6C28222E64726F707A6F6E6522293A28643D5B5D2C623D66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(297) := '297B76617220622C632C652C663B666F7228663D5B5D2C633D302C653D612E6C656E6774683B653E633B632B2B29623D615B635D2C662E70757368282F285E7C202964726F707A6F6E6528247C20292F2E7465737428622E636C6173734E616D65293F64';
wwv_flow_api.g_varchar2_table(298) := '2E707573682862293A766F69642030293B72657475726E20667D2C6228646F63756D656E742E676574456C656D656E747342795461674E616D6528226469762229292C6228646F63756D656E742E676574456C656D656E747342795461674E616D652822';
wwv_flow_api.g_varchar2_table(299) := '666F726D222929292C673D5B5D2C653D302C663D642E6C656E6774683B663E653B652B2B29633D645B655D2C672E7075736828612E6F7074696F6E73466F72456C656D656E74286329213D3D21313F6E657720612863293A766F69642030293B72657475';
wwv_flow_api.g_varchar2_table(300) := '726E20677D2C612E626C61636B6C697374656442726F77736572733D5B2F6F706572612E2A4D6163696E746F73682E2A76657273696F6E5C2F31322F695D2C612E697342726F77736572537570706F727465643D66756E6374696F6E28297B7661722062';
wwv_flow_api.g_varchar2_table(301) := '2C632C642C652C663B696628623D21302C77696E646F772E46696C65262677696E646F772E46696C65526561646572262677696E646F772E46696C654C697374262677696E646F772E426C6F62262677696E646F772E466F726D446174612626646F6375';
wwv_flow_api.g_varchar2_table(302) := '6D656E742E717565727953656C6563746F722969662822636C6173734C69737422696E20646F63756D656E742E637265617465456C656D656E74282261222929666F7228663D612E626C61636B6C697374656442726F77736572732C643D302C653D662E';
wwv_flow_api.g_varchar2_table(303) := '6C656E6774683B653E643B642B2B29633D665B645D2C632E74657374286E6176696761746F722E757365724167656E7429262628623D2131293B656C736520623D21313B656C736520623D21313B72657475726E20627D2C683D66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(304) := '2C62297B76617220632C642C652C663B666F7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B642B2B29633D615B645D2C63213D3D622626662E707573682863293B72657475726E20667D2C633D66756E6374696F6E2861297B72657475';
wwv_flow_api.g_varchar2_table(305) := '726E20612E7265706C616365282F5B5C2D5F5D285C77292F672C66756E6374696F6E2861297B72657475726E20612E6368617241742831292E746F55707065724361736528297D297D2C612E637265617465456C656D656E743D66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(306) := '297B76617220623B72657475726E20623D646F63756D656E742E637265617465456C656D656E74282264697622292C622E696E6E657248544D4C3D612C622E6368696C644E6F6465735B305D7D2C612E656C656D656E74496E736964653D66756E637469';
wwv_flow_api.g_varchar2_table(307) := '6F6E28612C62297B696628613D3D3D622972657475726E21303B666F72283B613D612E706172656E744E6F64653B29696628613D3D3D622972657475726E21303B72657475726E21317D2C612E676574456C656D656E743D66756E6374696F6E28612C62';
wwv_flow_api.g_varchar2_table(308) := '297B76617220633B69662822737472696E67223D3D747970656F6620613F633D646F63756D656E742E717565727953656C6563746F722861293A6E756C6C213D612E6E6F646554797065262628633D61292C6E756C6C3D3D63297468726F77206E657720';
wwv_flow_api.g_varchar2_table(309) := '4572726F722822496E76616C69642060222B622B2260206F7074696F6E2070726F76696465642E20506C656173652070726F766964652061204353532073656C6563746F72206F72206120706C61696E2048544D4C20656C656D656E742E22293B726574';
wwv_flow_api.g_varchar2_table(310) := '75726E20637D2C612E676574456C656D656E74733D66756E6374696F6E28612C62297B76617220632C642C652C662C672C682C692C6A3B6966286120696E7374616E63656F66204172726179297B653D5B5D3B7472797B666F7228663D302C683D612E6C';
wwv_flow_api.g_varchar2_table(311) := '656E6774683B683E663B662B2B29643D615B665D2C652E7075736828746869732E676574456C656D656E7428642C6229297D6361746368286B297B633D6B2C653D6E756C6C7D7D656C73652069662822737472696E67223D3D747970656F66206129666F';
wwv_flow_api.g_varchar2_table(312) := '7228653D5B5D2C6A3D646F63756D656E742E717565727953656C6563746F72416C6C2861292C673D302C693D6A2E6C656E6774683B693E673B672B2B29643D6A5B675D2C652E707573682864293B656C7365206E756C6C213D612E6E6F64655479706526';
wwv_flow_api.g_varchar2_table(313) := '2628653D5B615D293B6966286E756C6C3D3D657C7C21652E6C656E677468297468726F77206E6577204572726F722822496E76616C69642060222B622B2260206F7074696F6E2070726F76696465642E20506C656173652070726F766964652061204353';
wwv_flow_api.g_varchar2_table(314) := '532073656C6563746F722C206120706C61696E2048544D4C20656C656D656E74206F722061206C697374206F662074686F73652E22293B72657475726E20657D2C612E636F6E6669726D3D66756E6374696F6E28612C622C63297B72657475726E207769';
wwv_flow_api.g_varchar2_table(315) := '6E646F772E636F6E6669726D2861293F6228293A6E756C6C213D633F6328293A766F696420307D2C612E697356616C696446696C653D66756E6374696F6E28612C62297B76617220632C642C652C662C673B69662821622972657475726E21303B666F72';
wwv_flow_api.g_varchar2_table(316) := '28623D622E73706C697428222C22292C643D612E747970652C633D642E7265706C616365282F5C2F2E2A242F2C2222292C663D302C673D622E6C656E6774683B673E663B662B2B29696628653D625B665D2C653D652E7472696D28292C222E223D3D3D65';
wwv_flow_api.g_varchar2_table(317) := '2E636861724174283029297B6966282D31213D3D612E6E616D652E746F4C6F7765724361736528292E696E6465784F6628652E746F4C6F7765724361736528292C612E6E616D652E6C656E6774682D652E6C656E677468292972657475726E21307D656C';
wwv_flow_api.g_varchar2_table(318) := '7365206966282F5C2F5C2A242F2E74657374286529297B696628633D3D3D652E7265706C616365282F5C2F2E2A242F2C2222292972657475726E21307D656C736520696628643D3D3D652972657475726E21303B72657475726E21317D2C22756E646566';
wwv_flow_api.g_varchar2_table(319) := '696E656422213D747970656F66206A517565727926266E756C6C213D3D6A51756572792626286A51756572792E666E2E64726F707A6F6E653D66756E6374696F6E2862297B72657475726E20746869732E656163682866756E6374696F6E28297B726574';
wwv_flow_api.g_varchar2_table(320) := '75726E206E6577206128746869732C62297D297D292C22756E646566696E656422213D747970656F66206D6F64756C6526266E756C6C213D3D6D6F64756C653F6D6F64756C652E6578706F7274733D613A77696E646F772E44726F707A6F6E653D612C61';
wwv_flow_api.g_varchar2_table(321) := '2E41444445443D226164646564222C612E5155455545443D22717565756564222C612E41434345505445443D612E5155455545442C612E55504C4F4144494E473D2275706C6F6164696E67222C612E50524F43455353494E473D612E55504C4F4144494E';
wwv_flow_api.g_varchar2_table(322) := '472C612E43414E43454C45443D2263616E63656C6564222C612E4552524F523D226572726F72222C612E535543434553533D2273756363657373222C653D66756E6374696F6E2861297B76617220622C632C642C652C662C672C682C692C6A2C6B3B0A66';
wwv_flow_api.g_varchar2_table(323) := '6F7228683D612E6E61747572616C57696474682C673D612E6E61747572616C4865696768742C633D646F63756D656E742E637265617465456C656D656E74282263616E76617322292C632E77696474683D312C632E6865696768743D672C643D632E6765';
wwv_flow_api.g_varchar2_table(324) := '74436F6E746578742822326422292C642E64726177496D61676528612C302C30292C653D642E676574496D6167654461746128302C302C312C67292E646174612C6B3D302C663D672C693D673B693E6B3B29623D655B342A28692D31292B335D2C303D3D';
wwv_flow_api.g_varchar2_table(325) := '3D623F663D693A6B3D692C693D662B6B3E3E313B72657475726E206A3D692F672C303D3D3D6A3F313A6A7D2C663D66756E6374696F6E28612C622C632C642C662C672C682C692C6A2C6B297B766172206C3B72657475726E206C3D652862292C612E6472';
wwv_flow_api.g_varchar2_table(326) := '6177496D61676528622C632C642C662C672C682C692C6A2C6B2F6C297D2C643D66756E6374696F6E28612C62297B76617220632C642C652C662C672C682C692C6A2C6B3B696628653D21312C6B3D21302C643D612E646F63756D656E742C6A3D642E646F';
wwv_flow_api.g_varchar2_table(327) := '63756D656E74456C656D656E742C633D642E6164644576656E744C697374656E65723F226164644576656E744C697374656E6572223A226174746163684576656E74222C693D642E6164644576656E744C697374656E65723F2272656D6F76654576656E';
wwv_flow_api.g_varchar2_table(328) := '744C697374656E6572223A226465746163684576656E74222C683D642E6164644576656E744C697374656E65723F22223A226F6E222C663D66756E6374696F6E2863297B72657475726E22726561647973746174656368616E676522213D3D632E747970';
wwv_flow_api.g_varchar2_table(329) := '657C7C22636F6D706C657465223D3D3D642E726561647953746174653F2828226C6F6164223D3D3D632E747970653F613A64295B695D28682B632E747970652C662C2131292C2165262628653D2130293F622E63616C6C28612C632E747970657C7C6329';
wwv_flow_api.g_varchar2_table(330) := '3A766F69642030293A766F696420307D2C673D66756E6374696F6E28297B76617220613B7472797B6A2E646F5363726F6C6C28226C65667422297D63617463682862297B72657475726E20613D622C766F69642073657454696D656F757428672C353029';
wwv_flow_api.g_varchar2_table(331) := '7D72657475726E20662822706F6C6C22297D2C22636F6D706C65746522213D3D642E72656164795374617465297B696628642E6372656174654576656E744F626A65637426266A2E646F5363726F6C6C297B7472797B6B3D21612E6672616D65456C656D';
wwv_flow_api.g_varchar2_table(332) := '656E747D6361746368286C297B7D6B26266728297D72657475726E20645B635D28682B22444F4D436F6E74656E744C6F61646564222C662C2131292C645B635D28682B22726561647973746174656368616E6765222C662C2131292C615B635D28682B22';
wwv_flow_api.g_varchar2_table(333) := '6C6F6164222C662C2131297D7D2C612E5F6175746F446973636F76657246756E6374696F6E3D66756E6374696F6E28297B72657475726E20612E6175746F446973636F7665723F612E646973636F76657228293A766F696420307D2C642877696E646F77';
wwv_flow_api.g_varchar2_table(334) := '2C612E5F6175746F446973636F76657246756E6374696F6E297D292E63616C6C2874686973293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(43446997639068739)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_file_name=>'dropzone.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '402D7765626B69742D6B65796672616D65732070617373696E672D7468726F7567687B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D6F7A2D7472616E73666F726D3A7472';
wwv_flow_api.g_varchar2_table(2) := '616E736C617465592834307078293B2D6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E73666F726D3A7472616E736C617465592834307078293B7472616E73666F726D3A7472616E736C6174655928343070';
wwv_flow_api.g_varchar2_table(3) := '78297D3330252C203730257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D732D7472616E73666F726D';
wwv_flow_api.g_varchar2_table(4) := '3A7472616E736C6174655928307078293B2D6F2D7472616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D3A7472616E736C6174655928307078297D313030257B6F7061636974793A303B2D7765626B69742D7472616E73';
wwv_flow_api.g_varchar2_table(5) := '666F726D3A7472616E736C61746559282D34307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6D732D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6F2D7472616E73666F726D';
wwv_flow_api.g_varchar2_table(6) := '3A7472616E736C61746559282D34307078293B7472616E73666F726D3A7472616E736C61746559282D34307078297D7D402D6D6F7A2D6B65796672616D65732070617373696E672D7468726F7567687B30257B6F7061636974793A303B2D7765626B6974';
wwv_flow_api.g_varchar2_table(7) := '2D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E7366';
wwv_flow_api.g_varchar2_table(8) := '6F726D3A7472616E736C617465592834307078293B7472616E73666F726D3A7472616E736C617465592834307078297D3330252C203730257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7472616E736C617465592830707829';
wwv_flow_api.g_varchar2_table(9) := '3B2D6D6F7A2D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D732D7472616E73666F726D3A7472616E736C6174655928307078293B2D6F2D7472616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D';
wwv_flow_api.g_varchar2_table(10) := '3A7472616E736C6174655928307078297D313030257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C61746559282D3430707829';
wwv_flow_api.g_varchar2_table(11) := '3B2D6D732D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6F2D7472616E73666F726D3A7472616E736C61746559282D34307078293B7472616E73666F726D3A7472616E736C61746559282D34307078297D7D406B6579667261';
wwv_flow_api.g_varchar2_table(12) := '6D65732070617373696E672D7468726F7567687B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C617465592834307078293B';
wwv_flow_api.g_varchar2_table(13) := '2D6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E73666F726D3A7472616E736C617465592834307078293B7472616E73666F726D3A7472616E736C617465592834307078297D3330252C203730257B6F7061';
wwv_flow_api.g_varchar2_table(14) := '636974793A313B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D732D7472616E73666F726D3A7472616E736C6174655928307078';
wwv_flow_api.g_varchar2_table(15) := '293B2D6F2D7472616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D3A7472616E736C6174655928307078297D313030257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C61746559';
wwv_flow_api.g_varchar2_table(16) := '282D34307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6D732D7472616E73666F726D3A7472616E736C61746559282D34307078293B2D6F2D7472616E73666F726D3A7472616E736C61746559282D3430';
wwv_flow_api.g_varchar2_table(17) := '7078293B7472616E73666F726D3A7472616E736C61746559282D34307078297D7D402D7765626B69742D6B65796672616D657320736C6964652D696E7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C6174';
wwv_flow_api.g_varchar2_table(18) := '65592834307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E73666F726D3A7472616E736C617465592834307078';
wwv_flow_api.g_varchar2_table(19) := '293B7472616E73666F726D3A7472616E736C617465592834307078297D3330257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C6174';
wwv_flow_api.g_varchar2_table(20) := '655928307078293B2D6D732D7472616E73666F726D3A7472616E736C6174655928307078293B2D6F2D7472616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D3A7472616E736C6174655928307078297D7D402D6D6F7A2D';
wwv_flow_api.g_varchar2_table(21) := '6B65796672616D657320736C6964652D696E7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C617465592834307078293B2D';
wwv_flow_api.g_varchar2_table(22) := '6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E73666F726D3A7472616E736C617465592834307078293B7472616E73666F726D3A7472616E736C617465592834307078297D3330257B6F7061636974793A31';
wwv_flow_api.g_varchar2_table(23) := '3B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D732D7472616E73666F726D3A7472616E736C6174655928307078293B2D6F2D74';
wwv_flow_api.g_varchar2_table(24) := '72616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D3A7472616E736C6174655928307078297D7D406B65796672616D657320736C6964652D696E7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F';
wwv_flow_api.g_varchar2_table(25) := '726D3A7472616E736C617465592834307078293B2D6D6F7A2D7472616E73666F726D3A7472616E736C617465592834307078293B2D6D732D7472616E73666F726D3A7472616E736C617465592834307078293B2D6F2D7472616E73666F726D3A7472616E';
wwv_flow_api.g_varchar2_table(26) := '736C617465592834307078293B7472616E73666F726D3A7472616E736C617465592834307078297D3330257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7472616E736C6174655928307078293B2D6D6F7A2D7472616E73666F';
wwv_flow_api.g_varchar2_table(27) := '726D3A7472616E736C6174655928307078293B2D6D732D7472616E73666F726D3A7472616E736C6174655928307078293B2D6F2D7472616E73666F726D3A7472616E736C6174655928307078293B7472616E73666F726D3A7472616E736C617465592830';
wwv_flow_api.g_varchar2_table(28) := '7078297D7D402D7765626B69742D6B65796672616D65732070756C73657B30257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B2D6D6F7A2D7472616E73666F726D3A7363616C652831293B2D6D732D7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(29) := '616C652831293B2D6F2D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D3130257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31293B2D6D6F7A2D7472616E73666F726D3A7363616C';
wwv_flow_api.g_varchar2_table(30) := '6528312E31293B2D6D732D7472616E73666F726D3A7363616C6528312E31293B2D6F2D7472616E73666F726D3A7363616C6528312E31293B7472616E73666F726D3A7363616C6528312E31297D3230257B2D7765626B69742D7472616E73666F726D3A73';
wwv_flow_api.g_varchar2_table(31) := '63616C652831293B2D6D6F7A2D7472616E73666F726D3A7363616C652831293B2D6D732D7472616E73666F726D3A7363616C652831293B2D6F2D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D402D6D';
wwv_flow_api.g_varchar2_table(32) := '6F7A2D6B65796672616D65732070756C73657B30257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B2D6D6F7A2D7472616E73666F726D3A7363616C652831293B2D6D732D7472616E73666F726D3A7363616C652831293B2D6F2D74';
wwv_flow_api.g_varchar2_table(33) := '72616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D3130257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31293B2D6D6F7A2D7472616E73666F726D3A7363616C6528312E31293B2D6D732D';
wwv_flow_api.g_varchar2_table(34) := '7472616E73666F726D3A7363616C6528312E31293B2D6F2D7472616E73666F726D3A7363616C6528312E31293B7472616E73666F726D3A7363616C6528312E31297D3230257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B2D6D6F';
wwv_flow_api.g_varchar2_table(35) := '7A2D7472616E73666F726D3A7363616C652831293B2D6D732D7472616E73666F726D3A7363616C652831293B2D6F2D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D65732070756C';
wwv_flow_api.g_varchar2_table(36) := '73657B30257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B2D6D6F7A2D7472616E73666F726D3A7363616C652831293B2D6D732D7472616E73666F726D3A7363616C652831293B2D6F2D7472616E73666F726D3A7363616C652831';
wwv_flow_api.g_varchar2_table(37) := '293B7472616E73666F726D3A7363616C652831297D3130257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E31293B2D6D6F7A2D7472616E73666F726D3A7363616C6528312E31293B2D6D732D7472616E73666F726D3A7363616C6528';
wwv_flow_api.g_varchar2_table(38) := '312E31293B2D6F2D7472616E73666F726D3A7363616C6528312E31293B7472616E73666F726D3A7363616C6528312E31297D3230257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B2D6D6F7A2D7472616E73666F726D3A7363616C';
wwv_flow_api.g_varchar2_table(39) := '652831293B2D6D732D7472616E73666F726D3A7363616C652831293B2D6F2D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D2E64726F707A6F6E652C2E64726F707A6F6E65202A7B626F782D73697A69';
wwv_flow_api.g_varchar2_table(40) := '6E673A626F726465722D626F787D2E64726F707A6F6E657B6D696E2D6865696768743A31353070783B626F726465723A32707820736F6C6964207267626128302C302C302C302E33293B6261636B67726F756E643A77686974653B70616464696E673A32';
wwv_flow_api.g_varchar2_table(41) := '30707820323070787D2E64726F707A6F6E652E647A2D636C69636B61626C657B637572736F723A706F696E7465727D2E64726F707A6F6E652E647A2D636C69636B61626C65202A7B637572736F723A64656661756C747D2E64726F707A6F6E652E647A2D';
wwv_flow_api.g_varchar2_table(42) := '636C69636B61626C65202E647A2D6D6573736167652C2E64726F707A6F6E652E647A2D636C69636B61626C65202E647A2D6D657373616765202A7B637572736F723A706F696E7465727D2E64726F707A6F6E652E647A2D73746172746564202E647A2D6D';
wwv_flow_api.g_varchar2_table(43) := '6573736167657B646973706C61793A6E6F6E657D2E64726F707A6F6E652E647A2D647261672D686F7665727B626F726465722D7374796C653A736F6C69647D2E64726F707A6F6E652E647A2D647261672D686F766572202E647A2D6D6573736167657B6F';
wwv_flow_api.g_varchar2_table(44) := '7061636974793A302E357D2E64726F707A6F6E65202E647A2D6D6573736167657B746578742D616C69676E3A63656E7465723B6D617267696E3A32656D20307D2E64726F707A6F6E65202E647A2D707265766965777B706F736974696F6E3A72656C6174';
wwv_flow_api.g_varchar2_table(45) := '6976653B646973706C61793A696E6C696E652D626C6F636B3B766572746963616C2D616C69676E3A746F703B6D617267696E3A313670783B6D696E2D6865696768743A31303070787D2E64726F707A6F6E65202E647A2D707265766965773A686F766572';
wwv_flow_api.g_varchar2_table(46) := '7B7A2D696E6465783A313030307D2E64726F707A6F6E65202E647A2D707265766965773A686F766572202E647A2D64657461696C737B6F7061636974793A317D2E64726F707A6F6E65202E647A2D707265766965772E647A2D66696C652D707265766965';
wwv_flow_api.g_varchar2_table(47) := '77202E647A2D696D6167657B626F726465722D7261646975733A323070783B6261636B67726F756E643A233939393B6261636B67726F756E643A6C696E6561722D6772616469656E7428746F20626F74746F6D2C20236565652C2023646464297D2E6472';
wwv_flow_api.g_varchar2_table(48) := '6F707A6F6E65202E647A2D707265766965772E647A2D66696C652D70726576696577202E647A2D64657461696C737B6F7061636974793A317D2E64726F707A6F6E65202E647A2D707265766965772E647A2D696D6167652D707265766965777B6261636B';
wwv_flow_api.g_varchar2_table(49) := '67726F756E643A77686974657D2E64726F707A6F6E65202E647A2D707265766965772E647A2D696D6167652D70726576696577202E647A2D64657461696C737B2D7765626B69742D7472616E736974696F6E3A6F70616369747920302E3273206C696E65';
wwv_flow_api.g_varchar2_table(50) := '61723B2D6D6F7A2D7472616E736974696F6E3A6F70616369747920302E3273206C696E6561723B2D6D732D7472616E736974696F6E3A6F70616369747920302E3273206C696E6561723B2D6F2D7472616E736974696F6E3A6F70616369747920302E3273';
wwv_flow_api.g_varchar2_table(51) := '206C696E6561723B7472616E736974696F6E3A6F70616369747920302E3273206C696E6561727D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D72656D6F76657B666F6E742D73697A653A313470783B746578742D616C69676E3A6365';
wwv_flow_api.g_varchar2_table(52) := '6E7465723B646973706C61793A626C6F636B3B637572736F723A706F696E7465723B626F726465723A6E6F6E657D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D72656D6F76653A686F7665727B746578742D6465636F726174696F6E';
wwv_flow_api.g_varchar2_table(53) := '3A756E6465726C696E657D2E64726F707A6F6E65202E647A2D707265766965773A686F766572202E647A2D64657461696C737B6F7061636974793A317D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C737B7A2D696E64';
wwv_flow_api.g_varchar2_table(54) := '65783A32303B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B6F7061636974793A303B666F6E742D73697A653A313370783B6D696E2D77696474683A313030253B6D61782D77696474683A313030253B70616464696E673A';
wwv_flow_api.g_varchar2_table(55) := '32656D2031656D3B746578742D616C69676E3A63656E7465723B636F6C6F723A7267626128302C302C302C302E39293B6C696E652D6865696768743A313530257D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E';
wwv_flow_api.g_varchar2_table(56) := '647A2D73697A657B6D617267696E2D626F74746F6D3A31656D3B666F6E742D73697A653A313670787D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E647A2D66696C656E616D657B77686974652D73706163653A';
wwv_flow_api.g_varchar2_table(57) := '6E6F777261707D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E647A2D66696C656E616D653A686F766572207370616E7B626F726465723A31707820736F6C69642072676261283230302C3230302C3230302C30';
wwv_flow_api.g_varchar2_table(58) := '2E38293B6261636B67726F756E642D636F6C6F723A72676261283235352C3235352C3235352C302E38297D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E647A2D66696C656E616D653A6E6F74283A686F766572';
wwv_flow_api.g_varchar2_table(59) := '297B6F766572666C6F773A68696464656E3B746578742D6F766572666C6F773A656C6C69707369737D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E647A2D66696C656E616D653A6E6F74283A686F7665722920';
wwv_flow_api.g_varchar2_table(60) := '7370616E7B626F726465723A31707820736F6C6964207472616E73706172656E747D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D64657461696C73202E647A2D66696C656E616D65207370616E2C2E64726F707A6F6E65202E647A2D';
wwv_flow_api.g_varchar2_table(61) := '70726576696577202E647A2D64657461696C73202E647A2D73697A65207370616E7B6261636B67726F756E642D636F6C6F723A72676261283235352C3235352C3235352C302E34293B70616464696E673A3020302E34656D3B626F726465722D72616469';
wwv_flow_api.g_varchar2_table(62) := '75733A3370787D2E64726F707A6F6E65202E647A2D707265766965773A686F766572202E647A2D696D61676520696D677B2D7765626B69742D7472616E73666F726D3A7363616C6528312E30352C20312E3035293B2D6D6F7A2D7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(63) := '7363616C6528312E30352C20312E3035293B2D6D732D7472616E73666F726D3A7363616C6528312E30352C20312E3035293B2D6F2D7472616E73666F726D3A7363616C6528312E30352C20312E3035293B7472616E73666F726D3A7363616C6528312E30';
wwv_flow_api.g_varchar2_table(64) := '352C20312E3035293B2D7765626B69742D66696C7465723A626C757228387078293B66696C7465723A626C757228387078297D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D696D6167657B626F726465722D7261646975733A323070';
wwv_flow_api.g_varchar2_table(65) := '783B6F766572666C6F773A68696464656E3B77696474683A31323070783B6865696768743A31323070783B706F736974696F6E3A72656C61746976653B646973706C61793A626C6F636B3B7A2D696E6465783A31307D2E64726F707A6F6E65202E647A2D';
wwv_flow_api.g_varchar2_table(66) := '70726576696577202E647A2D696D61676520696D677B646973706C61793A626C6F636B7D2E64726F707A6F6E65202E647A2D707265766965772E647A2D73756363657373202E647A2D737563636573732D6D61726B7B2D7765626B69742D616E696D6174';
wwv_flow_api.g_varchar2_table(67) := '696F6E3A70617373696E672D7468726F7567682033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031293B2D6D6F7A2D616E696D6174696F6E3A70617373696E672D7468726F7567682033732063756269632D62657A6965';
wwv_flow_api.g_varchar2_table(68) := '7228302E37372C20302C20302E3137352C2031293B2D6D732D616E696D6174696F6E3A70617373696E672D7468726F7567682033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031293B2D6F2D616E696D6174696F6E3A70';
wwv_flow_api.g_varchar2_table(69) := '617373696E672D7468726F7567682033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031293B616E696D6174696F6E3A70617373696E672D7468726F7567682033732063756269632D62657A69657228302E37372C20302C';
wwv_flow_api.g_varchar2_table(70) := '20302E3137352C2031297D2E64726F707A6F6E65202E647A2D707265766965772E647A2D6572726F72202E647A2D6572726F722D6D61726B7B6F7061636974793A313B2D7765626B69742D616E696D6174696F6E3A736C6964652D696E20337320637562';
wwv_flow_api.g_varchar2_table(71) := '69632D62657A69657228302E37372C20302C20302E3137352C2031293B2D6D6F7A2D616E696D6174696F6E3A736C6964652D696E2033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031293B2D6D732D616E696D6174696F';
wwv_flow_api.g_varchar2_table(72) := '6E3A736C6964652D696E2033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031293B2D6F2D616E696D6174696F6E3A736C6964652D696E2033732063756269632D62657A69657228302E37372C20302C20302E3137352C20';
wwv_flow_api.g_varchar2_table(73) := '31293B616E696D6174696F6E3A736C6964652D696E2033732063756269632D62657A69657228302E37372C20302C20302E3137352C2031297D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D737563636573732D6D61726B2C2E64726F';
wwv_flow_api.g_varchar2_table(74) := '707A6F6E65202E647A2D70726576696577202E647A2D6572726F722D6D61726B7B706F696E7465722D6576656E74733A6E6F6E653B6F7061636974793A303B7A2D696E6465783A3530303B706F736974696F6E3A6162736F6C7574653B646973706C6179';
wwv_flow_api.g_varchar2_table(75) := '3A626C6F636B3B746F703A3530253B6C6566743A3530253B6D617267696E2D6C6566743A2D323770783B6D617267696E2D746F703A2D323770787D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D737563636573732D6D61726B207376';
wwv_flow_api.g_varchar2_table(76) := '672C2E64726F707A6F6E65202E647A2D70726576696577202E647A2D6572726F722D6D61726B207376677B646973706C61793A626C6F636B3B77696474683A353470783B6865696768743A353470787D2E64726F707A6F6E65202E647A2D707265766965';
wwv_flow_api.g_varchar2_table(77) := '772E647A2D70726F63657373696E67202E647A2D70726F67726573737B6F7061636974793A313B2D7765626B69742D7472616E736974696F6E3A616C6C20302E3273206C696E6561723B2D6D6F7A2D7472616E736974696F6E3A616C6C20302E3273206C';
wwv_flow_api.g_varchar2_table(78) := '696E6561723B2D6D732D7472616E736974696F6E3A616C6C20302E3273206C696E6561723B2D6F2D7472616E736974696F6E3A616C6C20302E3273206C696E6561723B7472616E736974696F6E3A616C6C20302E3273206C696E6561727D2E64726F707A';
wwv_flow_api.g_varchar2_table(79) := '6F6E65202E647A2D707265766965772E647A2D636F6D706C657465202E647A2D70726F67726573737B6F7061636974793A303B2D7765626B69742D7472616E736974696F6E3A6F70616369747920302E347320656173652D696E3B2D6D6F7A2D7472616E';
wwv_flow_api.g_varchar2_table(80) := '736974696F6E3A6F70616369747920302E347320656173652D696E3B2D6D732D7472616E736974696F6E3A6F70616369747920302E347320656173652D696E3B2D6F2D7472616E736974696F6E3A6F70616369747920302E347320656173652D696E3B74';
wwv_flow_api.g_varchar2_table(81) := '72616E736974696F6E3A6F70616369747920302E347320656173652D696E7D2E64726F707A6F6E65202E647A2D707265766965773A6E6F74282E647A2D70726F63657373696E6729202E647A2D70726F67726573737B2D7765626B69742D616E696D6174';
wwv_flow_api.g_varchar2_table(82) := '696F6E3A70756C7365203673206561736520696E66696E6974653B2D6D6F7A2D616E696D6174696F6E3A70756C7365203673206561736520696E66696E6974653B2D6D732D616E696D6174696F6E3A70756C7365203673206561736520696E66696E6974';
wwv_flow_api.g_varchar2_table(83) := '653B2D6F2D616E696D6174696F6E3A70756C7365203673206561736520696E66696E6974653B616E696D6174696F6E3A70756C7365203673206561736520696E66696E6974657D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D70726F';
wwv_flow_api.g_varchar2_table(84) := '67726573737B6F7061636974793A313B7A2D696E6465783A313030303B706F696E7465722D6576656E74733A6E6F6E653B706F736974696F6E3A6162736F6C7574653B6865696768743A313670783B6C6566743A3530253B746F703A3530253B6D617267';
wwv_flow_api.g_varchar2_table(85) := '696E2D746F703A2D3870783B77696474683A383070783B6D617267696E2D6C6566743A2D343070783B6261636B67726F756E643A72676261283235352C3235352C3235352C302E39293B2D7765626B69742D7472616E73666F726D3A7363616C65283129';
wwv_flow_api.g_varchar2_table(86) := '3B626F726465722D7261646975733A3870783B6F766572666C6F773A68696464656E7D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D70726F6772657373202E647A2D75706C6F61647B6261636B67726F756E643A233333333B626163';
wwv_flow_api.g_varchar2_table(87) := '6B67726F756E643A6C696E6561722D6772616469656E7428746F20626F74746F6D2C20233636362C2023343434293B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B626F74746F6D3A303B77696474683A303B2D7765626B';
wwv_flow_api.g_varchar2_table(88) := '69742D7472616E736974696F6E3A7769647468203330306D7320656173652D696E2D6F75743B2D6D6F7A2D7472616E736974696F6E3A7769647468203330306D7320656173652D696E2D6F75743B2D6D732D7472616E736974696F6E3A77696474682033';
wwv_flow_api.g_varchar2_table(89) := '30306D7320656173652D696E2D6F75743B2D6F2D7472616E736974696F6E3A7769647468203330306D7320656173652D696E2D6F75743B7472616E736974696F6E3A7769647468203330306D7320656173652D696E2D6F75747D2E64726F707A6F6E6520';
wwv_flow_api.g_varchar2_table(90) := '2E647A2D707265766965772E647A2D6572726F72202E647A2D6572726F722D6D6573736167657B646973706C61793A626C6F636B7D2E64726F707A6F6E65202E647A2D707265766965772E647A2D6572726F723A686F766572202E647A2D6572726F722D';
wwv_flow_api.g_varchar2_table(91) := '6D6573736167657B6F7061636974793A313B706F696E7465722D6576656E74733A6175746F7D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D6572726F722D6D6573736167657B706F696E7465722D6576656E74733A6E6F6E653B7A2D';
wwv_flow_api.g_varchar2_table(92) := '696E6465783A313030303B706F736974696F6E3A6162736F6C7574653B646973706C61793A626C6F636B3B646973706C61793A6E6F6E653B6F7061636974793A303B2D7765626B69742D7472616E736974696F6E3A6F70616369747920302E3373206561';
wwv_flow_api.g_varchar2_table(93) := '73653B2D6D6F7A2D7472616E736974696F6E3A6F70616369747920302E337320656173653B2D6D732D7472616E736974696F6E3A6F70616369747920302E337320656173653B2D6F2D7472616E736974696F6E3A6F70616369747920302E337320656173';
wwv_flow_api.g_varchar2_table(94) := '653B7472616E736974696F6E3A6F70616369747920302E337320656173653B626F726465722D7261646975733A3870783B666F6E742D73697A653A313370783B746F703A31333070783B6C6566743A2D313070783B77696474683A31343070783B626163';
wwv_flow_api.g_varchar2_table(95) := '6B67726F756E643A236265323632363B6261636B67726F756E643A6C696E6561722D6772616469656E7428746F20626F74746F6D2C20236265323632362C2023613932323232293B70616464696E673A302E35656D20312E32656D3B636F6C6F723A7768';
wwv_flow_api.g_varchar2_table(96) := '6974657D2E64726F707A6F6E65202E647A2D70726576696577202E647A2D6572726F722D6D6573736167653A61667465727B636F6E74656E743A27273B706F736974696F6E3A6162736F6C7574653B746F703A2D3670783B6C6566743A363470783B7769';
wwv_flow_api.g_varchar2_table(97) := '6474683A303B6865696768743A303B626F726465722D6C6566743A36707820736F6C6964207472616E73706172656E743B626F726465722D72696768743A36707820736F6C6964207472616E73706172656E743B626F726465722D626F74746F6D3A3670';
wwv_flow_api.g_varchar2_table(98) := '7820736F6C696420236265323632367D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(43447372006069624)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_file_name=>'dropzone.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20415045582044726F707A6F6E652066756E6374696F6E730A2F2F20417574686F723A2044616E69656C20486F63686C6569746E65720A2F2F2056657273696F6E3A20312E360A0A766172206752756E203D202759273B0A2F2F2070617273652073';
wwv_flow_api.g_varchar2_table(2) := '7472696E6720746F20626F6F6C65616E0A66756E6374696F6E207061727365426F6F6C65616E2870537472696E6729207B0A20207661722070426F6F6C65616E3B0A20206966202870537472696E672E746F4C6F776572436173652829203D3D20277472';
wwv_flow_api.g_varchar2_table(3) := '75652729207B0A2020202070426F6F6C65616E203D20747275653B0A20207D0A20206966202870537472696E672E746F4C6F776572436173652829203D3D202766616C73652729207B0A2020202070426F6F6C65616E203D2066616C73653B0A20207D0A';
wwv_flow_api.g_varchar2_table(4) := '202069662028212870537472696E672E746F4C6F776572436173652829203D3D202774727565272920262620212870537472696E672E746F4C6F776572436173652829203D3D202766616C7365272929207B0A2020202070426F6F6C65616E203D20756E';
wwv_flow_api.g_varchar2_table(5) := '646566696E65643B0A20207D0A202072657475726E2070426F6F6C65616E3B0A7D0A2F2F206275696C64732061206A732061727261792066726F6D206C6F6E6720737472696E670A66756E6374696F6E20636C6F6232417272617928636C6F622C73697A';
wwv_flow_api.g_varchar2_table(6) := '652C6172726179297B0A20206C6F6F70436F756E74203D204D6174682E666C6F6F7228636C6F622E6C656E677468202F2073697A6529202B20313B0A2020666F7220287661722069203D20303B2069203C206C6F6F70436F756E743B20692B2B29207B0A';
wwv_flow_api.g_varchar2_table(7) := '2020202061727261792E7075736828636C6F622E736C6963652873697A65202A20692C73697A652A28692B312929293B0A20207D0A202072657475726E2061727261793B0A7D0A2F2F20636F6E76657274732062696E617279417272617920746F206261';
wwv_flow_api.g_varchar2_table(8) := '7365363420737472696E670A66756E6374696F6E2062696E61727941727261793262617365363428696E74384172726179297B0A202020207661722064617461203D2022223B0A20202020766172206279746573203D206E65772055696E743841727261';
wwv_flow_api.g_varchar2_table(9) := '7928696E74384172726179293B0A20202020766172206C656E677468203D2062797465732E627974654C656E6774683B0A20202020666F72287661722069203D20303B2069203C206C656E6774683B20692B2B29207B0A20202020202020206461746120';
wwv_flow_api.g_varchar2_table(10) := '2B3D20537472696E672E66726F6D43686172436F64652862797465735B695D293B0A202020207D0A2020202072657475726E2062746F612864617461293B0A7D0A2F2F204170657820414A41582063616C6C20746F2075706C6F61642066696C650A6675';
wwv_flow_api.g_varchar2_table(11) := '6E6374696F6E2061706578416A617843616C6C2870416A61784964656E7469666965722C7046696C656E616D652C7046696C65747970652C7066303141727261792C70506167654974656D732C63616C6C6261636B29207B0A20202020617065782E7365';
wwv_flow_api.g_varchar2_table(12) := '727665722E706C7567696E2870416A61784964656E7469666965722C207B0A202020202020202020202020202020202020202020202020202020202020202020207830313A207046696C656E616D652C0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(13) := '2020202020202020202020202020207830323A207046696C65747970652C0A202020202020202020202020202020202020202020202020202020202020202020206630313A207066303141727261792C0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(14) := '202020202020202020202020202020706167654974656D733A2070506167654974656D730A202020202020202020202020202020202020202020202020202020202020202020207D2C7B0A20202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(15) := '202020202020202020202064617461547970653A202768746D6C272C0A202020202020202020202020202020202020202020202020202020202020202020202020737563636573733A66756E6374696F6E2829207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(16) := '202020202020202020202020202020202020202020202020202063616C6C6261636B28293B0A202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(17) := '20202020202020202020202020207D293B0A7D0A2F2F20736C6565702066756E6374696F6E20286861636B20746F20656E737572652073657276657220676574732072696768742066696C6520286C6F74206F6620736D616C6C2066696C657329290A66';
wwv_flow_api.g_varchar2_table(18) := '756E6374696F6E20736C6565705F756E74696C28704D696C6C7365636F6E647329207B0A20202076617220764D6178536563203D206E6577204461746528292E67657454696D6528293B0A20202020207768696C6520286E657720446174652829203C20';
wwv_flow_api.g_varchar2_table(19) := '764D6178536563202B20704D696C6C7365636F6E647329207B7D0A20202020202072657475726E20747275653B0A7D0A2F2F2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A66756E6374696F6E206170';
wwv_flow_api.g_varchar2_table(20) := '657844726F707A6F6E652870526567696F6E49642C20704F7074696F6E732C20704C6F6767696E67297B0A202076617220764F7074696F6E7320202020202020202020203D20704F7074696F6E733B0A20207661722076526567696F6E24202020202020';
wwv_flow_api.g_varchar2_table(21) := '20202020203D206A517565727928272327202B20617065782E7574696C2E6573636170654353532870526567696F6E4964202B20275F64726F707A6F6E6527292C20617065782E6750616765436F6E7465787424293B0A20207661722076526567696F6E';
wwv_flow_api.g_varchar2_table(22) := '2020202020202020202020203D20617065782E7574696C2E6573636170654353532870526567696F6E4964202B20275F64726F707A6F6E6527293B0A202076617220766C6F6767696E6720202020202020202020203D207061727365426F6F6C65616E28';
wwv_flow_api.g_varchar2_table(23) := '704C6F6767696E67293B0A20207661722076436C69636B61626C652020202020202020203D207061727365426F6F6C65616E28764F7074696F6E732E636C69636B61626C65293B0A202076617220764D617846696C6553697A65202020202020203D2070';
wwv_flow_api.g_varchar2_table(24) := '61727365496E7428764F7074696F6E732E6D617846696C6573697A65293B0A2020766172207652656D6F7665416674657255706C6F6164203D207061727365426F6F6C65616E28764F7074696F6E732E72656D6F7665416674657255706C6F6164293B0A';
wwv_flow_api.g_varchar2_table(25) := '202076617220764D617846696C6573202020202020202020203D207061727365496E7428764F7074696F6E732E6D617846696C6573293B0A20207661722076436F707950617374652020202020202020203D207061727365426F6F6C65616E28764F7074';
wwv_flow_api.g_varchar2_table(26) := '696F6E732E737570706F7274436F70795061737465293B0A202076617220765761697454696D65202020202020202020203D207061727365496E7428764F7074696F6E732E7761697454696D65293B0A20207661722076506172616C6C656C55706C6F61';
wwv_flow_api.g_varchar2_table(27) := '64732020203D207061727365496E7428764F7074696F6E732E706172616C6C656C55706C6F616473293B0A20202F2F204C6F6767696E670A202069662028766C6F6767696E6729207B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E6541';
wwv_flow_api.g_varchar2_table(28) := '7065783A20764F7074696F6E732E616A61784964656E7469666965723A272C764F7074696F6E732E616A61784964656E746966696572293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E706167';
wwv_flow_api.g_varchar2_table(29) := '654974656D733A272C764F7074696F6E732E706167654974656D73293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E6D617846696C6573697A653A272C764F7074696F6E732E6D617846696C65';
wwv_flow_api.g_varchar2_table(30) := '73697A65293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E636C69636B61626C653A272C764F7074696F6E732E636C69636B61626C65293B0A20202020636F6E736F6C652E6C6F67282764726F';
wwv_flow_api.g_varchar2_table(31) := '707A6F6E65417065783A20764F7074696F6E732E72656D6F7665416674657255706C6F61643A272C764F7074696F6E732E72656D6F7665416674657255706C6F6164293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20';
wwv_flow_api.g_varchar2_table(32) := '764F7074696F6E732E64656661756C744D6573736167653A272C764F7074696F6E732E64656661756C744D657373616765293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E6163636570746564';
wwv_flow_api.g_varchar2_table(33) := '46696C65733A272C764F7074696F6E732E616363657074656446696C6573293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E6D617846696C65733A272C764F7074696F6E732E6D617846696C65';
wwv_flow_api.g_varchar2_table(34) := '73293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E706172616C6C656C55706C6F6164733A272C764F7074696F6E732E706172616C6C656C55706C6F616473293B0A20202020636F6E736F6C65';
wwv_flow_api.g_varchar2_table(35) := '2E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E72656672657368526567696F6E49443A272C764F7074696F6E732E72656672657368526567696F6E4944293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E6541';
wwv_flow_api.g_varchar2_table(36) := '7065783A20764F7074696F6E732E737570706F7274436F707950617374653A272C764F7074696F6E732E737570706F7274436F70795061737465293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E73';
wwv_flow_api.g_varchar2_table(37) := '2E7761697454696D653A272C764F7074696F6E732E7761697454696D65293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E66696C65546F6F4269674D6573736167653A272C764F7074696F6E73';
wwv_flow_api.g_varchar2_table(38) := '2E66696C65546F6F4269674D657373616765293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A20764F7074696F6E732E6D617846696C65734D6573736167653A272C764F7074696F6E732E6D617846696C65734D657373';
wwv_flow_api.g_varchar2_table(39) := '616765293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A2070526567696F6E49643A272C70526567696F6E4964293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A2076526567696F6E3A';
wwv_flow_api.g_varchar2_table(40) := '272C76526567696F6E293B0A20202020636F6E736F6C652E6C6F67282764726F707A6F6E65417065783A2076526567696F6E243A272C76526567696F6E24293B0A20207D0A20202F2F2044524F505A4F4E450A202044726F707A6F6E652E6175746F4469';
wwv_flow_api.g_varchar2_table(41) := '73636F766572203D2066616C73653B0A2020766172206D7944726F707A6F6E65203D206E65772044726F707A6F6E6528276469762327202B2076526567696F6E2C0A202020207B0A202020202020706172616D4E616D653A2022705F636C6F625F303122';
wwv_flow_api.g_varchar2_table(42) := '2C0A20202020202075726C3A20227777765F666C6F772E73686F77222C0A202020202020706172616D733A207B0A2020202020202020705F696E7374616E63653A202476282770496E7374616E636527292C0A2020202020202020705F666C6F775F6964';
wwv_flow_api.g_varchar2_table(43) := '3A202476282770466C6F77496427292C0A2020202020202020705F666C6F775F737465705F69643A202476282770466C6F7753746570496427290A2020202020207D2C0A20202061646452656D6F76654C696E6B733A2066616C73652C0A202020706172';
wwv_flow_api.g_varchar2_table(44) := '616C6C656C55706C6F6164733A2076506172616C6C656C55706C6F6164732C0A20202075706C6F61644D756C7469706C653A2066616C73652C0A2020206175746F50726F6365737351756575653A2066616C73652C0A2020206D617846696C6573697A65';
wwv_flow_api.g_varchar2_table(45) := '3A20764D617846696C6553697A652C0A2020206469637444656661756C744D6573736167653A20764F7074696F6E732E64656661756C744D6573736167652C0A202020636C69636B61626C653A2076436C69636B61626C652C0A2020206D617846696C65';
wwv_flow_api.g_varchar2_table(46) := '733A20764D617846696C65732C0A202020616363657074656446696C65733A20764F7074696F6E732E616363657074656446696C65732C0A2020206469637446696C65546F6F4269673A20764F7074696F6E732E66696C65546F6F4269674D6573736167';
wwv_flow_api.g_varchar2_table(47) := '652C0A202020646963744D617846696C657345786365656465643A20764F7074696F6E732E6D617846696C65734D6573736167650A20207D293B0A20202F2F2064697361626C6520636C69636B61626C6520656C656D656E740A20206966202821287643';
wwv_flow_api.g_varchar2_table(48) := '6C69636B61626C652929207B0A202020202428272E647A2D68696464656E2D696E70757427292E70726F70282764697361626C6564272C74727565293B0A20207D0A20202F2F20436F707926506173746520737570706F72740A20206966202876436F70';
wwv_flow_api.g_varchar2_table(49) := '79506173746529207B0A2020202046696C655265616465724A532E7365747570436C6970626F61726428646F63756D656E742E626F64792C207B0A202020202020202072656164417344656661756C743A20224461746155524C222C0A20202020202020';
wwv_flow_api.g_varchar2_table(50) := '206163636570743A207B0A2020202020202020202027696D6167652F2A273A20274461746155524C270A20202020202020207D2C0A20202020202020206F6E3A207B0A2020202020202020202020206C6F61643A2066756E6374696F6E28652C2066696C';
wwv_flow_api.g_varchar2_table(51) := '6529207B0A202020202020202020202020202020206752756E203D202759273B0A202020202020202020202020202020206D7944726F707A6F6E652E61646446696C652866696C65293B0A2020202020202020202020207D0A20202020202020207D0A20';
wwv_flow_api.g_varchar2_table(52) := '2020207D2920200A20207D0A20202F2F206275696C642062617365363420616E642061747461636820746F206630312061727261790A20206D7944726F707A6F6E652E6F6E2822616464656466696C65222C66756E6374696F6E2866696C6529207B0A20';
wwv_flow_api.g_varchar2_table(53) := '2020202F2F206275696C642062617365363420616E642061747461636820746F206630312061727261790A2020202076617220726561646572203D206E65772046696C6552656164657228293B0A202020207265616465722E6F6E6C6F6164203D202866';
wwv_flow_api.g_varchar2_table(54) := '756E6374696F6E287066696C6529207B0A2020202072657475726E2066756E6374696F6E286529207B0A202020202020696620287066696C6529207B0A20202020202020202F2F2042696E617279496E7438417272617920746F206261736536340A2020';
wwv_flow_api.g_varchar2_table(55) := '20202020202076617220626173653634203D2062696E61727941727261793262617365363428652E7461726765742E726573756C74293B0A20202020202020202F2F2073706C69742062617365363420636C6F6220737472696E6720746F206630312061';
wwv_flow_api.g_varchar2_table(56) := '72726179206C656E6774682033306B0A2020202020202020766172206630314172726179203D205B5D3B0A20202020202020206630314172726179203D20636C6F62324172726179286261736536342C33303030302C6630314172726179293B0A202020';
wwv_flow_api.g_varchar2_table(57) := '202020202066696C652E6630314172726179203D2066303141727261793B0A2020202020202020696620286752756E203D3D2027592729207B0A202020202020202020206D7944726F707A6F6E652E70726F63657373517565756528293B0A2020202020';
wwv_flow_api.g_varchar2_table(58) := '2020207D0A2020202020207D0A202020207D0A202020207D292866696C65293B0A202020207265616465722E72656164417341727261794275666665722866696C65293B0A20207D293B0A20202F2F2070726F63657373696E67207769746820736C6565';
wwv_flow_api.g_varchar2_table(59) := '700A20206D7944726F707A6F6E652E6F6E282270726F63657373696E67222C66756E6374696F6E2866696C6529207B0A202020206752756E203D20274E273B0A202020202F2F20736C65657020286861636B290A20202020736C6565705F756E74696C28';
wwv_flow_api.g_varchar2_table(60) := '765761697454696D65293B0A20207D293B0A20202F2F2073656E642066696C6520617320626173653634206630312061727261790A20206D7944726F707A6F6E652E6F6E282273656E64696E67222C66756E6374696F6E2866696C6529207B0A20202020';
wwv_flow_api.g_varchar2_table(61) := '66696C652E737461747573203D2044726F707A6F6E652E55504C4F4144494E473B0A202020202F2F20414A41582063616C6C20617065782E7365727665722E706C7567696E20616E642070726F636573732066696C652071756575652069662073756363';
wwv_flow_api.g_varchar2_table(62) := '6573730A2020202061706578416A617843616C6C28764F7074696F6E732E616A61784964656E7469666965722C66696C652E6E616D652C66696C652E747970652C66696C652E66303141727261792C764F7074696F6E732E706167654974656D732C6675';
wwv_flow_api.g_varchar2_table(63) := '6E6374696F6E2829207B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(64) := '2020202020202066696C652E737461747573203D2044726F707A6F6E652E535543434553533B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(65) := '20202020202020202020202020202020202020202020202020202020202020202020202F2F2070726F636573732066696C652071756575650A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(66) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020696620286D7944726F707A6F6E652E67657451756575656446696C657328292E6C656E677468203E2030202626206D';
wwv_flow_api.g_varchar2_table(67) := '7944726F707A6F6E652E67657455706C6F6164696E6746696C657328292E6C656E677468203D3D203029207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(68) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020206D7944726F707A6F6E652E70726F63657373517565756528293B0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(69) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F20636865636B20616761696E0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(70) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D20656C7365207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(71) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202073657454696D656F75742866756E6374';
wwv_flow_api.g_varchar2_table(72) := '696F6E2829207B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(73) := '2020202020202020696620286D7944726F707A6F6E652E67657451756575656446696C657328292E6C656E677468203E2030202626206D7944726F707A6F6E652E67657455706C6F6164696E6746696C657328292E6C656E677468203D3D203029207B0A';
wwv_flow_api.g_varchar2_table(74) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(75) := '20206D7944726F707A6F6E652E70726F63657373517565756528293B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(76) := '20202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(77) := '20202020202020202020202020202020202020202020202020202020207D2C20323030293B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(78) := '202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(79) := '2020202020202020202020202020202020202020202020202020202020207D293B0A20207D293B0A20202F2F20416674657220636F6D706C6574653A20636C6561722064617461202F207265667265736820726567696F6E0A20206D7944726F707A6F6E';
wwv_flow_api.g_varchar2_table(80) := '652E6F6E2822636F6D706C657465222C2066756E6374696F6E2829207B0A202020202F2F2072656D6F766520616C6C2066696C65732061667465722075706C6F616420697320636F6D706C6574650A20202020696620287652656D6F7665416674657255';
wwv_flow_api.g_varchar2_table(81) := '706C6F616429207B0A202020202020696620286D7944726F707A6F6E652E67657451756575656446696C657328292E6C656E677468203D3D2030202626206D7944726F707A6F6E652E67657455706C6F6164696E6746696C657328292E6C656E67746820';
wwv_flow_api.g_varchar2_table(82) := '3D3D203029207B0A20202020202020202F2F2077616974203320736563730A202020202020202073657454696D656F75742866756E6374696F6E2829207B0A202020202020202020206D7944726F707A6F6E652E72656D6F7665416C6C46696C65732829';
wwv_flow_api.g_varchar2_table(83) := '3B0A20202020202020207D2C2033303030293B0A2020202020207D0A202020207D0A2020202069662028764F7074696F6E732E72656672657368526567696F6E494429207B0A202020202020696620286D7944726F707A6F6E652E676574517565756564';
wwv_flow_api.g_varchar2_table(84) := '46696C657328292E6C656E677468203D3D2030202626206D7944726F707A6F6E652E67657455706C6F6164696E6746696C657328292E6C656E677468203D3D203029207B0A20202020202020202F2F2077616974203320736563730A2020202020202020';
wwv_flow_api.g_varchar2_table(85) := '73657454696D656F75742866756E6374696F6E2829207B0A20202020202020202020617065782E6576656E742E7472696767657228272327202B20764F7074696F6E732E72656672657368526567696F6E49442C2027617065787265667265736827293B';
wwv_flow_api.g_varchar2_table(86) := '3B0A20202020202020207D2C2033303030293B0A2020202020207D0A202020207D0A20207D293B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(43447736828072174)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_file_name=>'apexdropzone.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A46696C655265616465722E6A73202D2076302E39390A41206C69676874776569676874207772617070657220666F7220636F6D6D6F6E2046696C655265616465722075736167652E0A436F70797269676874203230313420427269616E204772';
wwv_flow_api.g_varchar2_table(2) := '696E7374656164202D204D4954204C6963656E73652E0A53656520687474703A2F2F6769746875622E636F6D2F626772696E732F66696C657265616465722E6A7320666F7220646F63756D656E746174696F6E2E0A2A2F0A0A2866756E6374696F6E2877';
wwv_flow_api.g_varchar2_table(3) := '696E646F772C20646F63756D656E7429207B0A0A202020207661722046696C65526561646572203D2077696E646F772E46696C655265616465723B0A202020207661722046696C6552656164657253796E63537570706F7274203D2066616C73653B0A20';
wwv_flow_api.g_varchar2_table(4) := '20202076617220776F726B6572536372697074203D202273656C662E6164644576656E744C697374656E657228276D657373616765272C2066756E6374696F6E286529207B2076617220646174613D652E646174613B20747279207B2076617220726561';
wwv_flow_api.g_varchar2_table(5) := '646572203D206E65772046696C6552656164657253796E633B20706F73744D657373616765287B20726573756C743A207265616465725B646174612E7265616441735D28646174612E66696C65292C2065787472613A20646174612E65787472612C2066';
wwv_flow_api.g_varchar2_table(6) := '696C653A20646174612E66696C657D297D2063617463682865297B20706F73744D657373616765287B20726573756C743A276572726F72272C2065787472613A646174612E65787472612C2066696C653A646174612E66696C657D293B207D207D2C2066';
wwv_flow_api.g_varchar2_table(7) := '616C7365293B223B0A202020207661722073796E63446574656374696F6E536372697074203D20226F6E6D657373616765203D2066756E6374696F6E286529207B20706F73744D65737361676528212146696C6552656164657253796E63293B207D3B22';
wwv_flow_api.g_varchar2_table(8) := '3B0A202020207661722066696C655265616465724576656E7473203D205B276C6F61647374617274272C202770726F6772657373272C20276C6F6164272C202761626F7274272C20276572726F72272C20276C6F6164656E64275D3B0A20202020766172';
wwv_flow_api.g_varchar2_table(9) := '2073796E63203D2066616C73653B0A202020207661722046696C655265616465724A53203D2077696E646F772E46696C655265616465724A53203D207B0A2020202020202020656E61626C65643A2066616C73652C0A2020202020202020736574757049';
wwv_flow_api.g_varchar2_table(10) := '6E7075743A207365747570496E7075742C0A2020202020202020736574757044726F703A20736574757044726F702C0A20202020202020207365747570436C6970626F6172643A207365747570436C6970626F6172642C0A202020202020202073657453';
wwv_flow_api.g_varchar2_table(11) := '796E633A2066756E6374696F6E202876616C756529207B0A20202020202020202020202073796E63203D2076616C75653B0A0A2020202020202020202020206966202873796E63202626202146696C6552656164657253796E63537570706F727429207B';
wwv_flow_api.g_varchar2_table(12) := '0A20202020202020202020202020202020636865636B46696C6552656164657253796E63537570706F727428293B0A2020202020202020202020207D0A20202020202020207D2C0A202020202020202067657453796E633A2066756E6374696F6E282920';
wwv_flow_api.g_varchar2_table(13) := '7B0A20202020202020202020202072657475726E2073796E632026262046696C6552656164657253796E63537570706F72743B0A20202020202020207D2C0A20202020202020206F75747075743A205B5D2C0A20202020202020206F7074733A207B0A20';
wwv_flow_api.g_varchar2_table(14) := '202020202020202020202064726167436C6173733A202264726167222C0A2020202020202020202020206163636570743A2066616C73652C0A20202020202020202020202072656164417344656661756C743A20274461746155524C272C0A2020202020';
wwv_flow_api.g_varchar2_table(15) := '202020202020207265616441734D61703A207B0A2020202020202020202020207D2C0A2020202020202020202020206F6E3A207B0A202020202020202020202020202020206C6F616473746172743A206E6F6F702C0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(16) := '202070726F67726573733A206E6F6F702C0A202020202020202020202020202020206C6F61643A206E6F6F702C0A2020202020202020202020202020202061626F72743A206E6F6F702C0A202020202020202020202020202020206572726F723A206E6F';
wwv_flow_api.g_varchar2_table(17) := '6F702C0A202020202020202020202020202020206C6F6164656E643A206E6F6F702C0A20202020202020202020202020202020736B69703A206E6F6F702C0A2020202020202020202020202020202067726F757073746172743A206E6F6F702C0A202020';
wwv_flow_api.g_varchar2_table(18) := '2020202020202020202020202067726F7570656E643A206E6F6F702C0A202020202020202020202020202020206265666F726573746172743A206E6F6F700A2020202020202020202020207D0A20202020202020207D0A202020207D3B0A0A202020202F';
wwv_flow_api.g_varchar2_table(19) := '2F205365747570206A517565727920706C7567696E2028696620617661696C61626C65290A2020202069662028747970656F66286A51756572792920213D3D2022756E646566696E65642229207B0A20202020202020206A51756572792E666E2E66696C';
wwv_flow_api.g_varchar2_table(20) := '655265616465724A53203D2066756E6374696F6E286F70747329207B0A20202020202020202020202072657475726E20746869732E656163682866756E6374696F6E2829207B0A20202020202020202020202020202020696620286A5175657279287468';
wwv_flow_api.g_varchar2_table(21) := '6973292E69732822696E707574222929207B0A20202020202020202020202020202020202020207365747570496E70757428746869732C206F707473293B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C73';
wwv_flow_api.g_varchar2_table(22) := '65207B0A2020202020202020202020202020202020202020736574757044726F7028746869732C206F707473293B0A202020202020202020202020202020207D0A2020202020202020202020207D293B0A20202020202020207D3B0A0A20202020202020';
wwv_flow_api.g_varchar2_table(23) := '206A51756572792E666E2E66696C65436C6970626F617264203D2066756E6374696F6E286F70747329207B0A20202020202020202020202072657475726E20746869732E656163682866756E6374696F6E2829207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(24) := '20207365747570436C6970626F61726428746869732C206F707473293B0A2020202020202020202020207D293B0A20202020202020207D3B0A202020207D0A0A202020202F2F204E6F7420616C6C2062726F777365727320737570706F72742074686520';
wwv_flow_api.g_varchar2_table(25) := '46696C6552656164657220696E746572666163652E2052657475726E20776974682074686520656E61626C656420626974203D2066616C73652E0A20202020696620282146696C6552656164657229207B0A202020202020202072657475726E3B0A2020';
wwv_flow_api.g_varchar2_table(26) := '20207D0A0A0A202020202F2F206D616B65576F726B65722069732061206C6974746C65207772617070657220666F722067656E65726174696E672077656220776F726B6572732066726F6D20737472696E67730A2020202066756E6374696F6E206D616B';
wwv_flow_api.g_varchar2_table(27) := '65576F726B65722873637269707429207B0A20202020202020207661722055524C203D2077696E646F772E55524C207C7C2077696E646F772E7765626B697455524C3B0A202020202020202076617220426C6F62203D2077696E646F772E426C6F623B0A';
wwv_flow_api.g_varchar2_table(28) := '202020202020202076617220576F726B6572203D2077696E646F772E576F726B65723B0A0A2020202020202020696620282155524C207C7C2021426C6F62207C7C2021576F726B6572207C7C202173637269707429207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(29) := '72657475726E206E756C6C3B0A20202020202020207D0A0A202020202020202076617220626C6F62203D206E657720426C6F62285B7363726970745D293B0A202020202020202076617220776F726B6572203D206E657720576F726B65722855524C2E63';
wwv_flow_api.g_varchar2_table(30) := '72656174654F626A65637455524C28626C6F6229293B0A202020202020202072657475726E20776F726B65723B0A202020207D0A0A202020202F2F207365747570436C6970626F6172643A2062696E6420746F20636C6970626F617264206576656E7473';
wwv_flow_api.g_varchar2_table(31) := '2028696E74656E64656420666F7220646F63756D656E742E626F6479290A2020202066756E6374696F6E207365747570436C6970626F61726428656C656D656E742C206F70747329207B0A0A2020202020202020696620282146696C655265616465724A';
wwv_flow_api.g_varchar2_table(32) := '532E656E61626C656429207B0A20202020202020202020202072657475726E3B0A20202020202020207D0A202020202020202076617220696E7374616E63654F7074696F6E73203D20657874656E6428657874656E64287B7D2C2046696C655265616465';
wwv_flow_api.g_varchar2_table(33) := '724A532E6F707473292C206F707473293B0A0A2020202020202020656C656D656E742E6164644576656E744C697374656E657228227061737465222C206F6E70617374652C2066616C7365293B0A0A202020202020202066756E6374696F6E206F6E7061';
wwv_flow_api.g_varchar2_table(34) := '737465286529207B0A2020202020202020202020207661722066696C6573203D205B5D3B0A20202020202020202020202076617220636C6970626F61726444617461203D20652E636C6970626F61726444617461207C7C207B7D3B0A2020202020202020';
wwv_flow_api.g_varchar2_table(35) := '20202020766172206974656D73203D20636C6970626F617264446174612E6974656D73207C7C205B5D3B0A0A202020202020202020202020666F7220287661722069203D20303B2069203C206974656D732E6C656E6774683B20692B2B29207B0A202020';
wwv_flow_api.g_varchar2_table(36) := '202020202020202020202020207661722066696C65203D206974656D735B695D2E676574417346696C6528293B0A0A202020202020202020202020202020206966202866696C6529207B0A0A20202020202020202020202020202020202020202F2F2043';
wwv_flow_api.g_varchar2_table(37) := '726561746520612066616B652066696C65206E616D6520666F7220696D616765732066726F6D20636C6970626F6172642C2073696E63652074686973206461746120646F65736E2774206765742073656E740A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(38) := '202020766172206D617463686573203D206E65772052656745787028222F5C282E2A5C2922292E657865632866696C652E74797065293B0A2020202020202020202020202020202020202020696620282166696C652E6E616D65202626206D6174636865';
wwv_flow_api.g_varchar2_table(39) := '7329207B0A20202020202020202020202020202020202020202020202076617220657874656E73696F6E203D206D6174636865735B315D3B0A20202020202020202020202020202020202020202020202066696C652E6E616D65203D2022636C6970626F';
wwv_flow_api.g_varchar2_table(40) := '61726422202B2069202B20222E22202B20657874656E73696F6E3B0A20202020202020202020202020202020202020207D0A0A202020202020202020202020202020202020202066696C65732E707573682866696C65293B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(41) := '20202020207D0A2020202020202020202020207D0A0A2020202020202020202020206966202866696C65732E6C656E67746829207B0A2020202020202020202020202020202070726F6365737346696C654C69737428652C2066696C65732C20696E7374';
wwv_flow_api.g_varchar2_table(42) := '616E63654F7074696F6E73293B0A20202020202020202020202020202020652E70726576656E7444656661756C7428293B0A20202020202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A2020202020202020202020207D';
wwv_flow_api.g_varchar2_table(43) := '0A20202020202020207D0A202020207D0A0A202020202F2F207365747570496E7075743A2062696E642074686520276368616E676527206576656E7420746F20616E20696E7075745B747970653D66696C655D0A2020202066756E6374696F6E20736574';
wwv_flow_api.g_varchar2_table(44) := '7570496E70757428696E7075742C206F70747329207B0A0A2020202020202020696620282146696C655265616465724A532E656E61626C656429207B0A20202020202020202020202072657475726E3B0A20202020202020207D0A202020202020202076';
wwv_flow_api.g_varchar2_table(45) := '617220696E7374616E63654F7074696F6E73203D20657874656E6428657874656E64287B7D2C2046696C655265616465724A532E6F707473292C206F707473293B0A0A2020202020202020696E7075742E6164644576656E744C697374656E6572282263';
wwv_flow_api.g_varchar2_table(46) := '68616E6765222C20696E7075744368616E67652C2066616C7365293B0A2020202020202020696E7075742E6164644576656E744C697374656E6572282264726F70222C20696E70757444726F702C2066616C7365293B0A0A202020202020202066756E63';
wwv_flow_api.g_varchar2_table(47) := '74696F6E20696E7075744368616E6765286529207B0A20202020202020202020202070726F6365737346696C654C69737428652C20696E7075742E66696C65732C20696E7374616E63654F7074696F6E73293B0A20202020202020207D0A0A2020202020';
wwv_flow_api.g_varchar2_table(48) := '20202066756E6374696F6E20696E70757444726F70286529207B0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A202020202020202020202020652E70726576656E7444656661756C7428293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(49) := '2020202070726F6365737346696C654C69737428652C20652E646174615472616E736665722E66696C65732C20696E7374616E63654F7074696F6E73293B0A20202020202020207D0A202020207D0A0A202020202F2F20736574757044726F703A206269';
wwv_flow_api.g_varchar2_table(50) := '6E6420746865202764726F7027206576656E7420666F72206120444F4D20656C656D656E740A2020202066756E6374696F6E20736574757044726F702864726F70626F782C206F70747329207B0A0A2020202020202020696620282146696C6552656164';
wwv_flow_api.g_varchar2_table(51) := '65724A532E656E61626C656429207B0A20202020202020202020202072657475726E3B0A20202020202020207D0A202020202020202076617220696E7374616E63654F7074696F6E73203D20657874656E6428657874656E64287B7D2C2046696C655265';
wwv_flow_api.g_varchar2_table(52) := '616465724A532E6F707473292C206F707473293B0A20202020202020207661722064726167436C617373203D20696E7374616E63654F7074696F6E732E64726167436C6173733B0A202020202020202076617220696E697469616C697A65644F6E426F64';
wwv_flow_api.g_varchar2_table(53) := '79203D2066616C73653B0A0A20202020202020202F2F2042696E642064726167206576656E747320746F207468652064726F70626F7820746F206164642074686520636C617373207768696C65206472616767696E672C20616E64206163636570742074';
wwv_flow_api.g_varchar2_table(54) := '68652064726F702064617461207472616E736665722E0A202020202020202064726F70626F782E6164644576656E744C697374656E6572282264726167656E746572222C206F6E6C795769746846696C65732864726167656E746572292C2066616C7365';
wwv_flow_api.g_varchar2_table(55) := '293B0A202020202020202064726F70626F782E6164644576656E744C697374656E65722822647261676C65617665222C206F6E6C795769746846696C657328647261676C65617665292C2066616C7365293B0A202020202020202064726F70626F782E61';
wwv_flow_api.g_varchar2_table(56) := '64644576656E744C697374656E65722822647261676F766572222C206F6E6C795769746846696C657328647261676F766572292C2066616C7365293B0A202020202020202064726F70626F782E6164644576656E744C697374656E6572282264726F7022';
wwv_flow_api.g_varchar2_table(57) := '2C206F6E6C795769746846696C65732864726F70292C2066616C7365293B0A0A20202020202020202F2F2042696E6420746F20626F647920746F2070726576656E74207468652064726F70626F78206576656E74732066726F6D20666972696E67207768';
wwv_flow_api.g_varchar2_table(58) := '656E2069742077617320696E697469616C697A6564206F6E2074686520706167652E0A2020202020202020646F63756D656E742E626F64792E6164644576656E744C697374656E65722822647261677374617274222C20626F6479647261677374617274';
wwv_flow_api.g_varchar2_table(59) := '2C2074727565293B0A2020202020202020646F63756D656E742E626F64792E6164644576656E744C697374656E6572282264726167656E64222C20626F647964726167656E642C2074727565293B0A2020202020202020646F63756D656E742E626F6479';
wwv_flow_api.g_varchar2_table(60) := '2E6164644576656E744C697374656E6572282264726F70222C20626F647964726F702C2066616C7365293B0A0A202020202020202066756E6374696F6E20626F647964726167656E64286529207B0A202020202020202020202020696E697469616C697A';
wwv_flow_api.g_varchar2_table(61) := '65644F6E426F6479203D2066616C73653B0A20202020202020207D0A0A202020202020202066756E6374696F6E20626F6479647261677374617274286529207B0A202020202020202020202020696E697469616C697A65644F6E426F6479203D20747275';
wwv_flow_api.g_varchar2_table(62) := '653B0A20202020202020207D0A0A202020202020202066756E6374696F6E20626F647964726F70286529207B0A20202020202020202020202069662028652E646174615472616E736665722E66696C657320262620652E646174615472616E736665722E';
wwv_flow_api.g_varchar2_table(63) := '66696C65732E6C656E67746820297B0A20202020202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A20202020202020202020202020202020652E70726576656E7444656661756C7428293B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(64) := '207D0A20202020202020207D0A0A202020202020202066756E6374696F6E206F6E6C795769746846696C657328666E29207B0A20202020202020202020202072657475726E2066756E6374696F6E2829207B0A2020202020202020202020202020202069';
wwv_flow_api.g_varchar2_table(65) := '66202821696E697469616C697A65644F6E426F647929207B0A2020202020202020202020202020202020202020666E2E6170706C7928746869732C20617267756D656E7473293B0A202020202020202020202020202020207D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(66) := '20207D3B0A20202020202020207D0A0A202020202020202066756E6374696F6E2064726F70286529207B0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A202020202020202020202020652E70726576656E74446566';
wwv_flow_api.g_varchar2_table(67) := '61756C7428293B0A2020202020202020202020206966202864726167436C61737329207B0A2020202020202020202020202020202072656D6F7665436C6173732864726F70626F782C2064726167436C617373293B0A2020202020202020202020207D0A';
wwv_flow_api.g_varchar2_table(68) := '20202020202020202020202070726F6365737346696C654C69737428652C20652E646174615472616E736665722E66696C65732C20696E7374616E63654F7074696F6E73293B0A20202020202020207D0A0A202020202020202066756E6374696F6E2064';
wwv_flow_api.g_varchar2_table(69) := '726167656E746572286529207B0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A202020202020202020202020652E70726576656E7444656661756C7428293B0A202020202020202020202020696620286472616743';
wwv_flow_api.g_varchar2_table(70) := '6C61737329207B0A20202020202020202020202020202020616464436C6173732864726F70626F782C2064726167436C617373293B0A2020202020202020202020207D0A20202020202020207D0A0A202020202020202066756E6374696F6E2064726167';
wwv_flow_api.g_varchar2_table(71) := '6C65617665286529207B0A2020202020202020202020206966202864726167436C61737329207B0A2020202020202020202020202020202072656D6F7665436C6173732864726F70626F782C2064726167436C617373293B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(72) := '207D0A20202020202020207D0A0A202020202020202066756E6374696F6E20647261676F766572286529207B0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A202020202020202020202020652E70726576656E7444';
wwv_flow_api.g_varchar2_table(73) := '656661756C7428293B0A2020202020202020202020206966202864726167436C61737329207B0A20202020202020202020202020202020616464436C6173732864726F70626F782C2064726167436C617373293B0A2020202020202020202020207D0A20';
wwv_flow_api.g_varchar2_table(74) := '202020202020207D0A202020207D0A0A202020202F2F207365747570437573746F6D46696C6550726F706572746965733A206D6F64696679207468652066696C65206F626A65637420776974682065787472612070726F706572746965730A2020202066';
wwv_flow_api.g_varchar2_table(75) := '756E6374696F6E207365747570437573746F6D46696C6550726F706572746965732866696C65732C2067726F7570494429207B0A2020202020202020666F7220287661722069203D20303B2069203C2066696C65732E6C656E6774683B20692B2B29207B';
wwv_flow_api.g_varchar2_table(76) := '0A2020202020202020202020207661722066696C65203D2066696C65735B695D3B0A20202020202020202020202066696C652E6578747261203D207B0A202020202020202020202020202020206E616D654E6F457874656E73696F6E3A2066696C652E6E';
wwv_flow_api.g_varchar2_table(77) := '616D652E737562737472696E6728302C2066696C652E6E616D652E6C617374496E6465784F6628272E2729292C0A20202020202020202020202020202020657874656E73696F6E3A2066696C652E6E616D652E737562737472696E672866696C652E6E61';
wwv_flow_api.g_varchar2_table(78) := '6D652E6C617374496E6465784F6628272E2729202B2031292C0A2020202020202020202020202020202066696C6549443A20692C0A20202020202020202020202020202020756E6971756549443A20676574556E69717565494428292C0A202020202020';
wwv_flow_api.g_varchar2_table(79) := '2020202020202020202067726F757049443A2067726F757049442C0A2020202020202020202020202020202070726574747953697A653A2070726574747953697A652866696C652E73697A65290A2020202020202020202020207D3B0A20202020202020';
wwv_flow_api.g_varchar2_table(80) := '207D0A202020207D0A0A202020202F2F206765745265616441734D6574686F643A2072657475726E206D6574686F64206E616D6520666F7220277265616441732A27202D20687474703A2F2F7777772E77332E6F72672F54522F46696C654150492F2372';
wwv_flow_api.g_varchar2_table(81) := '656164696E672D612D66696C650A2020202066756E6374696F6E206765745265616441734D6574686F6428747970652C207265616441734D61702C2072656164417344656661756C7429207B0A2020202020202020666F722028766172207220696E2072';
wwv_flow_api.g_varchar2_table(82) := '65616441734D617029207B0A20202020202020202020202069662028747970652E6D61746368286E6577205265674578702872292929207B0A2020202020202020202020202020202072657475726E202772656164417327202B207265616441734D6170';
wwv_flow_api.g_varchar2_table(83) := '5B725D3B0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E202772656164417327202B2072656164417344656661756C743B0A202020207D0A0A202020202F2F2070726F6365737346696C654C6973743A';
wwv_flow_api.g_varchar2_table(84) := '2072656164207468652066696C657320776974682046696C655265616465722C2073656E64206F666620637573746F6D206576656E74732E0A2020202066756E6374696F6E2070726F6365737346696C654C69737428652C2066696C65732C206F707473';
wwv_flow_api.g_varchar2_table(85) := '29207B0A0A20202020202020207661722066696C65734C656674203D2066696C65732E6C656E6774683B0A20202020202020207661722067726F7570203D207B0A20202020202020202020202067726F757049443A2067657447726F7570494428292C0A';
wwv_flow_api.g_varchar2_table(86) := '20202020202020202020202066696C65733A2066696C65732C0A202020202020202020202020737461727465643A206E6577204461746528290A20202020202020207D3B0A0A202020202020202066756E6374696F6E2067726F7570456E642829207B0A';
wwv_flow_api.g_varchar2_table(87) := '20202020202020202020202067726F75702E656E646564203D206E6577204461746528293B0A2020202020202020202020206F7074732E6F6E2E67726F7570656E642867726F7570293B0A20202020202020207D0A0A202020202020202066756E637469';
wwv_flow_api.g_varchar2_table(88) := '6F6E2067726F757046696C65446F6E652829207B0A202020202020202020202020696620282D2D66696C65734C656674203D3D3D203029207B0A2020202020202020202020202020202067726F7570456E6428293B0A2020202020202020202020207D0A';
wwv_flow_api.g_varchar2_table(89) := '20202020202020207D0A0A202020202020202046696C655265616465724A532E6F75747075742E707573682867726F7570293B0A20202020202020207365747570437573746F6D46696C6550726F706572746965732866696C65732C2067726F75702E67';
wwv_flow_api.g_varchar2_table(90) := '726F75704944293B0A0A20202020202020206F7074732E6F6E2E67726F757073746172742867726F7570293B0A0A20202020202020202F2F204E6F2066696C657320696E2067726F7570202D20656E6420696D6D6564696174656C790A20202020202020';
wwv_flow_api.g_varchar2_table(91) := '20696620282166696C65732E6C656E67746829207B0A20202020202020202020202067726F7570456E6428293B0A20202020202020202020202072657475726E3B0A20202020202020207D0A0A202020202020202076617220737570706F72747353796E';
wwv_flow_api.g_varchar2_table(92) := '63203D2073796E632026262046696C6552656164657253796E63537570706F72743B0A20202020202020207661722073796E63576F726B65723B0A0A20202020202020202F2F204F6E6C7920696E697469616C697A65207468652073796E6368726F6E6F';
wwv_flow_api.g_varchar2_table(93) := '757320776F726B657220696620746865206F7074696F6E20697320656E61626C6564202D20746F2070726576656E7420746865206F766572686561640A202020202020202069662028737570706F72747353796E6329207B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(94) := '2073796E63576F726B6572203D206D616B65576F726B657228776F726B6572536372697074293B0A20202020202020202020202073796E63576F726B65722E6F6E6D657373616765203D2066756E6374696F6E286529207B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(95) := '20202020207661722066696C65203D20652E646174612E66696C653B0A2020202020202020202020202020202076617220726573756C74203D20652E646174612E726573756C743B0A0A202020202020202020202020202020202F2F20576F726B657273';
wwv_flow_api.g_varchar2_table(96) := '207365656D20746F206C6F73652074686520637573746F6D2070726F7065727479206F6E207468652066696C65206F626A6563742E0A20202020202020202020202020202020696620282166696C652E657874726129207B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(97) := '20202020202020202066696C652E6578747261203D20652E646174612E65787472613B0A202020202020202020202020202020207D0A0A2020202020202020202020202020202066696C652E65787472612E656E646564203D206E657720446174652829';
wwv_flow_api.g_varchar2_table(98) := '3B0A0A202020202020202020202020202020202F2F2043616C6C206572726F72206F72206C6F6164206576656E7420646570656E64696E67206F6E2073756363657373206F662074686520726561642066726F6D2074686520776F726B65722E0A202020';
wwv_flow_api.g_varchar2_table(99) := '202020202020202020202020206F7074732E6F6E5B726573756C74203D3D3D20226572726F7222203F20226572726F7222203A20226C6F6164225D287B207461726765743A207B20726573756C743A20726573756C74207D207D2C2066696C65293B0A20';
wwv_flow_api.g_varchar2_table(100) := '20202020202020202020202020202067726F757046696C65446F6E6528293B0A2020202020202020202020207D3B0A20202020202020207D0A0A202020202020202041727261792E70726F746F747970652E666F72456163682E63616C6C2866696C6573';
wwv_flow_api.g_varchar2_table(101) := '2C2066756E6374696F6E2866696C6529207B0A0A20202020202020202020202066696C652E65787472612E73746172746564203D206E6577204461746528293B0A0A202020202020202020202020696620286F7074732E61636365707420262620216669';
wwv_flow_api.g_varchar2_table(102) := '6C652E747970652E6D61746368286E657720526567457870286F7074732E616363657074292929207B0A202020202020202020202020202020206F7074732E6F6E2E736B69702866696C65293B0A2020202020202020202020202020202067726F757046';
wwv_flow_api.g_varchar2_table(103) := '696C65446F6E6528293B0A2020202020202020202020202020202072657475726E3B0A2020202020202020202020207D0A0A202020202020202020202020696620286F7074732E6F6E2E6265666F726573746172742866696C6529203D3D3D2066616C73';
wwv_flow_api.g_varchar2_table(104) := '6529207B0A202020202020202020202020202020206F7074732E6F6E2E736B69702866696C65293B0A2020202020202020202020202020202067726F757046696C65446F6E6528293B0A2020202020202020202020202020202072657475726E3B0A2020';
wwv_flow_api.g_varchar2_table(105) := '202020202020202020207D0A0A20202020202020202020202076617220726561644173203D206765745265616441734D6574686F642866696C652E747970652C206F7074732E7265616441734D61702C206F7074732E72656164417344656661756C7429';
wwv_flow_api.g_varchar2_table(106) := '3B0A0A2020202020202020202020206966202873796E63576F726B657229207B0A2020202020202020202020202020202073796E63576F726B65722E706F73744D657373616765287B0A202020202020202020202020202020202020202066696C653A20';
wwv_flow_api.g_varchar2_table(107) := '66696C652C0A202020202020202020202020202020202020202065787472613A2066696C652E65787472612C0A20202020202020202020202020202020202020207265616441733A207265616441730A202020202020202020202020202020207D293B0A';
wwv_flow_api.g_varchar2_table(108) := '2020202020202020202020207D0A202020202020202020202020656C7365207B0A0A2020202020202020202020202020202076617220726561646572203D206E65772046696C6552656164657228293B0A20202020202020202020202020202020726561';
wwv_flow_api.g_varchar2_table(109) := '6465722E6F726967696E616C4576656E74203D20653B0A0A2020202020202020202020202020202066696C655265616465724576656E74732E666F72456163682866756E6374696F6E286576656E744E616D6529207B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(110) := '202020202020207265616465725B276F6E27202B206576656E744E616D655D203D2066756E6374696F6E286529207B0A202020202020202020202020202020202020202020202020696620286576656E744E616D65203D3D20276C6F616427207C7C2065';
wwv_flow_api.g_varchar2_table(111) := '76656E744E616D65203D3D20276572726F722729207B0A2020202020202020202020202020202020202020202020202020202066696C652E65787472612E656E646564203D206E6577204461746528293B0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(112) := '2020202020207D0A2020202020202020202020202020202020202020202020206F7074732E6F6E5B6576656E744E616D655D28652C2066696C65293B0A202020202020202020202020202020202020202020202020696620286576656E744E616D65203D';
wwv_flow_api.g_varchar2_table(113) := '3D20276C6F6164656E642729207B0A2020202020202020202020202020202020202020202020202020202067726F757046696C65446F6E6528293B0A2020202020202020202020202020202020202020202020207D0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(114) := '2020202020207D3B0A202020202020202020202020202020207D293B0A202020202020202020202020202020207265616465725B7265616441735D2866696C65293B0A2020202020202020202020207D0A20202020202020207D293B0A202020207D0A0A';
wwv_flow_api.g_varchar2_table(115) := '202020202F2F20636865636B46696C6552656164657253796E63537570706F72743A2043726561746520612074656D706F7261727920776F726B657220616E64207365652069662046696C6552656164657253796E63206578697374730A202020206675';
wwv_flow_api.g_varchar2_table(116) := '6E6374696F6E20636865636B46696C6552656164657253796E63537570706F72742829207B0A202020202020202076617220776F726B6572203D206D616B65576F726B65722873796E63446574656374696F6E536372697074293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(117) := '69662028776F726B657229207B0A202020202020202020202020776F726B65722E6F6E6D657373616765203D66756E6374696F6E286529207B0A2020202020202020202020202020202046696C6552656164657253796E63537570706F7274203D20652E';
wwv_flow_api.g_varchar2_table(118) := '646174613B0A2020202020202020202020207D3B0A202020202020202020202020776F726B65722E706F73744D657373616765287B7D293B0A20202020202020207D0A202020207D0A0A202020202F2F206E6F6F703A20646F206E6F7468696E670A2020';
wwv_flow_api.g_varchar2_table(119) := '202066756E6374696F6E206E6F6F702829207B0A0A202020207D0A0A202020202F2F20657874656E643A207573656420746F206D616B65206465657020636F70696573206F66206F7074696F6E73206F626A6563740A2020202066756E6374696F6E2065';
wwv_flow_api.g_varchar2_table(120) := '7874656E642864657374696E6174696F6E2C20736F7572636529207B0A2020202020202020666F7220287661722070726F706572747920696E20736F7572636529207B0A20202020202020202020202069662028736F757263655B70726F70657274795D';
wwv_flow_api.g_varchar2_table(121) := '20262620736F757263655B70726F70657274795D2E636F6E7374727563746F722026260A20202020202020202020202020202020736F757263655B70726F70657274795D2E636F6E7374727563746F72203D3D3D204F626A65637429207B0A2020202020';
wwv_flow_api.g_varchar2_table(122) := '202020202020202020202064657374696E6174696F6E5B70726F70657274795D203D2064657374696E6174696F6E5B70726F70657274795D207C7C207B7D3B0A20202020202020202020202020202020617267756D656E74732E63616C6C656528646573';
wwv_flow_api.g_varchar2_table(123) := '74696E6174696F6E5B70726F70657274795D2C20736F757263655B70726F70657274795D293B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A2020202020202020202020202020202064657374696E6174696F6E5B';
wwv_flow_api.g_varchar2_table(124) := '70726F70657274795D203D20736F757263655B70726F70657274795D3B0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E2064657374696E6174696F6E3B0A202020207D0A0A202020202F2F2068617343';
wwv_flow_api.g_varchar2_table(125) := '6C6173733A20646F657320616E20656C656D656E742068617665207468652063737320636C6173733F0A2020202066756E6374696F6E20686173436C61737328656C2C206E616D6529207B0A202020202020202072657475726E206E6577205265674578';
wwv_flow_api.g_varchar2_table(126) := '702822283F3A5E7C5C5C732B2922202B206E616D65202B2022283F3A5C5C732B7C242922292E7465737428656C2E636C6173734E616D65293B0A202020207D0A0A202020202F2F20616464436C6173733A20616464207468652063737320636C61737320';
wwv_flow_api.g_varchar2_table(127) := '666F722074686520656C656D656E742E0A2020202066756E6374696F6E20616464436C61737328656C2C206E616D6529207B0A20202020202020206966202821686173436C61737328656C2C206E616D652929207B0A20202020202020202020656C2E63';
wwv_flow_api.g_varchar2_table(128) := '6C6173734E616D65203D20656C2E636C6173734E616D65203F205B656C2E636C6173734E616D652C206E616D655D2E6A6F696E2827202729203A206E616D653B0A20202020202020207D0A202020207D0A0A202020202F2F2072656D6F7665436C617373';
wwv_flow_api.g_varchar2_table(129) := '3A2072656D6F7665207468652063737320636C6173732066726F6D2074686520656C656D656E742E0A2020202066756E6374696F6E2072656D6F7665436C61737328656C2C206E616D6529207B0A202020202020202069662028686173436C6173732865';
wwv_flow_api.g_varchar2_table(130) := '6C2C206E616D652929207B0A202020202020202020207661722063203D20656C2E636C6173734E616D653B0A20202020202020202020656C2E636C6173734E616D65203D20632E7265706C616365286E6577205265674578702822283F3A5E7C5C5C732B';
wwv_flow_api.g_varchar2_table(131) := '2922202B206E616D65202B2022283F3A5C5C732B7C2429222C20226722292C20222022292E7265706C616365282F5E5C735C732A2F2C202727292E7265706C616365282F5C735C732A242F2C202727293B0A20202020202020207D0A202020207D0A0A20';
wwv_flow_api.g_varchar2_table(132) := '2020202F2F2070726574747953697A653A20636F6E7665727420627974657320746F2061206D6F7265207265616461626C6520737472696E672E0A2020202066756E6374696F6E2070726574747953697A6528627974657329207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(133) := '7661722073203D205B276279746573272C20276B62272C20274D42272C20274742272C20275442272C20275042275D3B0A20202020202020207661722065203D204D6174682E666C6F6F72284D6174682E6C6F67286279746573292F4D6174682E6C6F67';
wwv_flow_api.g_varchar2_table(134) := '283130323429293B0A202020202020202072657475726E202862797465732F4D6174682E706F7728313032342C204D6174682E666C6F6F7228652929292E746F46697865642832292B2220222B735B655D3B0A202020207D0A0A202020202F2F20676574';
wwv_flow_api.g_varchar2_table(135) := '47726F757049443A2067656E6572617465206120756E6971756520696E7420494420666F722067726F7570732E0A202020207661722067657447726F75704944203D202866756E6374696F6E28696429207B0A202020202020202072657475726E206675';
wwv_flow_api.g_varchar2_table(136) := '6E6374696F6E2829207B0A20202020202020202020202072657475726E2069642B2B3B0A20202020202020207D3B0A202020207D292830293B0A0A202020202F2F20676574556E6971756549443A2067656E6572617465206120756E6971756520696E74';
wwv_flow_api.g_varchar2_table(137) := '20494420666F722066696C65730A2020202076617220676574556E697175654944203D202866756E6374696F6E28696429207B0A202020202020202072657475726E2066756E6374696F6E2829207B0A20202020202020202020202072657475726E2069';
wwv_flow_api.g_varchar2_table(138) := '642B2B3B0A20202020202020207D3B0A202020207D292830293B0A0A202020202F2F2054686520696E7465726661636520697320737570706F727465642C2062696E64207468652046696C655265616465724A532063616C6C6261636B730A2020202046';
wwv_flow_api.g_varchar2_table(139) := '696C655265616465724A532E656E61626C6564203D20747275653B0A0A7D2928746869732C20646F63756D656E74293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(43605720232805449)
,p_plugin_id=>wwv_flow_api.id(43432289042189088)
,p_file_name=>'filereader.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done

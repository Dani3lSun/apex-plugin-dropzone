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
,p_release=>'5.0.1.00.06'
,p_default_workspace_id=>96713923238010156
,p_default_application_id=>57743
,p_default_owner=>'DHTEST'
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
 p_id=>wwv_flow_api.id(12946692333396534467)
,p_plugin_type=>'REGION TYPE'
,p_name=>'DE.DANIELH.DROPZONE'
,p_display_name=>'Dropzone'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * Dropzone Apex Plugin',
' * Version: 1.0 (14.09.2015)',
' * Author:  Daniel Hochleitner',
' *-------------------------------------',
'*/',
'FUNCTION render_dropzone(p_region              IN apex_plugin.t_region,',
'                         p_plugin              IN apex_plugin.t_plugin,',
'                         p_is_printer_friendly IN BOOLEAN)',
'  RETURN apex_plugin.t_region_render_result IS',
'  -- plugin attributes',
'  l_file_item                VARCHAR2(100) := p_region.attribute_01;',
'  l_filename_item            VARCHAR2(100) := p_region.attribute_02;',
'  l_width                    VARCHAR2(50) := p_region.attribute_03;',
'  l_height                   VARCHAR2(50) := p_region.attribute_04;',
'  l_display_message          VARCHAR2(500) := p_region.attribute_05;',
'  l_upload_process_enable    NUMBER := p_region.attribute_06;',
'  l_upload_process           VARCHAR2(100) := p_region.attribute_07;',
'  l_page_items_session_state VARCHAR2(1000) := p_region.attribute_08;',
'  l_handle_ssp_items         NUMBER := p_region.attribute_09;',
'  -- other variables',
'  l_region_id           VARCHAR2(100);',
'  l_dropzone_string     CLOB;',
'  l_item_string         CLOB;',
'  l_width_esc           VARCHAR2(50);',
'  l_height_esc          VARCHAR2(50);',
'  l_display_message_esc VARCHAR2(500);',
'  l_upload_process_esc  VARCHAR2(100);',
'  l_page_items_string   VARCHAR2(1000);',
'  l_page_items_arr2     apex_application_global.vc_arr2;',
'  l_count               NUMBER := 0;',
'  --',
'  -- cursor for session items on current page and page 0',
'  CURSOR l_cur_items IS',
'    SELECT api.item_name,',
'           api.item_id,',
'           v(api.item_name) item_value',
'      FROM apex_application_page_items api',
'     WHERE api.application_id = v(''APP_ID'')',
'       AND api.page_id IN (0,',
'                           v(''APP_PAGE_ID''))',
'       AND api.item_protection_level != ''Unrestricted''',
'       AND v(api.item_name) IS NOT NULL',
'     ORDER BY api.display_sequence;',
'  --',
'BEGIN',
'  -- set variables',
'  l_region_id := apex_escape.html_attribute(p_region.static_id ||',
'                                            ''_dropzone'');',
'  -- escape input',
'  l_width_esc           := sys.htf.escape_sc(l_width);',
'  l_height_esc          := sys.htf.escape_sc(l_height);',
'  l_display_message_esc := sys.htf.escape_sc(l_display_message);',
'  l_upload_process_esc  := sys.htf.escape_sc(l_upload_process);',
'  --',
'  -- add div for dropzone',
'  sys.htp.p(''<div id="'' || l_region_id ||',
'            ''" class="dropzone dz-clickable" style="border:5px solid grey;width:'' ||',
'            l_width_esc || '';height:'' || l_height_esc ||',
'            '';overflow:auto;">',
'<div class="dz-message" data-dz-message><span>'' ||',
'            l_display_message_esc || ''</span></div></div>'');',
'  --',
'  -- add dropzone js',
'  apex_javascript.add_library(p_name           => ''dropzone.min'',',
'                              p_directory      => p_plugin.file_prefix,',
'                              p_version        => NULL,',
'                              p_skip_extension => FALSE);',
'  --',
'  -- add dropzone css',
'  apex_css.add_file(p_name      => ''dropzone.min'',',
'                    p_directory => p_plugin.file_prefix);',
'  --',
'  -- Build Dropzone JS Function String',
'  -- Filename function',
'  l_dropzone_string := ''function getFilenames() {'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || '' names_string="";'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || '' $(''''#'' || l_region_id ||',
'                       '' div'''').find(''''div.dz-filename'''').each(function(){'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string || ''   if (names_string) {'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    names_string = names_string + '''':'''' + $(this).text();'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string || ''   }'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''   else {'' || chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    names_string = $(this).text();'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''   }'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || '' });'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''apex.item("'' ||',
'                       l_filename_item || ''").setValue(names_string);'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string || ''}'' || chr(10) || chr(10);',
'  --',
'  -- js vars for filebrowse item',
'  -- name attr',
'  l_dropzone_string := l_dropzone_string || ''var vAttName = $(''''#'' ||',
'                       l_file_item || '''''').attr(''''name'''');'' || chr(10);',
'  -- item id',
'  l_dropzone_string := l_dropzone_string || ''var vAttNameID = $(''''#'' ||',
'                       l_file_item ||',
'                       '''''').prev(''''input[type="hidden"][name="p_arg_names"]'''').val();'' ||',
'                       chr(10);',
'  -- only when handle ssp is on',
'  IF l_handle_ssp_items = 1 THEN',
'    --',
'    -- js vars for session items',
'    FOR l_rec IN l_cur_items LOOP',
'      l_count := l_count + 1;',
'      -- name attr',
'      l_item_string := l_item_string || ''var vAttName'' || l_count ||',
'                       '' = $(''''#'' || l_rec.item_name ||',
'                       '''''').attr(''''name'''');'' || chr(10);',
'      -- ids',
'      l_item_string := l_item_string || ''var vAttNameID'' || l_count ||',
'                       '' = $(''''#'' || l_rec.item_name ||',
'                       '''''').prev(''''input[type="hidden"][name="p_arg_names"]'''').val();'' ||',
'                       chr(10);',
'      -- p_arg_checksums',
'      l_item_string := l_item_string || ''var vAttChecksum'' || l_count ||',
'                       '' = $(''''#'' || l_rec.item_name ||',
'                       '''''').next(''''input[type="hidden"][name="p_arg_checksums"]'''').val();'' ||',
'                       chr(10);',
'    END LOOP;',
'    -- build complete string',
'    l_dropzone_string := l_dropzone_string || l_item_string || chr(10);',
'  END IF;',
'  --',
'  -- dropzone config',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''myDropzone = new Dropzone(''''div#'' || l_region_id ||',
'                       '''''','' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''  {'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''   "url": "wwv_flow.accept",'' ||',
'                       chr(10);',
'  -- required params for wwv_flow.accept',
'  l_dropzone_string := l_dropzone_string || ''   "params": {'' || chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    "p_instance":$v(''''pInstance''''),'' || chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    "p_flow_id":$v(''''pFlowId''''),'' || chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    "p_flow_step_id":$v(''''pFlowStepId''''),'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    "p_page_checksum":$v(''''pPageChecksum''''),'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''    "p_page_submission_id":$v(''''pPageSubmissionId'''')'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string || ''  }'' || chr(10);',
'  l_dropzone_string := l_dropzone_string || ''});'' || chr(10);',
'  -- dropzone options',
'  l_dropzone_string := l_dropzone_string ||',
'                       '' myDropzone.options.paramName = vAttName;'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       '' myDropzone.options.addRemoveLinks = false;'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       '' Dropzone.autoDiscover = false;'' || chr(10) ||',
'                       chr(10);',
'  -- sending function',
'  l_dropzone_string := l_dropzone_string ||',
'                       ''myDropzone.on(''''sending'''',function(file, xhr, formData) {'' ||',
'                       chr(10);',
'  l_dropzone_string := l_dropzone_string ||',
'                       '' formData.append("p_arg_names",vAttNameID);'' ||',
'                       chr(10);',
'  -- loop over items again (append name/id,p_arg_names,p_arg_values,p_arg_checksums)',
'  l_item_string := NULL;',
'  l_count       := 0;',
'  -- only when handle ssp is on',
'  IF l_handle_ssp_items = 1 THEN',
'    FOR l_rec IN l_cur_items LOOP',
'      l_count := l_count + 1;',
'      -- only when not undefined',
'      -- name/id',
'      l_item_string := l_item_string || '' if (typeof vAttName'' || l_count ||',
'                       '' !== ''''undefined'''') { formData.append(vAttName'' ||',
'                       l_count || '',vAttNameID'' || l_count || ''); }'' ||',
'                       chr(10);',
'      -- p_arg_names',
'      l_item_string := l_item_string || '' if (typeof vAttNameID'' || l_count ||',
'                       '' !== ''''undefined'''') { formData.append("p_arg_names",vAttNameID'' ||',
'                       l_count || ''); }'' || chr(10);',
'      -- p_arg_values',
'      l_item_string := l_item_string ||',
'                       '' formData.append("p_arg_values",'''''' ||',
'                       l_rec.item_value || '''''');'' || chr(10);',
'      -- only when not undefined',
'      -- p_arg_checksums',
'      l_item_string := l_item_string || '' if (typeof vAttChecksum'' ||',
'                       l_count ||',
'                       '' !== ''''undefined'''') { formData.append("p_arg_checksums",vAttChecksum'' ||',
'                       l_count || ''); }'' || chr(10);',
'    END LOOP;',
'    -- build complete string',
'    l_dropzone_string := l_dropzone_string || l_item_string || chr(10);',
'  END IF;',
'  --',
'  l_dropzone_string := l_dropzone_string || ''});'' || chr(10) || chr(10);',
'  --',
'  -- success function with call to application process',
'  -- only when application process is enabled',
'  IF l_upload_process_enable = 1 THEN',
'    -- get page items from input and convert to array and build string',
'    l_page_items_arr2 := apex_util.string_to_table(l_page_items_session_state,',
'                                                   '','');',
'    FOR i IN 1 .. l_page_items_arr2.count LOOP',
'      l_page_items_string := l_page_items_string || '',#'' ||',
'                             l_page_items_arr2(i);',
'    END LOOP;',
'    -- remove comma leading/trailing',
'    l_page_items_string := rtrim(ltrim(l_page_items_string,',
'                                       '',''),',
'                                 '','');',
'    -- build success function with call to application process',
'    l_dropzone_string := l_dropzone_string ||',
'                         ''myDropzone.on(''''success'''',function(a,response) {'' ||',
'                         chr(10);',
'    l_dropzone_string := l_dropzone_string || '' getFilenames();'' || chr(10);',
'    l_dropzone_string := l_dropzone_string ||',
'                         '' var fileNames = apex.item("'' || l_filename_item ||',
'                         ''").getValue();'' || chr(10);',
'    l_dropzone_string := l_dropzone_string || '' apex.server.process("'' ||',
'                         upper(l_upload_process_esc) || ''", {'' || chr(10);',
'    l_dropzone_string := l_dropzone_string || ''  x01: fileNames,'' ||',
'                         chr(10);',
'    l_dropzone_string := l_dropzone_string || ''  pageItems: "#'' ||',
'                         l_filename_item || '','' || l_page_items_string || ''"'' ||',
'                         chr(10);',
'    l_dropzone_string := l_dropzone_string || '' });'' || chr(10);',
'    l_dropzone_string := l_dropzone_string || ''});'' || chr(10);',
'  END IF;',
'  --',
'  -- write inline dropzone js string',
'  apex_javascript.add_inline_code(p_code => l_dropzone_string);',
'  --',
'  RETURN NULL;',
'  --',
'END render_dropzone;'))
,p_render_function=>'render_dropzone'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Dropzone is a region type plugin that allows you to provide nice looking drag’n’drop file uploads. It is based on JS Framework dropzone.js.',
'Dropzone Github Page: https://github.com/enyo/dropzone'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-dropzone'
,p_files_version=>221
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946778443066557825)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Filebrowse Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Apex Filebrowse Item that holds the file input data. Place it for example in another region that is hidden by default (using DA hide).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946779914027572854)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Filename Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT blob_content,<br>',
'       filename,<br>',
'       mime_type<br>',
'  FROM apex_application_temp_files<br>',
' WHERE application_id IN (v(''APP_ID''),<br>',
'                                 0)<br>',
'         AND filename = p_filename'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item holds the filenames of all uploaded files. Divided by ":". This item should be from type hidden (using DA hide).<br>',
'You should use this item to select later from apex_application_temp_files (using APEX_UTIL.STRING_TO_TABLE function)'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946778701285561496)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(12946778967823564707)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(12946780178863580404)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Display message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Drop files here or click to upload.'
,p_is_translatable=>false
,p_help_text=>'Enter the text that would be displayed in the Dropzone area.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946956953110543071)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Save file using Application Process?'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Should the files saved using a Application Process (On Demand). x01 parameter is used.<br>',
'You must created this process yourself. Inparameter is the filename Item.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12946957551447543848)
,p_plugin_attribute_id=>wwv_flow_api.id(12946956953110543071)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12946958030971544285)
,p_plugin_attribute_id=>wwv_flow_api.id(12946956953110543071)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946780515672585380)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Name Upload Process'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'UPLOAD_DROPZONE_FILES'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(12946956953110543071)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
,p_help_text=>'Name of the Upload Application Process'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946962966652575647)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Page Items in Session State'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(12946956953110543071)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
,p_help_text=>'Page Items that should be set into session state. The filename item is already in session state!'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12946966461158665475)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>55
,p_prompt=>'Handle Items with SSP'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Include items on current page and page 0 that have SSP enabled into POST call against wwv_flow.accept.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12946967127763665935)
,p_plugin_attribute_id=>wwv_flow_api.id(12946966461158665475)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12946967476331666370)
,p_plugin_attribute_id=>wwv_flow_api.id(12946966461158665475)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'0'
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
wwv_flow_api.g_varchar2_table(30) := '72656D6F76656466696C65222C227468756D626E61696C222C226572726F72222C226572726F726D756C7469706C65222C2270726F63657373696E67222C2270726F63657373696E676D756C7469706C65222C2275706C6F616470726F6772657373222C';
wwv_flow_api.g_varchar2_table(31) := '22746F74616C75706C6F616470726F6772657373222C2273656E64696E67222C2273656E64696E676D756C7469706C65222C2273756363657373222C22737563636573736D756C7469706C65222C2263616E63656C6564222C2263616E63656C65646D75';
wwv_flow_api.g_varchar2_table(32) := '6C7469706C65222C22636F6D706C657465222C22636F6D706C6574656D756C7469706C65222C227265736574222C226D617866696C65736578636565646564222C226D617866696C657372656163686564222C227175657565636F6D706C657465225D2C';
wwv_flow_api.g_varchar2_table(33) := '632E70726F746F747970652E64656661756C744F7074696F6E733D7B75726C3A6E756C6C2C6D6574686F643A22706F7374222C7769746843726564656E7469616C733A21312C706172616C6C656C55706C6F6164733A322C75706C6F61644D756C746970';
wwv_flow_api.g_varchar2_table(34) := '6C653A21312C6D617846696C6573697A653A3235362C706172616D4E616D653A2266696C65222C637265617465496D6167655468756D626E61696C733A21302C6D61785468756D626E61696C46696C6573697A653A31302C7468756D626E61696C576964';
wwv_flow_api.g_varchar2_table(35) := '74683A3132302C7468756D626E61696C4865696768743A3132302C66696C6573697A65426173653A3165332C6D617846696C65733A6E756C6C2C66696C6573697A65426173653A3165332C706172616D733A7B7D2C636C69636B61626C653A21302C6967';
wwv_flow_api.g_varchar2_table(36) := '6E6F726548696464656E46696C65733A21302C616363657074656446696C65733A6E756C6C2C61636365707465644D696D6554797065733A6E756C6C2C6175746F50726F6365737351756575653A21302C6175746F51756575653A21302C61646452656D';
wwv_flow_api.g_varchar2_table(37) := '6F76654C696E6B733A21312C7072657669657773436F6E7461696E65723A6E756C6C2C636170747572653A6E756C6C2C6469637444656661756C744D6573736167653A2244726F702066696C6573206865726520746F2075706C6F6164222C6469637446';
wwv_flow_api.g_varchar2_table(38) := '616C6C6261636B4D6573736167653A22596F75722062726F7773657220646F6573206E6F7420737570706F72742064726167276E2764726F702066696C652075706C6F6164732E222C6469637446616C6C6261636B546578743A22506C65617365207573';
wwv_flow_api.g_varchar2_table(39) := '65207468652066616C6C6261636B20666F726D2062656C6F7720746F2075706C6F616420796F75722066696C6573206C696B6520696E20746865206F6C64656E20646179732E222C6469637446696C65546F6F4269673A2246696C6520697320746F6F20';
wwv_flow_api.g_varchar2_table(40) := '62696720287B7B66696C6573697A657D7D4D6942292E204D61782066696C6573697A653A207B7B6D617846696C6573697A657D7D4D69422E222C64696374496E76616C696446696C65547970653A22596F752063616E27742075706C6F61642066696C65';
wwv_flow_api.g_varchar2_table(41) := '73206F66207468697320747970652E222C64696374526573706F6E73654572726F723A2253657276657220726573706F6E6465642077697468207B7B737461747573436F64657D7D20636F64652E222C6469637443616E63656C55706C6F61643A224361';
wwv_flow_api.g_varchar2_table(42) := '6E63656C2075706C6F6164222C6469637443616E63656C55706C6F6164436F6E6669726D6174696F6E3A2241726520796F75207375726520796F752077616E7420746F2063616E63656C20746869732075706C6F61643F222C6469637452656D6F766546';
wwv_flow_api.g_varchar2_table(43) := '696C653A2252656D6F76652066696C65222C6469637452656D6F766546696C65436F6E6669726D6174696F6E3A6E756C6C2C646963744D617846696C657345786365656465643A22596F752063616E206E6F742075706C6F616420616E79206D6F726520';
wwv_flow_api.g_varchar2_table(44) := '66696C65732E222C6163636570743A66756E6374696F6E28612C62297B72657475726E206228297D2C696E69743A66756E6374696F6E28297B72657475726E20677D2C666F72636546616C6C6261636B3A21312C66616C6C6261636B3A66756E6374696F';
wwv_flow_api.g_varchar2_table(45) := '6E28297B76617220612C622C642C652C662C673B666F7228746869732E656C656D656E742E636C6173734E616D653D22222B746869732E656C656D656E742E636C6173734E616D652B2220647A2D62726F777365722D6E6F742D737570706F7274656422';
wwv_flow_api.g_varchar2_table(46) := '2C673D746869732E656C656D656E742E676574456C656D656E747342795461674E616D65282264697622292C653D302C663D672E6C656E6774683B663E653B652B2B29613D675B655D2C2F285E7C2029647A2D6D65737361676528247C20292F2E746573';
wwv_flow_api.g_varchar2_table(47) := '7428612E636C6173734E616D6529262628623D612C612E636C6173734E616D653D22647A2D6D65737361676522293B72657475726E20627C7C28623D632E637265617465456C656D656E7428273C64697620636C6173733D22647A2D6D65737361676522';
wwv_flow_api.g_varchar2_table(48) := '3E3C7370616E3E3C2F7370616E3E3C2F6469763E27292C746869732E656C656D656E742E617070656E644368696C64286229292C643D622E676574456C656D656E747342795461674E616D6528227370616E22295B305D2C64262628642E74657874436F';
wwv_flow_api.g_varchar2_table(49) := '6E74656E743D746869732E6F7074696F6E732E6469637446616C6C6261636B4D657373616765292C746869732E656C656D656E742E617070656E644368696C6428746869732E67657446616C6C6261636B466F726D2829297D2C726573697A653A66756E';
wwv_flow_api.g_varchar2_table(50) := '6374696F6E2861297B76617220622C632C643B72657475726E20623D7B737263583A302C737263593A302C73726357696474683A612E77696474682C7372634865696768743A612E6865696768747D2C633D612E77696474682F612E6865696768742C62';
wwv_flow_api.g_varchar2_table(51) := '2E6F707457696474683D746869732E6F7074696F6E732E7468756D626E61696C57696474682C622E6F70744865696768743D746869732E6F7074696F6E732E7468756D626E61696C4865696768742C6E756C6C3D3D622E6F7074576964746826266E756C';
wwv_flow_api.g_varchar2_table(52) := '6C3D3D622E6F70744865696768743F28622E6F707457696474683D622E73726357696474682C622E6F70744865696768743D622E737263486569676874293A6E756C6C3D3D622E6F707457696474683F622E6F707457696474683D632A622E6F70744865';
wwv_flow_api.g_varchar2_table(53) := '696768743A6E756C6C3D3D622E6F7074486569676874262628622E6F70744865696768743D312F632A622E6F70745769647468292C643D622E6F707457696474682F622E6F70744865696768742C612E6865696768743C622E6F70744865696768747C7C';
wwv_flow_api.g_varchar2_table(54) := '612E77696474683C622E6F707457696474683F28622E7472674865696768743D622E7372634865696768742C622E74726757696474683D622E7372635769647468293A633E643F28622E7372634865696768743D612E6865696768742C622E7372635769';
wwv_flow_api.g_varchar2_table(55) := '6474683D622E7372634865696768742A64293A28622E73726357696474683D612E77696474682C622E7372634865696768743D622E73726357696474682F64292C622E737263583D28612E77696474682D622E7372635769647468292F322C622E737263';
wwv_flow_api.g_varchar2_table(56) := '593D28612E6865696768742D622E737263486569676874292F322C627D2C64726F703A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D647261672D686F76657222297D';
wwv_flow_api.g_varchar2_table(57) := '2C6472616773746172743A672C64726167656E643A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D647261672D686F76657222297D2C64726167656E7465723A66756E';
wwv_flow_api.g_varchar2_table(58) := '6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E6164642822647A2D647261672D686F76657222297D2C647261676F7665723A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E';
wwv_flow_api.g_varchar2_table(59) := '636C6173734C6973742E6164642822647A2D647261672D686F76657222297D2C647261676C656176653A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D647261672D68';
wwv_flow_api.g_varchar2_table(60) := '6F76657222297D2C70617374653A672C72657365743A66756E6374696F6E28297B72657475726E20746869732E656C656D656E742E636C6173734C6973742E72656D6F76652822647A2D7374617274656422297D2C616464656466696C653A66756E6374';
wwv_flow_api.g_varchar2_table(61) := '696F6E2861297B76617220622C642C652C662C672C682C692C6A2C6B2C6C2C6D2C6E2C6F3B696628746869732E656C656D656E743D3D3D746869732E7072657669657773436F6E7461696E65722626746869732E656C656D656E742E636C6173734C6973';
wwv_flow_api.g_varchar2_table(62) := '742E6164642822647A2D7374617274656422292C746869732E7072657669657773436F6E7461696E6572297B666F7228612E70726576696577456C656D656E743D632E637265617465456C656D656E7428746869732E6F7074696F6E732E707265766965';
wwv_flow_api.g_varchar2_table(63) := '7754656D706C6174652E7472696D2829292C612E7072657669657754656D706C6174653D612E70726576696577456C656D656E742C746869732E7072657669657773436F6E7461696E65722E617070656E644368696C6428612E70726576696577456C65';
wwv_flow_api.g_varchar2_table(64) := '6D656E74292C6C3D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D6E616D655D22292C663D302C693D6C2E6C656E6774683B693E663B662B2B29623D6C5B665D2C622E74657874436F6E74';
wwv_flow_api.g_varchar2_table(65) := '656E743D612E6E616D653B666F72286D3D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D73697A655D22292C673D302C6A3D6D2E6C656E6774683B6A3E673B672B2B29623D6D5B675D2C62';
wwv_flow_api.g_varchar2_table(66) := '2E696E6E657248544D4C3D746869732E66696C6573697A6528612E73697A65293B666F7228746869732E6F7074696F6E732E61646452656D6F76654C696E6B73262628612E5F72656D6F76654C696E6B3D632E637265617465456C656D656E7428273C61';
wwv_flow_api.g_varchar2_table(67) := '20636C6173733D22647A2D72656D6F76652220687265663D226A6176617363726970743A756E646566696E65643B2220646174612D647A2D72656D6F76653E272B746869732E6F7074696F6E732E6469637452656D6F766546696C652B223C2F613E2229';
wwv_flow_api.g_varchar2_table(68) := '2C612E70726576696577456C656D656E742E617070656E644368696C6428612E5F72656D6F76654C696E6B29292C643D66756E6374696F6E2862297B72657475726E2066756E6374696F6E2864297B72657475726E20642E70726576656E744465666175';
wwv_flow_api.g_varchar2_table(69) := '6C7428292C642E73746F7050726F7061676174696F6E28292C612E7374617475733D3D3D632E55504C4F4144494E473F632E636F6E6669726D28622E6F7074696F6E732E6469637443616E63656C55706C6F6164436F6E6669726D6174696F6E2C66756E';
wwv_flow_api.g_varchar2_table(70) := '6374696F6E28297B72657475726E20622E72656D6F766546696C652861297D293A622E6F7074696F6E732E6469637452656D6F766546696C65436F6E6669726D6174696F6E3F632E636F6E6669726D28622E6F7074696F6E732E6469637452656D6F7665';
wwv_flow_api.g_varchar2_table(71) := '46696C65436F6E6669726D6174696F6E2C66756E6374696F6E28297B72657475726E20622E72656D6F766546696C652861297D293A622E72656D6F766546696C652861297D7D2874686973292C6E3D612E70726576696577456C656D656E742E71756572';
wwv_flow_api.g_varchar2_table(72) := '7953656C6563746F72416C6C28225B646174612D647A2D72656D6F76655D22292C6F3D5B5D2C683D302C6B3D6E2E6C656E6774683B6B3E683B682B2B29653D6E5B685D2C6F2E7075736828652E6164644576656E744C697374656E65722822636C69636B';
wwv_flow_api.g_varchar2_table(73) := '222C6429293B72657475726E206F7D7D2C72656D6F76656466696C653A66756E6374696F6E2861297B76617220623B72657475726E20612E70726576696577456C656D656E7426266E756C6C213D28623D612E70726576696577456C656D656E74292626';
wwv_flow_api.g_varchar2_table(74) := '622E706172656E744E6F64652E72656D6F76654368696C6428612E70726576696577456C656D656E74292C746869732E5F7570646174654D617846696C657352656163686564436C61737328297D2C7468756D626E61696C3A66756E6374696F6E28612C';
wwv_flow_api.g_varchar2_table(75) := '62297B76617220632C642C652C663B696628612E70726576696577456C656D656E74297B666F7228612E70726576696577456C656D656E742E636C6173734C6973742E72656D6F76652822647A2D66696C652D7072657669657722292C663D612E707265';
wwv_flow_api.g_varchar2_table(76) := '76696577456C656D656E742E717565727953656C6563746F72416C6C28225B646174612D647A2D7468756D626E61696C5D22292C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C632E616C743D612E6E616D652C632E737263';
wwv_flow_api.g_varchar2_table(77) := '3D623B72657475726E2073657454696D656F75742866756E6374696F6E28297B72657475726E2066756E6374696F6E28297B72657475726E20612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D696D6167652D7072';
wwv_flow_api.g_varchar2_table(78) := '657669657722297D7D2874686973292C31297D7D2C6572726F723A66756E6374696F6E28612C62297B76617220632C642C652C662C673B696628612E70726576696577456C656D656E74297B666F7228612E70726576696577456C656D656E742E636C61';
wwv_flow_api.g_varchar2_table(79) := '73734C6973742E6164642822647A2D6572726F7222292C22537472696E6722213D747970656F6620622626622E6572726F72262628623D622E6572726F72292C663D612E70726576696577456C656D656E742E717565727953656C6563746F72416C6C28';
wwv_flow_api.g_varchar2_table(80) := '225B646174612D647A2D6572726F726D6573736167655D22292C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C672E7075736828632E74657874436F6E74656E743D62293B72657475726E20677D7D2C6572726F';
wwv_flow_api.g_varchar2_table(81) := '726D756C7469706C653A672C70726F63657373696E673A66756E6374696F6E2861297B72657475726E20612E70726576696577456C656D656E74262628612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D70726F63';
wwv_flow_api.g_varchar2_table(82) := '657373696E6722292C612E5F72656D6F76654C696E6B293F612E5F72656D6F76654C696E6B2E74657874436F6E74656E743D746869732E6F7074696F6E732E6469637443616E63656C55706C6F61643A766F696420307D2C70726F63657373696E676D75';
wwv_flow_api.g_varchar2_table(83) := '6C7469706C653A672C75706C6F616470726F67726573733A66756E6374696F6E28612C62297B76617220632C642C652C662C673B696628612E70726576696577456C656D656E74297B666F7228663D612E70726576696577456C656D656E742E71756572';
wwv_flow_api.g_varchar2_table(84) := '7953656C6563746F72416C6C28225B646174612D647A2D75706C6F616470726F67726573735D22292C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C672E70757368282250524F4752455353223D3D3D632E6E6F';
wwv_flow_api.g_varchar2_table(85) := '64654E616D653F632E76616C75653D623A632E7374796C652E77696474683D22222B622B222522293B72657475726E20677D7D2C746F74616C75706C6F616470726F67726573733A672C73656E64696E673A672C73656E64696E676D756C7469706C653A';
wwv_flow_api.g_varchar2_table(86) := '672C737563636573733A66756E6374696F6E2861297B72657475726E20612E70726576696577456C656D656E743F612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D7375636365737322293A766F696420307D2C73';
wwv_flow_api.g_varchar2_table(87) := '7563636573736D756C7469706C653A672C63616E63656C65643A66756E6374696F6E2861297B72657475726E20746869732E656D697428226572726F72222C612C2255706C6F61642063616E63656C65642E22297D2C63616E63656C65646D756C746970';
wwv_flow_api.g_varchar2_table(88) := '6C653A672C636F6D706C6574653A66756E6374696F6E2861297B72657475726E20612E5F72656D6F76654C696E6B262628612E5F72656D6F76654C696E6B2E74657874436F6E74656E743D746869732E6F7074696F6E732E6469637452656D6F76654669';
wwv_flow_api.g_varchar2_table(89) := '6C65292C612E70726576696577456C656D656E743F612E70726576696577456C656D656E742E636C6173734C6973742E6164642822647A2D636F6D706C65746522293A766F696420307D2C636F6D706C6574656D756C7469706C653A672C6D617866696C';
wwv_flow_api.g_varchar2_table(90) := '657365786365656465643A672C6D617866696C6573726561636865643A672C7175657565636F6D706C6574653A672C7072657669657754656D706C6174653A273C64697620636C6173733D22647A2D7072657669657720647A2D66696C652D7072657669';
wwv_flow_api.g_varchar2_table(91) := '6577223E5C6E20203C64697620636C6173733D22647A2D696D616765223E3C696D6720646174612D647A2D7468756D626E61696C202F3E3C2F6469763E5C6E20203C64697620636C6173733D22647A2D64657461696C73223E5C6E202020203C64697620';
wwv_flow_api.g_varchar2_table(92) := '636C6173733D22647A2D73697A65223E3C7370616E20646174612D647A2D73697A653E3C2F7370616E3E3C2F6469763E5C6E202020203C64697620636C6173733D22647A2D66696C656E616D65223E3C7370616E20646174612D647A2D6E616D653E3C2F';
wwv_flow_api.g_varchar2_table(93) := '7370616E3E3C2F6469763E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D22647A2D70726F6772657373223E3C7370616E20636C6173733D22647A2D75706C6F61642220646174612D647A2D75706C6F616470726F67726573733E3C2F73';
wwv_flow_api.g_varchar2_table(94) := '70616E3E3C2F6469763E5C6E20203C64697620636C6173733D22647A2D6572726F722D6D657373616765223E3C7370616E20646174612D647A2D6572726F726D6573736167653E3C2F7370616E3E3C2F6469763E5C6E20203C64697620636C6173733D22';
wwv_flow_api.g_varchar2_table(95) := '647A2D737563636573732D6D61726B223E5C6E202020203C7376672077696474683D223534707822206865696768743D2235347078222076696577426F783D22302030203534203534222076657273696F6E3D22312E312220786D6C6E733D2268747470';
wwv_flow_api.g_varchar2_table(96) := '3A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B2220786D6C6E733A736B657463683D22687474703A2F2F7777772E626F68656D69616E';
wwv_flow_api.g_varchar2_table(97) := '636F64696E672E636F6D2F736B657463682F6E73223E5C6E2020202020203C7469746C653E436865636B3C2F7469746C653E5C6E2020202020203C646566733E3C2F646566733E5C6E2020202020203C672069643D22506167652D3122207374726F6B65';
wwv_flow_api.g_varchar2_table(98) := '3D226E6F6E6522207374726F6B652D77696474683D2231222066696C6C3D226E6F6E65222066696C6C2D72756C653D226576656E6F64642220736B657463683A747970653D224D5350616765223E5C6E20202020202020203C7061746820643D224D3233';
wwv_flow_api.g_varchar2_table(99) := '2E352C33312E38343331343538204C31372E353835323431392C32352E39323833383737204331362E303234383235332C32342E333637393731312031332E343931303239342C32342E3336363833352031312E393238393332322C32352E3932383933';
wwv_flow_api.g_varchar2_table(100) := '3232204331302E333730303133362C32372E343837383530382031302E333636353931322C33302E303233343435352031312E393238333837372C33312E35383532343139204C32302E343134373538312C34302E30373136313233204332302E353133';
wwv_flow_api.g_varchar2_table(101) := '333939392C34302E313730323534312032302E363135393331352C34302E323632363634392032302E373231383631352C34302E33343838343335204332322E323833353636392C34312E383732353635312032342E3739343233342C34312E38363236';
wwv_flow_api.g_varchar2_table(102) := '3230322032362E333436313536342C34302E33313036393738204C34332E333130363937382C32332E33343631353634204334342E383737313032312C32312E373739373532312034342E383735383035372C31392E323438333838372034332E333133';
wwv_flow_api.g_varchar2_table(103) := '373038352C31372E36383632393135204334312E373534373839392C31362E313237333732392033392E323137363033352C31362E313235353432322033372E363533383433362C31372E36383933303232204C32332E352C33312E3834333134353820';
wwv_flow_api.g_varchar2_table(104) := '5A204D32372C3533204334312E333539343033352C35332035332C34312E333539343033352035332C3237204335332C31322E363430353936352034312E333539343033352C312032372C31204331322E363430353936352C3120312C31322E36343035';
wwv_flow_api.g_varchar2_table(105) := '39363520312C32372043312C34312E333539343033352031322E363430353936352C35332032372C3533205A222069643D224F76616C2D3222207374726F6B652D6F7061636974793D22302E31393837393431353822207374726F6B653D222337343734';
wwv_flow_api.g_varchar2_table(106) := '3734222066696C6C2D6F7061636974793D22302E383136353139343735222066696C6C3D22234646464646462220736B657463683A747970653D224D53536861706547726F7570223E3C2F706174683E5C6E2020202020203C2F673E5C6E202020203C2F';
wwv_flow_api.g_varchar2_table(107) := '7376673E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D22647A2D6572726F722D6D61726B223E5C6E202020203C7376672077696474683D223534707822206865696768743D2235347078222076696577426F783D223020302035342035';
wwv_flow_api.g_varchar2_table(108) := '34222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B2220786D6C6E73';
wwv_flow_api.g_varchar2_table(109) := '3A736B657463683D22687474703A2F2F7777772E626F68656D69616E636F64696E672E636F6D2F736B657463682F6E73223E5C6E2020202020203C7469746C653E4572726F723C2F7469746C653E5C6E2020202020203C646566733E3C2F646566733E5C';
wwv_flow_api.g_varchar2_table(110) := '6E2020202020203C672069643D22506167652D3122207374726F6B653D226E6F6E6522207374726F6B652D77696474683D2231222066696C6C3D226E6F6E65222066696C6C2D72756C653D226576656E6F64642220736B657463683A747970653D224D53';
wwv_flow_api.g_varchar2_table(111) := '50616765223E5C6E20202020202020203C672069643D22436865636B2D2B2D4F76616C2D322220736B657463683A747970653D224D534C6179657247726F757022207374726F6B653D222337343734373422207374726F6B652D6F7061636974793D2230';
wwv_flow_api.g_varchar2_table(112) := '2E313938373934313538222066696C6C3D2223464646464646222066696C6C2D6F7061636974793D22302E383136353139343735223E5C6E202020202020202020203C7061746820643D224D33322E363536383534322C3239204C33382E333130363937';
wwv_flow_api.g_varchar2_table(113) := '382C32332E33343631353634204333392E383737313032312C32312E373739373532312033392E383735383035372C31392E323438333838372033382E333133373038352C31372E36383632393135204333362E373534373839392C31362E3132373337';
wwv_flow_api.g_varchar2_table(114) := '32392033342E323137363033352C31362E313235353432322033322E363533383433362C31372E36383933303232204C32372C32332E33343331343538204C32312E333436313536342C31372E36383933303232204331392E373832333936352C31362E';
wwv_flow_api.g_varchar2_table(115) := '313235353432322031372E323435323130312C31362E313237333732392031352E363836323931352C31372E36383632393135204331342E313234313934332C31392E323438333838372031342E313232383937392C32312E373739373532312031352E';
wwv_flow_api.g_varchar2_table(116) := '363839333032322C32332E33343631353634204C32312E333433313435382C3239204C31352E363839333032322C33342E36353338343336204331342E313232383937392C33362E323230323437392031342E313234313934332C33382E373531363131';
wwv_flow_api.g_varchar2_table(117) := '332031352E363836323931352C34302E33313337303835204331372E323435323130312C34312E383732363237312031392E373832333936352C34312E383734343537382032312E333436313536342C34302E33313036393738204C32372C33342E3635';
wwv_flow_api.g_varchar2_table(118) := '3638353432204C33322E363533383433362C34302E33313036393738204333342E323137363033352C34312E383734343537382033362E373534373839392C34312E383732363237312033382E333133373038352C34302E33313337303835204333392E';
wwv_flow_api.g_varchar2_table(119) := '383735383035372C33382E373531363131332033392E383737313032312C33362E323230323437392033382E333130363937382C33342E36353338343336204C33322E363536383534322C3239205A204D32372C3533204334312E333539343033352C35';
wwv_flow_api.g_varchar2_table(120) := '332035332C34312E333539343033352035332C3237204335332C31322E363430353936352034312E333539343033352C312032372C31204331322E363430353936352C3120312C31322E3634303539363520312C32372043312C34312E33353934303335';
wwv_flow_api.g_varchar2_table(121) := '2031322E363430353936352C35332032372C3533205A222069643D224F76616C2D322220736B657463683A747970653D224D53536861706547726F7570223E3C2F706174683E5C6E20202020202020203C2F673E5C6E2020202020203C2F673E5C6E2020';
wwv_flow_api.g_varchar2_table(122) := '20203C2F7376673E5C6E20203C2F6469763E5C6E3C2F6469763E277D2C643D66756E6374696F6E28297B76617220612C622C632C642C652C662C673B666F7228643D617267756D656E74735B305D2C633D323C3D617267756D656E74732E6C656E677468';
wwv_flow_api.g_varchar2_table(123) := '3F692E63616C6C28617267756D656E74732C31293A5B5D2C663D302C673D632E6C656E6774683B673E663B662B2B297B623D635B665D3B666F72286120696E206229653D625B615D2C645B615D3D657D72657475726E20647D2C632E70726F746F747970';
wwv_flow_api.g_varchar2_table(124) := '652E676574416363657074656446696C65733D66756E6374696F6E28297B76617220612C622C632C642C653B666F7228643D746869732E66696C65732C653D5B5D2C623D302C633D642E6C656E6774683B633E623B622B2B29613D645B625D2C612E6163';
wwv_flow_api.g_varchar2_table(125) := '6365707465642626652E707573682861293B72657475726E20657D2C632E70726F746F747970652E67657452656A656374656446696C65733D66756E6374696F6E28297B76617220612C622C632C642C653B666F7228643D746869732E66696C65732C65';
wwv_flow_api.g_varchar2_table(126) := '3D5B5D2C623D302C633D642E6C656E6774683B633E623B622B2B29613D645B625D2C612E61636365707465647C7C652E707573682861293B72657475726E20657D2C632E70726F746F747970652E67657446696C6573576974685374617475733D66756E';
wwv_flow_api.g_varchar2_table(127) := '6374696F6E2861297B76617220622C632C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C633D302C643D652E6C656E6774683B643E633B632B2B29623D655B635D2C622E7374617475733D3D3D612626662E707573682862293B72';
wwv_flow_api.g_varchar2_table(128) := '657475726E20667D2C632E70726F746F747970652E67657451756575656446696C65733D66756E6374696F6E28297B72657475726E20746869732E67657446696C65735769746853746174757328632E515545554544297D2C632E70726F746F74797065';
wwv_flow_api.g_varchar2_table(129) := '2E67657455706C6F6164696E6746696C65733D66756E6374696F6E28297B72657475726E20746869732E67657446696C65735769746853746174757328632E55504C4F4144494E47297D2C632E70726F746F747970652E67657441637469766546696C65';
wwv_flow_api.g_varchar2_table(130) := '733D66756E6374696F6E28297B76617220612C622C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C623D302C643D652E6C656E6774683B643E623B622B2B29613D655B625D2C28612E7374617475733D3D3D632E55504C4F414449';
wwv_flow_api.g_varchar2_table(131) := '4E477C7C612E7374617475733D3D3D632E515545554544292626662E707573682861293B72657475726E20667D2C632E70726F746F747970652E696E69743D66756E6374696F6E28297B76617220612C622C642C652C662C672C683B666F722822666F72';
wwv_flow_api.g_varchar2_table(132) := '6D223D3D3D746869732E656C656D656E742E7461674E616D652626746869732E656C656D656E742E7365744174747269627574652822656E6374797065222C226D756C7469706172742F666F726D2D6461746122292C746869732E656C656D656E742E63';
wwv_flow_api.g_varchar2_table(133) := '6C6173734C6973742E636F6E7461696E73282264726F707A6F6E652229262621746869732E656C656D656E742E717565727953656C6563746F7228222E647A2D6D65737361676522292626746869732E656C656D656E742E617070656E644368696C6428';
wwv_flow_api.g_varchar2_table(134) := '632E637265617465456C656D656E7428273C64697620636C6173733D22647A2D64656661756C7420647A2D6D657373616765223E3C7370616E3E272B746869732E6F7074696F6E732E6469637444656661756C744D6573736167652B223C2F7370616E3E';
wwv_flow_api.g_varchar2_table(135) := '3C2F6469763E2229292C746869732E636C69636B61626C65456C656D656E74732E6C656E677468262628643D66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E68696464656E46696C65496E7075742626';
wwv_flow_api.g_varchar2_table(136) := '646F63756D656E742E626F64792E72656D6F76654368696C6428612E68696464656E46696C65496E707574292C612E68696464656E46696C65496E7075743D646F63756D656E742E637265617465456C656D656E742822696E70757422292C612E686964';
wwv_flow_api.g_varchar2_table(137) := '64656E46696C65496E7075742E736574417474726962757465282274797065222C2266696C6522292C286E756C6C3D3D612E6F7074696F6E732E6D617846696C65737C7C612E6F7074696F6E732E6D617846696C65733E31292626612E68696464656E46';
wwv_flow_api.g_varchar2_table(138) := '696C65496E7075742E73657441747472696275746528226D756C7469706C65222C226D756C7469706C6522292C612E68696464656E46696C65496E7075742E636C6173734E616D653D22647A2D68696464656E2D696E707574222C6E756C6C213D612E6F';
wwv_flow_api.g_varchar2_table(139) := '7074696F6E732E616363657074656446696C65732626612E68696464656E46696C65496E7075742E7365744174747269627574652822616363657074222C612E6F7074696F6E732E616363657074656446696C6573292C6E756C6C213D612E6F7074696F';
wwv_flow_api.g_varchar2_table(140) := '6E732E636170747572652626612E68696464656E46696C65496E7075742E736574417474726962757465282263617074757265222C612E6F7074696F6E732E63617074757265292C612E68696464656E46696C65496E7075742E7374796C652E76697369';
wwv_flow_api.g_varchar2_table(141) := '62696C6974793D2268696464656E222C612E68696464656E46696C65496E7075742E7374796C652E706F736974696F6E3D226162736F6C757465222C612E68696464656E46696C65496E7075742E7374796C652E746F703D2230222C612E68696464656E';
wwv_flow_api.g_varchar2_table(142) := '46696C65496E7075742E7374796C652E6C6566743D2230222C612E68696464656E46696C65496E7075742E7374796C652E6865696768743D2230222C612E68696464656E46696C65496E7075742E7374796C652E77696474683D2230222C646F63756D65';
wwv_flow_api.g_varchar2_table(143) := '6E742E626F64792E617070656E644368696C6428612E68696464656E46696C65496E707574292C612E68696464656E46696C65496E7075742E6164644576656E744C697374656E657228226368616E6765222C66756E6374696F6E28297B76617220622C';
wwv_flow_api.g_varchar2_table(144) := '632C652C663B696628633D612E68696464656E46696C65496E7075742E66696C65732C632E6C656E67746829666F7228653D302C663D632E6C656E6774683B663E653B652B2B29623D635B655D2C612E61646446696C652862293B72657475726E206428';
wwv_flow_api.g_varchar2_table(145) := '297D297D7D2874686973292928292C746869732E55524C3D6E756C6C213D28673D77696E646F772E55524C293F673A77696E646F772E7765626B697455524C2C683D746869732E6576656E74732C653D302C663D682E6C656E6774683B663E653B652B2B';
wwv_flow_api.g_varchar2_table(146) := '29613D685B655D2C746869732E6F6E28612C746869732E6F7074696F6E735B615D293B72657475726E20746869732E6F6E282275706C6F616470726F6772657373222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B726574';
wwv_flow_api.g_varchar2_table(147) := '75726E20612E757064617465546F74616C55706C6F616450726F677265737328297D7D287468697329292C746869732E6F6E282272656D6F76656466696C65222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B7265747572';
wwv_flow_api.g_varchar2_table(148) := '6E20612E757064617465546F74616C55706C6F616450726F677265737328297D7D287468697329292C746869732E6F6E282263616E63656C6564222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E2862297B72657475726E20612E';
wwv_flow_api.g_varchar2_table(149) := '656D69742822636F6D706C657465222C62297D7D287468697329292C746869732E6F6E2822636F6D706C657465222C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20303D3D3D612E67657455706C6F616469';
wwv_flow_api.g_varchar2_table(150) := '6E6746696C657328292E6C656E6774682626303D3D3D612E67657451756575656446696C657328292E6C656E6774683F73657454696D656F75742866756E6374696F6E28297B72657475726E20612E656D697428227175657565636F6D706C6574652229';
wwv_flow_api.g_varchar2_table(151) := '7D2C30293A766F696420307D7D287468697329292C623D66756E6374696F6E2861297B72657475726E20612E73746F7050726F7061676174696F6E28292C612E70726576656E7444656661756C743F612E70726576656E7444656661756C7428293A612E';
wwv_flow_api.g_varchar2_table(152) := '72657475726E56616C75653D21317D2C746869732E6C697374656E6572733D5B7B656C656D656E743A746869732E656C656D656E742C6576656E74733A7B6472616773746172743A66756E6374696F6E2861297B72657475726E2066756E6374696F6E28';
wwv_flow_api.g_varchar2_table(153) := '62297B72657475726E20612E656D69742822647261677374617274222C62297D7D2874686973292C64726167656E7465723A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B72657475726E20622863292C612E656D697428';
wwv_flow_api.g_varchar2_table(154) := '2264726167656E746572222C63297D7D2874686973292C647261676F7665723A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B76617220643B7472797B643D632E646174615472616E736665722E656666656374416C6C6F';
wwv_flow_api.g_varchar2_table(155) := '7765647D63617463682865297B7D72657475726E20632E646174615472616E736665722E64726F704566666563743D226D6F7665223D3D3D647C7C226C696E6B4D6F7665223D3D3D643F226D6F7665223A22636F7079222C622863292C612E656D697428';
wwv_flow_api.g_varchar2_table(156) := '22647261676F766572222C63297D7D2874686973292C647261676C656176653A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2862297B72657475726E20612E656D69742822647261676C65617665222C62297D7D2874686973292C';
wwv_flow_api.g_varchar2_table(157) := '64726F703A66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B72657475726E20622863292C612E64726F702863297D7D2874686973292C64726167656E643A66756E6374696F6E2861297B72657475726E2066756E6374696F';
wwv_flow_api.g_varchar2_table(158) := '6E2862297B72657475726E20612E656D6974282264726167656E64222C62297D7D2874686973297D7D5D2C746869732E636C69636B61626C65456C656D656E74732E666F72456163682866756E6374696F6E2861297B72657475726E2066756E6374696F';
wwv_flow_api.g_varchar2_table(159) := '6E2862297B72657475726E20612E6C697374656E6572732E70757368287B656C656D656E743A622C6576656E74733A7B636C69636B3A66756E6374696F6E2864297B72657475726E2062213D3D612E656C656D656E747C7C642E7461726765743D3D3D61';
wwv_flow_api.g_varchar2_table(160) := '2E656C656D656E747C7C632E656C656D656E74496E7369646528642E7461726765742C612E656C656D656E742E717565727953656C6563746F7228222E647A2D6D6573736167652229293F612E68696464656E46696C65496E7075742E636C69636B2829';
wwv_flow_api.g_varchar2_table(161) := '3A766F696420307D7D7D297D7D287468697329292C746869732E656E61626C6528292C746869732E6F7074696F6E732E696E69742E63616C6C2874686973297D2C632E70726F746F747970652E64657374726F793D66756E6374696F6E28297B76617220';
wwv_flow_api.g_varchar2_table(162) := '613B72657475726E20746869732E64697361626C6528292C746869732E72656D6F7665416C6C46696C6573282130292C286E756C6C213D28613D746869732E68696464656E46696C65496E707574293F612E706172656E744E6F64653A766F6964203029';
wwv_flow_api.g_varchar2_table(163) := '262628746869732E68696464656E46696C65496E7075742E706172656E744E6F64652E72656D6F76654368696C6428746869732E68696464656E46696C65496E707574292C746869732E68696464656E46696C65496E7075743D6E756C6C292C64656C65';
wwv_flow_api.g_varchar2_table(164) := '746520746869732E656C656D656E742E64726F707A6F6E652C632E696E7374616E6365732E73706C69636528632E696E7374616E6365732E696E6465784F662874686973292C31297D2C632E70726F746F747970652E757064617465546F74616C55706C';
wwv_flow_api.g_varchar2_table(165) := '6F616450726F67726573733D66756E6374696F6E28297B76617220612C622C632C642C652C662C672C683B696628643D302C633D302C613D746869732E67657441637469766546696C657328292C612E6C656E677468297B666F7228683D746869732E67';
wwv_flow_api.g_varchar2_table(166) := '657441637469766546696C657328292C663D302C673D682E6C656E6774683B673E663B662B2B29623D685B665D2C642B3D622E75706C6F61642E627974657353656E742C632B3D622E75706C6F61642E746F74616C3B653D3130302A642F637D656C7365';
wwv_flow_api.g_varchar2_table(167) := '20653D3130303B72657475726E20746869732E656D69742822746F74616C75706C6F616470726F6772657373222C652C632C64297D2C632E70726F746F747970652E5F676574506172616D4E616D653D66756E6374696F6E2861297B72657475726E2266';
wwv_flow_api.g_varchar2_table(168) := '756E6374696F6E223D3D747970656F6620746869732E6F7074696F6E732E706172616D4E616D653F746869732E6F7074696F6E732E706172616D4E616D652861293A22222B746869732E6F7074696F6E732E706172616D4E616D652B28746869732E6F70';
wwv_flow_api.g_varchar2_table(169) := '74696F6E732E75706C6F61644D756C7469706C653F225B222B612B225D223A2222297D2C632E70726F746F747970652E67657446616C6C6261636B466F726D3D66756E6374696F6E28297B76617220612C622C642C653B72657475726E28613D74686973';
wwv_flow_api.g_varchar2_table(170) := '2E6765744578697374696E6746616C6C6261636B2829293F613A28643D273C64697620636C6173733D22647A2D66616C6C6261636B223E272C746869732E6F7074696F6E732E6469637446616C6C6261636B54657874262628642B3D223C703E222B7468';
wwv_flow_api.g_varchar2_table(171) := '69732E6F7074696F6E732E6469637446616C6C6261636B546578742B223C2F703E22292C642B3D273C696E70757420747970653D2266696C6522206E616D653D22272B746869732E5F676574506172616D4E616D652830292B272220272B28746869732E';
wwv_flow_api.g_varchar2_table(172) := '6F7074696F6E732E75706C6F61644D756C7469706C653F276D756C7469706C653D226D756C7469706C6522273A766F69642030292B27202F3E3C696E70757420747970653D227375626D6974222076616C75653D2255706C6F616421223E3C2F6469763E';
wwv_flow_api.g_varchar2_table(173) := '272C623D632E637265617465456C656D656E742864292C22464F524D22213D3D746869732E656C656D656E742E7461674E616D653F28653D632E637265617465456C656D656E7428273C666F726D20616374696F6E3D22272B746869732E6F7074696F6E';
wwv_flow_api.g_varchar2_table(174) := '732E75726C2B272220656E63747970653D226D756C7469706172742F666F726D2D6461746122206D6574686F643D22272B746869732E6F7074696F6E732E6D6574686F642B27223E3C2F666F726D3E27292C652E617070656E644368696C64286229293A';
wwv_flow_api.g_varchar2_table(175) := '28746869732E656C656D656E742E7365744174747269627574652822656E6374797065222C226D756C7469706172742F666F726D2D6461746122292C746869732E656C656D656E742E73657441747472696275746528226D6574686F64222C746869732E';
wwv_flow_api.g_varchar2_table(176) := '6F7074696F6E732E6D6574686F6429292C6E756C6C213D653F653A62297D2C632E70726F746F747970652E6765744578697374696E6746616C6C6261636B3D66756E6374696F6E28297B76617220612C622C632C642C652C663B666F7228623D66756E63';
wwv_flow_api.g_varchar2_table(177) := '74696F6E2861297B76617220622C632C643B666F7228633D302C643D612E6C656E6774683B643E633B632B2B29696628623D615B635D2C2F285E7C202966616C6C6261636B28247C20292F2E7465737428622E636C6173734E616D65292972657475726E';
wwv_flow_api.g_varchar2_table(178) := '20627D2C663D5B22646976222C22666F726D225D2C643D302C653D662E6C656E6774683B653E643B642B2B29696628633D665B645D2C613D6228746869732E656C656D656E742E676574456C656D656E747342795461674E616D65286329292972657475';
wwv_flow_api.g_varchar2_table(179) := '726E20617D2C632E70726F746F747970652E73657475704576656E744C697374656E6572733D66756E6374696F6E28297B76617220612C622C632C642C652C662C673B666F7228663D746869732E6C697374656E6572732C673D5B5D2C643D302C653D66';
wwv_flow_api.g_varchar2_table(180) := '2E6C656E6774683B653E643B642B2B29613D665B645D2C672E707573682866756E6374696F6E28297B76617220642C653B643D612E6576656E74732C653D5B5D3B666F72286220696E206429633D645B625D2C652E7075736828612E656C656D656E742E';
wwv_flow_api.g_varchar2_table(181) := '6164644576656E744C697374656E657228622C632C213129293B72657475726E20657D2829293B72657475726E20677D2C632E70726F746F747970652E72656D6F76654576656E744C697374656E6572733D66756E6374696F6E28297B76617220612C62';
wwv_flow_api.g_varchar2_table(182) := '2C632C642C652C662C673B666F7228663D746869732E6C697374656E6572732C673D5B5D2C643D302C653D662E6C656E6774683B653E643B642B2B29613D665B645D2C672E707573682866756E6374696F6E28297B76617220642C653B643D612E657665';
wwv_flow_api.g_varchar2_table(183) := '6E74732C653D5B5D3B666F72286220696E206429633D645B625D2C652E7075736828612E656C656D656E742E72656D6F76654576656E744C697374656E657228622C632C213129293B72657475726E20657D2829293B72657475726E20677D2C632E7072';
wwv_flow_api.g_varchar2_table(184) := '6F746F747970652E64697361626C653D66756E6374696F6E28297B76617220612C622C632C642C653B666F7228746869732E636C69636B61626C65456C656D656E74732E666F72456163682866756E6374696F6E2861297B72657475726E20612E636C61';
wwv_flow_api.g_varchar2_table(185) := '73734C6973742E72656D6F76652822647A2D636C69636B61626C6522297D292C746869732E72656D6F76654576656E744C697374656E65727328292C643D746869732E66696C65732C653D5B5D2C623D302C633D642E6C656E6774683B633E623B622B2B';
wwv_flow_api.g_varchar2_table(186) := '29613D645B625D2C652E7075736828746869732E63616E63656C55706C6F6164286129293B72657475726E20657D2C632E70726F746F747970652E656E61626C653D66756E6374696F6E28297B72657475726E20746869732E636C69636B61626C65456C';
wwv_flow_api.g_varchar2_table(187) := '656D656E74732E666F72456163682866756E6374696F6E2861297B72657475726E20612E636C6173734C6973742E6164642822647A2D636C69636B61626C6522297D292C746869732E73657475704576656E744C697374656E65727328297D2C632E7072';
wwv_flow_api.g_varchar2_table(188) := '6F746F747970652E66696C6573697A653D66756E6374696F6E2861297B76617220622C632C642C652C662C672C682C693B666F7228673D5B225442222C224742222C224D42222C224B42222C2262225D2C643D653D6E756C6C2C633D683D302C693D672E';
wwv_flow_api.g_varchar2_table(189) := '6C656E6774683B693E683B633D2B2B6829696628663D675B635D2C623D4D6174682E706F7728746869732E6F7074696F6E732E66696C6573697A65426173652C342D63292F31302C613E3D62297B643D612F4D6174682E706F7728746869732E6F707469';
wwv_flow_api.g_varchar2_table(190) := '6F6E732E66696C6573697A65426173652C342D63292C653D663B627265616B7D72657475726E20643D4D6174682E726F756E642831302A64292F31302C223C7374726F6E673E222B642B223C2F7374726F6E673E20222B657D2C632E70726F746F747970';
wwv_flow_api.g_varchar2_table(191) := '652E5F7570646174654D617846696C657352656163686564436C6173733D66756E6374696F6E28297B72657475726E206E756C6C213D746869732E6F7074696F6E732E6D617846696C65732626746869732E676574416363657074656446696C65732829';
wwv_flow_api.g_varchar2_table(192) := '2E6C656E6774683E3D746869732E6F7074696F6E732E6D617846696C65733F28746869732E676574416363657074656446696C657328292E6C656E6774683D3D3D746869732E6F7074696F6E732E6D617846696C65732626746869732E656D697428226D';
wwv_flow_api.g_varchar2_table(193) := '617866696C657372656163686564222C746869732E66696C6573292C746869732E656C656D656E742E636C6173734C6973742E6164642822647A2D6D61782D66696C65732D726561636865642229293A746869732E656C656D656E742E636C6173734C69';
wwv_flow_api.g_varchar2_table(194) := '73742E72656D6F76652822647A2D6D61782D66696C65732D7265616368656422297D2C632E70726F746F747970652E64726F703D66756E6374696F6E2861297B76617220622C633B612E646174615472616E73666572262628746869732E656D69742822';
wwv_flow_api.g_varchar2_table(195) := '64726F70222C61292C623D612E646174615472616E736665722E66696C65732C622E6C656E677468262628633D612E646174615472616E736665722E6974656D732C632626632E6C656E67746826266E756C6C213D635B305D2E7765626B697447657441';
wwv_flow_api.g_varchar2_table(196) := '73456E7472793F746869732E5F61646446696C657346726F6D4974656D732863293A746869732E68616E646C6546696C657328622929297D2C632E70726F746F747970652E70617374653D66756E6374696F6E2861297B76617220622C633B6966286E75';
wwv_flow_api.g_varchar2_table(197) := '6C6C213D286E756C6C213D6126266E756C6C213D28633D612E636C6970626F61726444617461293F632E6974656D733A766F69642030292972657475726E20746869732E656D697428227061737465222C61292C623D612E636C6970626F617264446174';
wwv_flow_api.g_varchar2_table(198) := '612E6974656D732C622E6C656E6774683F746869732E5F61646446696C657346726F6D4974656D732862293A766F696420307D2C632E70726F746F747970652E68616E646C6546696C65733D66756E6374696F6E2861297B76617220622C632C642C653B';
wwv_flow_api.g_varchar2_table(199) := '666F7228653D5B5D2C633D302C643D612E6C656E6774683B643E633B632B2B29623D615B635D2C652E7075736828746869732E61646446696C65286229293B72657475726E20657D2C632E70726F746F747970652E5F61646446696C657346726F6D4974';
wwv_flow_api.g_varchar2_table(200) := '656D733D66756E6374696F6E2861297B76617220622C632C642C652C663B666F7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B642B2B29633D615B645D2C662E70757368286E756C6C213D632E7765626B69744765744173456E747279';
wwv_flow_api.g_varchar2_table(201) := '262628623D632E7765626B69744765744173456E7472792829293F622E697346696C653F746869732E61646446696C6528632E676574417346696C652829293A622E69734469726563746F72793F746869732E5F61646446696C657346726F6D44697265';
wwv_flow_api.g_varchar2_table(202) := '63746F727928622C622E6E616D65293A766F696420303A6E756C6C213D632E676574417346696C653F6E756C6C3D3D632E6B696E647C7C2266696C65223D3D3D632E6B696E643F746869732E61646446696C6528632E676574417346696C652829293A76';
wwv_flow_api.g_varchar2_table(203) := '6F696420303A766F69642030293B72657475726E20667D2C632E70726F746F747970652E5F61646446696C657346726F6D4469726563746F72793D66756E6374696F6E28612C62297B76617220632C643B72657475726E20633D612E6372656174655265';
wwv_flow_api.g_varchar2_table(204) := '6164657228292C643D66756E6374696F6E2861297B72657475726E2066756E6374696F6E2863297B76617220642C652C663B666F7228653D302C663D632E6C656E6774683B663E653B652B2B29643D635B655D2C642E697346696C653F642E66696C6528';
wwv_flow_api.g_varchar2_table(205) := '66756E6374696F6E2863297B72657475726E20612E6F7074696F6E732E69676E6F726548696464656E46696C65732626222E223D3D3D632E6E616D652E737562737472696E6728302C31293F766F696420303A28632E66756C6C506174683D22222B622B';
wwv_flow_api.g_varchar2_table(206) := '222F222B632E6E616D652C612E61646446696C65286329297D293A642E69734469726563746F72792626612E5F61646446696C657346726F6D4469726563746F727928642C22222B622B222F222B642E6E616D65297D7D2874686973292C632E72656164';
wwv_flow_api.g_varchar2_table(207) := '456E747269657328642C66756E6374696F6E2861297B72657475726E22756E646566696E656422213D747970656F6620636F6E736F6C6526266E756C6C213D3D636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E';
wwv_flow_api.g_varchar2_table(208) := '6C6F673F636F6E736F6C652E6C6F672861293A766F696420307D297D2C632E70726F746F747970652E6163636570743D66756E6374696F6E28612C62297B72657475726E20612E73697A653E313032342A746869732E6F7074696F6E732E6D617846696C';
wwv_flow_api.g_varchar2_table(209) := '6573697A652A313032343F6228746869732E6F7074696F6E732E6469637446696C65546F6F4269672E7265706C61636528227B7B66696C6573697A657D7D222C4D6174682E726F756E6428612E73697A652F313032342F31302E3234292F313030292E72';
wwv_flow_api.g_varchar2_table(210) := '65706C61636528227B7B6D617846696C6573697A657D7D222C746869732E6F7074696F6E732E6D617846696C6573697A6529293A632E697356616C696446696C6528612C746869732E6F7074696F6E732E616363657074656446696C6573293F6E756C6C';
wwv_flow_api.g_varchar2_table(211) := '213D746869732E6F7074696F6E732E6D617846696C65732626746869732E676574416363657074656446696C657328292E6C656E6774683E3D746869732E6F7074696F6E732E6D617846696C65733F286228746869732E6F7074696F6E732E646963744D';
wwv_flow_api.g_varchar2_table(212) := '617846696C657345786365656465642E7265706C61636528227B7B6D617846696C65737D7D222C746869732E6F7074696F6E732E6D617846696C657329292C746869732E656D697428226D617866696C65736578636565646564222C6129293A74686973';
wwv_flow_api.g_varchar2_table(213) := '2E6F7074696F6E732E6163636570742E63616C6C28746869732C612C62293A6228746869732E6F7074696F6E732E64696374496E76616C696446696C6554797065297D2C632E70726F746F747970652E61646446696C653D66756E6374696F6E2861297B';
wwv_flow_api.g_varchar2_table(214) := '72657475726E20612E75706C6F61643D7B70726F67726573733A302C746F74616C3A612E73697A652C627974657353656E743A307D2C746869732E66696C65732E707573682861292C612E7374617475733D632E41444445442C746869732E656D697428';
wwv_flow_api.g_varchar2_table(215) := '22616464656466696C65222C61292C746869732E5F656E71756575655468756D626E61696C2861292C746869732E61636365707428612C66756E6374696F6E2862297B72657475726E2066756E6374696F6E2863297B72657475726E20633F28612E6163';
wwv_flow_api.g_varchar2_table(216) := '6365707465643D21312C622E5F6572726F7250726F63657373696E67285B615D2C6329293A28612E61636365707465643D21302C622E6F7074696F6E732E6175746F51756575652626622E656E717565756546696C65286129292C622E5F757064617465';
wwv_flow_api.g_varchar2_table(217) := '4D617846696C657352656163686564436C61737328297D7D287468697329297D2C632E70726F746F747970652E656E717565756546696C65733D66756E6374696F6E2861297B76617220622C632C643B666F7228633D302C643D612E6C656E6774683B64';
wwv_flow_api.g_varchar2_table(218) := '3E633B632B2B29623D615B635D2C746869732E656E717565756546696C652862293B72657475726E206E756C6C7D2C632E70726F746F747970652E656E717565756546696C653D66756E6374696F6E2861297B696628612E737461747573213D3D632E41';
wwv_flow_api.g_varchar2_table(219) := '444445447C7C612E6163636570746564213D3D2130297468726F77206E6577204572726F722822546869732066696C652063616E27742062652071756575656420626563617573652069742068617320616C7265616479206265656E2070726F63657373';
wwv_flow_api.g_varchar2_table(220) := '6564206F72207761732072656A65637465642E22293B72657475726E20612E7374617475733D632E5155455545442C746869732E6F7074696F6E732E6175746F50726F6365737351756575653F73657454696D656F75742866756E6374696F6E2861297B';
wwv_flow_api.g_varchar2_table(221) := '72657475726E2066756E6374696F6E28297B72657475726E20612E70726F63657373517565756528297D7D2874686973292C30293A766F696420307D2C632E70726F746F747970652E5F7468756D626E61696C51756575653D5B5D2C632E70726F746F74';
wwv_flow_api.g_varchar2_table(222) := '7970652E5F70726F63657373696E675468756D626E61696C3D21312C632E70726F746F747970652E5F656E71756575655468756D626E61696C3D66756E6374696F6E2861297B72657475726E20746869732E6F7074696F6E732E637265617465496D6167';
wwv_flow_api.g_varchar2_table(223) := '655468756D626E61696C732626612E747970652E6D61746368282F696D6167652E2A2F292626612E73697A653C3D313032342A746869732E6F7074696F6E732E6D61785468756D626E61696C46696C6573697A652A313032343F28746869732E5F746875';
wwv_flow_api.g_varchar2_table(224) := '6D626E61696C51756575652E707573682861292C73657454696D656F75742866756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E5F70726F636573735468756D626E61696C517565756528297D7D28746869';
wwv_flow_api.g_varchar2_table(225) := '73292C3029293A766F696420307D2C632E70726F746F747970652E5F70726F636573735468756D626E61696C51756575653D66756E6374696F6E28297B72657475726E20746869732E5F70726F63657373696E675468756D626E61696C7C7C303D3D3D74';
wwv_flow_api.g_varchar2_table(226) := '6869732E5F7468756D626E61696C51756575652E6C656E6774683F766F696420303A28746869732E5F70726F63657373696E675468756D626E61696C3D21302C746869732E6372656174655468756D626E61696C28746869732E5F7468756D626E61696C';
wwv_flow_api.g_varchar2_table(227) := '51756575652E736869667428292C66756E6374696F6E2861297B72657475726E2066756E6374696F6E28297B72657475726E20612E5F70726F63657373696E675468756D626E61696C3D21312C612E5F70726F636573735468756D626E61696C51756575';
wwv_flow_api.g_varchar2_table(228) := '6528297D7D28746869732929297D2C632E70726F746F747970652E72656D6F766546696C653D66756E6374696F6E2861297B72657475726E20612E7374617475733D3D3D632E55504C4F4144494E472626746869732E63616E63656C55706C6F61642861';
wwv_flow_api.g_varchar2_table(229) := '292C746869732E66696C65733D6828746869732E66696C65732C61292C746869732E656D6974282272656D6F76656466696C65222C61292C303D3D3D746869732E66696C65732E6C656E6774683F746869732E656D69742822726573657422293A766F69';
wwv_flow_api.g_varchar2_table(230) := '6420307D2C632E70726F746F747970652E72656D6F7665416C6C46696C65733D66756E6374696F6E2861297B76617220622C642C652C663B666F72286E756C6C3D3D61262628613D2131292C663D746869732E66696C65732E736C69636528292C643D30';
wwv_flow_api.g_varchar2_table(231) := '2C653D662E6C656E6774683B653E643B642B2B29623D665B645D2C28622E737461747573213D3D632E55504C4F4144494E477C7C61292626746869732E72656D6F766546696C652862293B72657475726E206E756C6C7D2C632E70726F746F747970652E';
wwv_flow_api.g_varchar2_table(232) := '6372656174655468756D626E61696C3D66756E6374696F6E28612C62297B76617220633B72657475726E20633D6E65772046696C655265616465722C632E6F6E6C6F61643D66756E6374696F6E2864297B72657475726E2066756E6374696F6E28297B76';
wwv_flow_api.g_varchar2_table(233) := '617220653B72657475726E22696D6167652F7376672B786D6C223D3D3D612E747970653F28642E656D697428227468756D626E61696C222C612C632E726573756C74292C766F6964286E756C6C213D62262662282929293A28653D646F63756D656E742E';
wwv_flow_api.g_varchar2_table(234) := '637265617465456C656D656E742822696D6722292C652E6F6E6C6F61643D66756E6374696F6E28297B76617220632C672C682C692C6A2C6B2C6C2C6D3B72657475726E20612E77696474683D652E77696474682C612E6865696768743D652E6865696768';
wwv_flow_api.g_varchar2_table(235) := '742C683D642E6F7074696F6E732E726573697A652E63616C6C28642C61292C6E756C6C3D3D682E7472675769647468262628682E74726757696474683D682E6F70745769647468292C6E756C6C3D3D682E747267486569676874262628682E7472674865';
wwv_flow_api.g_varchar2_table(236) := '696768743D682E6F7074486569676874292C633D646F63756D656E742E637265617465456C656D656E74282263616E76617322292C673D632E676574436F6E746578742822326422292C632E77696474683D682E74726757696474682C632E6865696768';
wwv_flow_api.g_varchar2_table(237) := '743D682E7472674865696768742C6628672C652C6E756C6C213D286A3D682E73726358293F6A3A302C6E756C6C213D286B3D682E73726359293F6B3A302C682E73726357696474682C682E7372634865696768742C6E756C6C213D286C3D682E74726758';
wwv_flow_api.g_varchar2_table(238) := '293F6C3A302C6E756C6C213D286D3D682E74726759293F6D3A302C682E74726757696474682C682E747267486569676874292C693D632E746F4461746155524C2822696D6167652F706E6722292C642E656D697428227468756D626E61696C222C612C69';
wwv_flow_api.g_varchar2_table(239) := '292C6E756C6C213D623F6228293A766F696420307D2C652E6F6E6572726F723D622C652E7372633D632E726573756C74297D7D2874686973292C632E7265616441734461746155524C2861297D2C632E70726F746F747970652E70726F63657373517565';
wwv_flow_api.g_varchar2_table(240) := '75653D66756E6374696F6E28297B76617220612C622C632C643B696628623D746869732E6F7074696F6E732E706172616C6C656C55706C6F6164732C633D746869732E67657455706C6F6164696E6746696C657328292E6C656E6774682C613D632C2128';
wwv_flow_api.g_varchar2_table(241) := '633E3D6229262628643D746869732E67657451756575656446696C657328292C642E6C656E6774683E3029297B696628746869732E6F7074696F6E732E75706C6F61644D756C7469706C652972657475726E20746869732E70726F6365737346696C6573';
wwv_flow_api.g_varchar2_table(242) := '28642E736C69636528302C622D6329293B666F72283B623E613B297B69662821642E6C656E6774682972657475726E3B746869732E70726F6365737346696C6528642E73686966742829292C612B2B7D7D7D2C632E70726F746F747970652E70726F6365';
wwv_flow_api.g_varchar2_table(243) := '737346696C653D66756E6374696F6E2861297B72657475726E20746869732E70726F6365737346696C6573285B615D297D2C632E70726F746F747970652E70726F6365737346696C65733D66756E6374696F6E2861297B76617220622C642C653B666F72';
wwv_flow_api.g_varchar2_table(244) := '28643D302C653D612E6C656E6774683B653E643B642B2B29623D615B645D2C622E70726F63657373696E673D21302C622E7374617475733D632E55504C4F4144494E472C746869732E656D6974282270726F63657373696E67222C62293B72657475726E';
wwv_flow_api.g_varchar2_table(245) := '20746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282270726F63657373696E676D756C7469706C65222C61292C746869732E75706C6F616446696C65732861297D2C632E70726F746F747970652E5F6765';
wwv_flow_api.g_varchar2_table(246) := '7446696C6573576974685868723D66756E6374696F6E2861297B76617220622C633B72657475726E20633D66756E6374696F6E28297B76617220632C642C652C663B666F7228653D746869732E66696C65732C663D5B5D2C633D302C643D652E6C656E67';
wwv_flow_api.g_varchar2_table(247) := '74683B643E633B632B2B29623D655B635D2C622E7868723D3D3D612626662E707573682862293B72657475726E20667D2E63616C6C2874686973297D2C632E70726F746F747970652E63616E63656C55706C6F61643D66756E6374696F6E2861297B7661';
wwv_flow_api.g_varchar2_table(248) := '7220622C642C652C662C672C682C693B696628612E7374617475733D3D3D632E55504C4F4144494E47297B666F7228643D746869732E5F67657446696C65735769746858687228612E786872292C653D302C673D642E6C656E6774683B673E653B652B2B';
wwv_flow_api.g_varchar2_table(249) := '29623D645B655D2C622E7374617475733D632E43414E43454C45443B666F7228612E7868722E61626F727428292C663D302C683D642E6C656E6774683B683E663B662B2B29623D645B665D2C746869732E656D6974282263616E63656C6564222C62293B';
wwv_flow_api.g_varchar2_table(250) := '746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282263616E63656C65646D756C7469706C65222C64297D656C73652828693D612E737461747573293D3D3D632E41444445447C7C693D3D3D632E51554555';
wwv_flow_api.g_varchar2_table(251) := '454429262628612E7374617475733D632E43414E43454C45442C746869732E656D6974282263616E63656C6564222C61292C746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D6974282263616E63656C65646D75';
wwv_flow_api.g_varchar2_table(252) := '6C7469706C65222C5B615D29293B72657475726E20746869732E6F7074696F6E732E6175746F50726F6365737351756575653F746869732E70726F63657373517565756528293A766F696420307D2C653D66756E6374696F6E28297B76617220612C623B';
wwv_flow_api.g_varchar2_table(253) := '72657475726E20623D617267756D656E74735B305D2C613D323C3D617267756D656E74732E6C656E6774683F692E63616C6C28617267756D656E74732C31293A5B5D2C2266756E6374696F6E223D3D747970656F6620623F622E6170706C792874686973';
wwv_flow_api.g_varchar2_table(254) := '2C61293A627D2C632E70726F746F747970652E75706C6F616446696C653D66756E6374696F6E2861297B72657475726E20746869732E75706C6F616446696C6573285B615D297D2C632E70726F746F747970652E75706C6F616446696C65733D66756E63';
wwv_flow_api.g_varchar2_table(255) := '74696F6E2861297B76617220622C662C672C682C692C6A2C6B2C6C2C6D2C6E2C6F2C702C712C722C732C742C752C762C772C782C792C7A2C412C422C432C442C452C462C472C482C492C4A2C4B2C4C3B666F7228773D6E657720584D4C48747470526571';
wwv_flow_api.g_varchar2_table(256) := '756573742C783D302C423D612E6C656E6774683B423E783B782B2B29623D615B785D2C622E7868723D773B703D6528746869732E6F7074696F6E732E6D6574686F642C61292C753D6528746869732E6F7074696F6E732E75726C2C61292C772E6F70656E';
wwv_flow_api.g_varchar2_table(257) := '28702C752C2130292C772E7769746843726564656E7469616C733D2121746869732E6F7074696F6E732E7769746843726564656E7469616C732C733D6E756C6C2C673D66756E6374696F6E2863297B72657475726E2066756E6374696F6E28297B766172';
wwv_flow_api.g_varchar2_table(258) := '20642C652C663B666F7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B642B2B29623D615B645D2C662E7075736828632E5F6572726F7250726F63657373696E6728612C737C7C632E6F7074696F6E732E64696374526573706F6E736545';
wwv_flow_api.g_varchar2_table(259) := '72726F722E7265706C61636528227B7B737461747573436F64657D7D222C772E737461747573292C7729293B72657475726E20667D7D2874686973292C743D66756E6374696F6E2863297B72657475726E2066756E6374696F6E2864297B76617220652C';
wwv_flow_api.g_varchar2_table(260) := '662C672C682C692C6A2C6B2C6C2C6D3B6966286E756C6C213D6429666F7228663D3130302A642E6C6F616465642F642E746F74616C2C673D302C6A3D612E6C656E6774683B6A3E673B672B2B29623D615B675D2C622E75706C6F61643D7B70726F677265';
wwv_flow_api.g_varchar2_table(261) := '73733A662C746F74616C3A642E746F74616C2C627974657353656E743A642E6C6F616465647D3B656C73657B666F7228653D21302C663D3130302C683D302C6B3D612E6C656E6774683B6B3E683B682B2B29623D615B685D2C28313030213D3D622E7570';
wwv_flow_api.g_varchar2_table(262) := '6C6F61642E70726F67726573737C7C622E75706C6F61642E627974657353656E74213D3D622E75706C6F61642E746F74616C29262628653D2131292C622E75706C6F61642E70726F67726573733D662C622E75706C6F61642E627974657353656E743D62';
wwv_flow_api.g_varchar2_table(263) := '2E75706C6F61642E746F74616C3B696628652972657475726E7D666F72286D3D5B5D2C693D302C6C3D612E6C656E6774683B6C3E693B692B2B29623D615B695D2C6D2E7075736828632E656D6974282275706C6F616470726F6772657373222C622C662C';
wwv_flow_api.g_varchar2_table(264) := '622E75706C6F61642E627974657353656E7429293B72657475726E206D7D7D2874686973292C772E6F6E6C6F61643D66756E6374696F6E2862297B72657475726E2066756E6374696F6E2864297B76617220653B696628615B305D2E737461747573213D';
wwv_flow_api.g_varchar2_table(265) := '3D632E43414E43454C45442626343D3D3D772E72656164795374617465297B696628733D772E726573706F6E7365546578742C772E676574526573706F6E73654865616465722822636F6E74656E742D74797065222926267E772E676574526573706F6E';
wwv_flow_api.g_varchar2_table(266) := '73654865616465722822636F6E74656E742D7479706522292E696E6465784F6628226170706C69636174696F6E2F6A736F6E2229297472797B733D4A534F4E2E70617273652873297D63617463682866297B643D662C733D22496E76616C6964204A534F';
wwv_flow_api.g_varchar2_table(267) := '4E20726573706F6E73652066726F6D207365727665722E227D72657475726E207428292C3230303C3D28653D772E7374617475732926263330303E653F622E5F66696E697368656428612C732C64293A6728297D7D7D2874686973292C772E6F6E657272';
wwv_flow_api.g_varchar2_table(268) := '6F723D66756E6374696F6E28297B72657475726E2066756E6374696F6E28297B72657475726E20615B305D2E737461747573213D3D632E43414E43454C45443F6728293A766F696420307D7D2874686973292C723D6E756C6C213D28473D772E75706C6F';
wwv_flow_api.g_varchar2_table(269) := '6164293F473A772C722E6F6E70726F67726573733D742C6A3D7B4163636570743A226170706C69636174696F6E2F6A736F6E222C2243616368652D436F6E74726F6C223A226E6F2D6361636865222C22582D5265717565737465642D57697468223A2258';
wwv_flow_api.g_varchar2_table(270) := '4D4C4874747052657175657374227D2C746869732E6F7074696F6E732E68656164657273262664286A2C746869732E6F7074696F6E732E68656164657273293B666F72286820696E206A29693D6A5B685D2C772E73657452657175657374486561646572';
wwv_flow_api.g_varchar2_table(271) := '28682C69293B696628663D6E657720466F726D446174612C746869732E6F7074696F6E732E706172616D73297B483D746869732E6F7074696F6E732E706172616D733B666F72286F20696E204829763D485B6F5D2C662E617070656E64286F2C76297D66';
wwv_flow_api.g_varchar2_table(272) := '6F7228793D302C433D612E6C656E6774683B433E793B792B2B29623D615B795D2C746869732E656D6974282273656E64696E67222C622C772C66293B696628746869732E6F7074696F6E732E75706C6F61644D756C7469706C652626746869732E656D69';
wwv_flow_api.g_varchar2_table(273) := '74282273656E64696E676D756C7469706C65222C612C772C66292C22464F524D223D3D3D746869732E656C656D656E742E7461674E616D6529666F7228493D746869732E656C656D656E742E717565727953656C6563746F72416C6C2822696E7075742C';
wwv_flow_api.g_varchar2_table(274) := '2074657874617265612C2073656C6563742C20627574746F6E22292C7A3D302C443D492E6C656E6774683B443E7A3B7A2B2B296966286C3D495B7A5D2C6D3D6C2E67657441747472696275746528226E616D6522292C6E3D6C2E67657441747472696275';
wwv_flow_api.g_varchar2_table(275) := '746528227479706522292C2253454C454354223D3D3D6C2E7461674E616D6526266C2E68617341747472696275746528226D756C7469706C65222929666F72284A3D6C2E6F7074696F6E732C413D302C453D4A2E6C656E6774683B453E413B412B2B2971';
wwv_flow_api.g_varchar2_table(276) := '3D4A5B415D2C712E73656C65637465642626662E617070656E64286D2C712E76616C7565293B656C736528216E7C7C22636865636B626F7822213D3D284B3D6E2E746F4C6F77657243617365282929262622726164696F22213D3D4B7C7C6C2E63686563';
wwv_flow_api.g_varchar2_table(277) := '6B6564292626662E617070656E64286D2C6C2E76616C7565293B666F72286B3D463D302C4C3D612E6C656E6774682D313B4C3E3D303F4C3E3D463A463E3D4C3B6B3D4C3E3D303F2B2B463A2D2D4629662E617070656E6428746869732E5F676574506172';
wwv_flow_api.g_varchar2_table(278) := '616D4E616D65286B292C615B6B5D2C615B6B5D2E6E616D65293B72657475726E20772E73656E642866297D2C632E70726F746F747970652E5F66696E69736865643D66756E6374696F6E28612C622C64297B76617220652C662C673B666F7228663D302C';
wwv_flow_api.g_varchar2_table(279) := '673D612E6C656E6774683B673E663B662B2B29653D615B665D2C652E7374617475733D632E535543434553532C746869732E656D6974282273756363657373222C652C622C64292C746869732E656D69742822636F6D706C657465222C65293B72657475';
wwv_flow_api.g_varchar2_table(280) := '726E20746869732E6F7074696F6E732E75706C6F61644D756C7469706C65262628746869732E656D69742822737563636573736D756C7469706C65222C612C622C64292C746869732E656D69742822636F6D706C6574656D756C7469706C65222C612929';
wwv_flow_api.g_varchar2_table(281) := '2C746869732E6F7074696F6E732E6175746F50726F6365737351756575653F746869732E70726F63657373517565756528293A766F696420307D2C632E70726F746F747970652E5F6572726F7250726F63657373696E673D66756E6374696F6E28612C62';
wwv_flow_api.g_varchar2_table(282) := '2C64297B76617220652C662C673B666F7228663D302C673D612E6C656E6774683B673E663B662B2B29653D615B665D2C652E7374617475733D632E4552524F522C746869732E656D697428226572726F72222C652C622C64292C746869732E656D697428';
wwv_flow_api.g_varchar2_table(283) := '22636F6D706C657465222C65293B72657475726E20746869732E6F7074696F6E732E75706C6F61644D756C7469706C65262628746869732E656D697428226572726F726D756C7469706C65222C612C622C64292C746869732E656D69742822636F6D706C';
wwv_flow_api.g_varchar2_table(284) := '6574656D756C7469706C65222C6129292C746869732E6F7074696F6E732E6175746F50726F6365737351756575653F746869732E70726F63657373517565756528293A766F696420307D2C637D2862292C612E76657273696F6E3D22342E302E31222C61';
wwv_flow_api.g_varchar2_table(285) := '2E6F7074696F6E733D7B7D2C612E6F7074696F6E73466F72456C656D656E743D66756E6374696F6E2862297B72657475726E20622E6765744174747269627574652822696422293F612E6F7074696F6E735B6328622E6765744174747269627574652822';
wwv_flow_api.g_varchar2_table(286) := '69642229295D3A766F696420307D2C612E696E7374616E6365733D5B5D2C612E666F72456C656D656E743D66756E6374696F6E2861297B69662822737472696E67223D3D747970656F662061262628613D646F63756D656E742E717565727953656C6563';
wwv_flow_api.g_varchar2_table(287) := '746F72286129292C6E756C6C3D3D286E756C6C213D613F612E64726F707A6F6E653A766F6964203029297468726F77206E6577204572726F7228224E6F2044726F707A6F6E6520666F756E6420666F7220676976656E20656C656D656E742E2054686973';
wwv_flow_api.g_varchar2_table(288) := '2069732070726F6261626C79206265636175736520796F7527726520747279696E6720746F20616363657373206974206265666F72652044726F707A6F6E6520686164207468652074696D6520746F20696E697469616C697A652E205573652074686520';
wwv_flow_api.g_varchar2_table(289) := '60696E697460206F7074696F6E20746F20736574757020616E79206164646974696F6E616C206F6273657276657273206F6E20796F75722044726F707A6F6E652E22293B72657475726E20612E64726F707A6F6E657D2C612E6175746F446973636F7665';
wwv_flow_api.g_varchar2_table(290) := '723D21302C612E646973636F7665723D66756E6374696F6E28297B76617220622C632C642C652C662C673B666F7228646F63756D656E742E717565727953656C6563746F72416C6C3F643D646F63756D656E742E717565727953656C6563746F72416C6C';
wwv_flow_api.g_varchar2_table(291) := '28222E64726F707A6F6E6522293A28643D5B5D2C623D66756E6374696F6E2861297B76617220622C632C652C663B666F7228663D5B5D2C633D302C653D612E6C656E6774683B653E633B632B2B29623D615B635D2C662E70757368282F285E7C20296472';
wwv_flow_api.g_varchar2_table(292) := '6F707A6F6E6528247C20292F2E7465737428622E636C6173734E616D65293F642E707573682862293A766F69642030293B72657475726E20667D2C6228646F63756D656E742E676574456C656D656E747342795461674E616D6528226469762229292C62';
wwv_flow_api.g_varchar2_table(293) := '28646F63756D656E742E676574456C656D656E747342795461674E616D652822666F726D222929292C673D5B5D2C653D302C663D642E6C656E6774683B663E653B652B2B29633D645B655D2C672E7075736828612E6F7074696F6E73466F72456C656D65';
wwv_flow_api.g_varchar2_table(294) := '6E74286329213D3D21313F6E657720612863293A766F69642030293B72657475726E20677D2C612E626C61636B6C697374656442726F77736572733D5B2F6F706572612E2A4D6163696E746F73682E2A76657273696F6E5C2F31322F695D2C612E697342';
wwv_flow_api.g_varchar2_table(295) := '726F77736572537570706F727465643D66756E6374696F6E28297B76617220622C632C642C652C663B696628623D21302C77696E646F772E46696C65262677696E646F772E46696C65526561646572262677696E646F772E46696C654C69737426267769';
wwv_flow_api.g_varchar2_table(296) := '6E646F772E426C6F62262677696E646F772E466F726D446174612626646F63756D656E742E717565727953656C6563746F722969662822636C6173734C69737422696E20646F63756D656E742E637265617465456C656D656E74282261222929666F7228';
wwv_flow_api.g_varchar2_table(297) := '663D612E626C61636B6C697374656442726F77736572732C643D302C653D662E6C656E6774683B653E643B642B2B29633D665B645D2C632E74657374286E6176696761746F722E757365724167656E7429262628623D2131293B656C736520623D21313B';
wwv_flow_api.g_varchar2_table(298) := '656C736520623D21313B72657475726E20627D2C683D66756E6374696F6E28612C62297B76617220632C642C652C663B666F7228663D5B5D2C643D302C653D612E6C656E6774683B653E643B642B2B29633D615B645D2C63213D3D622626662E70757368';
wwv_flow_api.g_varchar2_table(299) := '2863293B72657475726E20667D2C633D66756E6374696F6E2861297B72657475726E20612E7265706C616365282F5B5C2D5F5D285C77292F672C66756E6374696F6E2861297B72657475726E20612E6368617241742831292E746F557070657243617365';
wwv_flow_api.g_varchar2_table(300) := '28297D297D2C612E637265617465456C656D656E743D66756E6374696F6E2861297B76617220623B72657475726E20623D646F63756D656E742E637265617465456C656D656E74282264697622292C622E696E6E657248544D4C3D612C622E6368696C64';
wwv_flow_api.g_varchar2_table(301) := '4E6F6465735B305D7D2C612E656C656D656E74496E736964653D66756E6374696F6E28612C62297B696628613D3D3D622972657475726E21303B666F72283B613D612E706172656E744E6F64653B29696628613D3D3D622972657475726E21303B726574';
wwv_flow_api.g_varchar2_table(302) := '75726E21317D2C612E676574456C656D656E743D66756E6374696F6E28612C62297B76617220633B69662822737472696E67223D3D747970656F6620613F633D646F63756D656E742E717565727953656C6563746F722861293A6E756C6C213D612E6E6F';
wwv_flow_api.g_varchar2_table(303) := '646554797065262628633D61292C6E756C6C3D3D63297468726F77206E6577204572726F722822496E76616C69642060222B622B2260206F7074696F6E2070726F76696465642E20506C656173652070726F766964652061204353532073656C6563746F';
wwv_flow_api.g_varchar2_table(304) := '72206F72206120706C61696E2048544D4C20656C656D656E742E22293B72657475726E20637D2C612E676574456C656D656E74733D66756E6374696F6E28612C62297B76617220632C642C652C662C672C682C692C6A3B6966286120696E7374616E6365';
wwv_flow_api.g_varchar2_table(305) := '6F66204172726179297B653D5B5D3B7472797B666F7228663D302C683D612E6C656E6774683B683E663B662B2B29643D615B665D2C652E7075736828746869732E676574456C656D656E7428642C6229297D6361746368286B297B633D6B2C653D6E756C';
wwv_flow_api.g_varchar2_table(306) := '6C7D7D656C73652069662822737472696E67223D3D747970656F66206129666F7228653D5B5D2C6A3D646F63756D656E742E717565727953656C6563746F72416C6C2861292C673D302C693D6A2E6C656E6774683B693E673B672B2B29643D6A5B675D2C';
wwv_flow_api.g_varchar2_table(307) := '652E707573682864293B656C7365206E756C6C213D612E6E6F646554797065262628653D5B615D293B6966286E756C6C3D3D657C7C21652E6C656E677468297468726F77206E6577204572726F722822496E76616C69642060222B622B2260206F707469';
wwv_flow_api.g_varchar2_table(308) := '6F6E2070726F76696465642E20506C656173652070726F766964652061204353532073656C6563746F722C206120706C61696E2048544D4C20656C656D656E74206F722061206C697374206F662074686F73652E22293B72657475726E20657D2C612E63';
wwv_flow_api.g_varchar2_table(309) := '6F6E6669726D3D66756E6374696F6E28612C622C63297B72657475726E2077696E646F772E636F6E6669726D2861293F6228293A6E756C6C213D633F6328293A766F696420307D2C612E697356616C696446696C653D66756E6374696F6E28612C62297B';
wwv_flow_api.g_varchar2_table(310) := '76617220632C642C652C662C673B69662821622972657475726E21303B666F7228623D622E73706C697428222C22292C643D612E747970652C633D642E7265706C616365282F5C2F2E2A242F2C2222292C663D302C673D622E6C656E6774683B673E663B';
wwv_flow_api.g_varchar2_table(311) := '662B2B29696628653D625B665D2C653D652E7472696D28292C222E223D3D3D652E636861724174283029297B6966282D31213D3D612E6E616D652E746F4C6F7765724361736528292E696E6465784F6628652E746F4C6F7765724361736528292C612E6E';
wwv_flow_api.g_varchar2_table(312) := '616D652E6C656E6774682D652E6C656E677468292972657475726E21307D656C7365206966282F5C2F5C2A242F2E74657374286529297B696628633D3D3D652E7265706C616365282F5C2F2E2A242F2C2222292972657475726E21307D656C7365206966';
wwv_flow_api.g_varchar2_table(313) := '28643D3D3D652972657475726E21303B72657475726E21317D2C22756E646566696E656422213D747970656F66206A517565727926266E756C6C213D3D6A51756572792626286A51756572792E666E2E64726F707A6F6E653D66756E6374696F6E286229';
wwv_flow_api.g_varchar2_table(314) := '7B72657475726E20746869732E656163682866756E6374696F6E28297B72657475726E206E6577206128746869732C62297D297D292C22756E646566696E656422213D747970656F66206D6F64756C6526266E756C6C213D3D6D6F64756C653F6D6F6475';
wwv_flow_api.g_varchar2_table(315) := '6C652E6578706F7274733D613A77696E646F772E44726F707A6F6E653D612C612E41444445443D226164646564222C612E5155455545443D22717565756564222C612E41434345505445443D612E5155455545442C612E55504C4F4144494E473D227570';
wwv_flow_api.g_varchar2_table(316) := '6C6F6164696E67222C612E50524F43455353494E473D612E55504C4F4144494E472C612E43414E43454C45443D2263616E63656C6564222C612E4552524F523D226572726F72222C612E535543434553533D2273756363657373222C653D66756E637469';
wwv_flow_api.g_varchar2_table(317) := '6F6E2861297B76617220622C632C642C652C662C672C682C692C6A2C6B3B666F7228683D612E6E61747572616C57696474682C673D612E6E61747572616C4865696768742C633D646F63756D656E742E637265617465456C656D656E74282263616E7661';
wwv_flow_api.g_varchar2_table(318) := '7322292C632E77696474683D312C632E6865696768743D672C643D632E676574436F6E746578742822326422292C642E64726177496D61676528612C302C30292C653D642E676574496D6167654461746128302C302C312C67292E646174612C6B3D302C';
wwv_flow_api.g_varchar2_table(319) := '663D672C693D673B693E6B3B29623D655B342A28692D31292B335D2C303D3D3D623F663D693A6B3D692C693D662B6B3E3E313B72657475726E206A3D692F672C303D3D3D6A3F313A6A7D2C663D66756E6374696F6E28612C622C632C642C662C672C682C';
wwv_flow_api.g_varchar2_table(320) := '692C6A2C6B297B766172206C3B72657475726E206C3D652862292C612E64726177496D61676528622C632C642C662C672C682C692C6A2C6B2F6C297D2C643D66756E6374696F6E28612C62297B76617220632C642C652C662C672C682C692C6A2C6B3B69';
wwv_flow_api.g_varchar2_table(321) := '6628653D21312C6B3D21302C643D612E646F63756D656E742C6A3D642E646F63756D656E74456C656D656E742C633D642E6164644576656E744C697374656E65723F226164644576656E744C697374656E6572223A226174746163684576656E74222C69';
wwv_flow_api.g_varchar2_table(322) := '3D642E6164644576656E744C697374656E65723F2272656D6F76654576656E744C697374656E6572223A226465746163684576656E74222C683D642E6164644576656E744C697374656E65723F22223A226F6E222C663D66756E6374696F6E2863297B72';
wwv_flow_api.g_varchar2_table(323) := '657475726E22726561647973746174656368616E676522213D3D632E747970657C7C22636F6D706C657465223D3D3D642E726561647953746174653F2828226C6F6164223D3D3D632E747970653F613A64295B695D28682B632E747970652C662C213129';
wwv_flow_api.g_varchar2_table(324) := '2C2165262628653D2130293F622E63616C6C28612C632E747970657C7C63293A766F69642030293A766F696420300A7D2C673D66756E6374696F6E28297B76617220613B7472797B6A2E646F5363726F6C6C28226C65667422297D63617463682862297B';
wwv_flow_api.g_varchar2_table(325) := '72657475726E20613D622C766F69642073657454696D656F757428672C3530297D72657475726E20662822706F6C6C22297D2C22636F6D706C65746522213D3D642E72656164795374617465297B696628642E6372656174654576656E744F626A656374';
wwv_flow_api.g_varchar2_table(326) := '26266A2E646F5363726F6C6C297B7472797B6B3D21612E6672616D65456C656D656E747D6361746368286C297B7D6B26266728297D72657475726E20645B635D28682B22444F4D436F6E74656E744C6F61646564222C662C2131292C645B635D28682B22';
wwv_flow_api.g_varchar2_table(327) := '726561647973746174656368616E6765222C662C2131292C615B635D28682B226C6F6164222C662C2131297D7D2C612E5F6175746F446973636F76657246756E6374696F6E3D66756E6374696F6E28297B72657475726E20612E6175746F446973636F76';
wwv_flow_api.g_varchar2_table(328) := '65723F612E646973636F76657228293A766F696420307D2C642877696E646F772C612E5F6175746F446973636F76657246756E6374696F6E297D292E63616C6C2874686973293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(12946780849048588820)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_file_name=>'dropzone.min.js'
,p_mime_type=>'text/javascript'
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
 p_id=>wwv_flow_api.id(12946781276408589656)
,p_plugin_id=>wwv_flow_api.id(12946692333396534467)
,p_file_name=>'dropzone.min.css'
,p_mime_type=>'text/css'
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

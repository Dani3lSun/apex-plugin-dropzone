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
,p_default_workspace_id=>96713923238010156
,p_default_application_id=>81505
,p_default_owner=>'DHTEST'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 81505 - Dropzone Demo
--
-- Application Export:
--   Application:     81505
--   Name:            Dropzone Demo
--   Date and Time:   22:43 Wednesday December 23, 2015
--   Exported By:     DANIEL.HOCHLEITNER@MBSUPPORT.DE
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.03
--   Instance ID:     63113759365424
--

-- Application Statistics:
--   Pages:                      2
--     Items:                    4
--     Processes:                4
--     Regions:                  5
--     Buttons:                  2
--     Dynamic Actions:          2
--   Shared Components:
--     Logic:
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              13
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       Plug-ins:               1
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,81505)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DHTEST')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Dropzone Demo')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_81505')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'1DA0BED9E903FFBA9692AFDFE300C3A16C5ADF2B38C6C9E811CC8A8BD7527F8D'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'0'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(21565600742253832338)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Dropzone Demo'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_last_updated_by=>'DANIEL.HOCHLEITNER@MBSUPPORT.DE'
,p_last_upd_yyyymmddhh24miss=>'20151223224319'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(21565558199974832290)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(21565650863369871787)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dropzone'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-upload'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(21565600436627832336)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(21565600672992832337)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_for_pages=>'&LOGOUT_URL.'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21565557880489832290)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21565557978326832290)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21565558002753832290)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(21565601878442832341)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(21565676197575049709)
,p_short_name=>'Dropzone'
,p_link=>'f?p=&APP_ID.:1:&SESSION.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565558205585832290)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558338699832291)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558406919832291)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558527151832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558668816832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558797127832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558824592832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565558936516832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559031524832292)
,p_page_template_id=>wwv_flow_api.id(21565558205585832290)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565559106837832292)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559208808832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559319757832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559445862832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559568471832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559687957832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559706297832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559839766832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565559980196832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560009958832292)
,p_page_template_id=>wwv_flow_api.id(21565559106837832292)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565560179549832293)
,p_theme_id=>42
,p_name=>'Login'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="html-login no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="html-login no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="html-login no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560279406832293)
,p_page_template_id=>wwv_flow_api.id(21565560179549832293)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560337309832293)
,p_page_template_id=>wwv_flow_api.id(21565560179549832293)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565560475328832293)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560528389832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560651519832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560762272832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560833091832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565560942187832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561092038832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561132958832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561243784832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561397084832293)
,p_page_template_id=>wwv_flow_api.id(21565560475328832293)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565561481185832293)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561579634832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561698923832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561743223832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561832508832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565561962952832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562053247832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562197385832294)
,p_page_template_id=>wwv_flow_api.id(21565561481185832293)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565562245056832294)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-wrapper">',
'    <div class="t-Dialog-header">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--standard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562305451832294)
,p_page_template_id=>wwv_flow_api.id(21565562245056832294)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562476409832294)
,p_page_template_id=>wwv_flow_api.id(21565562245056832294)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562578065832294)
,p_page_template_id=>wwv_flow_api.id(21565562245056832294)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565562642773832294)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562783829832294)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562839061832294)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565562973291832294)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563060352832294)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563122183832295)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563269026832295)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563368881832295)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563460560832295)
,p_page_template_id=>wwv_flow_api.id(21565562642773832294)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565563536004832295)
,p_theme_id=>42
,p_name=>'Standard'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563648765832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563725561832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563826926832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565563923211832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564099209832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564118890832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564279605832295)
,p_page_template_id=>wwv_flow_api.id(21565563536004832295)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(21565564379292832295)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Wizard t-Wizard--modal">',
'    <div class=" t-Wizard-steps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Wizard-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Wizard-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564485279832295)
,p_page_template_id=>wwv_flow_api.id(21565564379292832295)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564581873832295)
,p_page_template_id=>wwv_flow_api.id(21565564379292832295)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564661753832295)
,p_page_template_id=>wwv_flow_api.id(21565564379292832295)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(21565595276350832322)
,p_template_name=>'Icon'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(21565595336186832323)
,p_template_name=>'Text'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(21565595427816832323)
,p_template_name=>'Text with Icon'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565564775164832295)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565564836638832296)
,p_plug_template_id=>wwv_flow_api.id(21565564775164832295)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565566272950832298)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565566375698832298)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565566456488832298)
,p_plug_template_id=>wwv_flow_api.id(21565566375698832298)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565566593149832299)
,p_plug_template_id=>wwv_flow_api.id(21565566375698832298)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565567238405832299)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565567370409832299)
,p_plug_template_id=>wwv_flow_api.id(21565567238405832299)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565567439914832299)
,p_plug_template_id=>wwv_flow_api.id(21565567238405832299)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565570681525832301)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565570735612832301)
,p_plug_template_id=>wwv_flow_api.id(21565570681525832301)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565570824191832301)
,p_plug_template_id=>wwv_flow_api.id(21565570681525832301)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565572737381832303)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">#TITLE#</h2>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565572881620832303)
,p_plug_template_id=>wwv_flow_api.id(21565572737381832303)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565572965749832303)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-body js-regionDialog-body">',
'#BODY#',
'  </div>',
'  <div class="t-DialogRegion-buttons js-regionDialog-buttons">',
'     <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'       <div class="t-ButtonRegion-wrap">',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565573046422832303)
,p_plug_template_id=>wwv_flow_api.id(21565572965749832303)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565573816639832303)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565574140908832303)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565574263276832304)
,p_plug_template_id=>wwv_flow_api.id(21565574140908832303)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565574309819832304)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565574472909832304)
,p_plug_template_id=>wwv_flow_api.id(21565574309819832304)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565574588813832304)
,p_plug_template_id=>wwv_flow_api.id(21565574309819832304)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565576439739832306)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565576572303832306)
,p_plug_template_id=>wwv_flow_api.id(21565576439739832306)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565576619415832306)
,p_plug_template_id=>wwv_flow_api.id(21565576439739832306)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565577604578832307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(21565578125748832308)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(21565578245795832308)
,p_plug_template_id=>wwv_flow_api.id(21565578125748832308)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565586565774832314)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_theme_id=>42
,p_theme_class_id=>3
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_list_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565588237465832316)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2885322685880632508
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565590364357832318)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565591135860832319)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2066548068783481421
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565592010947832319)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565592560135832320)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565592619859832320)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565592759024832320)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565592827511832320)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565593733818832321)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(21565594289692832321)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565578772166832308)
,p_row_template_name=>'Alerts'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565578848943832309)
,p_row_template_name=>'Badge List'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565580552192832310)
,p_row_template_name=>'Cards'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565582673852832311)
,p_row_template_name=>'Comments'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon a-MediaBlock-graphic">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body a-MediaBlock-content">',
'        <div class="t-Comments-info">',
'            #USER_NAME# &middot; <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565583053994832312)
,p_row_template_name=>'Search Results'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565583111452832312)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(21565583111452832312)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565584492229832313)
,p_row_template_name=>'Timeline'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565584635049832313)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(21565585619610832313)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(21565594732377832322)
,p_template_name=>'Hidden'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(21565594807427832322)
,p_template_name=>'Optional'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(21565594905674832322)
,p_template_name=>'Optional - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(21565595060237832322)
,p_template_name=>'Required'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(21565595190570832322)
,p_template_name=>'Required - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(21565595818095832323)
,p_name=>'Breadcrumb'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(21565596049966832324)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="t-Form-field t-Form-searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(21565595983737832324)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="uDay today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="uDay" headers="#DY#">'
,p_cust_weekend_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_wk_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_close_format=>'</div></td>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(21565596471346832326)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(21565563536004832295)
,p_default_dialog_template=>wwv_flow_api.id(21565562245056832294)
,p_error_template=>wwv_flow_api.id(21565560179549832293)
,p_printer_friendly_template=>wwv_flow_api.id(21565563536004832295)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(21565560179549832293)
,p_default_button_template=>wwv_flow_api.id(21565595336186832323)
,p_default_region_template=>wwv_flow_api.id(21565574309819832304)
,p_default_chart_template=>wwv_flow_api.id(21565574309819832304)
,p_default_form_template=>wwv_flow_api.id(21565574309819832304)
,p_default_reportr_template=>wwv_flow_api.id(21565574309819832304)
,p_default_tabform_template=>wwv_flow_api.id(21565574309819832304)
,p_default_wizard_template=>wwv_flow_api.id(21565574309819832304)
,p_default_menur_template=>wwv_flow_api.id(21565577604578832307)
,p_default_listr_template=>wwv_flow_api.id(21565574309819832304)
,p_default_irr_template=>wwv_flow_api.id(21565573816639832303)
,p_default_report_template=>wwv_flow_api.id(21565583111452832312)
,p_default_label_template=>wwv_flow_api.id(21565594807427832322)
,p_default_menu_template=>wwv_flow_api.id(21565595818095832323)
,p_default_calendar_template=>wwv_flow_api.id(21565595983737832324)
,p_default_list_template=>wwv_flow_api.id(21565590364357832318)
,p_default_nav_list_template=>wwv_flow_api.id(21565593733818832321)
,p_default_top_nav_list_temp=>wwv_flow_api.id(21565593733818832321)
,p_default_side_nav_list_temp=>wwv_flow_api.id(21565592759024832320)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(21565566375698832298)
,p_default_dialogr_template=>wwv_flow_api.id(21565566272950832298)
,p_default_option_label=>wwv_flow_api.id(21565594807427832322)
,p_default_required_label=>wwv_flow_api.id(21565595060237832322)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(21565592619859832320)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>62
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/hammer/2.0.3/hammer#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(21565596151792832325)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(21565596284062832325)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(21565596329253832325)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565565055997832297)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565565277600832297)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565565478199832297)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565566691739832299)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565566808226832299)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565567500209832299)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565567924759832299)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565568519630832300)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565569193817832300)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565569314782832300)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565570218315832301)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565571809940832302)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565573243116832303)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565576787555832306)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565576969063832307)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565577343315832307)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565577755487832308)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565578304438832308)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565578913642832309)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565579108221832309)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565580737208832310)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the amount of text to display for the Card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565581470079832311)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the style and design of the cards in the report.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565581779814832311)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565582456050832311)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565582779720832312)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565583203084832312)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565583592086832312)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565583708477832312)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565584703213832313)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565586661376832315)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565587450268832315)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565588457048832316)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565589164370832316)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565589492602832317)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565590117108832317)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565590823387832318)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565593259598832321)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565594394746832321)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565595592373832323)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565596522030832334)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565596729192832334)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565596938982832334)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565597145324832335)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565597580965832335)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565597703855832335)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565597942402832335)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565598173260832335)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565598363946832335)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565598563248832335)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565599069465832336)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565599631978832336)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(21565599806218832336)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565564965684832296)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565199961832297)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(21565565055997832297)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565356907832297)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(21565565277600832297)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565580637832297)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(21565565478199832297)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565685775832297)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(21565565055997832297)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565768968832297)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(21565565277600832297)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565896917832298)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(21565565055997832297)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565565930320832298)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(21565565277600832297)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565566045552832298)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(21565565055997832297)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565566169884832298)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565564775164832295)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(21565565478199832297)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565566750444832299)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(21565566375698832298)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565566964773832299)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(21565566375698832298)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(21565566808226832299)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565567046186832299)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(21565566375698832298)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565567176833832299)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(21565566375698832298)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(21565566808226832299)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565567675653832299)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(21565567500209832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565567744086832299)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(21565567500209832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565567856104832299)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(21565567500209832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568062853832300)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568152873832300)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568274581832300)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568399099832300)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(21565567500209832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568425489832300)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568691413832300)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568754886832300)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568832007832300)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565568955463832300)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569030915832300)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569211643832300)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(21565569193817832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569473208832300)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569523529832300)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(21565569193817832300)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569604195832301)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569707949832301)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569889824832301)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565569916328832301)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570006399832301)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570159423832301)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570384613832301)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(21565570218315832301)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570499116832301)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(21565570218315832301)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570515278832301)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565567238405832299)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565570928978832301)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571051200832301)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571103029832301)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571266010832302)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571392978832302)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571425792832302)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571562856832302)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571639935832302)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571747508832302)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565571988258832302)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(21565571809940832302)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572028777832302)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(21565571809940832302)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572162162832302)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572240520832302)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572381184832302)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572435369832302)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572525444832302)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565572610381832303)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565570681525832301)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573154161832303)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573379013832303)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(21565573243116832303)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573426024832303)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(21565573243116832303)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573538473832303)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573694873832303)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573758213832303)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565572965749832303)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(21565573243116832303)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565573913144832303)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565573816639832303)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565574094257832303)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565573816639832303)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565574689323832304)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565574789514832304)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565574863265832304)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565574981798832305)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(21565567924759832299)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575085992832305)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575188145832305)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575204106832305)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575304516832305)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575444282832305)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(21565568519630832300)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575542259832305)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(21565569193817832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575633580832305)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575767445832305)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(21565569193817832300)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575868598832305)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565575925554832305)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565576059825832305)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565576125803832306)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(21565569314782832300)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565576255862832306)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565576340104832306)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565574309819832304)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(21565566691739832299)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565576891288832306)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(21565576787555832306)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577063886832307)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(21565576969063832307)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577114961832307)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577230077832307)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(21565576969063832307)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577473537832307)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(21565577343315832307)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577550879832307)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565576439739832306)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(21565577343315832307)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577871207832308)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(21565577604578832307)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(21565577755487832308)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565577982147832308)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(21565577604578832307)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565578066680832308)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(21565577604578832307)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(21565577755487832308)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565578406906832308)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(21565578125748832308)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(21565578304438832308)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565578547463832308)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565578125748832308)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(21565578304438832308)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565578681221832308)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(21565578125748832308)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579098462832309)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(21565578913642832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579217694832309)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579383133832309)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(21565578913642832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579478237832309)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579554573832309)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(21565578913642832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579674051832309)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579717806832309)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579855652832310)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(21565578913642832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565579974501832310)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(21565578913642832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580038088832310)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580120914832310)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580264189832310)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580340450832310)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580482004832310)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565578848943832309)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580661232832310)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580853757832310)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(21565580737208832310)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565580925817832310)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581036776832310)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(21565580737208832310)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581165221832310)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581238045832310)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(21565580737208832310)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581348237832311)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581567086832311)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(21565581470079832311)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581612096832311)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(21565581470079832311)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581865649832311)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(21565581779814832311)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565581907263832311)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(21565581779814832311)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582046719832311)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(21565581470079832311)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582118143832311)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582232110832311)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(21565580737208832310)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582339564832311)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582590620832311)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565580552192832310)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(21565582456050832311)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582815642832312)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565582673852832311)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(21565582779720832312)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565582936317832312)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565582673852832311)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(21565582779720832312)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565583386822832312)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(21565583203084832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565583474547832312)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(21565583203084832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565583676001832312)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(21565583592086832312)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565583810684832312)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(21565583708477832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565583960339832312)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(21565583708477832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584030458832312)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(21565583708477832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584173164832312)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(21565583592086832312)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584215800832313)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584382453832313)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565583111452832312)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(21565583708477832312)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584547927832313)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(21565584492229832313)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(21565581470079832311)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584842917832313)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565584956272832313)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585007210832313)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585194481832313)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585265080832313)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585394911832313)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585468092832313)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585581358832313)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(21565584635049832313)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585772152832314)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585811606832314)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565585967987832314)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586033158832314)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586117080832314)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(21565579108221832309)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586246907832314)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586395637832314)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586456704832314)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(21565585619610832313)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(21565584703213832313)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586763410832315)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586808515832315)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565586995875832315)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587052254832315)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587162020832315)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587263811832315)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587366927832315)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587512391832315)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(21565587450268832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587664775832315)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(21565587450268832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587797243832315)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587868623832316)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(21565587450268832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565587908098832316)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588079025832316)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(21565587450268832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588127839832316)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(21565586565774832314)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(21565587450268832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588379776832316)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588589479832316)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(21565588457048832316)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588604025832316)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588798087832316)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(21565588457048832316)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588820213832316)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565588937787832316)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(21565588457048832316)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589093750832316)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589266517832316)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589323932832317)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589587526832317)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(21565589492602832317)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589626870832317)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(21565589492602832317)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589728036832317)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589824402832317)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565589947970832317)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(21565588457048832316)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590057039832317)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590237654832318)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565588237465832316)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(21565590117108832317)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590401969832318)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590509884832318)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590662609832318)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590790220832318)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565590994961832318)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(21565590823387832318)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591063862832318)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565590364357832318)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(21565590823387832318)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591283370832319)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591338379832319)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591439169832319)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591577462832319)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591638052832319)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591754517832319)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591811330832319)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565591934162832319)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(21565591135860832319)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565592161495832320)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(21565592010947832319)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565592292708832320)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565592010947832319)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565592393494832320)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565592010947832319)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565592485188832320)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565592010947832319)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565592927828832320)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(21565589492602832317)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593051241832320)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(21565586661376832315)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593177262832321)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(21565589492602832317)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593340470832321)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(21565593259598832321)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593405176832321)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593542005832321)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(21565589164370832316)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593615631832321)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(21565592827511832320)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(21565593259598832321)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593884954832321)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(21565593733818832321)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565593999650832321)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(21565593733818832321)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565594095367832321)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(21565593733818832321)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565594180002832321)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(21565593733818832321)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565594491861832321)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(21565594289692832321)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(21565594394746832321)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565594536898832321)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(21565594289692832321)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(21565594394746832321)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565594618536832322)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(21565594289692832321)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(21565594394746832321)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565595628763832323)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(21565595427816832323)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(21565595592373832323)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565595793610832323)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(21565595427816832323)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(21565595592373832323)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565596671338832334)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(21565596522030832334)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565596868912832334)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(21565596729192832334)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597084818832334)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(21565596938982832334)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597280928832335)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(21565597145324832335)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597356293832335)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(21565597145324832335)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597404564832335)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(21565596938982832334)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597654344832335)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(21565597580965832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565597816902832335)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(21565597703855832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598087127832335)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(21565597942402832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598275434832335)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(21565598173260832335)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598457803832335)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(21565598363946832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598695153832335)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(21565598563248832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598784267832335)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(21565598563248832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598898375832335)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(21565598563248832335)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565598903713832335)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(21565596522030832334)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599122470832336)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(21565599069465832336)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599269326832336)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(21565598363946832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599338855832336)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(21565597580965832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599468455832336)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(21565597703855832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599506365832336)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(21565597942402832335)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599776782832336)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(21565599631978832336)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565599924932832336)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(21565599806218832336)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565600064794832336)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565600136388832336)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(21565596522030832334)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565600290069832336)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(21565596522030832334)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(21565600393531832336)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(21565598173260832335)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
null;
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(21565600742253832338)
,p_name=>'APEX'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
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
 p_id=>wwv_flow_api.id(34512300410798539001)
,p_plugin_type=>'REGION TYPE'
,p_name=>'DE.DANIELH.DROPZONE'
,p_display_name=>'Dropzone'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','DE.DANIELH.DROPZONE'),'')
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
 p_id=>wwv_flow_api.id(34512386520468562359)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512387991429577388)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512386778687566030)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512387045225569241)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512388256265584938)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512565030512547605)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512565628849548382)
,p_plugin_attribute_id=>wwv_flow_api.id(34512565030512547605)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(34512566108373548819)
,p_plugin_attribute_id=>wwv_flow_api.id(34512565030512547605)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(34512388593074589914)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Name Upload Process'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'UPLOAD_DROPZONE_FILES'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(34512565030512547605)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
,p_help_text=>'Name of the Upload Application Process'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(34512571044054580181)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Page Items in Session State'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(34512565030512547605)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
,p_help_text=>'Page Items that should be set into session state. The filename item is already in session state!'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(34512574538560670009)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512575205165670469)
,p_plugin_attribute_id=>wwv_flow_api.id(34512574538560670009)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(34512575553733670904)
,p_plugin_attribute_id=>wwv_flow_api.id(34512574538560670009)
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
 p_id=>wwv_flow_api.id(34512388926450593354)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
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
 p_id=>wwv_flow_api.id(34512389353810594190)
,p_plugin_id=>wwv_flow_api.id(34512300410798539001)
,p_file_name=>'dropzone.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(21565600534107832337)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_navigation_list_id=>wwv_flow_api.id(21565558199974832290)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(21565592759024832320)
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(21565600436627832336)
,p_nav_bar_list_template_id=>wwv_flow_api.id(21565592619859832320)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(21565600534107832337)
,p_name=>'Dropzone'
,p_page_mode=>'NORMAL'
,p_step_title=>'Dropzone'
,p_step_sub_title=>'Dropzone'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DANIEL.HOCHLEITNER@MBSUPPORT.DE'
,p_last_upd_yyyymmddhh24miss=>'20151223224203'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21565672922225049704)
,p_plug_name=>'(items)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(21565566272950832298)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(21565674079183049706)
,p_name=>'APEX_APPLICATION_TEMP_FILES '
,p_template=>wwv_flow_api.id(21565574309819832304)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select filename',
'from apex_application_temp_files'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(21565583111452832312)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(21565674444664049706)
,p_query_column_id=>1
,p_column_alias=>'FILENAME'
,p_column_display_sequence=>1
,p_column_heading=>'Filename'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21565675281790049707)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(21565577604578832307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(21565601878442832341)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(21565595818095832323)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21565675687620049708)
,p_plug_name=>'Dropzone (beta)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(21565574309819832304)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_DE.DANIELH.DROPZONE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P1_FILE_BROWSE'
,p_attribute_02=>'P1_FILE_NAMES'
,p_attribute_03=>'700px'
,p_attribute_04=>'400px'
,p_attribute_05=>'Drop files here or click to upload.'
,p_attribute_06=>'0'
,p_attribute_09=>'0'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21565674836930049707)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21565674079183049706)
,p_button_name=>'REFRESH_TEMP_FILES'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(21565595427816832323)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh Temp Files'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21565673229577049704)
,p_name=>'P1_FILE_BROWSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21565672922225049704)
,p_prompt=>'File browse'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(21565594807427832322)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21565673654805049705)
,p_name=>'P1_FILE_NAMES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21565672922225049704)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21565676378804049709)
,p_name=>'HIDE_ITEM_REGION'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21565676865899049710)
,p_event_id=>wwv_flow_api.id(21565676378804049709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21565672922225049704)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21565848797415902601)
,p_name=>'REFRESH_REGION_TEMP_FILES'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21565674836930049707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21565848854902902602)
,p_event_id=>wwv_flow_api.id(21565848797415902601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21565674079183049706)
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(21565600534107832337)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Dropzone Demo - Log In'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(21565560179549832293)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20151223222957'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21565601085457832339)
,p_plug_name=>'Log In'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(21565574309819832304)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21565601308850832341)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(21565601085457832339)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(21565595336186832323)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21565601166073832340)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21565601085457832339)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(21565594807427832322)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21565601273449832340)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21565601085457832339)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(21565594807427832322)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21565601520204832341)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21565601405319832341)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21565601770227832341)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21565601628858832341)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

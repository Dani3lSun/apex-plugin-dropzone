/*-------------------------------------
 * Dropzone Apex Plugin
 * Version: 1.0 (14.09.2015)
 * Author:  Daniel Hochleitner
 *-------------------------------------
*/
FUNCTION render_dropzone(p_region              IN apex_plugin.t_region,
                         p_plugin              IN apex_plugin.t_plugin,
                         p_is_printer_friendly IN BOOLEAN)
  RETURN apex_plugin.t_region_render_result IS
  -- plugin attributes
  l_file_item                VARCHAR2(100) := p_region.attribute_01;
  l_filename_item            VARCHAR2(100) := p_region.attribute_02;
  l_width                    VARCHAR2(50) := p_region.attribute_03;
  l_height                   VARCHAR2(50) := p_region.attribute_04;
  l_display_message          VARCHAR2(500) := p_region.attribute_05;
  l_upload_process_enable    NUMBER := p_region.attribute_06;
  l_upload_process           VARCHAR2(100) := p_region.attribute_07;
  l_page_items_session_state VARCHAR2(1000) := p_region.attribute_08;
  l_handle_ssp_items         NUMBER := p_region.attribute_09;
  -- other variables
  l_region_id           VARCHAR2(100);
  l_dropzone_string     CLOB;
  l_item_string         CLOB;
  l_width_esc           VARCHAR2(50);
  l_height_esc          VARCHAR2(50);
  l_display_message_esc VARCHAR2(500);
  l_upload_process_esc  VARCHAR2(100);
  l_page_items_string   VARCHAR2(1000);
  l_page_items_arr2     apex_application_global.vc_arr2;
  l_count               NUMBER := 0;
  --
  -- cursor for session items on current page and page 0
  CURSOR l_cur_items IS
    SELECT api.item_name,
           api.item_id,
           v(api.item_name) item_value
      FROM apex_application_page_items api
     WHERE api.application_id = v('APP_ID')
       AND api.page_id IN (0,
                           v('APP_PAGE_ID'))
       AND api.item_protection_level != 'Unrestricted'
       AND v(api.item_name) IS NOT NULL
     ORDER BY api.display_sequence;
  --
BEGIN
  -- set variables
  l_region_id := apex_escape.html_attribute(p_region.static_id ||
                                            '_dropzone');
  -- escape input
  l_width_esc           := sys.htf.escape_sc(l_width);
  l_height_esc          := sys.htf.escape_sc(l_height);
  l_display_message_esc := sys.htf.escape_sc(l_display_message);
  l_upload_process_esc  := sys.htf.escape_sc(l_upload_process);
  --
  -- add div for dropzone
  sys.htp.p('<div id="' || l_region_id ||
            '" class="dropzone dz-clickable" style="border:5px solid grey;width:' ||
            l_width_esc || ';height:' || l_height_esc ||
            ';overflow:auto;">
<div class="dz-message" data-dz-message><span>' ||
            l_display_message_esc || '</span></div></div>');
  --
  -- add dropzone js
  apex_javascript.add_library(p_name           => 'dropzone.min',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  --
  -- add dropzone css
  apex_css.add_file(p_name      => 'dropzone.min',
                    p_directory => p_plugin.file_prefix);
  --
  -- Build Dropzone JS Function String
  -- Filename function
  l_dropzone_string := 'function getFilenames() {' || chr(10);
  l_dropzone_string := l_dropzone_string || ' names_string="";' || chr(10);
  l_dropzone_string := l_dropzone_string || ' $(''#' || l_region_id ||
                       ' div'').find(''div.dz-filename'').each(function(){' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string || '   if (names_string) {' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    names_string = names_string + '':'' + $(this).text();' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string || '   }' || chr(10);
  l_dropzone_string := l_dropzone_string || '   else {' || chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    names_string = $(this).text();' || chr(10);
  l_dropzone_string := l_dropzone_string || '   }' || chr(10);
  l_dropzone_string := l_dropzone_string || ' });' || chr(10);
  l_dropzone_string := l_dropzone_string || 'apex.item("' ||
                       l_filename_item || '").setValue(names_string);' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string || '}' || chr(10) || chr(10);
  --
  -- js vars for filebrowse item
  -- name attr
  l_dropzone_string := l_dropzone_string || 'var vAttName = $(''#' ||
                       l_file_item || ''').attr(''name'');' || chr(10);
  -- item id
  l_dropzone_string := l_dropzone_string || 'var vAttNameID = $(''#' ||
                       l_file_item ||
                       ''').prev(''input[type="hidden"][name="p_arg_names"]'').val();' ||
                       chr(10);
  -- only when handle ssp is on
  IF l_handle_ssp_items = 1 THEN
    --
    -- js vars for session items
    FOR l_rec IN l_cur_items LOOP
      l_count := l_count + 1;
      -- name attr
      l_item_string := l_item_string || 'var vAttName' || l_count ||
                       ' = $(''#' || l_rec.item_name ||
                       ''').attr(''name'');' || chr(10);
      -- ids
      l_item_string := l_item_string || 'var vAttNameID' || l_count ||
                       ' = $(''#' || l_rec.item_name ||
                       ''').prev(''input[type="hidden"][name="p_arg_names"]'').val();' ||
                       chr(10);
      -- p_arg_checksums
      l_item_string := l_item_string || 'var vAttChecksum' || l_count ||
                       ' = $(''#' || l_rec.item_name ||
                       ''').next(''input[type="hidden"][name="p_arg_checksums"]'').val();' ||
                       chr(10);
    END LOOP;
    -- build complete string
    l_dropzone_string := l_dropzone_string || l_item_string || chr(10);
  END IF;
  --
  -- dropzone config
  l_dropzone_string := l_dropzone_string ||
                       'myDropzone = new Dropzone(''div#' || l_region_id ||
                       ''',' || chr(10);
  l_dropzone_string := l_dropzone_string || '  {' || chr(10);
  l_dropzone_string := l_dropzone_string || '   "url": "wwv_flow.accept",' ||
                       chr(10);
  -- required params for wwv_flow.accept
  l_dropzone_string := l_dropzone_string || '   "params": {' || chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    "p_instance":$v(''pInstance''),' || chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    "p_flow_id":$v(''pFlowId''),' || chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    "p_flow_step_id":$v(''pFlowStepId''),' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    "p_page_checksum":$v(''pPageChecksum''),' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       '    "p_page_submission_id":$v(''pPageSubmissionId'')' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string || '  }' || chr(10);
  l_dropzone_string := l_dropzone_string || '});' || chr(10);
  -- dropzone options
  l_dropzone_string := l_dropzone_string ||
                       ' myDropzone.options.paramName = vAttName;' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       ' myDropzone.options.addRemoveLinks = false;' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       ' Dropzone.autoDiscover = false;' || chr(10) ||
                       chr(10);
  -- sending function
  l_dropzone_string := l_dropzone_string ||
                       'myDropzone.on(''sending'',function(file, xhr, formData) {' ||
                       chr(10);
  l_dropzone_string := l_dropzone_string ||
                       ' formData.append("p_arg_names",vAttNameID);' ||
                       chr(10);
  -- loop over items again (append name/id,p_arg_names,p_arg_values,p_arg_checksums)
  l_item_string := NULL;
  l_count       := 0;
  -- only when handle ssp is on
  IF l_handle_ssp_items = 1 THEN
    FOR l_rec IN l_cur_items LOOP
      l_count := l_count + 1;
      -- only when not undefined
      -- name/id
      l_item_string := l_item_string || ' if (typeof vAttName' || l_count ||
                       ' !== ''undefined'') { formData.append(vAttName' ||
                       l_count || ',vAttNameID' || l_count || '); }' ||
                       chr(10);
      -- p_arg_names
      l_item_string := l_item_string || ' if (typeof vAttNameID' || l_count ||
                       ' !== ''undefined'') { formData.append("p_arg_names",vAttNameID' ||
                       l_count || '); }' || chr(10);
      -- p_arg_values
      l_item_string := l_item_string ||
                       ' formData.append("p_arg_values",''' ||
                       l_rec.item_value || ''');' || chr(10);
      -- only when not undefined
      -- p_arg_checksums
      l_item_string := l_item_string || ' if (typeof vAttChecksum' ||
                       l_count ||
                       ' !== ''undefined'') { formData.append("p_arg_checksums",vAttChecksum' ||
                       l_count || '); }' || chr(10);
    END LOOP;
    -- build complete string
    l_dropzone_string := l_dropzone_string || l_item_string || chr(10);
  END IF;
  --
  l_dropzone_string := l_dropzone_string || '});' || chr(10) || chr(10);
  --
  -- success function with call to application process
  -- only when application process is enabled
  IF l_upload_process_enable = 1 THEN
    -- get page items from input and convert to array and build string
    l_page_items_arr2 := apex_util.string_to_table(l_page_items_session_state,
                                                   ',');
    FOR i IN 1 .. l_page_items_arr2.count LOOP
      l_page_items_string := l_page_items_string || ',#' ||
                             l_page_items_arr2(i);
    END LOOP;
    -- remove comma leading/trailing
    l_page_items_string := rtrim(ltrim(l_page_items_string,
                                       ','),
                                 ',');
    -- build success function with call to application process
    l_dropzone_string := l_dropzone_string ||
                         'myDropzone.on(''success'',function(a,response) {' ||
                         chr(10);
    l_dropzone_string := l_dropzone_string || ' getFilenames();' || chr(10);
    l_dropzone_string := l_dropzone_string ||
                         ' var fileNames = apex.item("' || l_filename_item ||
                         '").getValue();' || chr(10);
    l_dropzone_string := l_dropzone_string || ' apex.server.process("' ||
                         upper(l_upload_process_esc) || '", {' || chr(10);
    l_dropzone_string := l_dropzone_string || '  x01: fileNames,' ||
                         chr(10);
    l_dropzone_string := l_dropzone_string || '  pageItems: "#' ||
                         l_filename_item || ',' || l_page_items_string || '"' ||
                         chr(10);
    l_dropzone_string := l_dropzone_string || ' });' || chr(10);
    l_dropzone_string := l_dropzone_string || '});' || chr(10);
  END IF;
  --
  -- write inline dropzone js string
  apex_javascript.add_inline_code(p_code => l_dropzone_string);
  --
  RETURN NULL;
  --
END render_dropzone;
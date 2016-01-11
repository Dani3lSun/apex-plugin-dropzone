/*-------------------------------------
 * Dropzone Apex Plugin
 * Version: 1.8 (12.01.2015)
 * Author:  Daniel Hochleitner
 *-------------------------------------
*/
FUNCTION render_dropzone(p_region              IN apex_plugin.t_region,
                         p_plugin              IN apex_plugin.t_plugin,
                         p_is_printer_friendly IN BOOLEAN)
  RETURN apex_plugin.t_region_render_result IS
  -- plugin attributes
  l_width                 VARCHAR2(50) := p_region.attribute_01;
  l_height                VARCHAR2(50) := p_region.attribute_02;
  l_display_message       VARCHAR2(500) := p_region.attribute_03;
  l_max_filesize_mb       NUMBER := p_region.attribute_04;
  l_dz_clickable          VARCHAR2(50) := p_region.attribute_05;
  l_items_submit          VARCHAR(1000) := p_region.attribute_06;
  l_plsql                 p_region.attribute_07%TYPE := p_region.attribute_07;
  l_logging               VARCHAR(50) := p_region.attribute_08;
  l_remove_uploaded_files VARCHAR(50) := p_region.attribute_09;
  l_accepted_files        VARCHAR(1000) := p_region.attribute_10;
  l_filetoobig_message    VARCHAR(500) := p_region.attribute_11;
  l_maxfiles_message      VARCHAR(500) := p_region.attribute_12;
  l_max_files             NUMBER := p_region.attribute_13;
  l_refresh_regionid      VARCHAR(100) := p_region.attribute_14;
  l_copy_paste_support    VARCHAR(50) := p_region.attribute_15;
  l_wait_time_ms          NUMBER := p_region.attribute_16;
  l_parallel_uploads      NUMBER := p_region.attribute_17;
  l_common_file_preview   VARCHAR(50) := p_region.attribute_18;
  l_dz_style              VARCHAR2(100) := p_region.attribute_19;
  -- other variables
  l_region_id              VARCHAR2(200);
  l_width_esc              VARCHAR2(50);
  l_height_esc             VARCHAR2(50);
  l_display_message_esc    VARCHAR2(500);
  l_filetoobig_message_esc VARCHAR2(500);
  l_maxfiles_message_esc   VARCHAR2(500);
  l_refresh_regionid_esc   VARCHAR(100);
  --
BEGIN
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_region(p_plugin => p_plugin,
                                  p_region => p_region);
  END IF;
  -- set variables and defaults
  l_region_id             := apex_escape.html_attribute(p_region.static_id ||
                                                        '_dropzone');
  l_dz_style              := nvl(l_dz_style,
                                 'STYLE1');
  l_max_filesize_mb       := nvl(l_max_filesize_mb,
                                 2);
  l_dz_clickable          := nvl(l_dz_clickable,
                                 'true');
  l_remove_uploaded_files := nvl(l_remove_uploaded_files,
                                 'false');
  l_max_files             := nvl(l_max_files,
                                 256);
  l_copy_paste_support    := nvl(l_copy_paste_support,
                                 'false');
  l_wait_time_ms          := nvl(l_wait_time_ms,
                                 600);
  l_parallel_uploads      := nvl(l_parallel_uploads,
                                 1);
  IF l_parallel_uploads > 2 THEN
    l_parallel_uploads := 2;
  ELSIF l_parallel_uploads = 0 THEN
    l_parallel_uploads := 1;
  END IF;
  l_common_file_preview := nvl(l_common_file_preview,
                               'true');
  l_filetoobig_message  := nvl(l_filetoobig_message,
                               'File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.');
  l_maxfiles_message    := nvl(l_maxfiles_message,
                               'You can not upload more than {{maxFiles}} files.');
  l_logging             := nvl(l_logging,
                               'false');
  -- escape input
  l_width_esc              := sys.htf.escape_sc(l_width);
  l_height_esc             := sys.htf.escape_sc(l_height);
  l_display_message_esc    := sys.htf.escape_sc(l_display_message);
  l_filetoobig_message_esc := sys.htf.escape_sc(l_filetoobig_message);
  l_maxfiles_message_esc   := sys.htf.escape_sc(l_maxfiles_message);
  l_refresh_regionid_esc   := sys.htf.escape_sc(l_refresh_regionid);
  --
  -- add div for dropzone
  -- style 1 (grey border)
  IF l_dz_style = 'STYLE1' THEN
    sys.htp.p('<div id="' || l_region_id ||
              '" class="dropzone" style="border:5px solid grey;background: white;width:' ||
              l_width_esc || ';height:' || l_height_esc ||
              ';overflow:auto;"></div>');
    -- style 2 (blue dashed border)
  ELSIF l_dz_style = 'STYLE2' THEN
    sys.htp.p('<div id="' || l_region_id ||
              '" class="dropzone" style="border: 3px dashed #0087F7;border-radius: 5px;background: white;width:' ||
              l_width_esc || ';height:' || l_height_esc ||
              ';overflow:auto;"></div>');
  END IF;
  --
  -- add dropzone js and apexdropzone
  apex_javascript.add_library(p_name           => 'dropzone.min',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  --
  apex_javascript.add_library(p_name           => 'apexdropzone',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  -- filereader for Copy&Paste support
  IF l_copy_paste_support = 'true' THEN
    apex_javascript.add_library(p_name           => 'filereader',
                                p_directory      => p_plugin.file_prefix,
                                p_version        => NULL,
                                p_skip_extension => FALSE);
  END IF;
  --
  -- add dropzone css
  apex_css.add_file(p_name      => 'dropzone.min',
                    p_directory => p_plugin.file_prefix);
  --
  -- onload code
  apex_javascript.add_onload_code(p_code => 'apexDropzone(' ||
                                            apex_javascript.add_value(p_region.static_id) || '{' ||
                                            apex_javascript.add_attribute('pageItems',
                                                                          apex_plugin_util.page_item_names_to_jquery(l_items_submit)) ||
                                            apex_javascript.add_attribute('ajaxIdentifier',
                                                                          apex_plugin.get_ajax_identifier) ||
                                            apex_javascript.add_attribute('maxFilesize',
                                                                          l_max_filesize_mb) ||
                                            apex_javascript.add_attribute('clickable',
                                                                          l_dz_clickable) ||
                                            apex_javascript.add_attribute('removeAfterUpload',
                                                                          l_remove_uploaded_files) ||
                                            apex_javascript.add_attribute('maxFiles',
                                                                          l_max_files) ||
                                            apex_javascript.add_attribute('acceptedFiles',
                                                                          l_accepted_files) ||
                                            apex_javascript.add_attribute('refreshRegionID',
                                                                          l_refresh_regionid_esc) ||
                                            apex_javascript.add_attribute('supportCopyPaste',
                                                                          l_copy_paste_support) ||
                                            apex_javascript.add_attribute('waitTime',
                                                                          l_wait_time_ms) ||
                                            apex_javascript.add_attribute('parallelUploads',
                                                                          l_parallel_uploads) ||
                                            apex_javascript.add_attribute('commonFilePreview',
                                                                          l_common_file_preview) ||
                                            apex_javascript.add_attribute('pluginPrefix',
                                                                          p_plugin.file_prefix) ||
                                            apex_javascript.add_attribute('defaultMessage',
                                                                          l_display_message_esc) ||
                                            apex_javascript.add_attribute('fileTooBigMessage',
                                                                          l_filetoobig_message_esc) ||
                                            apex_javascript.add_attribute('maxFilesMessage',
                                                                          l_maxfiles_message_esc,
                                                                          FALSE,
                                                                          FALSE) || '},' ||
                                            apex_javascript.add_value(l_logging,
                                                                      FALSE) || ');');
  --
  RETURN NULL;
  --
END render_dropzone;
--
--
-- AJAX function
--
--
FUNCTION ajax_dropzone(p_region IN apex_plugin.t_region,
                       p_plugin IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_region_ajax_result IS
  --
  -- plugin attributes
  l_result apex_plugin.t_dynamic_action_ajax_result;
  l_plsql  p_region.attribute_07%TYPE := p_region.attribute_07;
  --
BEGIN
  -- execute PL/SQL
  apex_plugin_util.execute_plsql_code(p_plsql_code => l_plsql);
  --
  --
  RETURN NULL;
  --
END ajax_dropzone;
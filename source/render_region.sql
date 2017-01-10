/*-------------------------------------
 * Dropzone APEX Plugin
 * Version: 2.0.3 (10.01.2017)
 * Author:  Daniel Hochleitner
 *-------------------------------------
*/
FUNCTION render_dropzone(p_region              IN apex_plugin.t_region,
                         p_plugin              IN apex_plugin.t_plugin,
                         p_is_printer_friendly IN BOOLEAN)
  RETURN apex_plugin.t_region_render_result IS
  --
  l_result apex_plugin.t_region_render_result;
  -- region attributes
  l_dz_style              p_region.attribute_07%TYPE := p_region.attribute_07;
  l_width                 p_region.attribute_08%TYPE := p_region.attribute_08;
  l_height                p_region.attribute_09%TYPE := p_region.attribute_09;
  l_max_filesize          NUMBER := p_region.attribute_10;
  l_max_files             NUMBER := p_region.attribute_11;
  l_parallel_uploads      NUMBER := p_region.attribute_12;
  l_accepted_files        p_region.attribute_13%TYPE := p_region.attribute_13;
  l_wait_time             NUMBER := p_region.attribute_14;
  l_upload_mechanism      p_region.attribute_15%TYPE := p_region.attribute_15;
  l_dz_clickable          p_region.attribute_16%TYPE := p_region.attribute_16;
  l_show_file_preview     p_region.attribute_17%TYPE := p_region.attribute_17;
  l_copy_paste_support    p_region.attribute_18%TYPE := p_region.attribute_18;
  l_remove_uploaded_files p_region.attribute_19%TYPE := p_region.attribute_19;
  l_delete_files          p_region.attribute_20%TYPE := p_region.attribute_20;
  -- plugin attributes
  l_display_message            p_plugin.attribute_01%TYPE := p_plugin.attribute_01;
  l_fallback_message           p_plugin.attribute_02%TYPE := p_plugin.attribute_02;
  l_filetoobig_message         p_plugin.attribute_03%TYPE := p_plugin.attribute_03;
  l_maxfiles_message           p_plugin.attribute_04%TYPE := p_plugin.attribute_04;
  l_remove_file_message        p_plugin.attribute_05%TYPE := p_plugin.attribute_05;
  l_cancel_upload_message      p_plugin.attribute_06%TYPE := p_plugin.attribute_06;
  l_cancel_upl_confirm_message p_plugin.attribute_07%TYPE := p_plugin.attribute_07;
  l_invalid_filetype_message   p_plugin.attribute_08%TYPE := p_plugin.attribute_08;
  -- other variables
  l_region_id VARCHAR2(200);
  l_dz_class  VARCHAR2(50);
  -- js/css file vars
  l_filereader_js VARCHAR2(50);
  --
BEGIN
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_region(p_plugin => p_plugin,
                                  p_region => p_region);
    -- set js/css filenames
    l_filereader_js := 'filereader';
  ELSE
    l_filereader_js := 'filereader.min';
  END IF;
  -- set variables and defaults
  l_region_id := apex_escape.html_attribute(p_region.static_id ||
                                            '_dropzone');
  l_max_files := nvl(l_max_files,
                     256);
  IF l_parallel_uploads > 2 THEN
    l_parallel_uploads := 2;
  ELSIF l_parallel_uploads = 0 THEN
    l_parallel_uploads := 1;
  END IF;
  -- escape input
  l_width                      := apex_escape.html(l_width);
  l_height                     := apex_escape.html(l_height);
  l_display_message            := apex_escape.html(l_display_message);
  l_fallback_message           := apex_escape.html(l_fallback_message);
  l_filetoobig_message         := apex_escape.html(l_filetoobig_message);
  l_maxfiles_message           := apex_escape.html(l_maxfiles_message);
  l_remove_file_message        := apex_escape.html(l_remove_file_message);
  l_cancel_upload_message      := apex_escape.html(l_cancel_upload_message);
  l_cancel_upl_confirm_message := apex_escape.html(l_cancel_upl_confirm_message);
  l_invalid_filetype_message   := apex_escape.html(l_invalid_filetype_message);
  --
  -- add div for dropzone
  -- style 1 (grey border)
  IF l_dz_style = 'STYLE1' THEN
    l_dz_class := 'dz-style1';
    -- style 2 (blue dashed border)
  ELSIF l_dz_style = 'STYLE2' THEN
    l_dz_class := 'dz-style2';
    -- style 3 (red dashed border)
  ELSIF l_dz_style = 'STYLE3' THEN
    l_dz_class := 'dz-style3';
    -- style 4 (grey background and grey dashed border)
  ELSIF l_dz_style = 'STYLE4' THEN
    l_dz_class := 'dz-style4';
  END IF;
  --
  htp.p('<div id="' || l_region_id || '" class="dropzone ' || l_dz_class ||
        '" style="width:' || l_width || ';height:' || l_height ||
        ';"></div>');
  --
  -- filereader lib for Copy&Paste support
  IF l_copy_paste_support = 'true' THEN
    apex_javascript.add_library(p_name           => l_filereader_js,
                                p_directory      => p_plugin.file_prefix ||
                                                    'js/',
                                p_version        => NULL,
                                p_skip_extension => FALSE);
  END IF;
  --
  -- onload code
  apex_javascript.add_onload_code(p_code => 'apexDropzone.apexDropzoneFnc(' ||
                                            apex_javascript.add_value(p_region.static_id) || '{' ||
                                            apex_javascript.add_attribute('ajaxIdentifier',
                                                                          apex_plugin.get_ajax_identifier) ||
                                            apex_javascript.add_attribute('maxFilesize',
                                                                          l_max_filesize) ||
                                            apex_javascript.add_attribute('maxFiles',
                                                                          l_max_files) ||
                                            apex_javascript.add_attribute('parallelUploads',
                                                                          l_parallel_uploads) ||
                                            apex_javascript.add_attribute('acceptedFiles',
                                                                          l_accepted_files) ||
                                            apex_javascript.add_attribute('waitTime',
                                                                          l_wait_time) ||
                                            apex_javascript.add_attribute('uploadMechanism',
                                                                          l_upload_mechanism) ||
                                            apex_javascript.add_attribute('clickable',
                                                                          l_dz_clickable) ||
                                            apex_javascript.add_attribute('showFilePreview',
                                                                          l_show_file_preview) ||
                                            apex_javascript.add_attribute('supportCopyPaste',
                                                                          l_copy_paste_support) ||
                                            apex_javascript.add_attribute('removeAfterUpload',
                                                                          l_remove_uploaded_files) ||
                                            apex_javascript.add_attribute('deleteFiles',
                                                                          l_delete_files) ||
                                            apex_javascript.add_attribute('pluginPrefix',
                                                                          p_plugin.file_prefix) ||
                                            apex_javascript.add_attribute('displayMessage',
                                                                          l_display_message) ||
                                            apex_javascript.add_attribute('fallbackMessage',
                                                                          l_fallback_message) ||
                                            apex_javascript.add_attribute('fileTooBigMessage',
                                                                          l_filetoobig_message) ||
                                            apex_javascript.add_attribute('maxFilesMessage',
                                                                          l_maxfiles_message) ||
                                            apex_javascript.add_attribute('removeFileMessage',
                                                                          l_remove_file_message) ||
                                            apex_javascript.add_attribute('cancelUploadMessage',
                                                                          l_cancel_upload_message) ||
                                            apex_javascript.add_attribute('cancelUploadConfirmMessage',
                                                                          l_cancel_upl_confirm_message) ||
                                            apex_javascript.add_attribute('invalidFileTypeMessage',
                                                                          l_invalid_filetype_message,
                                                                          FALSE,
                                                                          FALSE) ||
                                            '});');
  --
  RETURN l_result;
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
  l_result apex_plugin.t_region_ajax_result;
  -- region attributes
  l_storage_type     p_region.attribute_01%TYPE := p_region.attribute_01;
  l_table_coll_name  p_region.attribute_02%TYPE := p_region.attribute_02;
  l_filename_column  p_region.attribute_03%TYPE := p_region.attribute_03;
  l_mimetype_column  p_region.attribute_04%TYPE := p_region.attribute_04;
  l_blob_column      p_region.attribute_05%TYPE := p_region.attribute_05;
  l_date_column      p_region.attribute_06%TYPE := p_region.attribute_06;
  l_pk_column        p_region.attribute_21%TYPE := p_region.attribute_21;
  l_upload_mechanism p_region.attribute_15%TYPE := p_region.attribute_15;
  l_delete_files     p_region.attribute_20%TYPE := p_region.attribute_20;
  -- other variables
  l_type                VARCHAR2(50);
  l_chunked_temp_coll   VARCHAR2(100);
  l_blob                BLOB;
  l_filename            VARCHAR2(200);
  l_mime_type           VARCHAR2(100);
  l_token               VARCHAR2(32000);
  l_random_file_id      NUMBER;
  l_insert_sql          VARCHAR2(32767);
  l_delete_sql          VARCHAR2(32767);
  l_insert_id           NUMBER;
  l_delete_id           NUMBER;
  l_current_chunk_count NUMBER;
  l_total_chunk_count   NUMBER;
  l_chunk_clob          CLOB;
  l_chunk_blob          BLOB;
  -- cursor for file chunks
  CURSOR l_cur_chunk_files IS
    SELECT apex_collections.blob001 AS chunk_blob
      FROM apex_collections
     WHERE upper(apex_collections.collection_name) = l_chunked_temp_coll
       AND apex_collections.c001 = l_filename
       AND apex_collections.n002 = l_total_chunk_count
     ORDER BY apex_collections.n001;
  --
  -- Helper Functions
  PROCEDURE write_htp_error(p_message IN VARCHAR2,
                            p_id      IN VARCHAR2 := NULL) IS
  BEGIN
    htp.init;
    htp.p('{ "status": "error", "message": "' || p_message ||
          '", "code": "' ||
          regexp_replace(SQLERRM || ' ' ||
                         dbms_utility.format_error_backtrace,
                         '("|' || chr(10) || '|' || chr(13) || ',")',
                         '') || '", "id": "' || p_id || '" }');
  END write_htp_error;
  --
  PROCEDURE write_htp_success(p_message IN VARCHAR2,
                              p_id      IN VARCHAR2 := NULL) IS
  BEGIN
    htp.init;
    htp.p('{ "status": "success", "message": "' || p_message ||
          '", "code": "", "id": "' || p_id || '" }');
  END write_htp_success;
  --
BEGIN
  --
  -- Debug Info
  apex_debug.info('Dropzone AJAX Parameter x01: ' ||
                  apex_application.g_x01);
  apex_debug.info('Dropzone AJAX Parameter x02: ' ||
                  apex_application.g_x02);
  apex_debug.info('Dropzone AJAX Parameter x03: ' ||
                  apex_application.g_x03);
  apex_debug.info('Dropzone AJAX Parameter x04: ' ||
                  apex_application.g_x04);
  apex_debug.info('Dropzone AJAX Parameter x05: ' ||
                  apex_application.g_x05);
  apex_debug.info('Dropzone AJAX Parameter p_clob_01(length): ' ||
                  dbms_lob.getlength(apex_application.g_clob_01));
  --
  --
  l_type            := nvl(apex_application.g_x01,
                           'UPLOAD');
  l_table_coll_name := upper(l_table_coll_name);
  --
  --
  -- Upload
  --
  IF l_type = 'UPLOAD' THEN
    --
    -- Chunked 1MB file upload / chunks in temp collection (multiple server requests (per file chunk))
    IF l_upload_mechanism = 'CHUNKED' THEN
      BEGIN
        l_chunked_temp_coll := l_table_coll_name || '_TEMP';
        -- get defaults from AJAX Process
        l_filename            := apex_application.g_x02;
        l_mime_type           := nvl(apex_application.g_x03,
                                     'application/octet-stream');
        l_current_chunk_count := to_number(apex_application.g_x04);
        l_total_chunk_count   := to_number(apex_application.g_x05);
        l_chunk_clob          := apex_application.g_clob_01;
        -- create / truncate collection on first chunk
        IF l_current_chunk_count = 1 THEN
          apex_collection.create_or_truncate_collection(l_chunked_temp_coll);
        END IF;
        -- add collection member (only if l_chunk_clob not null and chunk count > 1)
        IF dbms_lob.getlength(l_chunk_clob) IS NOT NULL THEN
          -- convert base64 chunk to BLOB
          l_chunk_blob := apex_web_service.clobbase642blob(p_clob => l_chunk_clob);
          --
          IF (l_total_chunk_count) > 1 THEN
            --
            apex_collection.add_member(p_collection_name => l_chunked_temp_coll,
                                       p_c001            => l_filename, -- filename
                                       p_c002            => l_mime_type, -- mime_type
                                       p_n001            => l_current_chunk_count, -- current count from JS loop
                                       p_n002            => l_total_chunk_count, -- total count of all chunks
                                       p_blob001         => l_chunk_blob); -- BLOB base64 file chunk content
          ELSE
            l_blob := l_chunk_blob;
          END IF;
        END IF;
        -- last file chunk peace (chunk count > 1 --> BLOB null)
        IF l_current_chunk_count = l_total_chunk_count AND
           dbms_lob.getlength(l_blob) IS NULL THEN
          --
          dbms_lob.createtemporary(l_blob,
                                   FALSE,
                                   dbms_lob.session);
          -- loop over all file chunks and build final file
          FOR l_rec_chunk_files IN l_cur_chunk_files LOOP
            IF dbms_lob.getlength(l_rec_chunk_files.chunk_blob) IS NOT NULL THEN
              dbms_lob.append(l_blob,
                              l_rec_chunk_files.chunk_blob);
            END IF;
          END LOOP;
          -- delete temp collection
          IF apex_collection.collection_exists(p_collection_name => l_chunked_temp_coll) THEN
            apex_collection.delete_collection(p_collection_name => l_chunked_temp_coll);
          END IF;
          --
        END IF;
        -- status return json
        write_htp_success('File Chunk ' || l_current_chunk_count || ' of ' ||
                          l_total_chunk_count || ' for ' || l_filename ||
                          ' successfully saved to Temp. APEX Collection ' ||
                          l_chunked_temp_coll);
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File Chunk ' || l_current_chunk_count || ' of ' ||
                          l_total_chunk_count || ' for ' || l_filename ||
                          ' NOT saved to Temp. APEX Collection ' ||
                          l_chunked_temp_coll);
          RETURN NULL;
      END;
      --
      -- normal file upload via f01 array (1 server request)
    ELSIF l_upload_mechanism = 'NORMAL' THEN
      BEGIN
        -- get defaults from AJAX Process
        l_filename  := apex_application.g_x02;
        l_mime_type := nvl(apex_application.g_x03,
                           'application/octet-stream');
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
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File Upload could not be processed for ' ||
                          l_filename);
          RETURN NULL;
      END;
    END IF;
    --
    -- Save to APEX Collection
    IF l_storage_type = 'COLLECTION' AND
       dbms_lob.getlength(l_blob) IS NOT NULL THEN
      BEGIN
        -- random file id
        l_random_file_id := round(dbms_random.value(100000,
                                                    99999999));
        -- check if collection exist
        IF NOT
            apex_collection.collection_exists(p_collection_name => l_table_coll_name) THEN
          apex_collection.create_collection(l_table_coll_name);
        END IF;
        -- add collection member
        l_insert_id := apex_collection.add_member(p_collection_name => l_table_coll_name,
                                                  p_c001            => l_filename, -- filename
                                                  p_c002            => l_mime_type, -- mime_type
                                                  p_d001            => SYSDATE, -- date created
                                                  p_n001            => l_random_file_id, -- random file id
                                                  p_blob001         => l_blob); -- BLOB file content
        -- status return json
        write_htp_success(p_message => 'File ' || l_filename ||
                                       ' successfully saved to APEX Collection ' ||
                                       l_table_coll_name,
                          p_id      => l_insert_id);
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || l_filename ||
                          ' NOT saved to APEX Collection ' ||
                          l_table_coll_name);
          RETURN NULL;
      END;
      --
      -- Save to custom Table
    ELSIF l_storage_type = 'TABLE' AND
          dbms_lob.getlength(l_blob) IS NOT NULL THEN
      BEGIN
        -- dynamic insert statement
        -- without optional date column
        IF l_date_column IS NULL THEN
          l_insert_sql := 'INSERT INTO ' ||
                          dbms_assert.sql_object_name(l_table_coll_name) || '( ' ||
                          dbms_assert.simple_sql_name(l_filename_column) || ', ' ||
                          dbms_assert.simple_sql_name(l_mimetype_column) || ', ' ||
                          dbms_assert.simple_sql_name(l_blob_column) ||
                          ') VALUES (:filename_value,:mimetype_value,:blob_value) RETURNING ' ||
                          dbms_assert.simple_sql_name(l_pk_column) ||
                          ' INTO :pk_value';
          -- execute insert
          EXECUTE IMMEDIATE l_insert_sql
            USING l_filename, l_mime_type, l_blob
            RETURNING INTO l_insert_id;
          -- with optional date column
        ELSE
          l_insert_sql := 'INSERT INTO ' ||
                          dbms_assert.sql_object_name(l_table_coll_name) || '( ' ||
                          dbms_assert.simple_sql_name(l_filename_column) || ', ' ||
                          dbms_assert.simple_sql_name(l_mimetype_column) || ', ' ||
                          dbms_assert.simple_sql_name(l_blob_column) || ', ' ||
                          dbms_assert.simple_sql_name(l_date_column) ||
                          ') VALUES (:filename_value,:mimetype_value,:blob_value,:date_value) RETURNING ' ||
                          dbms_assert.simple_sql_name(l_pk_column) ||
                          ' INTO :pk_value';
          -- execute insert
          EXECUTE IMMEDIATE l_insert_sql
            USING l_filename, l_mime_type, l_blob, SYSDATE
            RETURNING INTO l_insert_id;
        END IF;
        -- status return json
        write_htp_success(p_message => 'File ' || l_filename ||
                                       ' successfully saved to Custom Table ' ||
                                       l_table_coll_name,
                          p_id      => l_insert_id);
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || l_filename ||
                          ' NOT saved to Custom Table ' ||
                          l_table_coll_name);
          RETURN NULL;
      END;
      --
    END IF;
    --
  END IF;
  --
  -- Delete File
  --
  IF l_type = 'DELETE' AND l_delete_files = 'true' THEN
    l_filename  := apex_application.g_x02;
    l_delete_id := to_number(apex_application.g_x03);
    --
    -- Delete from APEX Collection
    IF l_storage_type = 'COLLECTION' THEN
      --
      BEGIN
        -- check if collection exist
        IF apex_collection.collection_exists(p_collection_name => l_table_coll_name) THEN
          -- delete collection member (only if Seq-ID not null)
          IF l_delete_id IS NOT NULL THEN
            apex_collection.delete_member(p_collection_name => l_table_coll_name,
                                          p_seq             => l_delete_id);
            -- status return json
            write_htp_success('File ' || l_filename ||
                              ' successfully deleted from APEX Collection ' ||
                              l_table_coll_name);
          ELSE
            -- status return json
            write_htp_error('File-ID missing for File ' || l_filename ||
                            '. NOT deleted from APEX Collection ' ||
                            l_table_coll_name);
          END IF;
        ELSE
          -- status return json
          write_htp_error('APEX Collection ' || l_table_coll_name ||
                          ' missing for File ' || l_filename);
        END IF;
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || l_filename ||
                          ' NOT deleted from APEX Collection ' ||
                          l_table_coll_name);
          RETURN NULL;
      END;
      --
      -- Delete from custom Table
    ELSIF l_storage_type = 'TABLE' THEN
      BEGIN
        -- dynamic delete statement
        IF l_delete_id IS NOT NULL THEN
          l_delete_sql := 'DELETE FROM ' ||
                          dbms_assert.sql_object_name(l_table_coll_name) ||
                          ' WHERE ' ||
                          dbms_assert.simple_sql_name(l_pk_column) ||
                          ' = :pk_value';
          -- execute delete
          EXECUTE IMMEDIATE l_delete_sql
            USING l_delete_id;
          -- status return json
          write_htp_success('File ' || l_filename ||
                            ' successfully deleted from Custom Table ' ||
                            l_table_coll_name);
        ELSE
          -- status return json
          write_htp_error('File-ID missing for File ' || l_filename ||
                          '. NOT deleted from Custom Table ' ||
                          l_table_coll_name);
        END IF;
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || l_filename ||
                          ' NOT deleted from Custom Table ' ||
                          l_table_coll_name);
          RETURN NULL;
      END;
      --
    END IF;
  END IF;
  --
  RETURN l_result;
  --
EXCEPTION
  WHEN OTHERS THEN
    -- status return json
    write_htp_error('General Error occured in Dropzone AJAX Function');
    RETURN NULL;
    --
END ajax_dropzone;
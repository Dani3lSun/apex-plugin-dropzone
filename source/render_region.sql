/*-------------------------------------
 * Dropzone APEX Plugin
 * Version: 2.2.2 (24.01.2018)
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
  l_accepted_files        p_region.attribute_13%TYPE := p_region.attribute_13;
  l_upload_mechanism      p_region.attribute_15%TYPE := p_region.attribute_15;
  l_dz_clickable          p_region.attribute_16%TYPE := p_region.attribute_16;
  l_show_file_preview     p_region.attribute_17%TYPE := p_region.attribute_17;
  l_copy_paste_support    p_region.attribute_18%TYPE := p_region.attribute_18;
  l_remove_uploaded_files p_region.attribute_19%TYPE := p_region.attribute_19;
  l_delete_files          p_region.attribute_20%TYPE := p_region.attribute_20;
  l_resize_images         p_region.attribute_22%TYPE := p_region.attribute_22;
  l_resize_width          p_region.attribute_23%TYPE := p_region.attribute_23;
  l_resize_height         p_region.attribute_24%TYPE := p_region.attribute_24;
  -- plugin attributes
  l_display_message            p_plugin.attribute_01%TYPE := p_plugin.attribute_01;
  l_fallback_message           p_plugin.attribute_02%TYPE := p_plugin.attribute_02;
  l_filetoobig_message         p_plugin.attribute_03%TYPE := p_plugin.attribute_03;
  l_maxfiles_message           p_plugin.attribute_04%TYPE := p_plugin.attribute_04;
  l_remove_file_message        p_plugin.attribute_05%TYPE := p_plugin.attribute_05;
  l_cancel_upload_message      p_plugin.attribute_06%TYPE := p_plugin.attribute_06;
  l_cancel_upl_confirm_message p_plugin.attribute_07%TYPE := p_plugin.attribute_07;
  l_invalid_filetype_message   p_plugin.attribute_08%TYPE := p_plugin.attribute_08;
  l_chunk_size                 p_plugin.attribute_09%TYPE := p_plugin.attribute_09;
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
  l_region_id  := apex_escape.html_attribute(p_region.static_id ||
                                             '_dropzone');
  l_max_files  := nvl(l_max_files,
                      256);
  l_chunk_size := nvl(l_chunk_size,
                      1048576);
  -- escape input
  l_width                      := apex_escape.html(l_width);
  l_height                     := apex_escape.html(l_height);
  l_display_message            := apex_escape.json(l_display_message);
  l_fallback_message           := apex_escape.json(l_fallback_message);
  l_filetoobig_message         := apex_escape.json(l_filetoobig_message);
  l_maxfiles_message           := apex_escape.json(l_maxfiles_message);
  l_remove_file_message        := apex_escape.json(l_remove_file_message);
  l_cancel_upload_message      := apex_escape.json(l_cancel_upload_message);
  l_cancel_upl_confirm_message := apex_escape.json(l_cancel_upl_confirm_message);
  l_invalid_filetype_message   := apex_escape.json(l_invalid_filetype_message);
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
  apex_javascript.add_onload_code(p_code => 'apexDropzone.pluginHandler(' ||
                                            apex_javascript.add_value(p_region.static_id) || '{' ||
                                            apex_javascript.add_attribute('ajaxIdentifier',
                                                                          apex_plugin.get_ajax_identifier) ||
                                            apex_javascript.add_attribute('maxFilesize',
                                                                          l_max_filesize) ||
                                            apex_javascript.add_attribute('maxFiles',
                                                                          l_max_files) ||
                                            apex_javascript.add_attribute('acceptedFiles',
                                                                          l_accepted_files) ||
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
                                            apex_javascript.add_attribute('resizeImages',
                                                                          l_resize_images) ||
                                            apex_javascript.add_attribute('resizeWidth',
                                                                          l_resize_width) ||
                                            apex_javascript.add_attribute('resizeHeight',
                                                                          l_resize_height) ||
                                            apex_javascript.add_attribute('pluginPrefix',
                                                                          p_plugin.file_prefix) ||
                                            apex_javascript.add_attribute('chunkSize',
                                                                          l_chunk_size) ||
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
  l_blob                BLOB := empty_blob();
  l_filename            VARCHAR2(200);
  l_mime_type           VARCHAR2(100);
  l_delete_id           NUMBER;
  l_current_chunk_count NUMBER;
  l_total_chunk_count   NUMBER;
  l_chunk_clob          CLOB := empty_clob();
  --
  -- Helper Functions
  --

  --
  -- Write Error JSON
  PROCEDURE write_htp_error(p_message IN VARCHAR2,
                            p_id      IN VARCHAR2 := NULL,
                            p_output  IN BOOLEAN := FALSE) IS
  BEGIN
    htp.init;
    htp.p('{ "status": "error", "message": "' ||
          apex_escape.json(p_message) || '", "code": "' ||
          apex_escape.json(SQLERRM) || '", "id": "' ||
          apex_escape.json(p_id) || '" }');
  END write_htp_error;
  --
  -- Write Success JSON
  PROCEDURE write_htp_success(p_message IN VARCHAR2,
                              p_id      IN VARCHAR2 := NULL,
                              p_output  IN BOOLEAN := FALSE) IS
  BEGIN
    htp.init;
    htp.p('{ "status": "success", "message": "' ||
          apex_escape.json(p_message) || '", "code": "", "id": "' ||
          apex_escape.json(p_id) || '" }');
  END write_htp_success;
  --
  -- Sleep/Pause for given seconds
  PROCEDURE sleep(p_seconds IN NUMBER) AS
    l_now      TIMESTAMP := systimestamp;
    l_end_time TIMESTAMP;

  BEGIN
    l_end_time := l_now + numtodsinterval(p_seconds,
                                          'second');

    WHILE (l_end_time > l_now) LOOP
      l_now := systimestamp;
    END LOOP;
  END sleep;
  --
  -- Chunked File Processing
  FUNCTION process_chunked_file(p_table_coll_name     IN VARCHAR2,
                                p_filename            IN VARCHAR2,
                                p_mime_type           IN VARCHAR2,
                                p_current_chunk_count IN NUMBER,
                                p_total_chunk_count   IN NUMBER,
                                p_chunk_clob          IN OUT NOCOPY CLOB)
    RETURN BLOB IS
    --
    l_chunked_temp_coll VARCHAR2(100);
    l_chunk_blob        BLOB := empty_blob();
    l_blob              BLOB := empty_blob();
    l_chunk_length      NUMBER := 0;
    l_blob_length       NUMBER := 0;
    -- cursor for file chunks
    CURSOR l_cur_chunk_files IS
      SELECT apex_collections.blob001 AS chunk_blob,
             apex_collections.n003    AS blob_size
        FROM apex_collections
       WHERE apex_collections.collection_name = l_chunked_temp_coll
         AND apex_collections.c001 = p_filename
         AND apex_collections.n002 = p_total_chunk_count
       ORDER BY apex_collections.n001;
    --
  BEGIN
    l_chunked_temp_coll := upper(p_table_coll_name) || '_TEMP';
    -- create chunk collection
    IF NOT
        apex_collection.collection_exists(p_collection_name => l_chunked_temp_coll) THEN
      apex_collection.create_collection(p_collection_name => l_chunked_temp_coll);
    END IF;
    -- add collection member (only if p_chunk_clob not null and chunk count > 1)
    l_chunk_length := nvl(dbms_lob.getlength(p_chunk_clob),
                          0);
    --
    IF l_chunk_length > 0 THEN
      -- convert base64 chunk to BLOB
      l_chunk_blob := apex_web_service.clobbase642blob(p_clob => p_chunk_clob);
      --
      IF (p_total_chunk_count) > 1 THEN
        --
        apex_collection.add_member(p_collection_name => l_chunked_temp_coll,
                                   p_c001            => p_filename, -- filename
                                   p_c002            => p_mime_type, -- mime_type
                                   p_n001            => p_current_chunk_count, -- current count from JS loop
                                   p_n002            => p_total_chunk_count, -- total count of all chunks
                                   p_n003            => l_chunk_length, -- size of base64 BLOB file chunk
                                   p_blob001         => l_chunk_blob); -- BLOB base64 file chunk content
      ELSE
        l_blob := l_chunk_blob;
      END IF;
    END IF;
    -- last file chunk peace (chunk count > 1 --> BLOB null)
    l_blob_length := nvl(dbms_lob.getlength(l_blob),
                         0);
    IF p_current_chunk_count = p_total_chunk_count AND l_blob_length = 0 THEN
      --
      dbms_lob.createtemporary(l_blob,
                               FALSE,
                               dbms_lob.session);
      -- loop over all file chunks and build final file
      FOR l_rec_chunk_files IN l_cur_chunk_files LOOP
        IF l_rec_chunk_files.blob_size IS NOT NULL THEN
          dbms_lob.append(l_blob,
                          l_rec_chunk_files.chunk_blob);
        END IF;
      END LOOP;
      -- delete all chunks for specific file from collection
      FOR l_rec_del_coll IN (SELECT seq_id
                               FROM apex_collections
                              WHERE apex_collections.collection_name =
                                    l_chunked_temp_coll
                                AND apex_collections.c001 = p_filename
                                AND apex_collections.n002 =
                                    p_total_chunk_count) LOOP
        apex_collection.delete_member(p_collection_name => l_chunked_temp_coll,
                                      p_seq             => l_rec_del_coll.seq_id);
      END LOOP;
      --
    END IF;
    -- status return json
    write_htp_success('File Chunk ' || p_current_chunk_count || ' of ' ||
                      p_total_chunk_count || ' for ' || p_filename ||
                      ' successfully saved to Temp. APEX Collection ' ||
                      l_chunked_temp_coll);
    --
    RETURN l_blob;
    --
  EXCEPTION
    WHEN OTHERS THEN
      -- status return json
      write_htp_error('File Chunk ' || p_current_chunk_count || ' of ' ||
                      p_total_chunk_count || ' for ' || p_filename ||
                      ' NOT saved to Temp. APEX Collection ' ||
                      l_chunked_temp_coll);
      RAISE;
  END process_chunked_file;
  --
  -- Normal File Processing
  FUNCTION process_normal_file(p_filename  IN VARCHAR2,
                               p_f01_array IN apex_application.g_f01%TYPE)
    RETURN BLOB IS
    --
    l_token VARCHAR2(32000);
    l_blob  BLOB := empty_blob();
    --
  BEGIN
    -- build BLOB from f01 30k Array (base64 encoded)
    dbms_lob.createtemporary(l_blob,
                             FALSE,
                             dbms_lob.session);
    FOR i IN 1 .. p_f01_array.count LOOP
      l_token := p_f01_array(i);
      IF length(l_token) > 0 THEN
        dbms_lob.append(l_blob,
                        to_blob(utl_encode.base64_decode(utl_raw.cast_to_raw(l_token))));
      END IF;
    END LOOP;
    --
    RETURN l_blob;
    --
  EXCEPTION
    WHEN OTHERS THEN
      -- status return json
      write_htp_error('File Upload could not be processed for ' ||
                      p_filename);
      RAISE;
  END process_normal_file;
  --
  -- Save File to Collection / Table
  PROCEDURE save_file(p_storage_type    IN VARCHAR2,
                      p_table_coll_name IN VARCHAR2,
                      p_filename        IN VARCHAR2,
                      p_mime_type       IN VARCHAR2,
                      p_blob            IN OUT NOCOPY BLOB,
                      p_pk_column       IN VARCHAR2 := NULL,
                      p_filename_column IN VARCHAR2 := NULL,
                      p_mimetype_column IN VARCHAR2 := NULL,
                      p_blob_column     IN VARCHAR2 := NULL,
                      p_date_column     IN VARCHAR2 := NULL) IS
    --
    l_random_file_id NUMBER;
    l_insert_sql     VARCHAR2(32767);
    l_insert_id      NUMBER;
    l_blob_length    NUMBER := 0;
    --
  BEGIN
    --
    l_blob_length := nvl(dbms_lob.getlength(p_blob),
                         0);
    -- only process if BLOB has data
    IF l_blob_length > 0 THEN
      -- Save to APEX Collection
      IF p_storage_type = 'COLLECTION' THEN
        BEGIN
          -- random file id
          l_random_file_id := round(dbms_random.value(100000,
                                                      99999999));
          -- check if collection exist
          IF NOT
              apex_collection.collection_exists(p_collection_name => p_table_coll_name) THEN
            apex_collection.create_collection(p_table_coll_name);
          END IF;
          -- add collection member
          l_insert_id := apex_collection.add_member(p_collection_name => p_table_coll_name,
                                                    p_c001            => p_filename, -- filename
                                                    p_c002            => p_mime_type, -- mime_type
                                                    p_d001            => SYSDATE, -- date created
                                                    p_n001            => l_random_file_id, -- random file id
                                                    p_blob001         => p_blob); -- BLOB file content
          -- status return json
          write_htp_success(p_message => 'File ' || p_filename ||
                                         ' successfully saved to APEX Collection ' ||
                                         p_table_coll_name,
                            p_id      => l_insert_id);
          --
        EXCEPTION
          WHEN OTHERS THEN
            -- status return json
            write_htp_error('File ' || p_filename ||
                            ' NOT saved to APEX Collection ' ||
                            p_table_coll_name);
            RAISE;
        END;
        --
        -- Save to custom Table
      ELSIF p_storage_type = 'TABLE' THEN
        BEGIN
          -- dynamic insert statement
          -- without optional date column
          IF p_date_column IS NULL THEN
            l_insert_sql := 'INSERT INTO ' ||
                            dbms_assert.sql_object_name(p_table_coll_name) || '( ' ||
                            dbms_assert.simple_sql_name(p_filename_column) || ', ' ||
                            dbms_assert.simple_sql_name(p_mimetype_column) || ', ' ||
                            dbms_assert.simple_sql_name(p_blob_column) ||
                            ') VALUES (:filename_value,:mimetype_value,:blob_value) RETURNING ' ||
                            dbms_assert.simple_sql_name(p_pk_column) ||
                            ' INTO :pk_value';
            -- execute insert
            EXECUTE IMMEDIATE l_insert_sql
              USING p_filename, p_mime_type, p_blob
              RETURNING INTO l_insert_id;
            -- with optional date column
          ELSE
            l_insert_sql := 'INSERT INTO ' ||
                            dbms_assert.sql_object_name(p_table_coll_name) || '( ' ||
                            dbms_assert.simple_sql_name(p_filename_column) || ', ' ||
                            dbms_assert.simple_sql_name(p_mimetype_column) || ', ' ||
                            dbms_assert.simple_sql_name(p_blob_column) || ', ' ||
                            dbms_assert.simple_sql_name(p_date_column) ||
                            ') VALUES (:filename_value,:mimetype_value,:blob_value,:date_value) RETURNING ' ||
                            dbms_assert.simple_sql_name(p_pk_column) ||
                            ' INTO :pk_value';
            -- execute insert
            EXECUTE IMMEDIATE l_insert_sql
              USING p_filename, p_mime_type, p_blob, SYSDATE
              RETURNING INTO l_insert_id;
          END IF;
          -- status return json
          write_htp_success(p_message => 'File ' || p_filename ||
                                         ' successfully saved to Custom Table ' ||
                                         p_table_coll_name,
                            p_id      => l_insert_id);
          --
        EXCEPTION
          WHEN OTHERS THEN
            -- status return json
            write_htp_error('File ' || p_filename ||
                            ' NOT saved to Custom Table ' ||
                            p_table_coll_name);
            RAISE;
        END;
        --
      END IF;
      -- sleep 0.75 sec
      sleep(p_seconds => 75 / 100);
      --
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      -- sleep 0.75 sec
      sleep(p_seconds => 75 / 100);
      RAISE;
  END save_file;
  --
  -- Delete File from Collection / Table
  PROCEDURE delete_file(p_storage_type    IN VARCHAR2,
                        p_table_coll_name IN VARCHAR2,
                        p_delete_id       IN NUMBER,
                        p_filename        IN VARCHAR2,
                        p_pk_column       IN VARCHAR2 := NULL) IS
    --
    l_delete_sql VARCHAR2(32767);
    --
  BEGIN
    -- Delete from APEX Collection
    IF p_storage_type = 'COLLECTION' THEN
      --
      BEGIN
        -- check if collection exist
        IF apex_collection.collection_exists(p_collection_name => p_table_coll_name) THEN
          -- delete collection member (only if Seq-ID not null)
          IF p_delete_id IS NOT NULL THEN
            apex_collection.delete_member(p_collection_name => p_table_coll_name,
                                          p_seq             => p_delete_id);
            -- status return json
            write_htp_success('File ' || p_filename ||
                              ' successfully deleted from APEX Collection ' ||
                              p_table_coll_name);
          ELSE
            -- status return json
            write_htp_error('File-ID missing for File ' || p_filename ||
                            '. NOT deleted from APEX Collection ' ||
                            p_table_coll_name);
          END IF;
        ELSE
          -- status return json
          write_htp_error('APEX Collection ' || p_table_coll_name ||
                          ' missing for File ' || p_filename);
        END IF;
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || p_filename ||
                          ' NOT deleted from APEX Collection ' ||
                          p_table_coll_name);
          RAISE;
      END;
      --
      -- Delete from custom Table
    ELSIF p_storage_type = 'TABLE' THEN
      BEGIN
        -- dynamic delete statement
        IF p_delete_id IS NOT NULL THEN
          l_delete_sql := 'DELETE FROM ' ||
                          dbms_assert.sql_object_name(p_table_coll_name) ||
                          ' WHERE ' ||
                          dbms_assert.simple_sql_name(p_pk_column) ||
                          ' = :pk_value';
          -- execute delete
          EXECUTE IMMEDIATE l_delete_sql
            USING p_delete_id;
          -- status return json
          write_htp_success('File ' || p_filename ||
                            ' successfully deleted from Custom Table ' ||
                            p_table_coll_name);
        ELSE
          -- status return json
          write_htp_error('File-ID missing for File ' || p_filename ||
                          '. NOT deleted from Custom Table ' ||
                          p_table_coll_name);
        END IF;
        --
      EXCEPTION
        WHEN OTHERS THEN
          -- status return json
          write_htp_error('File ' || p_filename ||
                          ' NOT deleted from Custom Table ' ||
                          p_table_coll_name);
          RAISE;
      END;
      --
    END IF;
    --
  END delete_file;
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
  -- replace substitution strings
  l_table_coll_name := apex_plugin_util.replace_substitutions(p_value => l_table_coll_name);
  l_filename_column := apex_plugin_util.replace_substitutions(p_value => l_filename_column);
  l_mimetype_column := apex_plugin_util.replace_substitutions(p_value => l_mimetype_column);
  l_blob_column     := apex_plugin_util.replace_substitutions(p_value => l_blob_column);
  l_date_column     := apex_plugin_util.replace_substitutions(p_value => l_date_column);
  l_pk_column       := apex_plugin_util.replace_substitutions(p_value => l_pk_column);
  -- set general vars
  l_type            := nvl(apex_application.g_x01,
                           'UPLOAD');
  l_table_coll_name := upper(l_table_coll_name);
  --
  --
  -- Upload
  --
  IF l_type = 'UPLOAD' THEN
    -- get defaults from AJAX Process
    l_filename  := apex_application.g_x02;
    l_mime_type := nvl(apex_application.g_x03,
                       'application/octet-stream');
    --
    -- Chunked 1MB file upload / chunks in temp collection (multiple server requests (per file chunk))
    IF l_upload_mechanism = 'CHUNKED' THEN
      BEGIN
        -- get defaults from AJAX Process
        l_current_chunk_count := to_number(apex_application.g_x04);
        l_total_chunk_count   := to_number(apex_application.g_x05);
        l_chunk_clob          := apex_application.g_clob_01;
        --
        l_blob := process_chunked_file(p_table_coll_name     => l_table_coll_name,
                                       p_filename            => l_filename,
                                       p_mime_type           => l_mime_type,
                                       p_current_chunk_count => l_current_chunk_count,
                                       p_total_chunk_count   => l_total_chunk_count,
                                       p_chunk_clob          => l_chunk_clob);
      EXCEPTION
        WHEN OTHERS THEN
          RETURN NULL;
      END;
      --
      -- normal file upload via f01 array (1 server request)
    ELSIF l_upload_mechanism = 'NORMAL' THEN
      BEGIN
        l_blob := process_normal_file(p_filename  => l_filename,
                                      p_f01_array => apex_application.g_f01);
      EXCEPTION
        WHEN OTHERS THEN
          RETURN NULL;
      END;
    END IF;
    --
    -- Save final File
    BEGIN
      save_file(p_storage_type    => l_storage_type,
                p_table_coll_name => l_table_coll_name,
                p_filename        => l_filename,
                p_mime_type       => l_mime_type,
                p_blob            => l_blob,
                p_pk_column       => l_pk_column,
                p_filename_column => l_filename_column,
                p_mimetype_column => l_mimetype_column,
                p_blob_column     => l_blob_column,
                p_date_column     => l_date_column);
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
    END;
    --
  END IF;
  --
  -- Delete File
  --
  IF l_type = 'DELETE' AND l_delete_files = 'true' THEN
    l_filename  := apex_application.g_x02;
    l_delete_id := to_number(apex_application.g_x03);
    --
    BEGIN
      delete_file(p_storage_type    => l_storage_type,
                  p_table_coll_name => l_table_coll_name,
                  p_delete_id       => l_delete_id,
                  p_filename        => l_filename,
                  p_pk_column       => l_pk_column);
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
    END;
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

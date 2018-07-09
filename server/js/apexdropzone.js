/*
APEX Dropzone JS
Author: Daniel Hochleitner
Version: 2.2.4
*/

/**
 * global namespace
 */
var apexDropzone = {
  /**
   * parse string to boolean
   * @param {string} pString
   * @return {boolean}
   */
  parseBoolean: function(pString) {
    var boolean;
    if (pString.toLowerCase() == 'true') {
      boolean = true;
    }
    if (pString.toLowerCase() == 'false') {
      boolean = false;
    }
    if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
      boolean = undefined;
    }
    return boolean;
  },
  /**
   * check if an image (url) exists
   * @param {string} pUrl
   * @param {function} pGood
   * @param {function} pBad
   */
  imageExists: function(pUrl, pGood, pBad) {
    try {
      var img = new Image();
      img.onload = pGood;
      img.onerror = pBad;
      img.src = pUrl;
    } catch (err) {
      apex.debug.log('apexDropzone.imageExists Error', err);
    }
  },
  /**
   * builds a js array from long string
   * @param {string} pClob
   * @param {number} pSize
   * @param {array} pArray
   * @return {array}
   */
  clob2Array: function(pClob, pSize, pArray) {
    loopCount = Math.floor(pClob.length / pSize) + 1;
    for (var i = 0; i < loopCount; i++) {
      pArray.push(pClob.slice(pSize * i, pSize * (i + 1)));
    }
    return pArray;
  },
  /**
   * converts binaryArray to base64 string
   * @param {array} pInt8Array
   * @return {string}
   */
  binaryArray2base64: function(pInt8Array) {
    var data = '';
    var bytes = new Uint8Array(pInt8Array);
    var length = bytes.byteLength;
    for (var i = 0; i < length; i++) {
      data += String.fromCharCode(bytes[i]);
    }
    return btoa(data);
  },
  /**
   * Set upload progress function
   * @param {object} pEvent
   * @param {object} pDropzone
   * @param {object} pFile
   */
  setUploadProgress: function(pEvent, pDropzone, pFile) {
    var percentComplete;
    if (pEvent) {
      percentComplete = (pEvent.loaded / pEvent.total) * 100;
      if (percentComplete > 100) {
        percentComplete = 100;
      }
      pFile.upload = {
        progress: percentComplete,
        total: pEvent.total,
        bytesSent: pEvent.loaded
      };
    } else {
      percentComplete = 100;
      pFile.upload = {
        progress: percentComplete,
        bytesSent: pFile.upload.total
      };
    }
    pDropzone.emit('uploadprogress', pFile, percentComplete, pFile.size / (100 / percentComplete));
  },
  /**
   * Set upload progress function for chunked upload
   * @param {object} pEvent
   * @param {object} pDropzone
   * @param {number} pCurrentChunk
   * @param {number} pChunkCount
   * @param {object} pFile
   */
  setUploadProgressChunked: function(pEvent, pDropzone, pCurrentChunk, pChunkCount, pFile) {
    var percentComplete;
    if (pEvent) {
      percentComplete = (pCurrentChunk / pChunkCount) * 100;
      percentComplete = percentComplete + ((pEvent.loaded / pEvent.total) * 100) / pChunkCount;
      if (percentComplete > 100) {
        percentComplete = 100;
      }
      pFile.upload = {
        progress: percentComplete,
        total: pEvent.total * (pCurrentChunk / pChunkCount),
        bytesSent: pEvent.loaded * (pCurrentChunk / pChunkCount)
      };
    } else {
      percentComplete = 100 * (pCurrentChunk / pChunkCount);
      if (percentComplete > 100) {
        percentComplete = 100;
      }
      pFile.upload = {
        progress: percentComplete,
        bytesSent: pFile.upload.total * (pCurrentChunk / pChunkCount)
      };
    }
    pDropzone.emit('uploadprogress', pFile, percentComplete, pFile.size / (100 / percentComplete));
  },
  /**
   * Asynchronous Loop Function
   * @param {number} pIterations
   * @param {function} pFunction
   * @param {function} callback
   */
  asyncLoop: function(pIterations, pFunction, callback) {
    var index = 1;
    var done = false;
    var loop = {
      next: function() {
        if (done) {
          return;
        }
        if (index <= pIterations) {
          index++;
          pFunction(loop);
        } else {
          done = true;
          callback();
        }
      },
      iteration: function() {
        return index - 1;
      },
      stop: function() {
        done = true;
        callback();
      }
    };
    loop.next();
    return loop;
  },
  /**
   * file manipulation before uploading, like image resize
   * @param {object} pDropzone
   * @param {object} pFile
   * @param {function} callback
   */
  processFile: function(pDropzone, pFile, callback) {
    if ((pDropzone.options.resizeWidth || pDropzone.options.resizeHeight) && pFile.type.match(/image.*/)) {
      var resizeMethod = pDropzone.options.resizeMethod;
      if (pDropzone.options.resizeWidth && pDropzone.options.resizeHeight) {
        resizeMethod = 'crop';
      } else {
        resizeMethod = 'contain';
      }
      pDropzone.resizeImage(pFile, pDropzone.options.resizeWidth, pDropzone.options.resizeHeight, resizeMethod, function(file) {
        file.name = pFile.name;
        file.status = pFile.status;
        file.accepted = pFile.accepted;
        file.processing = pFile.processing;
        file.lastModified = pFile.lastModified;
        file.lastModifiedDate = pFile.lastModifiedDate;
        file.previewElement = pFile.previewElement;
        file.previewTemplate = pFile.previewTemplate;
        file._removeLink = pFile._removeLink;
        callback(file);
      });
    } else {
      callback(pFile);
    }
  },
  /**
   * file upload function
   * @param {string} pRegionId
   * @param {string} pAjaxIdentifier
   * @param {object} pDropzone
   * @param {array} pFiles
   */
  uploadDzFiles: function(pRegionId, pAjaxIdentifier, pDropzone, pFiles) {
    // go through files
    for (var i = 0; i < pFiles.length; i++) {
      var file = pFiles[i];
      // async resize image function --> only when attributes are set
      apexDropzone.processFile(pDropzone, pFiles[i], function(processedFile) {
        // resize image: save original file object / processedFile for fileReader
        if (processedFile) {
          var orgFile = file;
          file = processedFile;
        }
        // Filereader => file to Binary to base64
        var reader = new FileReader();
        reader.onload = (function(pFile) {
          return function(e) {
            if (pFile) {
              // resize image: restore original file object
              if (processedFile) {
                file = orgFile;
              }
              // BinaryInt8Array to base64
              var base64 = apexDropzone.binaryArray2base64(e.target.result);
              // split base64 clob string to f01 array length 30k
              var f01Array = [];
              f01Array = apexDropzone.clob2Array(base64, 30000, f01Array);
              //set upload progress 10%
              pDropzone.emit('uploadprogress', file, 10, file.size / 10);

              // AJAX call to upload and process files (No apex.server.plugin because 5.1 doesn´t support xhr)
              file.xhr = apex.jQuery.ajax({
                dataType: 'text',
                type: 'POST',
                url: window.location.href.substr(0, window.location.href.indexOf('/f?p=') + 1) + 'wwv_flow.show',
                async: true,
                traditional: true,
                data: {
                  x01: 'UPLOAD',
                  x02: file.name,
                  x03: file.type,
                  f01: f01Array,
                  p_request: 'PLUGIN=' + pAjaxIdentifier,
                  p_flow_id: $v('pFlowId'),
                  p_flow_step_id: $v('pFlowStepId'),
                  p_instance: $v('pInstance'),
                  p_debug: $v('pdebug')
                },
                // SUCCESS function
                success: function(pData) {
                  // check status
                  var vJsonReturn;
                  try {
                    vJsonReturn = jQuery.parseJSON(pData);
                  } catch (err) {
                    apex.debug.log('apexDropzone.uploadDzFiles Response ParseError', err);
                    vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "uploadDzFiles Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
                  }
                  // response error
                  if (vJsonReturn.status == 'error') {
                    // APEX event
                    apex.debug.log('apexDropzone.uploadDzFiles Error', vJsonReturn.message, vJsonReturn.code);
                    apex.event.trigger('#' + pRegionId, 'dropzone-upload-error', vJsonReturn);
                    // file status
                    file.status = Dropzone.ERROR;
                    pDropzone.emit("error", file, "Database error during file upload");
                    // response success
                  } else if (vJsonReturn.status == 'success') {
                    // set file id to return id
                    file.id = vJsonReturn.id;
                    // APEX event
                    apex.debug.log('apexDropzone.uploadDzFiles Success', vJsonReturn.message);
                    apex.event.trigger('#' + pRegionId, 'dropzone-upload-success', pData);
                    // file status
                    file.status = Dropzone.SUCCESS;
                    pDropzone.emit("success", file, 'success', null);
                  }
                  // set file status SUCCESS / UPLOAD 100%
                  pDropzone.emit('uploadprogress', file, 100, file.size);
                  pDropzone.emit("complete", file);
                  // process file queue
                  pDropzone.processQueue();
                },
                // ERROR function
                error: function(xhr, pMessage) {
                  // APEX event
                  apex.debug.log('apexDropzone.uploadDzFiles Error', pMessage);
                  apex.event.trigger('#' + pRegionId, 'dropzone-upload-error', pMessage);
                  // set file status ERROR
                  file.status = Dropzone.ERROR;
                  // build message for error template
                  var message = "";
                  if (pMessage) {
                    message = pMessage;
                  } else {
                    message = 'Error processing file';
                  }
                  pDropzone.emit("error", file, message, xhr);
                  pDropzone.emit("complete", file);
                  // process file queue
                  pDropzone.processQueue();
                },
                // XHR for upload progress
                xhr: function() {
                  XhrObj = $.ajaxSettings.xhr();
                  if (XhrObj.upload) {
                    XhrObj.upload.addEventListener('progress', function(event) {
                      apexDropzone.setUploadProgress(event, pDropzone, file);
                    }, false);
                  } else {
                    apex.debug.log('apexDropzone.uploadDzFiles XHR', 'Upload progress is not supported.');
                  }
                  return XhrObj;
                }
              });
              // if file not found: process queue
            } else {
              pDropzone.processQueue();
            }
          };
        })(file);
        reader.readAsArrayBuffer(file);
      });
    }
  },
  /**
   * file upload function for chunked upload
   * @param {string} pRegionId
   * @param {string} pAjaxIdentifier
   * @param {object} pDropzone
   * @param {array} pFiles
   * @param {number} pChunkSize
   */
  uploadDzFilesChunked: function(pRegionId, pAjaxIdentifier, pDropzone, pFiles, pChunkSize) {
    // go through files
    for (var i = 0; i < pFiles.length; i++) {
      var file = pFiles[i];
      var orgFile;
      // async resize image function --> only when attributes are set
      apexDropzone.processFile(pDropzone, pFiles[i], function(processedFile) {
        // resize image: save original file object / processedFile for fileReader
        if (processedFile) {
          orgFile = file;
          file = processedFile;
        }
        // Filereader => file to Binary to base64
        var reader = new FileReader();
        reader.onload = (function(pFile) {
          return function(e) {
            if (pFile) {
              var fileChunk;
              var fileChunkBase64;
              var currentChunk;
              var chunkSize = pChunkSize || 1048576;
              var chunkStart;
              var chunkEnd;
              var fileChunkCount = Math.ceil(file.size / chunkSize);

              // loop over 1MB file chunks
              apexDropzone.asyncLoop(fileChunkCount, function(loop) {
                currentChunk = loop.iteration();
                chunkStart = chunkSize * (currentChunk - 1);
                chunkEnd = chunkStart + chunkSize;
                // Logging
                apex.debug.log(file.name + ' currentChunk', currentChunk);
                apex.debug.log(file.name + ' chunkStart', chunkStart);
                apex.debug.log(file.name + ' chunkEnd', chunkEnd);

                // slice file and build base64 per chunk
                fileChunk = file.slice(chunkStart, chunkEnd);
                var reader = new FileReader();
                reader.onload = (function(fileChunk) {
                  return function(eChunk) {
                    fileChunkBase64 = apexDropzone.binaryArray2base64(eChunk.target.result);

                    // AJAX call to upload and process files (No apex.server.plugin because 5.1 doesn´t support xhr)
                    file.xhr = apex.jQuery.ajax({
                      dataType: 'text',
                      type: 'POST',
                      url: window.location.href.substr(0, window.location.href.indexOf('/f?p=') + 1) + 'wwv_flow.show',
                      async: true,
                      traditional: true,
                      data: {
                        x01: 'UPLOAD',
                        x02: file.name,
                        x03: file.type,
                        x04: currentChunk,
                        x05: fileChunkCount,
                        p_clob_01: fileChunkBase64,
                        p_request: 'PLUGIN=' + pAjaxIdentifier,
                        p_flow_id: $v('pFlowId'),
                        p_flow_step_id: $v('pFlowStepId'),
                        p_instance: $v('pInstance'),
                        p_debug: $v('pdebug')
                      },
                      // SUCCESS function
                      success: function(pData) {
                        // resize image: restore original file object
                        if (processedFile) {
                          file = orgFile;
                        }
                        // check server status
                        var vJsonReturn;
                        try {
                          vJsonReturn = jQuery.parseJSON(pData);
                        } catch (err) {
                          apex.debug.log('apexDropzone.uploadDzFilesChunked Response ParseError', err);
                          vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "uploadDzFilesChunked Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
                        }
                        // response error
                        if (vJsonReturn.status == 'error') {
                          // APEX event
                          apex.debug.log('apexDropzone.uploadDzFilesChunked Error', vJsonReturn.message, vJsonReturn.code);
                          apex.event.trigger('#' + pRegionId, 'dropzone-upload-chunk-error', vJsonReturn);
                          // file status
                          file.status = Dropzone.ERROR;
                          pDropzone.emit("error", file, "Database error during file upload");
                          pDropzone.emit("complete", file);
                          // process file queue
                          pDropzone.processQueue();
                          // response success
                        } else if (vJsonReturn.status == 'success') {
                          // APEX event
                          apex.debug.log('apexDropzone.uploadDzFilesChunked Success', vJsonReturn.message);
                          apex.event.trigger('#' + pRegionId, 'dropzone-upload-chunk-success', pData);
                          // file status (only if last chunk was successful)
                          if (currentChunk == fileChunkCount) {
                            // set file id to return id
                            file.id = vJsonReturn.id;
                            // file status
                            file.status = Dropzone.SUCCESS;
                            pDropzone.emit("success", file, 'success', null);
                            pDropzone.emit("complete", file);
                            // process file queue
                            pDropzone.processQueue();
                          }
                        }
                        // resize image: restore original file object
                        if (processedFile) {
                          file = processedFile;
                        }
                        // next loop iteration
                        loop.next();
                      },
                      // ERROR function
                      error: function(xhr, pMessage) {
                        // resize image: restore original file object
                        if (processedFile) {
                          file = orgFile;
                        }
                        // APEX event
                        apex.debug.log('apexDropzone.uploadDzFilesChunked Error', pMessage);
                        apex.event.trigger('#' + pRegionId, 'dropzone-upload-chunk-error', pMessage);
                        // set file status ERROR
                        file.status = Dropzone.ERROR;
                        // build message for error template
                        var message = "";
                        if (pMessage) {
                          message = pMessage;
                        } else {
                          message = 'Error processing file';
                        }
                        pDropzone.emit("error", file, message, xhr);
                        pDropzone.emit("complete", file);
                        // process file queue
                        pDropzone.processQueue();
                      },
                      // XHR for upload progress
                      xhr: function() {
                        XhrObj = $.ajaxSettings.xhr();
                        if (XhrObj.upload) {
                          XhrObj.upload.addEventListener('progress', function(event) {
                            apexDropzone.setUploadProgressChunked(event, pDropzone, currentChunk, fileChunkCount, orgFile || file);
                          }, false);
                        } else {
                          apex.debug.log('apexDropzone.uploadDzFilesChunked XHR', 'Upload progress is not supported.');
                        }
                        return XhrObj;
                      }
                    });
                  };
                })(fileChunk);
                reader.readAsArrayBuffer(fileChunk);

              }, function() {
                apex.debug.log('apexDropzone.uploadDzFilesChunked Loop ended');
              });
              // if file not found: process queue
            } else {
              pDropzone.processQueue();
            }
          };
        })(file);
        reader.readAsArrayBuffer(file);
      });
    }
  },
  /**
   * file delete function
   * @param {string} pRegionId
   * @param {string} pAjaxIdentifier
   * @param {object} pDropzone
   * @param {object} pFile
   */
  deleteDzFile: function(pRegionId, pAjaxIdentifier, pDropzone, pFile) {
    // AJAX call to upload and process files (No apex.server.plugin because 5.1 doesn´t support xhr)
    apex.jQuery.ajax({
      dataType: 'text',
      type: 'POST',
      url: window.location.href.substr(0, window.location.href.indexOf('/f?p=') + 1) + 'wwv_flow.show',
      async: true,
      traditional: true,
      data: {
        x01: 'DELETE',
        x02: pFile.name,
        x03: pFile.id,
        p_request: 'PLUGIN=' + pAjaxIdentifier,
        p_flow_id: $v('pFlowId'),
        p_flow_step_id: $v('pFlowStepId'),
        p_instance: $v('pInstance'),
        p_debug: $v('pdebug')
      },
      // SUCCESS function
      success: function(pData) {
        // check status
        var vJsonReturn;
        try {
          vJsonReturn = jQuery.parseJSON(pData);
        } catch (err) {
          apex.debug.log('apexDropzone.deleteDzFile Response ParseError', err);
          vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "deleteDzFile Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
        }
        // response error
        if (vJsonReturn.status == 'error') {
          // APEX event
          apex.debug.log('apexDropzone.deleteDzFile Error', vJsonReturn.message, vJsonReturn.code);
          apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', vJsonReturn);
          // response success
        } else if (vJsonReturn.status == 'success') {
          // APEX event
          apex.debug.log('apexDropzone.deleteDzFile Success', vJsonReturn.message);
          apex.event.trigger('#' + pRegionId, 'dropzone-delete-success', pData);
        }
      },
      // ERROR function
      error: function(xhr, pMessage) {
        // APEX event
        apex.debug.log('apexDropzone.deleteDzFile Error', pMessage);
        apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', pMessage);
      }
    });
  },
  /**
   * Handle all plugin APEX region events
   * @param {object} pDropzone
   * @param {string} pRegionId
   */
  handlePluginEvents: function(pDropzone, pRegionId) {
    // deleted file
    pDropzone.on('removedfile', function(file) {
      apex.debug.log('apexDropzone.handlePluginEvents - removedfile event');
      apex.event.trigger('#' + pRegionId, 'dropzone-deleted-file', file);
    });
    // added file
    pDropzone.on('addedfile', function(file) {
      apex.debug.log('apexDropzone.handlePluginEvents - addedfile event');
      apex.event.trigger('#' + pRegionId, 'dropzone-added-file', file);
    });
    // maxFiles exceeded
    pDropzone.on('maxfilesexceeded', function(file) {
      apex.debug.log('apexDropzone.handlePluginEvents - maxfilesexceeded event');
      apex.event.trigger('#' + pRegionId, 'dropzone-maxfiles-exceeded', file);
    });
    // total upload progress
    pDropzone.on('totaluploadprogress', function(totalPercentage) {
      apex.debug.log('apexDropzone.handlePluginEvents - totaluploadprogress event');
      apex.event.trigger('#' + pRegionId, 'dropzone-totalupload-progress', totalPercentage);
    });
    // drag file over the dropzone
    pDropzone.on('dragenter', function() {
      apex.debug.log('apexDropzone.handlePluginEvents - dragenter event');
      apex.event.trigger('#' + pRegionId, 'dropzone-drag-over');
    });
    // file error occured
    pDropzone.on('error', function(file, errorMessage) {
      apex.debug.log('apexDropzone.handlePluginEvents - error event');
      file.errorMessage = errorMessage;
      apex.event.trigger('#' + pRegionId, 'dropzone-file-error', file);
    });
    // upload complete
    pDropzone.on('complete', function() {
      if (pDropzone.getQueuedFiles().length === 0 && pDropzone.getUploadingFiles().length === 0) {
        apex.debug.log('apexDropzone.handlePluginEvents - complete event');
        apex.event.trigger('#' + pRegionId, 'dropzone-upload-complete');
      }
    });
  },
  /**
   * Plugin Handler - Called from Plugin Render
   * @param {string} pRegionId
   * @param {object} pOptions
   */
  pluginHandler: function(pRegionId, pOptions) {
    var region$ = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
    var region = apex.util.escapeCSS(pRegionId + '_dropzone');

    var ajaxIdentifier = pOptions.ajaxIdentifier;
    var maxFileSize = parseFloat(pOptions.maxFilesize);
    var maxFiles = parseInt(pOptions.maxFiles);
    var acceptedFiles = pOptions.acceptedFiles;
    var uploadMechanism = pOptions.uploadMechanism;
    var clickable = apexDropzone.parseBoolean(pOptions.clickable);
    var showFilePreview = apexDropzone.parseBoolean(pOptions.showFilePreview);
    var supportCopyPaste = apexDropzone.parseBoolean(pOptions.supportCopyPaste);
    var removeAfterUpload = apexDropzone.parseBoolean(pOptions.removeAfterUpload);
    var deleteFiles = apexDropzone.parseBoolean(pOptions.deleteFiles);
    var resizeImages = apexDropzone.parseBoolean(pOptions.resizeImages);
    var resizeWidth = parseInt(pOptions.resizeWidth);
    var resizeHeight = parseInt(pOptions.resizeHeight);
    var pluginPrefix = pOptions.pluginPrefix;
    var chunkSize = parseInt(pOptions.chunkSize);
    var displayMessage = pOptions.displayMessage;
    var fallbackMessage = pOptions.fallbackMessage;
    var fileTooBigMessage = pOptions.fileTooBigMessage;
    var maxFilesMessage = pOptions.maxFilesMessage;
    var removeFileMessage = pOptions.removeFileMessage;
    var cancelUploadMessage = pOptions.cancelUploadMessage;
    var cancelUploadConfirmMessage = pOptions.cancelUploadConfirmMessage;
    var invalidFileTypeMessage = pOptions.invalidFileTypeMessage;
    // Logging
    apex.debug.log('apexDropzone.pluginHandler - pRegionId', pRegionId);
    apex.debug.log('apexDropzone.pluginHandler - pOptions', pOptions);
    apex.debug.log('apexDropzone.pluginHandler - region', region);
    apex.debug.log('apexDropzone.pluginHandler - region$', region$);
    apex.debug.log('apexDropzone.pluginHandler - ajaxIdentifier', ajaxIdentifier);
    apex.debug.log('apexDropzone.pluginHandler - maxFileSize', maxFileSize);
    apex.debug.log('apexDropzone.pluginHandler - maxFiles', maxFiles);
    apex.debug.log('apexDropzone.pluginHandler - acceptedFiles', acceptedFiles);
    apex.debug.log('apexDropzone.pluginHandler - uploadMechanism', uploadMechanism);
    apex.debug.log('apexDropzone.pluginHandler - clickable', clickable);
    apex.debug.log('apexDropzone.pluginHandler - showFilePreview', showFilePreview);
    apex.debug.log('apexDropzone.pluginHandler - supportCopyPaste', supportCopyPaste);
    apex.debug.log('apexDropzone.pluginHandler - removeAfterUpload', removeAfterUpload);
    apex.debug.log('apexDropzone.pluginHandler - deleteFiles', deleteFiles);
    apex.debug.log('apexDropzone.pluginHandler - resizeImages', resizeImages);
    apex.debug.log('apexDropzone.pluginHandler - resizeWidth', resizeWidth);
    apex.debug.log('apexDropzone.pluginHandler - resizeHeight', resizeHeight);
    apex.debug.log('apexDropzone.pluginHandler - pluginPrefix', pluginPrefix);
    apex.debug.log('apexDropzone.pluginHandler - chunkSize', chunkSize);
    apex.debug.log('apexDropzone.pluginHandler - displayMessage', displayMessage);
    apex.debug.log('apexDropzone.pluginHandler - fallbackMessage', fallbackMessage);
    apex.debug.log('apexDropzone.pluginHandler - fileTooBigMessage', fileTooBigMessage);
    apex.debug.log('apexDropzone.pluginHandler - maxFilesMessage', maxFilesMessage);
    apex.debug.log('apexDropzone.pluginHandler - removeFileMessage', removeFileMessage);
    apex.debug.log('apexDropzone.pluginHandler - cancelUploadMessage', cancelUploadMessage);
    apex.debug.log('apexDropzone.pluginHandler - cancelUploadConfirmMessage', cancelUploadConfirmMessage);
    apex.debug.log('apexDropzone.pluginHandler - invalidFileTypeMessage', invalidFileTypeMessage);
    // imageResize: resizeWidth & resizeHeight
    var lResizeWidth;
    var lResizeHeight;
    if (resizeImages) {
      lResizeWidth = resizeWidth || null;
      lResizeHeight = resizeHeight || null;
    } else {
      lResizeWidth = null;
      lResizeHeight = null;
    }
    // DROPZONE Options
    var dzOptions = {
      // NOT USED: required params, but uploading function uses plugin process
      url: window.location.href.substr(0, window.location.href.indexOf('/f?p=') + 1) + 'wwv_flow.show',
      // dropzone parameters
      uploadMultiple: false,
      autoProcessQueue: true,
      parallelUploads: 1,
      addRemoveLinks: deleteFiles,
      maxFilesize: maxFileSize,
      clickable: clickable,
      maxFiles: maxFiles,
      acceptedFiles: acceptedFiles,
      resizeWidth: lResizeWidth,
      resizeHeight: lResizeHeight,
      dictDefaultMessage: displayMessage,
      dictFallbackMessage: fallbackMessage,
      dictFileTooBig: fileTooBigMessage,
      dictMaxFilesExceeded: maxFilesMessage,
      dictRemoveFile: removeFileMessage,
      dictCancelUpload: cancelUploadMessage,
      dictCancelUploadConfirmation: cancelUploadConfirmMessage,
      dictInvalidFileType: invalidFileTypeMessage
    };
    // DROPZONE
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone('div#' + region, dzOptions);

    // disable clickable element
    if (!(clickable)) {
      $('.dz-hidden-input').prop('disabled', true);
    }

    // Copy&Paste support
    if (supportCopyPaste) {
      FileReaderJS.setupClipboard(document.body, {
        readAsDefault: "DataURL",
        accept: {
          'image/*': 'DataURL'
        },
        on: {
          load: function(e, file) {
            // add file and process queue when pasting
            myDropzone.addFile(file);
          }
        }
      });
    }

    // overwrite dropzone default upload function
    myDropzone.uploadFiles = function(files) {
      if (uploadMechanism == 'NORMAL') {
        apexDropzone.uploadDzFiles(pRegionId, ajaxIdentifier, myDropzone, files);
      } else if (uploadMechanism == 'CHUNKED') {
        apexDropzone.uploadDzFilesChunked(pRegionId, ajaxIdentifier, myDropzone, files, chunkSize);
      }

    };

    // handle plugin events
    apexDropzone.handlePluginEvents(myDropzone, pRegionId);

    // Delete Files
    if (deleteFiles) {
      myDropzone.on("removedfile", function(file) {
        // delete file
        apexDropzone.deleteDzFile(pRegionId, ajaxIdentifier, myDropzone, file);
      });
    }

    // On addedfile: preview images / callback event
    myDropzone.on("addedfile", function(file) {
      // add preview images to common file types
      if (showFilePreview) {
        // only if not an image
        if (!(file.type.match(/image.*/))) {
          var ext = file.name.split('.').pop();
          var url = pOptions.pluginPrefix + "img/" + ext + ".png";
          // check if image exists
          apexDropzone.imageExists(url,
            function() {
              $(file.previewElement).find(".dz-image img").attr("src", pOptions.pluginPrefix + "img/" + ext + ".png");
            },
            function() {
              $(file.previewElement).find(".dz-image img").attr("src", pOptions.pluginPrefix + "img/other.png");
            });
        }
      }
    });

    // After complete: clear dropzone data
    myDropzone.on("complete", function() {
      if (myDropzone.getQueuedFiles().length === 0 && myDropzone.getUploadingFiles().length === 0) {
        // remove all files after upload is complete
        if (removeAfterUpload) {
          // wait 3 secs
          setTimeout(function() {
            myDropzone.removeAllFiles();
          }, 3000);
        }
      }
    });
  }
};

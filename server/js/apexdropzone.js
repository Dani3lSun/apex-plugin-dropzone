/*
APEX Dropzone JS
Author: Daniel Hochleitner
Version: 2.0.3
*/

// global namespace
var apexDropzone = {
    // parse string to boolean
    parseBoolean: function(pString) {
        var pBoolean;
        if (pString.toLowerCase() == 'true') {
            pBoolean = true;
        }
        if (pString.toLowerCase() == 'false') {
            pBoolean = false;
        }
        if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
            pBoolean = undefined;
        }
        return pBoolean;
    },
    // check if image file exists
    imageExists: function(url, good, bad) {
        try {
            var img = new Image();
            img.onload = good;
            img.onerror = bad;
            img.src = url;
        } catch (err) {
            console.log(err);
        }
    },
    // builds a js array from long string
    clob2Array: function(clob, size, array) {
        loopCount = Math.floor(clob.length / size) + 1;
        for (var i = 0; i < loopCount; i++) {
            array.push(clob.slice(size * i, size * (i + 1)));
        }
        return array;
    },
    // converts binaryArray to base64 string
    binaryArray2base64: function(int8Array) {
        var data = "";
        var bytes = new Uint8Array(int8Array);
        var length = bytes.byteLength;
        for (var i = 0; i < length; i++) {
            data += String.fromCharCode(bytes[i]);
        }
        return btoa(data);
    },
    // sleep function (hack to ensure server gets right file (lot of small files))
    sleepUntil: function(pMillseconds) {
        var vMaxSec = new Date().getTime();
        while (new Date() < vMaxSec + pMillseconds) {}
        return true;
    },
    // Set upload progress function
    setUploadProgress: function(pEvent, pDropzone, pFile) {
        if (!pEvent) {
            pEvent = window.event;
        }
        if (pEvent.lengthComputable) {
            var percentComplete = (pEvent.loaded / pEvent.total) * 100;
            pDropzone.emit('uploadprogress', pFile, percentComplete, pFile.size / (100 / percentComplete));
        }
    },
    // Set upload progress function for chunked upload
    setUploadProgressChunked: function(pEvent, pDropzone, pCurrentChunk, pChunkCount, pFile) {
        if (!pEvent) {
            pEvent = window.event;
        }
        if (pEvent.lengthComputable) {
            var percentComplete = (pCurrentChunk / pChunkCount) * 100;
            percentComplete = percentComplete + ((pEvent.loaded / pEvent.total) * 100) / pChunkCount;
            pDropzone.emit('uploadprogress', pFile, percentComplete, pFile.size / (100 / percentComplete));
        }
    },
    // Asynchronous Loop Function
    asyncLoop: function(iterations, func, callback) {
        var index = 1;
        var done = false;
        var loop = {
            next: function() {
                if (done) {
                    return;
                }
                if (index <= iterations) {
                    index++;
                    func(loop);
                } else {
                    done = true;
                    callback();
                }
            },
            iteration: function() {
                return index - 1;
            },
            break: function() {
                done = true;
                callback();
            }
        };
        loop.next();
        return loop;
    },
    // file upload function
    uploadDzFiles: function(pRegionId, pDropzone, pFiles, pAjaxIdentifier, pWaitTime) {
        // go through files
        for (var i = 0; i < pFiles.length; i++) {
            var file = pFiles[i];
            // Filereader => file to Binary to base64
            var reader = new FileReader();
            reader.onload = (function(pFile) {
                return function(e) {
                    if (pFile) {
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
                                //sleep hack for large number of small files
                                apexDropzone.sleepUntil(pWaitTime);
                                // check status
                                var vJsonReturn;
                                try {
                                    vJsonReturn = jQuery.parseJSON(pData);
                                } catch (err) {
                                    apex.debug.log('uploadDzFiles Response ParseError', err);
                                    vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "uploadDzFiles Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
                                }
                                // response error
                                if (vJsonReturn.status == 'error') {
                                    // APEX event
                                    apex.debug.log('uploadDzFiles Error', vJsonReturn.message, vJsonReturn.code);
                                    apex.event.trigger('#' + pRegionId, 'dropzone-upload-error', vJsonReturn);
                                    // file status
                                    file.status = Dropzone.ERROR;
                                    pDropzone.emit("error", file, "Database error during file upload");
                                    // response success
                                } else if (vJsonReturn.status == 'success') {
                                    // set file id to return id
                                    file.id = vJsonReturn.id;
                                    // APEX event
                                    apex.debug.log('uploadDzFiles Success', vJsonReturn.message);
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
                                //sleep hack for large number of small files
                                apexDropzone.sleepUntil(pWaitTime);
                                // APEX event
                                apex.debug.log('uploadDzFiles Error', pMessage);
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
                                    console.log("Upload progress is not supported.");
                                }
                                return XhrObj;
                            }
                        });
                        // if file not found: process queue
                    } else {
                        //sleep hack for large number of small files
                        apexDropzone.sleepUntil(pWaitTime);
                        pDropzone.processQueue();
                    }
                };
            })(file);
            reader.readAsArrayBuffer(file);
        }
    },
    // file upload function for chunked upload
    uploadDzFilesChunked: function(pRegionId, pDropzone, pFiles, pAjaxIdentifier, pWaitTime) {
        // go through files
        for (var i = 0; i < pFiles.length; i++) {
            var file = pFiles[i];
            // Filereader => file to Binary to base64
            var reader = new FileReader();
            reader.onload = (function(pFile) {
                return function(e) {
                    if (pFile) {
                        var fileChunk;
                        var fileChunkBase64;
                        var currentChunk;
                        var chunkSize = 1024 * 1024;
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
                                    var fileChunkBase64 = apexDropzone.binaryArray2base64(eChunk.target.result);

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
                                            //sleep hack for large number of small files (only if last chunk was successful)
                                            if (currentChunk == fileChunkCount) {
                                                apexDropzone.sleepUntil(pWaitTime);
                                            }
                                            // check server status
                                            var vJsonReturn;
                                            try {
                                                vJsonReturn = jQuery.parseJSON(pData);
                                            } catch (err) {
                                                apex.debug.log('uploadDzFilesChunked Response ParseError', err);
                                                vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "uploadDzFilesChunked Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
                                            }
                                            // response error
                                            if (vJsonReturn.status == 'error') {
                                                // APEX event
                                                apex.debug.log('uploadDzFilesChunked Error', vJsonReturn.message, vJsonReturn.code);
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
                                                apex.debug.log('uploadDzFilesChunked Success', vJsonReturn.message);
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
                                            // next loop iteration
                                            loop.next();
                                        },
                                        // ERROR function
                                        error: function(xhr, pMessage) {
                                            //sleep hack for large number of small files
                                            apexDropzone.sleepUntil(pWaitTime);
                                            // APEX event
                                            apex.debug.log('uploadDzFilesChunked Error', pMessage);
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
                                                    apexDropzone.setUploadProgressChunked(event, pDropzone, currentChunk, fileChunkCount, file);
                                                }, false);
                                            } else {
                                                console.log("Upload progress is not supported.");
                                            }
                                            return XhrObj;
                                        }
                                    });
                                };
                            })(fileChunk);
                            reader.readAsArrayBuffer(fileChunk);

                        }, function() {
                            apex.debug.log('uploadDzFilesChunked Loop ended');
                        });
                        // if file not found: process queue
                    } else {
                        //sleep hack for large number of small files
                        apexDropzone.sleepUntil(pWaitTime);
                        pDropzone.processQueue();
                    }
                };
            })(file);
            reader.readAsArrayBuffer(file);
        }
    },
    // file delete function
    deleteDzFile: function(pRegionId, pDropzone, pFile, pAjaxIdentifier) {
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
                    apex.debug.log('deleteDzFile Response ParseError', err);
                    vJsonReturn = jQuery.parseJSON('{ "status": "error", "message": "deleteDzFile Response ParseError", "code": "AJAX Callback (pData) ParseError" }');
                }
                // response error
                if (vJsonReturn.status == 'error') {
                    // APEX event
                    apex.debug.log('deleteDzFile Error', vJsonReturn.message, vJsonReturn.code);
                    apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', vJsonReturn);
                    // response success
                } else if (vJsonReturn.status == 'success') {
                    // APEX event
                    apex.debug.log('deleteDzFile Success', vJsonReturn.message);
                    apex.event.trigger('#' + pRegionId, 'dropzone-delete-success', pData);
                }
            },
            // ERROR function
            error: function(xhr, pMessage) {
                // APEX event
                apex.debug.log('deleteDzFile Error', pMessage);
                apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', pMessage);
            }
        });
    },
    // function that gets called from plugin
    apexDropzoneFnc: function(pRegionId, pOptions) {
        var vOptions = pOptions;
        var vRegion$ = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
        var vRegion = apex.util.escapeCSS(pRegionId + '_dropzone');

        var vAjaxIdentifier = vOptions.ajaxIdentifier;
        var vMaxFileSize = parseFloat(vOptions.maxFilesize);
        var vMaxFiles = parseInt(vOptions.maxFiles);
        var vParallelUploads = parseInt(vOptions.parallelUploads);
        var vAcceptedFiles = vOptions.acceptedFiles;
        var vWaitTime = parseInt(vOptions.waitTime);
        var vUploadMechanism = vOptions.uploadMechanism;
        var vClickable = apexDropzone.parseBoolean(vOptions.clickable);
        var vShowFilePreview = apexDropzone.parseBoolean(vOptions.showFilePreview);
        var vCopyPaste = apexDropzone.parseBoolean(vOptions.supportCopyPaste);
        var vRemoveAfterUpload = apexDropzone.parseBoolean(vOptions.removeAfterUpload);
        var vDeleteFiles = apexDropzone.parseBoolean(vOptions.deleteFiles);
        var vPluginPrefix = vOptions.pluginPrefix;
        var vDisplayMessage = vOptions.displayMessage;
        var vFallbackMessage = vOptions.fallbackMessage;
        var vFileTooBigMessage = vOptions.fileTooBigMessage;
        var vMaxFilesMessage = vOptions.maxFilesMessage;
        var vRemoveFileMessage = vOptions.removeFileMessage;
        var vCancelUploadMessage = vOptions.cancelUploadMessage;
        var vCancelUploadConfirmMessage = vOptions.cancelUploadConfirmMessage;
        var vInvalidFileTypeMessage = vOptions.invalidFileTypeMessage;
        // Logging
        apex.debug.log('apexDropzoneFnc - pRegionId', pRegionId);
        apex.debug.log('apexDropzoneFnc - pOptions', pOptions);
        apex.debug.log('apexDropzoneFnc - vRegion', vRegion);
        apex.debug.log('apexDropzoneFnc - vRegion$', vRegion$);
        apex.debug.log('apexDropzoneFnc - vAjaxIdentifier', vAjaxIdentifier);
        apex.debug.log('apexDropzoneFnc - vMaxFileSize', vMaxFileSize);
        apex.debug.log('apexDropzoneFnc - vMaxFiles', vMaxFiles);
        apex.debug.log('apexDropzoneFnc - vParallelUploads', vParallelUploads);
        apex.debug.log('apexDropzoneFnc - vAcceptedFiles', vAcceptedFiles);
        apex.debug.log('apexDropzoneFnc - vWaitTime', vWaitTime);
        apex.debug.log('apexDropzoneFnc - vUploadMechanism', vUploadMechanism);
        apex.debug.log('apexDropzoneFnc - vClickable', vClickable);
        apex.debug.log('apexDropzoneFnc - vShowFilePreview', vShowFilePreview);
        apex.debug.log('apexDropzoneFnc - vCopyPaste', vCopyPaste);
        apex.debug.log('apexDropzoneFnc - vRemoveAfterUpload', vRemoveAfterUpload);
        apex.debug.log('apexDropzoneFnc - vPluginPrefix', vPluginPrefix);
        apex.debug.log('apexDropzoneFnc - vDisplayMessage', vDisplayMessage);
        apex.debug.log('apexDropzoneFnc - vFileTooBigMessage', vFileTooBigMessage);
        apex.debug.log('apexDropzoneFnc - vMaxFilesMessage', vMaxFilesMessage);
        apex.debug.log('apexDropzoneFnc - vRemoveFileMessage', vRemoveFileMessage);
        apex.debug.log('apexDropzoneFnc - vCancelUploadMessage', vCancelUploadMessage);
        apex.debug.log('apexDropzoneFnc - vCancelUploadConfirmMessage', vCancelUploadConfirmMessage);
        apex.debug.log('apexDropzoneFnc - vInvalidFileTypeMessage', vInvalidFileTypeMessage);
        // DROPZONE
        Dropzone.autoDiscover = false;
        var myDropzone = new Dropzone('div#' + vRegion, {
            // NOT USED: required params, but uploading function uses plugin process
            url: window.location.href.substr(0, window.location.href.indexOf('/f?p=') + 1) + 'wwv_flow.show',
            // dropzone parameters
            uploadMultiple: false,
            autoProcessQueue: true,
            addRemoveLinks: vDeleteFiles,
            parallelUploads: vParallelUploads,
            maxFilesize: vMaxFileSize,
            clickable: vClickable,
            maxFiles: vMaxFiles,
            acceptedFiles: vAcceptedFiles,
            dictDefaultMessage: vDisplayMessage,
            dictFileTooBig: vFileTooBigMessage,
            dictMaxFilesExceeded: vMaxFilesMessage,
            dictRemoveFile: vRemoveFileMessage,
            dictCancelUpload: vCancelUploadMessage,
            dictCancelUploadConfirmation: vCancelUploadConfirmMessage,
            dictInvalidFileType: vInvalidFileTypeMessage
        });
        // disable clickable element
        if (!(vClickable)) {
            $('.dz-hidden-input').prop('disabled', true);
        }
        // Copy&Paste support
        if (vCopyPaste) {
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
            if (vUploadMechanism == 'NORMAL') {
                apexDropzone.uploadDzFiles(pRegionId, myDropzone, files, vAjaxIdentifier, vWaitTime);
            } else if (vUploadMechanism == 'CHUNKED') {
                apexDropzone.uploadDzFilesChunked(pRegionId, myDropzone, files, vAjaxIdentifier, vWaitTime);
            }

        };
        // EVENTS
        // Delete Files
        if (vDeleteFiles) {
            myDropzone.on("removedfile", function(file) {
                // add apex event
                apex.event.trigger('#' + pRegionId, 'dropzone-deleted-file', file);
                // delete file
                apexDropzone.deleteDzFile(pRegionId, myDropzone, file, vAjaxIdentifier);
            });
        }
        // On addedfile: apex event / preview images / callback event
        myDropzone.on("addedfile", function(file) {
            // add apex event
            apex.event.trigger('#' + pRegionId, 'dropzone-added-file', file);
            // add preview images to common file types
            if (vShowFilePreview) {
                // only if not an image
                if (!(file.type.match(/image.*/))) {
                    var ext = file.name.split('.').pop();
                    var url = vOptions.pluginPrefix + "img/" + ext + ".png";
                    // check if image exists
                    apexDropzone.imageExists(url,
                        function() {
                            $(file.previewElement).find(".dz-image img").attr("src", vOptions.pluginPrefix + "img/" + ext + ".png");
                        },
                        function() {
                            $(file.previewElement).find(".dz-image img").attr("src", vOptions.pluginPrefix + "img/other.png");
                        });
                }
            }
        });
        // After maxFiles exceeded event
        myDropzone.on('maxfilesexceeded', function(file) {
            // add apex event
            apex.event.trigger('#' + pRegionId, 'dropzone-maxfiles-exceeded', file);
        });
        // Total upload progress
        myDropzone.on('totaluploadprogress', function(totalPercentage) {
            // add apex event
            apex.event.trigger('#' + pRegionId, 'dropzone-totalupload-progress', totalPercentage);
        });
        // After a user drags a file over the dropzone
        myDropzone.on('dragenter', function() {
            // add apex event
            apex.event.trigger('#' + pRegionId, 'dropzone-drag-over');
        });
        // After an file error occured
        myDropzone.on('error', function(file, errorMessage) {
            // add apex event
            file.errorMessage = errorMessage;
            apex.event.trigger('#' + pRegionId, 'dropzone-file-error', file);
        });
        // After complete: apex event / clear dropzone data
        myDropzone.on("complete", function() {
            if (myDropzone.getQueuedFiles().length === 0 && myDropzone.getUploadingFiles().length === 0) {
                // add apex event
                apex.event.trigger('#' + pRegionId, 'dropzone-upload-complete');
                // remove all files after upload is complete
                if (vRemoveAfterUpload) {
                    // wait 3 secs
                    setTimeout(function() {
                        myDropzone.removeAllFiles();
                    }, 3000);
                }
            }
        });
    }
};

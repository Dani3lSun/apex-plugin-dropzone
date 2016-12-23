// APEX Dropzone functions
// Author: Daniel Hochleitner
// Version: 1.9.5

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
    sleep_until: function(pMillseconds) {
        var vMaxSec = new Date().getTime();
        while (new Date() < vMaxSec + pMillseconds) {}
        return true;
    },
    // callback function
    doCallback: function(callback) {
        if (typeof callback === "function") {
            callback();
        }
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
    // build array for page items to submit
    buildPageItemsArray: function(pPageItems) {
        var vArrayPageItems = [];
        pPageItems = pPageItems.replace(/#/g, '');
        vArrayPageItems = pPageItems.split(',');
        return vArrayPageItems;
    },
    // build array for page item values
    buildPageItemValuesArray: function(pPageItemsArray) {
        var vArrayPageItemValues = [];
        for (var i = 0; i < pPageItemsArray.length; i++) {
            vArrayPageItemValues.push($v(vArrayPageItems[i]));
        }
        return vArrayPageItemValues;
    },
    // file upload function
    uploadDzFiles: function(pRegionId, pDropzone, pFiles, pPageItems, pAjaxIdentifier, pWaitTime) {
        // get page items to submit
        var vArrayPageItems = [];
        var vArrayPageItemValues = [];
        if (pPageItems) {
            vArrayPageItems = apexDropzone.buildPageItemsArray(pPageItems);
            vArrayPageItemValues = apexDropzone.buildPageItemValuesArray(vArrayPageItems);
        }
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
                        apex.jQuery.ajax({
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
                                p_arg_names: vArrayPageItems,
                                p_arg_values: vArrayPageItemValues,
                                p_request: 'PLUGIN=' + pAjaxIdentifier,
                                p_flow_id: $v('pFlowId'),
                                p_flow_step_id: $v('pFlowStepId'),
                                p_instance: $v('pInstance'),
                                p_debug: $v('pdebug')
                            },
                            // SUCCESS function
                            success: function(pData) {
                                //sleep hack for large number of small files
                                apexDropzone.sleep_until(pWaitTime);
                                // APEX event
                                if (pData.indexOf('sqlerrm') >= 0) {
                                    apex.event.trigger('#' + pRegionId, 'dropzone-upload-error', pData);
                                } else {
                                    apex.event.trigger('#' + pRegionId, 'dropzone-upload-success', pData);
                                }
                                // set file status SUCCESS / UPLOAD 100%
                                pDropzone.emit('uploadprogress', file, 100, file.size);
                                file.status = Dropzone.SUCCESS;
                                pDropzone.emit("success", file, 'success', null);
                                pDropzone.emit("complete", file);
                                // process file queue
                                pDropzone.processQueue();
                            },
                            // ERROR function
                            error: function(xhr, pMessage) {
                                //sleep hack for large number of small files
                                apexDropzone.sleep_until(pWaitTime);
                                // APEX event
                                apex.event.trigger('#' + pRegionId, 'dropzone-upload-error', pMessage);
                                // set file status ERROR
                                file.status = Dropzone.ERROR;
                                // build message for error template
                                var message = "";
                                if (pMessage === null || pMessage === undefined) {
                                    message = 'Error processing file.';
                                } else {
                                    message = pMessage;
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
                        apexDropzone.sleep_until(pWaitTime);
                        pDropzone.processQueue();
                    }
                };
            })(file);
            reader.readAsArrayBuffer(file);
        }
    },
    // file delete function
    deleteDzFile: function(pRegionId, pDropzone, pFile, pPageItems, pAjaxIdentifier) {
        // get page items to submit
        var vArrayPageItems = [];
        var vArrayPageItemValues = [];
        if (pPageItems) {
            vArrayPageItems = apexDropzone.buildPageItemsArray(pPageItems);
            vArrayPageItemValues = apexDropzone.buildPageItemValuesArray(vArrayPageItems);
        }
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
                p_arg_names: vArrayPageItems,
                p_arg_values: vArrayPageItemValues,
                p_request: 'PLUGIN=' + pAjaxIdentifier,
                p_flow_id: $v('pFlowId'),
                p_flow_step_id: $v('pFlowStepId'),
                p_instance: $v('pInstance'),
                p_debug: $v('pdebug')
            },
            // SUCCESS function
            success: function(pData) {
                // APEX event
                if (pData.indexOf('sqlerrm') >= 0) {
                    apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', pData);
                } else {
                    apex.event.trigger('#' + pRegionId, 'dropzone-delete-success', pData);
                }
            },
            // ERROR function
            error: function(xhr, pMessage) {
                // APEX event
                apex.event.trigger('#' + pRegionId, 'dropzone-delete-error', pMessage);
            }
        });
    },
    // function that gets called from plugin
    apexDropzoneFnc: function(pRegionId, pOptions, pLogging) {
        var vOptions = pOptions;
        var vRegion$ = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
        var vRegion = apex.util.escapeCSS(pRegionId + '_dropzone');
        var vlogging = apexDropzone.parseBoolean(pLogging);
        var vClickable = apexDropzone.parseBoolean(vOptions.clickable);
        var vMaxFileSize = parseFloat(vOptions.maxFilesize);
        var vRemoveAfterUpload = apexDropzone.parseBoolean(vOptions.removeAfterUpload);
        var vMaxFiles = parseInt(vOptions.maxFiles);
        var vCopyPaste = apexDropzone.parseBoolean(vOptions.supportCopyPaste);
        var vWaitTime = parseInt(vOptions.waitTime);
        var vParallelUploads = parseInt(vOptions.parallelUploads);
        var vCommonFilePreview = apexDropzone.parseBoolean(vOptions.commonFilePreview);
        var vDeleteFiles = apexDropzone.parseBoolean(vOptions.deleteFiles);
        var vPageItems = vOptions.pageItems;
        // Logging
        if (vlogging) {
            console.log('dropzoneApex: vOptions.ajaxIdentifier:', vOptions.ajaxIdentifier);
            console.log('dropzoneApex: vOptions.pageItems:', vOptions.pageItems);
            console.log('dropzoneApex: vOptions.maxFilesize:', vOptions.maxFilesize);
            console.log('dropzoneApex: vOptions.clickable:', vOptions.clickable);
            console.log('dropzoneApex: vOptions.removeAfterUpload:', vOptions.removeAfterUpload);
            console.log('dropzoneApex: vOptions.defaultMessage:', vOptions.defaultMessage);
            console.log('dropzoneApex: vOptions.acceptedFiles:', vOptions.acceptedFiles);
            console.log('dropzoneApex: vOptions.maxFiles:', vOptions.maxFiles);
            console.log('dropzoneApex: vOptions.parallelUploads:', vOptions.parallelUploads);
            console.log('dropzoneApex: vOptions.refreshRegionID:', vOptions.refreshRegionID);
            console.log('dropzoneApex: vOptions.supportCopyPaste:', vOptions.supportCopyPaste);
            console.log('dropzoneApex: vOptions.waitTime:', vOptions.waitTime);
            console.log('dropzoneApex: vOptions.commonFilePreview:', vOptions.commonFilePreview);
            console.log('dropzoneApex: vOptions.callbackEvent:', vOptions.callbackEvent);
            console.log('dropzoneApex: vOptions.callbackFnc:', vOptions.callbackFnc);
            console.log('dropzoneApex: vOptions.pluginPrefix:', vOptions.pluginPrefix);
            console.log('dropzoneApex: vOptions.fileTooBigMessage:', vOptions.fileTooBigMessage);
            console.log('dropzoneApex: vOptions.maxFilesMessage:', vOptions.maxFilesMessage);
            console.log('dropzoneApex: vOptions.deleteFiles:', vOptions.deleteFiles);
            console.log('dropzoneApex: vOptions.cancelUploadMessage:', vOptions.cancelUploadMessage);
            console.log('dropzoneApex: vOptions.removeFileMessage:', vOptions.removeFileMessage);
            console.log('dropzoneApex: pRegionId:', pRegionId);
            console.log('dropzoneApex: vRegion:', vRegion);
            console.log('dropzoneApex: vRegion$:', vRegion$);
        }
        // DROPZONE
        Dropzone.autoDiscover = false;
        var myDropzone = new Dropzone('div#' + vRegion,
            // NOT USED: required params, but uploading function uses plugin process
            {
                paramName: "p_clob_01",
                url: "wwv_flow.show",
                params: {
                    p_instance: $v('pInstance'),
                    p_flow_id: $v('pFlowId'),
                    p_flow_step_id: $v('pFlowStepId')
                },
                // dropzone parameters
                addRemoveLinks: vDeleteFiles,
                parallelUploads: vParallelUploads,
                uploadMultiple: false,
                autoProcessQueue: true,
                maxFilesize: vMaxFileSize,
                dictDefaultMessage: vOptions.defaultMessage,
                clickable: vClickable,
                maxFiles: vMaxFiles,
                acceptedFiles: vOptions.acceptedFiles,
                dictFileTooBig: vOptions.fileTooBigMessage,
                dictMaxFilesExceeded: vOptions.maxFilesMessage,
                dictCancelUpload: vOptions.cancelUploadMessage,
                dictRemoveFile: vOptions.removeFileMessage
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
            apexDropzone.uploadDzFiles(pRegionId, myDropzone, files, vPageItems, vOptions.ajaxIdentifier, vWaitTime);
        };
        // EVENTS
        // Delete Files
        if (vDeleteFiles) {
            myDropzone.on("removedfile", function(file) {
                apexDropzone.deleteDzFile(pRegionId, myDropzone, file, vPageItems, vOptions.ajaxIdentifier);
            });
        }
        // On addedfile: apex event / preview images / callback event
        myDropzone.on("addedfile", function(file) {
            // add apex event
            apex.event.trigger('#' + pRegionId, 'dropzone-added-file', file);
            // add preview images to common file types
            if (vCommonFilePreview) {
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
            // callback function on added file
            if (vOptions.callbackEvent == 'ADDEDFILE') {
                try {
                    var fncString = "return " + vOptions.callbackFnc.replace(/;+$/, '') + ";";
                    var customFnc = new Function(fncString)();
                    apexDropzone.doCallback(customFnc(file));
                } catch (err) {
                    console.log(err);
                }
            }
        });
        // After complete: apex event / callback event / clear dropzone data / refresh region
        myDropzone.on("complete", function() {
            if (myDropzone.getQueuedFiles().length === 0 && myDropzone.getUploadingFiles().length === 0) {
                // add apex event
                apex.event.trigger('#' + pRegionId, 'dropzone-upload-complete');
                // callback function on complete
                if (vOptions.callbackEvent == 'COMPLETE') {
                    try {
                        var fncString = "return " + vOptions.callbackFnc.replace(/;+$/, '') + ";";
                        var customFnc = new Function(fncString)();
                        apexDropzone.doCallback(customFnc());
                    } catch (err) {
                        console.log(err);
                    }
                }
                // remove all files after upload is complete
                if (vRemoveAfterUpload) {
                    // wait 3 secs
                    setTimeout(function() {
                        myDropzone.removeAllFiles();
                    }, 3000);
                }
                // refresh region after upload is complete
                if (vOptions.refreshRegionID) {
                    // wait 2 secs
                    setTimeout(function() {
                        apex.event.trigger('#' + vOptions.refreshRegionID, 'apexrefresh');
                    }, 2000);
                }
            }
        });
    }
};

// APEX Dropzone functions
// Author: Daniel Hochleitner
// Version: 1.9.2

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
    var img = new Image();
    img.onload = good;
    img.onerror = bad;
    img.src = url;
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
  // function that gets called from plugin
  apexDropzoneFnc: function(pRegionId, pOptions, pLogging) {
    var vOptions = pOptions;
    var vRegion$ = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
    var vRegion = apex.util.escapeCSS(pRegionId + '_dropzone');
    var vlogging = apexDropzone.parseBoolean(pLogging);
    var vClickable = apexDropzone.parseBoolean(vOptions.clickable);
    var vMaxFileSize = parseInt(vOptions.maxFilesize);
    var vRemoveAfterUpload = apexDropzone.parseBoolean(vOptions.removeAfterUpload);
    var vMaxFiles = parseInt(vOptions.maxFiles);
    var vCopyPaste = apexDropzone.parseBoolean(vOptions.supportCopyPaste);
    var vWaitTime = parseInt(vOptions.waitTime);
    var vParallelUploads = parseInt(vOptions.parallelUploads);
    var vCommonFilePreview = apexDropzone.parseBoolean(vOptions.commonFilePreview);
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
        addRemoveLinks: false,
        parallelUploads: vParallelUploads,
        uploadMultiple: false,
        autoProcessQueue: true,
        maxFilesize: vMaxFileSize,
        dictDefaultMessage: vOptions.defaultMessage,
        clickable: vClickable,
        maxFiles: vMaxFiles,
        acceptedFiles: vOptions.acceptedFiles,
        dictFileTooBig: vOptions.fileTooBigMessage,
        dictMaxFilesExceeded: vOptions.maxFilesMessage
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
    // On addedfile: apex event / preview images / callback event
    myDropzone.on("addedfile", function(file) {
      // add apex event
      $('#' + pRegionId).trigger('dropzone-added-file');
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
        var fncString = "return " + vOptions.callbackFnc.replace(/;+$/, '') + ";";
        var customFnc = new Function(fncString)();
        apexDropzone.doCallback(customFnc(file));
      }
    });
    // overwrite dropzone default upload function
    myDropzone.uploadFiles = function(files) {
      // go through files
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        //set upload progress 10%
        myDropzone.emit('uploadprogress', file, 10, file.size / 10);
        // Filereader => file to Binary to base64
        var reader = new FileReader();
        reader.onload = (function(pfile) {
          return function(e) {
            if (pfile) {
              // BinaryInt8Array to base64
              var base64 = apexDropzone.binaryArray2base64(e.target.result);
              //set upload progress 25%
              myDropzone.emit('uploadprogress', file, 25, file.size / 4);
              // split base64 clob string to f01 array length 30k
              var f01Array = [];
              f01Array = apexDropzone.clob2Array(base64, 30000, f01Array);
              //set upload progress 50%
              myDropzone.emit('uploadprogress', file, 50, file.size / 2);
              // AJAX call apex.server.plugin and process file queue if success
              apex.server.plugin(vOptions.ajaxIdentifier, {
                x01: file.name,
                x02: file.type,
                f01: f01Array,
                pageItems: vOptions.pageItems
              }, {
                dataType: 'html',
                // SUCESS function
                success: function() {
                  //sleep hack for large number of small files
                  apexDropzone.sleep_until(vWaitTime);
                  // set file status SUCCESS / UPLOAD 100%
                  myDropzone.emit('uploadprogress', file, 100, file.size);
                  file.status = Dropzone.SUCCESS;
                  myDropzone.emit("success", file, 'success', null);
                  myDropzone.emit("complete", file);
                  // process file queue
                  myDropzone.processQueue();
                },
                // ERROR function
                error: function(xhr, pMessage) {
                  //sleep hack for large number of small files
                  apexDropzone.sleep_until(vWaitTime);
                  // set file status ERROR
                  file.status = Dropzone.ERROR;
                  // build message for error template
                  var message = "";
                  if (pMessage === null || pMessage === undefined) {
                    message = 'Error processing file.';
                  } else {
                    message = pMessage;
                  }
                  myDropzone.emit("error", file, message, xhr);
                  myDropzone.emit("complete", file);
                  // process file queue
                  myDropzone.processQueue();
                }
              });
              // if file not found: process queue
            } else {
              //sleep hack for large number of small files
              apexDropzone.sleep_until(vWaitTime);
              myDropzone.processQueue();
            }
          };
        })(file);
        reader.readAsArrayBuffer(file);
      }
    };
    // After complete: apex event / callback event / clear dropzone data / refresh region
    myDropzone.on("complete", function() {
      if (myDropzone.getQueuedFiles().length === 0 && myDropzone.getUploadingFiles().length === 0) {
        // add apex event
        $('#' + pRegionId).trigger('dropzone-upload-complete');
        // callback function on complete
        if (vOptions.callbackEvent == 'COMPLETE') {
          var fncString = "return " + vOptions.callbackFnc.replace(/;+$/, '') + ";";
          new Function(fncString)();
          var customFnc = new Function(fncString)();
          apexDropzone.doCallback(customFnc());
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
          // wait 3 secs
          setTimeout(function() {
            apex.event.trigger('#' + vOptions.refreshRegionID, 'apexrefresh');
          }, 3000);
        }
      }
    });
  }
};

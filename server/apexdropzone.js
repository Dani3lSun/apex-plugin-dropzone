// APEX Dropzone functions
// Author: Daniel Hochleitner
// Version: 1.7

// parse string to boolean
function parseBoolean(pString) {
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
}
// builds a js array from long string
function clob2Array(clob,size,array){
  loopCount = Math.floor(clob.length / size) + 1;
  for (var i = 0; i < loopCount; i++) {
    array.push(clob.slice(size * i,size*(i+1)));
  }
  return array;
}
// converts binaryArray to base64 string
function binaryArray2base64(int8Array){
    var data = "";
    var bytes = new Uint8Array(int8Array);
    var length = bytes.byteLength;
    for(var i = 0; i < length; i++) {
        data += String.fromCharCode(bytes[i]);
    }
    return btoa(data);
}
// sleep function (hack to ensure server gets right file (lot of small files))
function sleep_until(pMillseconds) {
   var vMaxSec = new Date().getTime();
     while (new Date() < vMaxSec + pMillseconds) {}
      return true;
}
// function that gets called from plugin
function apexDropzone(pRegionId, pOptions, pLogging){
  var vOptions           = pOptions;
  var vRegion$           = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
  var vRegion            = apex.util.escapeCSS(pRegionId + '_dropzone');
  var vlogging           = parseBoolean(pLogging);
  var vClickable         = parseBoolean(vOptions.clickable);
  var vMaxFileSize       = parseInt(vOptions.maxFilesize);
  var vRemoveAfterUpload = parseBoolean(vOptions.removeAfterUpload);
  var vMaxFiles          = parseInt(vOptions.maxFiles);
  var vCopyPaste         = parseBoolean(vOptions.supportCopyPaste);
  var vWaitTime          = parseInt(vOptions.waitTime);
  var vParallelUploads   = parseInt(vOptions.parallelUploads);
  // Logging
  if (vlogging) {
    console.log('dropzoneApex: vOptions.ajaxIdentifier:',vOptions.ajaxIdentifier);
    console.log('dropzoneApex: vOptions.pageItems:',vOptions.pageItems);
    console.log('dropzoneApex: vOptions.maxFilesize:',vOptions.maxFilesize);
    console.log('dropzoneApex: vOptions.clickable:',vOptions.clickable);
    console.log('dropzoneApex: vOptions.removeAfterUpload:',vOptions.removeAfterUpload);
    console.log('dropzoneApex: vOptions.defaultMessage:',vOptions.defaultMessage);
    console.log('dropzoneApex: vOptions.acceptedFiles:',vOptions.acceptedFiles);
    console.log('dropzoneApex: vOptions.maxFiles:',vOptions.maxFiles);
    console.log('dropzoneApex: vOptions.parallelUploads:',vOptions.parallelUploads);
    console.log('dropzoneApex: vOptions.refreshRegionID:',vOptions.refreshRegionID);
    console.log('dropzoneApex: vOptions.supportCopyPaste:',vOptions.supportCopyPaste);
    console.log('dropzoneApex: vOptions.waitTime:',vOptions.waitTime);
    console.log('dropzoneApex: vOptions.fileTooBigMessage:',vOptions.fileTooBigMessage);
    console.log('dropzoneApex: vOptions.maxFilesMessage:',vOptions.maxFilesMessage);
    console.log('dropzoneApex: pRegionId:',pRegionId);
    console.log('dropzoneApex: vRegion:',vRegion);
    console.log('dropzoneApex: vRegion$:',vRegion$);
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
    $('.dz-hidden-input').prop('disabled',true);
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
    })  
  }
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
            var base64 = binaryArray2base64(e.target.result);
            //set upload progress 25%
            myDropzone.emit('uploadprogress', file, 25, file.size / 4);
            // split base64 clob string to f01 array length 30k
            var f01Array = [];
            f01Array = clob2Array(base64,30000,f01Array);
            //set upload progress 50%
            myDropzone.emit('uploadprogress', file, 50, file.size / 2);
            // AJAX call apex.server.plugin and process file queue if success
            apex.server.plugin(vOptions.ajaxIdentifier, {
                                  x01: file.name,
                                  x02: file.type,
                                  f01: f01Array,
                                  pageItems: vOptions.pageItems
                                  },{
                                    dataType: 'html',
                                    // SUCESS function
                                    success:function() {
                                        //sleep hack for large number of small files
                                        sleep_until(vWaitTime);
                                        // set file status SUCCESS / UPLOAD 100%
                                        myDropzone.emit('uploadprogress', file, 100, file.size);
                                        file.status = Dropzone.SUCCESS;
                                        myDropzone.emit("success", file, 'success', null);
                                        myDropzone.emit("complete", file);
                                        // process file queue
                                        myDropzone.processQueue();
                                        },
                                    // ERROR function
                                    error:function(xhr,pMessage) {
                                        //sleep hack for large number of small files
                                        sleep_until(vWaitTime);
                                        // set file status ERROR
                                        file.status = Dropzone.ERROR;
                                        // build message for error template
                                        var message = "";
                                        if (pMessage == null || pMessage == undefined) {
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
            sleep_until(vWaitTime);
            myDropzone.processQueue();
          }
        }
     })(file);
     reader.readAsArrayBuffer(file);  
    }
  }
  // After complete: clear data / refresh region
  myDropzone.on("complete", function() {
    // remove all files after upload is complete
    if (vRemoveAfterUpload) {
      if (myDropzone.getQueuedFiles().length == 0 && myDropzone.getUploadingFiles().length == 0) {
        // wait 3 secs
        setTimeout(function() {
          myDropzone.removeAllFiles();
        }, 3000);
      }
    }
    // refresh region after upload is complete
    if (vOptions.refreshRegionID) {
      if (myDropzone.getQueuedFiles().length == 0 && myDropzone.getUploadingFiles().length == 0) {
        // wait 3 secs
        setTimeout(function() {
          apex.event.trigger('#' + vOptions.refreshRegionID, 'apexrefresh');;
        }, 3000);
      }
    }
  });
}
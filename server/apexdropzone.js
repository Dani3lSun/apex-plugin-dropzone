// APEX Dropzone functions
// Author: Daniel Hochleitner
// Version: 1.6

var gRun = 'Y';
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
// Apex AJAX call to upload file
function apexAjaxCall(pAjaxIdentifier,pFilename,pFiletype,pf01Array,pPageItems,callback) {
    apex.server.plugin(pAjaxIdentifier, {
                                  x01: pFilename,
                                  x02: pFiletype,
                                  f01: pf01Array,
                                  pageItems: pPageItems
                                  },{
                                    dataType: 'html',
                                    success:function() {
                                        callback();
                                        }
                                  });
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
    {
      paramName: "p_clob_01",
      url: "wwv_flow.show",
      params: {
        p_instance: $v('pInstance'),
        p_flow_id: $v('pFlowId'),
        p_flow_step_id: $v('pFlowStepId')
      },
   addRemoveLinks: false,
   parallelUploads: vParallelUploads,
   uploadMultiple: false,
   autoProcessQueue: false,
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
                gRun = 'Y';
                myDropzone.addFile(file);
            }
        }
    })  
  }
  // build base64 and attach to f01 array
  myDropzone.on("addedfile",function(file) {
    // build base64 and attach to f01 array
    var reader = new FileReader();
    reader.onload = (function(pfile) {
    return function(e) {
      if (pfile) {
        // BinaryInt8Array to base64
        var base64 = binaryArray2base64(e.target.result);
        // split base64 clob string to f01 array length 30k
        var f01Array = [];
        f01Array = clob2Array(base64,30000,f01Array);
        file.f01Array = f01Array;
        if (gRun == 'Y') {
          myDropzone.processQueue();
        }
      }
    }
    })(file);
    reader.readAsArrayBuffer(file);
  });
  // processing with sleep
  myDropzone.on("processing",function(file) {
    gRun = 'N';
    // sleep (hack)
    sleep_until(vWaitTime);
  });
  // send file as base64 f01 array
  myDropzone.on("sending",function(file) {
    file.status = Dropzone.UPLOADING;
    // AJAX call apex.server.plugin and process file queue if success
    apexAjaxCall(vOptions.ajaxIdentifier,file.name,file.type,file.f01Array,vOptions.pageItems,function() {
                                                                                                file.status = Dropzone.SUCCESS;
                                                                                                // process file queue
                                                                                                if (myDropzone.getQueuedFiles().length > 0 && myDropzone.getUploadingFiles().length == 0) {
                                                                                                  myDropzone.processQueue();
                                                                                                // check again
                                                                                                } else {
                                                                                                  setTimeout(function() {
                                                                                                    if (myDropzone.getQueuedFiles().length > 0 && myDropzone.getUploadingFiles().length == 0) {
                                                                                                      myDropzone.processQueue();
                                                                                                    }
                                                                                                  }, 200);
                                                                                                }
                                                                                              });
  });
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
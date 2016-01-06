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

function setApexCollectionClob (pBigValue, callback) {
  var apexAjaxObj = new apex.ajax.clob (
  function() {
    var rs = p.readyState;
    if (rs == 4) {
      callback();
    } else {
      return false;
    };
  });
  apexAjaxObj._set(pBigValue);
}

function apexDropzone(pRegionId, pOptions, pLogging){
  var vOptions           = pOptions;
  var vRegion$           = jQuery('#' + apex.util.escapeCSS(pRegionId + '_dropzone'), apex.gPageContext$);
  var vRegion            = apex.util.escapeCSS(pRegionId + '_dropzone');
  var vlogging           = parseBoolean(pLogging);
  var vClickable         = parseBoolean(vOptions.clickable);
  var vMaxFileSize       = parseInt(vOptions.maxFilesize);
  var vRemoveAfterUpload = parseBoolean(vOptions.removeAfterUpload);
  // Logging
  if (vlogging) {
    console.log('dropzoneApex: vOptions.ajaxIdentifier:',vOptions.ajaxIdentifier);
    console.log('dropzoneApex: vOptions.pageItems:',vOptions.pageItems);
    console.log('dropzoneApex: vOptions.maxFilesize:',vOptions.maxFilesize);
    console.log('dropzoneApex: vOptions.clickable:',vOptions.clickable);
    console.log('dropzoneApex: vOptions.removeAfterUpload:',vOptions.removeAfterUpload);
    console.log('dropzoneApex: vOptions.defaultMessage:',vOptions.defaultMessage);
    console.log('dropzoneApex: vOptions.acceptedFiles:',vOptions.acceptedFiles);
    console.log('dropzoneApex: pRegionId:',pRegionId);
    console.log('dropzoneApex: pRegionId:',pRegionId);
    console.log('dropzoneApex: vRegion$:',vRegion$);
    console.log('dropzoneApex: vRegion:',vRegion);
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
      p_flow_step_id: $v('pFlowStepId'),
   },
   addRemoveLinks: false,
   parallelUploads: 2,
   uploadMultiple: false,
   maxFilesize: vMaxFileSize,
   dictDefaultMessage: vOptions.defaultMessage,
   clickable: vClickable,
   acceptedFiles: vOptions.acceptedFiles
  });

  if (!(vClickable)) {
    $('.dz-hidden-input').prop('disabled',true);
  }
  
  // send file as base64
  myDropzone.on('sending',function(file) {
    var reader = new FileReader();
    reader.onload = (function(pfile){
      return function(e) {
        // ArrayBuffer to BinaryString
        var data = "";
        var bytes = new Uint8Array(e.target.result);
        var length = bytes.byteLength;
        for(var i = 0; i < length; i++) {
          data += String.fromCharCode(bytes[i]);
        }
        // BinaryString to base64
        var base64 = btoa(data);
        // AJAX call
        setApexCollectionClob (base64, function(){apex.server.plugin(vOptions.ajaxIdentifier, {
                                                                     x01: pfile.name,
                                                                     x02: pfile.type,
                                                                     pageItems: vOptions.pageItems
                                                                     },{dataType: 'html'});
                                                   })
        }
      })(file);
      reader.readAsArrayBuffer(file)
  });
  // remove all files after upload is complete
  if (vRemoveAfterUpload) {
    myDropzone.on("complete", function() {
     if (myDropzone.getQueuedFiles().length == 0 && myDropzone.getUploadingFiles().length == 0) {
       // wait 4 secs
       setTimeout(function() {
         myDropzone.removeAllFiles();
       }, 4000);
     }
    });
  }
}
function openQRCamera(node) {
  var reader = new FileReader();
  reader.onload = function() {
    node.value = "";
    qrcode.callback = function(res) {
      if(res instanceof Error) {
        alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
      } else {
        node.parentNode.previousElementSibling.value = res;
      }
    };
    qrcode.decode(reader.result);
  };
  reader.readAsDataURL(node.files[0]);
}


export { openQRCamera };


const qrrrCode = () => {
  const html5QrCode  = new Html5Qrcode("reader");
  html5QrCode.start(
     cameraId, // retreived in the previous step.
     {
        fps: 10,    // sets the framerate to 10 frame per second
        qrbox: 250  // sets only 250 X 250 region of viewfinder to
                    // scannable, rest shaded.
   },
   qrCodeMessage => {     // do something when code is read. For example:
       console.log(`QR Code detected: ${qrCodeMessage}`);
   },
   errorMessage => {     // parse error, ideally ignore it. For example:
       console.log(`QR Code no longer in front of camera.`);
   })
   .catch(err => {     // Start failed, handle it. For example,
       console.log(`Unable to start scanning, error: ${err}`);
   });
}

export { qrrrCode };

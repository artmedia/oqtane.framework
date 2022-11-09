/* Module Script */
var Artmedia = Artmedia || {};

Artmedia.AlbalaghaNews = {

    CloseModal: function (idModale) {
        let myModalObj = document.querySelector('#' + idModale);
        let myModalInstance = bootstrap.Modal.getOrCreateInstance(myModalObj); // Returns a Bootstrap modal instance
        myModalInstance.hide();
        console.log('CloseModal ' + '#' + idModale);
    },
    OpenModal: function (idModale) {
        let myModalObj = document.querySelector('#' + idModale);
        let myModalInstance = bootstrap.Modal.getOrCreateInstance(myModalObj); // Returns a Bootstrap modal instance
        myModalInstance.show();
        console.log('OpenModal ' + '#' + idModale);
    },
    DownloadFile: function (base64content, strFileName, strMimeType) {

        console.log('Starting Download File: ' + strFileName + ' ' + strMimeType);

        download(ConvertBase64ToArrayBuffer(base64content), strFileName, strMimeType);
    }

};

function ConvertBase64ToArrayBuffer(base64) {
    var binary_string = window.atob(base64);
    var len = binary_string.length;
    var bytes = new Uint8Array(len);
    for (var i = 0; i < len; i++) {
        bytes[i] = binary_string.charCodeAt(i);
    }
    return bytes.buffer;
}
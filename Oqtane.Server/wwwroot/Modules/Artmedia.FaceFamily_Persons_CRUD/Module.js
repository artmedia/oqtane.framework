var Artmedia = Artmedia || {};

//var myModalFormPerson;
//var myToastConfermaOperazioneEl;
//var myToastConfermaOperazione;
//var myToastErroreOperazioneEl;
//var myToastErroreOperazione;
//var myCollapseDecessoEl;
//var myCollapseDecesso;

function ConsoleLog(myLogText) {
    console.log(myLogText);
}

Artmedia.FaceFamily_Persons_CRUD = {

    uploadFiles: function (posturl, folder, id, myKey) {

        //console.log("Artmedia.FaceFamily_Persons_CRUD.uploadFiles posturl=" + posturl + ";folder=" + folder + ";id=" + id + ";");
        //alert("Artmedia.FaceFamily_Persons_CRUD.uploadFiles posturl=" + posturl + ";folder=" + folder + ";id=" + id + ";");

        var files = document.getElementById(id + 'FileInput').files;
        var progressinfo = document.getElementById(id + 'ProgressInfo');
        var progressbar = document.getElementById(id + 'ProgressBar');
        var filename = '';

        for (var i = 0; i < files.length; i++) {
            var FileChunk = [];
            var file = files[i];
            var MaxFileSizeMB = 1;
            var BufferChunkSize = MaxFileSizeMB * (1024 * 1024);
            var FileStreamPos = 0;
            var EndPos = BufferChunkSize;
            var Size = file.size;

            progressbar.setAttribute("style", "visibility: visible;");

            if (files.length > 1) {
                filename = file.name;
            }

            while (FileStreamPos < Size) {
                FileChunk.push(file.slice(FileStreamPos, EndPos));
                FileStreamPos = EndPos;
                EndPos = FileStreamPos + BufferChunkSize;
            }

            var TotalParts = FileChunk.length;
            var PartCount = 0;

            while (Chunk = FileChunk.shift()) {
                PartCount++;
                var FileName = file.name + ".part_" + PartCount.toString().padStart(3, '0') + "_" + TotalParts.toString().padStart(3, '0');

                var data = new FormData();
                data.append('folder', folder);
                data.append('myKey', myKey); // !!!!!!!!!!!!!!!!!                
                data.append('file', Chunk, FileName);
                var request = new XMLHttpRequest();
                request.open('POST', posturl, true);
                request.upload.onloadstart = function (e) {
                    progressbar.value = 0;
                    progressinfo.innerHTML = filename + ' 0%';
                };
                request.upload.onprogress = function (e) {
                    var percent = Math.ceil((e.loaded / e.total) * 100);
                    progressbar.value = (percent / 100);
                    progressinfo.innerHTML = filename + '[' + PartCount + '] ' + percent + '%';
                };
                request.upload.onloadend = function (e) {
                    progressbar.value = 1;
                    progressinfo.innerHTML = filename + ' 100%';
                };
                request.send(data);
            }
        }
    },
    getFiles: function (id) {

        //console.log("Artmedia.FaceFamily_Persons_CRUD.getFiles id=" + id + ";");
        //alert("Artmedia.FaceFamily_Persons_CRUD.getFiles id=" + id + ";");

        var files = [];
        var fileinput = document.getElementById(id);
        if (fileinput !== null) {
            for (var i = 0; i < fileinput.files.length; i++) {
                files.push(fileinput.files[i].name);
            }
        }
        return files;
    },
    UploadCroppedPersonalImage: async function (moduleId, guidPerson) {

        console.log("chiamato UploadCroppedPersonalImage (moduleId=" + moduleId + ";guidPerson=" + guidPerson + ")");

        return await $uploadCrop.croppie('result', {
            type: 'canvas',
            size: 'viewport'
        }).then(function (resp) {

            const block = resp.split(";");
            let _length = byteLength(block[1].split(",")[1]);
            let _MimeType = block[0].split(":")[1];
            let _Base64Content = block[1].split(",")[1];
            var obj = {
                MimeType: _MimeType,
                Base64Content: _Base64Content,
                FileName: guidPerson, //passo guiPerson perche' il nomefile sara' "idFamily_guidPerson".png
                FileSize: _length
            }
            console.log('Base64Content=' + _Base64Content);
            uploadPersonalImage(obj, moduleId);
            return true;
        }).catch(function (resp) { return false; });
    },
    resetCroppedPersonalImage: function () {

        console.log("chiamato ResetCroppedPersonalImage");
        $uploadCrop.croppie('destroy');

    },
    instantiateCroppedPersonalImage: function () {

        console.log("chiamato InstantiateCroppedPersonalImage");

        try {

            $uploadCrop = $('#myCroppieBox').croppie({
                viewport: {
                    width: 120,
                    height: 120,
                    type: 'circle'
                },
                enableExif: true,
                url: '/Modules/Artmedia.FaceFamily_Persons_CRUD/person300.png'
            });

        }
        catch (err) {
            console.log('instantiateCroppedPersonalImage error=' + err.message);
        }

    },
    OpenModalPerson: function () {
        console.log('OpenModalPerson');
        let myModalFormPerson1 = new bootstrap.Modal(document.getElementById('modalFormPerson'), {});
        myModalFormPerson1.show();
    },
    CloseModalPerson: function () {

        let myModalFormPersonObj = document.querySelector('#modalFormPerson')
        let myModalFormPerson = bootstrap.Modal.getOrCreateInstance(myModalFormPersonObj) // Returns a Bootstrap modal instance
        myModalFormPerson.hide();

        console.log('CloseModalPerson');
        //let myModalFormPerson1 = new bootstrap.Modal(document.getElementById('modalFormPerson'), {});
        //myModalFormPerson1.hide();
    },
    OpenModalInvite: function () {
        console.log('OpenModalInvite');
        let myModalFormPerson1 = new bootstrap.Modal(document.getElementById('modalInvite'), {});
        myModalFormPerson1.show();
    },
    CloseModalInvite: function () {
        let myModalInviteObj = document.querySelector('#modalInvite')
        let myModalInvite = bootstrap.Modal.getOrCreateInstance(myModalInviteObj) // Returns a Bootstrap modal instance
        myModalInvite.hide();
        console.log('CloseModalInvite');
    },
    OpenModalConfirmDeletePerson: function () {
        let myModalConfirmDeletePerson = new bootstrap.Modal(document.getElementById('modalConfirmDeletePerson'), { keyboard: false});
        myModalConfirmDeletePerson.show();
        //return true;
    },
    CloseModalConfirmDeletePerson: function () {
        let myModalConfirmDeletePersonObj = document.querySelector('#modalConfirmDeletePerson')
        let myModalConfirmDeletePerson = bootstrap.Modal.getOrCreateInstance(myModalConfirmDeletePersonObj) // Returns a Bootstrap modal instance
        myModalConfirmDeletePerson.hide();
        //let myModalConfirmDeletePerson = new bootstrap.Modal(document.getElementById('modalConfirmDeletePerson'), { keyboard: false});
        //myModalConfirmDeletePerson.hide();
        //return true;
    },
    OpenModalEditPersonalImage: function () {
        let myModalEditPersonalImage = new bootstrap.Modal(document.getElementById('modalEditPersonalImage'), {});
        myModalEditPersonalImage.show();
    },
    CloseModalEditPersonalImage: function () {

        let myModalEditPersonalImageObj = document.querySelector('#modalEditPersonalImage')
        let myModalEditPersonalImage = bootstrap.Modal.getOrCreateInstance(myModalEditPersonalImageObj) // Returns a Bootstrap modal instance
        myModalEditPersonalImage.hide();
        console.log("called CloseModalEditPersonalImage");
        //let myModalEditPersonalImage = new bootstrap.Modal(document.getElementById('modalEditPersonalImage'), {});
        //myModalEditPersonalImage.hide();
    },
    ShowToastMsgConferma: function () {
        //$('#toastConfermaOperazione').toast('show');
        let myToastConfermaOperazioneEl = document.getElementById('toastConfermaOperazione');
        //myToastConfermaOperazione = bootstrap.Toast.getInstance(myToastConfermaOperazioneEl); // Returns a Bootstrap toast instance
        let myToastConfermaOperazione = new bootstrap.Toast(myToastConfermaOperazioneEl);//inizialize it
        myToastConfermaOperazione.show();//show it
        return true;
    },
    ShowToastMsgErrore: function () {
        //$('#toastErroreOperazione').toast('show');
        let myToastErroreOperazioneEl = document.getElementById('toastErroreOperazione');
        //myToastErroreOperazione = bootstrap.Toast.getInstance(myToastErroreOperazioneEl); // Returns a Bootstrap toast instance
        let myToastErroreOperazione = new bootstrap.Toast(myToastErroreOperazioneEl);//inizialize it
        myToastErroreOperazione.show();
        return true;
    },
    ShowCollapseDecesso: function () {
        let myCollapseDecessoEl = document.getElementById('collapseDecesso');
        let myCollapseDecesso = new bootstrap.Collapse(myCollapseDecessoEl, { toggle: false });
        myCollapseDecesso.show();
        console.log("chiamato ShowCollapseDecesso");
        return true;
    },
    HideCollapseDecesso: function () {
        let myCollapseDecessoEl = document.getElementById('collapseDecesso');
        let myCollapseDecesso = new bootstrap.Collapse(myCollapseDecessoEl, { toggle: false });
        myCollapseDecesso.hide();
        console.log("chiamato HideCollapseDecesso");
        return true;
    },
    ConsoleLog: function (myLogText) {
        console.log("ConsoleLog=" + myLogText);
    },
    InstantiatePhotogallery: function () {
        console.log("called InstantiatePhotogallery");

        //initialize Masonry after all images have been loaded
        var $grid = $('#mygridmasonry').imagesLoaded(function () {
            $grid.masonry({
                itemSelector: '.grid-item',
                columnWidth: '.grid-sizer',
                percentPosition: true
            });
        });

        // set itemSelector so .grid-sizer is not used in layout
        //$('#mygridmasonry').masonry({
        //    itemSelector: '.grid-item',
        //    // use element for option
        //    columnWidth: '.grid-sizer',
        //    percentPosition: true
        //});

        return true;
    },
    ExpandCollapseSection70: function () {
        const myCollapse = document.getElementById('collapseSection70');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.show();
    },
    ExpandCollapseSection60: function () {
        const myCollapse = document.getElementById('collapseSection60');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.show();
    },
    ExpandCollapseSection50: function () {
        const myCollapse = document.getElementById('collapseSection50');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.show();
    },
    ExpandCollapseSection40: function () {
        const myCollapse = document.getElementById('collapseSection40');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.show();
    },
    ExpandCollapseSection30: function () {
        const myCollapse = document.getElementById('collapseSection30');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.show();
    },
    CloseCollapseSection70: function () {
        const myCollapse = document.getElementById('collapseSection70');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.hide();
    },
    CloseCollapseSection60: function () {
        const myCollapse = document.getElementById('collapseSection60');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.hide();
    },
    CloseCollapseSection50: function () {
        const myCollapse = document.getElementById('collapseSection50');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.hide();
    },
    CloseCollapseSection40: function () {
        const myCollapse = document.getElementById('collapseSection40');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.hide();
    },
    CloseCollapseSection30: function () {
        const myCollapse = document.getElementById('collapseSection30');
        const bsCollapse = new bootstrap.Collapse(myCollapse, { toggle: false });
        bsCollapse.hide();
    },
    InstantiateUploadCroppieChangeEvent: function () {
        $('#uploadCroppie').on("change", function () {
            console.log("uploadCroppie clicked");
            readFile(this);
        });
    },
    SetActiveTab: function (activeIdOfButton, activeIdOfDivContent) {
        $('.nav-link').removeClass("active");
        $('#' + activeIdOfButton).addClass("active");
        $('.tab-pane').removeClass("active").removeClass("show");
        $('#' + activeIdOfDivContent).addClass("show").addClass("active");

        console.log("SetActiveTab to IdOfButton=" + activeIdOfButton + ";IdOfDivContent=" + activeIdOfDivContent);
    }
};


function ShowToastMsgConfermaV2() {
    //$('#toastConfermaOperazione').toast('show');
    let myToastConfermaOperazioneEl1 = document.getElementById('toastConfermaOperazione');
    let myToastConfermaOperazione1 = new bootstrap.Toast(myToastConfermaOperazioneEl1);//inizialize it
    myToastConfermaOperazione1.show();//show it
    //return true;
}


function convertBase64toBlob(b64Data, contentType = '', sliceSize = 512) {
    const byteCharacters = atob(b64Data);
    const byteArrays = [];

    for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
        const slice = byteCharacters.slice(offset, offset + sliceSize);

        const byteNumbers = new Array(slice.length);
        for (let i = 0; i < slice.length; i++) {
            byteNumbers[i] = slice.charCodeAt(i);
        }

        const byteArray = new Uint8Array(byteNumbers);
        byteArrays.push(byteArray);
    }

    const blob = new Blob(byteArrays, { type: contentType });
    return blob;
}


function byteLength(str) {
    // returns the byte length of an utf8 string
    var s = str.length;
    for (var i = str.length - 1; i >= 0; i--) {
        var code = str.charCodeAt(i);
        if (code > 0x7f && code <= 0x7ff) s++;
        else if (code > 0x7ff && code <= 0xffff) s += 2;
        if (code >= 0xDC00 && code <= 0xDFFF) i--; //trail surrogate
    }
    return s;
}



var $uploadCrop;

$(document).ready(function () {

    $uploadCrop = $('#myCroppieBox').croppie({
        viewport: {
            width: 120,
            height: 120,
            type: 'circle'
        },
        enableExif: true,
        url: '/Modules/Artmedia.FaceFamily_Persons_CRUD/person300.png'
    });


});


function readFile(input) {
    if (input.files && input.files[0]) {

        console.log('chiamato readFile');

        var reader = new FileReader();

        reader.onload = function (e) {
            $('#myCroppieBox').addClass('ready');
            $uploadCrop.croppie('bind', {
                url: e.target.result
            }).then(function () {
                console.log('jQuery bind complete');
            });

        }

        reader.readAsDataURL(input.files[0]);
    }
    else {
        //swal("Sorry - you're browser doesn't support the FileReader API");
        console.log("Sorry - you're browser doesn't support the FileReader API");
    }
}




function uploadPersonalImage(myObj, moduleId) {


    //               /api/MultimediaResourceImage/uploadPersonalImage/guidPerson/{guidPerson:Guid}
    const posturl = "/api/MultimediaResourceImage/UploadPersonalImage/guidPerson/" + myObj.FileName; //myObj.FileName=guidPerson
    //console.log('_objStringfy.Base64Content=' + myObj.Base64Content);

    $.ajax({
        type: "POST",
        data: JSON.stringify(myObj.Base64Content),// _objStringfy,
        // qs += "auth" + kvp.Key.ToLower() + "id=" + kvp.Value.ToString();
        // moduleid=63&authmoduleid=63
        url: posturl + "?" + jQuery.param({ moduleid: moduleId, authmoduleid: moduleId, guidPerson: myObj.FileName }),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json'
    }).done(function (res) {
        console.log('POST SUCCESS res', res);
        // Do something with the result :)
    });

}
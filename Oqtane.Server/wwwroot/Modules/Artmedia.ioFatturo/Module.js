/* Module Script */
var Artmedia = Artmedia || {};


function ConsoleLog(myLogText) {
    console.log(myLogText);
}

Artmedia.ioFatturo = {
    ShowToastMsg: function () {
        //$('#toastErroreOperazione').toast('show');
        let myToastErroreOperazioneEl = document.getElementById('mytoastmessagebox');
        //myToastErroreOperazione = bootstrap.Toast.getInstance(myToastErroreOperazioneEl); // Returns a Bootstrap toast instance
        let myToastErroreOperazione = new bootstrap.Toast(myToastErroreOperazioneEl);//inizialize it
        myToastErroreOperazione.show();
        return true;
    },
    CollapseMe: function (idOfDomElement, isShow) {
        const _bsCollapse = new bootstrap.Collapse('#' + idOfDomElement, { toggle: false })
        if (isShow == true) {
            _bsCollapse.show();
        } else if (isShow == false) {
            _bsCollapse.hide();
        }
        console.log('Collaps ' + '#' + idOfDomElement + " " + isShow);
    },
    CloseModal: function (idModale) {
        let myModalObj = document.querySelector('#' + idModale)
        let myModalInstance = bootstrap.Modal.getOrCreateInstance(myModalObj) // Returns a Bootstrap modal instance
        myModalInstance.hide();
        console.log('CloseModal ' + '#' + idModale);
    },
    OpenModal: function (idModale) {

        let myModalObj = document.querySelector('#' + idModale)
        let myModalInstance = bootstrap.Modal.getOrCreateInstance(myModalObj) // Returns a Bootstrap modal instance
        myModalInstance.show();
        console.log('OpenModal ' + '#' + idModale);

        //let myModal = new bootstrap.Modal(document.getElementById('#' + idModale), {});
        //myModal.show();
        //console.log('OpenModal '+ '#' + idModale);
    },
    PrintPdf: function (uidAzienda, uidFatturaClienteTestata) {
        printJS("/api/FatturaCliente/getPdfFatturaElettronica/" + uidFatturaClienteTestata + "/uidAzienda/" + uidAzienda);
        console.log("printJS " + "/api/FatturaCliente/getPdfFatturaElettronica/" + uidFatturaClienteTestata + "/uidAzienda/" + uidAzienda);
    },
    CheckPwd: function (idImputText, idLabelRule1, idLabelRule2, idLabelRule3, idLabelRule4, idLabelRule5) {

        $("#" + idImputText).keyup(function () {
            console.log("keyup fired");

            let isOkRule1 = CheckPwdRule1($("#" + idImputText).val());
            if (isOkRule1) {
                $("#" + idLabelRule1).removeClass().addClass("text-success");
            } else {
                $("#" + idLabelRule1).removeClass().addClass("text-danger");
            }

            let isOkRule2 = CheckPwdRule2($("#" + idImputText).val());
            if (isOkRule2) {
                $("#" + idLabelRule2).removeClass().addClass("text-success");
            } else {
                $("#" + idLabelRule2).removeClass().addClass("text-danger");
            }

            let isOkRule3 = CheckPwdRule3($("#" + idImputText).val());
            if (isOkRule3) {
                $("#" + idLabelRule3).removeClass().addClass("text-success");
            } else {
                $("#" + idLabelRule3).removeClass().addClass("text-danger");
            }

            let isOkRule4 = CheckPwdRule4($("#" + idImputText).val());
            if (isOkRule4) {
                $("#" + idLabelRule4).removeClass().addClass("text-success");
            } else {
                $("#" + idLabelRule4).removeClass().addClass("text-danger");
            }


            let isOkRule5 = CheckPwdRule5($("#" + idImputText).val());
            if (isOkRule5) {
                $("#" + idLabelRule5).removeClass().addClass("text-success");
            } else {
                $("#" + idLabelRule5).removeClass().addClass("text-danger");
            }

            console.log("CheckPwd isOkRule5=" + isOkRule5);
        });
    }

};

function CheckPwdRule1(password) {
    //console.log(myLogText);
    let match = true;
    if (password.length < 8) {
        match = false;
    }    
    return match;
}
function CheckPwdRule2(password) {
    //console.log(myLogText);
    let match = true;
    //if (!(password.match(/[a-z]+/))) {
    //    match = false;
    //}
    if (!(password.match(/[A-Z]+/))) {
        match = false;
    }
    //if (!(password.match(/[0-9]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[$@#&!]+/))) {
    //    match = false;
    //}
    return match;
}
function CheckPwdRule3(password) {
    //console.log(myLogText);
    let match = true;
    if (!(password.match(/[a-z]+/))) {
        match = false;
    }
    //if (!(password.match(/[A-Z]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[0-9]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[$@#&!]+/))) {
    //    match = false;
    //}
    return match;
}
function CheckPwdRule4(password) {
    //console.log(myLogText);
    let match = true;
    //if (!(password.match(/[a-z]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[A-Z]+/))) {
    //    match = false;
    //}
    if (!(password.match(/[0-9]+/))) {
        match = false;
    }
    //if (!(password.match(/[$@#&!]+/))) {
    //    match = false;
    //}
    return match;
}
function CheckPwdRule5(password) {
    //console.log(myLogText);
    let match = true;
    //if (!(password.match(/[a-z]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[A-Z]+/))) {
    //    match = false;
    //}
    //if (!(password.match(/[0-9]+/))) {
    //    match = false;
    //}
    if (!(password.match(/[$@#&!]+/))) {
        match = false;
    }
    return match;
}
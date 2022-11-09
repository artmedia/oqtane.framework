/* Module Script */
var Artmedia = Artmedia || {
};

//window.blazorPaypal = (approval_url) => {
//    var ppp = PAYPAL.apps.PPP({
//        "approvalUrl": approval_url,
//        "placeholder": "ppplus",
//        "mode": "sandbox",
//        "country": "IT"
//    });
//    console.log("approval_url=" + approval_url);
//}
//Artmedia.Sporting_MatchballPrenotazioni.blazorPaypal = (approval_url) => {
//    var ppp = PAYPAL.apps.PPP({
//        "approvalUrl": approval_url,
//        "placeholder": "ppplus",
//        "mode": "sandbox",
//        "country": "DE"
//    });
//    console.log("approval_url=" + approval_url);
//}

var myToastItemCarrelloEl;
var myToastItemCarrello;

var mytoastConfermaOperazioneEl;
var mytoastConfermaOperazione;

var mytoastErroreOperazioneEl;
var mytoastErroreOperazione;

var mytoastConfermaPrenotazManEl;
var mytoastConfermaPrenotazMan;

var mytoastErroreOperazionePrenotazManEl;
var mytoastErroreOperazionePrenotazMan;

//modal
var myModalUser;
var myModalAbbonamento;
var myModalPrenotazioneManuale;
var myModalPrenotazioneManualeSelezMultipla;

Artmedia.Sporting_MatchballPrenotazioni = {
    OpenModalUser: function () {
        //$('#ModalUser').modal('show');
        myModalUser = new bootstrap.Modal(document.getElementById('ModalUser'), {});
        myModalUser.show();
        return true;
    },
    CloseModalUser: function () {
        //$('#ModalUser').modal('hide');
        myModalUser.hide();
        return true;
    },
    ShowToastItem: function () {
        //$('#toastItemCarrello').toast('show');
        myToastItemCarrelloEl = document.getElementById('toastItemCarrello');
        myToastItemCarrello = new bootstrap.Toast(myToastItemCarrelloEl);//inizialize it
        myToastItemCarrello.show();//show it
        return true;
    },
    OpenModalAbbonamento: function () {
        //$('#modalAbbonamento').modal('show');
        myModalAbbonamento = new bootstrap.Modal(document.getElementById('modalAbbonamento'), {});
        myModalAbbonamento.show();
        return true;
    },
    CloseModalAbbonamento: function () {
        //$('#modalAbbonamento').modal('hide');
        myModalAbbonamento.hide();
        return true;
    },
    ShowToastMsgConferma: function () {
        //$('#toastConfermaOperazione').toast('show');
        mytoastConfermaOperazioneEl = document.getElementById('toastConfermaOperazione');
        mytoastConfermaOperazione = new bootstrap.Toast(mytoastConfermaOperazioneEl);//inizialize it
        mytoastConfermaOperazione.show();//show it
        return true;
    },
    ShowToastMsgErrore: function () {
        //$('#toastErroreOperazione').toast('show');
        mytoastErroreOperazioneEl = document.getElementById('toastErroreOperazione');
        mytoastErroreOperazione = new bootstrap.Toast(mytoastErroreOperazioneEl);//inizialize it
        mytoastErroreOperazione.show();//show it
        return true;
    },
    OpenModalPrenotazioneManuale: function () {
        //$('#modalPrenotazioneManuale').modal('show');        
        myModalPrenotazioneManuale = new bootstrap.Modal(document.getElementById('modalPrenotazioneManuale'), {});
        myModalPrenotazioneManuale.show();
        return true;
    },
    CloseModalPrenotazioneManuale: function () {
        //$('#modalPrenotazioneManuale').modal('hide');
        myModalPrenotazioneManuale.hide();
        return true;
    },
    ShowToastMsgConfermaPrenotazMan: function () {
        //$('#toastConfermaPrenotazMan').toast('show');
        mytoastConfermaPrenotazManEl = document.getElementById('toastConfermaPrenotazMan');
        mytoastConfermaPrenotazMan = new bootstrap.Toast(mytoastConfermaPrenotazManEl);//inizialize it
        mytoastConfermaPrenotazMan.show();//show it
        return true;
    },
    ShowToastMsgErrorePrenotazMan: function () {
        //$('#toastErroreOperazionePrenotazMan').toast('show');
        mytoastErroreOperazionePrenotazManEl = document.getElementById('toastErroreOperazionePrenotazMan');
        mytoastErroreOperazionePrenotazMan = new bootstrap.Toast(mytoastErroreOperazionePrenotazManEl);//inizialize it
        mytoastErroreOperazionePrenotazMan.show();//show it
        return true;
    },
    InstantiateJsMultipleSelectableItems: function () {

        var $currentlySelected = null;
        var selected = [];

        $('#selectable').selectable({
            start: function (event, ui) {
                $currentlySelected = $('.tblprenotazioni .ui-selected');
            },
            stop: function (event, ui) {
                for (var i = 0; i < selected.length; i++) {
                    if ($.inArray(selected[i], $currentlySelected) >= 0) {
                        $(selected[i]).removeClass('ui-selected');
                    }
                }
                selected = [];
            },
            selecting: function (event, ui) {
                $currentlySelected.addClass('ui-selected'); // re-apply ui-selected class to currently selected items
            },
            selected: function (event, ui) {
                selected.push(ui.selected);
            }
        });

    }


};

//Artmedia.Sporting_MatchballPrenotazioni = {
//    SalvaPrenotazione: function (dotNetObjRef) {
//        dotNetObjRef.invokeMethodAsync("doSalvaPrenotazione",{});
//    }
//};

//var contatoreItemsCarrello = 0;

$(document).ready(function () {
    console.log("ready Selezione Multipla");
    //$("#carrello").hide();

    //$("#giornoSelezionato").text();
});

//////////////AGGIUNGE ORA
////////////$("table").on("click", ".hPrenotabile", function () {

////////////    var _orainizio = $(this).data("orainizio");
////////////    var _tabella = $(this).closest("table");
////////////    var _idcampo = _tabella.data("idcampo");
////////////    //alert("orainizio=" + _orainizio + ";idcampo=" + _idcampo);

////////////    // ******** cella evidenziata ****************
////////////    $(_tabella).find('tr').each(function (i, row) {
////////////        var _divH = $(this).find('.h');
////////////        if (_divH.data("orainizio") == _orainizio) {
////////////            _divH.removeClass("hPrenotabile").addClass("hPrelazionata");
////////////        }
////////////    });

////////////    // ******** add item to cart **************
////////////    contatoreItemsCarrello++;
////////////    //$("#contatoreItemsCarrello").text(contatoreItemsCarrello);
////////////    $("#carrello").show();
////////////    //addItemToCart(int idCampo, int year, int month, int day, int oraInizio)
////////////    //dotNetObject.invokeMethodAsync('AddText', _idcampo, _orainizio);
////////////    //var dotNetReference = DotNetObjectReference.Create(this);
////////////    //var interop = new Interop(JSRuntime);
////////////    //interop.InvokeVoidAsync("AddItemToCart", _idcampo, _orainizio);
////////////});

////////////// RINUOVE ORA
////////////$("table").on("click", ".hPrelazionata", function () {

////////////    var _orainizio = $(this).data("orainizio");
////////////    var _tabella = $(this).closest("table");
////////////    var _idcampo = _tabella.data("idcampo");
////////////    //alert("orainizio=" + _orainizio + ";idcampo=" + _idcampo);

////////////    // ******** cella evidenziata ****************
////////////    $(_tabella).find('tr').each(function (i, row) {
////////////        var _divH = $(this).find('.h');
////////////        if (_divH.data("orainizio") == _orainizio) {
////////////            _divH.removeClass("hPrelazionata").addClass("hPrenotabile");
////////////        }
////////////    });

////////////    // ******** add item to cart **************
////////////    contatoreItemsCarrello--;
////////////    //$("#contatoreItemsCarrello").text(contatoreItemsCarrello);
////////////    if (contatoreItemsCarrello > 0) {
////////////        $("#carrello").show();
////////////    } else {
////////////        $("#carrello").hide();
////////////    }

////////////});

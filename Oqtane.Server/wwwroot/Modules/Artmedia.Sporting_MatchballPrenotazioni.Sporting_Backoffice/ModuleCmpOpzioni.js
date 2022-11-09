/* Module Script */
var ArtmediaCmpOpzioni = ArtmediaCmpOpzioni || {}

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

ArtmediaCmpOpzioni.Sporting_MatchballPrenotazioniBackoffice = {
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
    OpenModalPrenotazioneManualeSelezMultipla: function () {
        //$('#modalPrenotazioneManualeSelezMultipla').modal('show');
        myModalPrenotazioneManualeSelezMultipla = new bootstrap.Modal(document.getElementById('modalPrenotazioneManualeSelezMultipla'), {});
        myModalPrenotazioneManualeSelezMultipla.show();
        return true;
    },
    CloseModalPrenotazioneManualeSelezMultipla: function () {
        //$('#modalPrenotazioneManualeSelezMultipla').modal('hide');
        myModalPrenotazioneManualeSelezMultipla.hide();
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
    }
}

$(document).ready(function () {
    console.log("ready Module CmpOpzioni");
});

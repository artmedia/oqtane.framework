var Artmedia = Artmedia || {};

Artmedia.FaceFamily_Backoffice_ModuleCmpCanoni = {

    ShowToastMsgConferma: function () {
        //$('#toastConfermaOperazione').toast('show');
        let myToastConfermaOperazioneEl = document.getElementById('toastConfermaOperazione');
        //myToastConfermaOperazione = bootstrap.Toast.getInstance(myToastConfermaOperazioneEl); // Returns a Bootstrap toast instance
        let myToastConfermaOperazione = new bootstrap.Toast(myToastConfermaOperazioneEl);//inizialize it
        myToastConfermaOperazione.show();//show it
        //return true;
    },
    ShowToastMsgErrore: function () {
        //$('#toastErroreOperazione').toast('show');
        let myToastErroreOperazioneEl = document.getElementById('toastErroreOperazione');
        //myToastErroreOperazione = bootstrap.Toast.getInstance(myToastErroreOperazioneEl); // Returns a Bootstrap toast instance
        let myToastErroreOperazione = new bootstrap.Toast(myToastErroreOperazioneEl);//inizialize it
        myToastErroreOperazione.show();
        //return true;
    }
};

function ConsoleLog(myLogText) {
    console.log(myLogText);
}

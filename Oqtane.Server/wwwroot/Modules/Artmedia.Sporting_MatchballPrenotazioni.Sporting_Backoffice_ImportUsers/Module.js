/* Module Script */
var Artmedia = Artmedia || {
};

var myToastItemCarrelloEl;
var myToastItemCarrello;

Artmedia.Sporting_MatchballPrenotazioni = {
    ShowToastItem: function () {
        //$('#toastItemCarrello').toast('show');
        myToastItemCarrelloEl = document.getElementById('toastItemCarrello');
        myToastItemCarrello = new bootstrap.Toast(myToastItemCarrelloEl);//inizialize it
        myToastItemCarrello.show();//show it
        return true;
    }
};

$(document).ready(function () {

    console.log("ready! import users");


});
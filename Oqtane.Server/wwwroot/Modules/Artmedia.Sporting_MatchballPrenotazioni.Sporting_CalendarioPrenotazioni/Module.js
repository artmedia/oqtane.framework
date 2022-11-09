/* Module Script */
var Artmedia = Artmedia || {
};

var myToastItemCarrelloEl;
var myToastItemCarrello;

//modal
var myModalCarrello;

Artmedia.Sporting_MatchballPrenotazioni = {
    OpenModalCarrello: function () {
        //$('#ModalCarrello').modal('show');
        myModalCarrello = new bootstrap.Modal(document.getElementById('ModalCarrello'), {});
        myModalCarrello.show();
        return true;
    },
    ShowToastItemCarrello: function () {
        //$('#toastItemCarrello').toast('show');
        //return true;
        myToastItemCarrelloEl = document.getElementById('toastItemCarrello');
        myToastItemCarrello = new bootstrap.Toast(myToastItemCarrelloEl);//inizialize it
        myToastItemCarrello.show();//show it
        return true;
    },
    SalvaPrenotazione: function (dotNetObjRef) {
        //richiama c#
        dotNetObjRef.invokeMethodAsync("doSalvaPrenotazione", {});
    },
    InizializzaPayPalButton: function (myImportoCarrello, dotNetObjRef, UidOrdineTestata, ambiente, riferimenti) {

        paypal.Button.render({
            // Configure environment
            env: ambiente, //'production', // sandbox | production
            client: {
                sandbox: 'AQi0e0axmViOqkuZBwk67IcsYX6UINDMul_AgtJkW0DnOa6pZ2imnsyy-GYuFOqZDUOk9yZjwww3ZZFH',
                production: 'Ac6wq6GKhuMXMpyBenViauheXRuqgZ__iyq5tOzZHvFFX5sADS5ikcauShrIKPcHhIIiwUCVa6Tfc0Uv'
            },
            // Customize button (optional)
            locale: 'it_IT',
            style: {
                size: 'large',
                color: 'gold',
                shape: 'pill',
            },

            // Enable Pay Now checkout flow (optional)
            commit: true,

            // Set up a payment
            payment: function (data, actions) {
                return actions.payment.create({
                    transactions: [{
                        amount: {
                            total: myImportoCarrello, //'0.01',
                            currency: 'EUR'
                        },
                        description: riferimenti + ' prenotazione tennis campo coperto.'
                        , custom: ''
                        //,invoice_number: '123456789' //Insert a unique invoice number
                        //,payment_options: {
                        //    allowed_payment_method: 'INSTANT_FUNDING_SOURCE'
                        //}
                        //,soft_descriptor: 'ECHI5786786'
                    }]
                });
            },
            // Execute the payment
            onAuthorize: function (data, actions) {
                return actions.payment.execute().then(function () {
                    // Show a confirmation message to the buyer
                    //debugger;
                    //var a = data;
                    //var b = actions;
                    //window.alert('Grazie per il tuo acquisto!');
                    //processPayPal(data);
                    //SalvaPrenotazione
                    //DotNet.invokeMethodAsync("doSalvaPrenotazione");
                    dotNetObjRef.invokeMethodAsync("doSalvaPrenotazione", UidOrdineTestata);
                });
            }
        }, '#paypal-button');

        return true;
    }


};


$(document).ready(function () {
    console.log("ready!");
});

var mouse_down;

$(document).ready(function () {
    mouse_down = false;
});

//$("div.h").on("mousedown mouseup mouseover", myEventHandler);
$(document).on("mousedown mouseup mouseover", "div.h", myEventHandler);

function myEventHandler(e) {

    //console.log(e.type); // Event type ('mousedown', 'mouseup' etc)
    //console.log("The element that triggered the event: " + this); // The element that triggered the event.
    //console.log(mouse_down);

    let eventType = e.type;
    //let target = $(e.target);
    let myElement = $(this);

    if (eventType === "mouseover") {
        if (mouse_down === true) {
            selezionaItem(myElement);
        }
    }

    if (eventType === "mousedown") {
        console.log("mousedown");
        selezionaItem(myElement);
        mouse_down = true;
    }

    if (eventType === "mouseup") {
        if (mouse_down === true) {
            mouse_down = false;
            //alert("mouseup");
            console.log("mouseup");
            getOreSelectedBase();//FA PARTIRE LA SUB C#
            remoteFlags();
        }
    }
}

function selezionaItem(myItem) {

    if (myItem.hasClass("ui-selected")) {

        if (!myItem.hasClass("selected-flag")) {
            myItem.removeClass("ui-selected");
            myItem.addClass("selected-flag");
        }

    } else {
        myItem.addClass("ui-selected selected-flag");
    }
}

function remoteFlags() {
    $("div.h").removeClass("selected-flag");
}


function getOreSelectedBase() {

    let arrayOreSelected = [];
    arrayOreSelected = getArrayOreSelected();

    // DotNetObjRef è istanziato una sola volta all'inizio in JS
    // per cui non deve essere passato in ogni function
    myDotNetObjRef.invokeMethodAsync("doVisualizzaOreSelectedByJs", JSON.stringify(arrayOreSelected));
    //console.log("call start doVisualizzaOreSelectedByJsStatic");
    //DotNet.invokeMethodAsync("Artmedia.Sporting_MatchballPrenotazioni.Client.Oqtane","doVisualizzaOreSelectedByJsStatic", JSON.stringify(arrayOreSelected));
    //console.log("call end doVisualizzaOreSelectedByJsStatic");
}

function getArrayOreSelected() {
    //restituisce Array ore selezionate con selezione multipla
    let arrayOreSelected = [];

    $('.tblprenotazioni').find('.h').each(function (ii, ora) {

        if ($(ora).hasClass("selected-flag")) {

            //let _yearselezionato = $('#dataselezionata').data("yearselezionato");
            //let _monthselezionato = $('#dataselezionata').data("monthselezionato");
            //let _dayselezionato = $('#dataselezionata').data("dayselezionato");
            //console.log("_yearselezionato=" + _yearselezionato + ";_monthselezionato=" + _monthselezionato + ";_dayselezionato=" + _dayselezionato);

            let _orainizio = $(ora).data("orainizio");
            let _tabella = $(ora).closest("table");
            let _idcampo = _tabella.data("idcampo");
            //let _prenotazione = { IdCampo: _idcampo, OraInizio: _orainizio, Anno: _yearselezionato, Mese: _monthselezionato, Giorno: _dayselezionato };
            let _prenotazione = { IdCampo: _idcampo, OraInizio: _orainizio };
            arrayOreSelected.push(_prenotazione);
        }

    });
    return arrayOreSelected;
}

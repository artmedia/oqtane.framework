/* Module Script */
var Artmedia = Artmedia || {};

Artmedia.ThemeIoForfettario = {
    OpenOffcanvas: function (idOfElement) {
        console.log("Open offcanvasLeftMenu");
        const bsOffcanvas = new bootstrap.Offcanvas('#' + idOfElement);
        bsOffcanvas.show();
    },
    CloseOffcanvas: function (idOfElement) {
        console.log("Close offcanvas " + idOfElement);

        const myObj = document.querySelector('#' + idOfElement)
        //let myObjInstance = bootstrap.Modal.getOrCreateInstance(myObj) // Returns a Bootstrap obj instance
        //let myOffcanvas = document.getElementById(idOfElement);
        const myObjInstance = new bootstrap.Offcanvas.getOrCreateInstance(myObj);// ('#' + idOfElement);
        myObjInstance.hide();
    }
};

function StartPlugins() {
    console.log("executed StartPlugins");
}

$(document).ready(function () {
    console.log('document ready from Theme.js');
});

$(window).resize(function () {
    
});



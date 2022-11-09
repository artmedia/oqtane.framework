/* Module Script */
var ThemeFacefamily = ThemeFacefamily || {};

ThemeFacefamily = {
    OpenOffcanvasLeftMenu: function () {
        console.log("Open offcanvasLeftMenu");
        let myOffcanvas = document.getElementById('offcanvasLeftMenu');
        let bsOffcanvas = new bootstrap.Offcanvas(myOffcanvas);
        bsOffcanvas.show();
    },
    CloseOffcanvasLeftMenu: function () {
        let myOffcanvas = document.getElementById('offcanvasLeftMenu');
        let bsOffcanvas = new bootstrap.Offcanvas(myOffcanvas);
        bsOffcanvas.hide();
    }
};

function StartPlugins() {
    console.log("executed StartPlugins");
    //SetSlideshowHeight();
    //AOS.init();
}

function StartGoogleGlobalSiteTag() {
    // Global site tag (gtag.js) - Google Analytics anonimizzato /////
    window.dataLayer = window.dataLayer || [];
    function gtag() { window.dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'UA-XXXXXX-1', { 'anonymize_ip': true });
    console.log("started Global site tag (gtag.js) anonimizzato");
}

$(document).ready(function () {
    console.log('document ready from Theme.js');
    //SetSlideshowHeight();
});

$(window).resize(function () {
    
});

ThemeFacefamily.RestylingArtmediaWebSite = {

    WriteConsoleLog: function (myLogText) {
        console.log(myLogText);
    } 
};


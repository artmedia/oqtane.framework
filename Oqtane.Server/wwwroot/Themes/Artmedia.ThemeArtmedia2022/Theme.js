/* Module Script */
var Artmedia = Artmedia || {};

// ++++++++++ plausible ++++++++++++++++++++
/*<script defer data-domain="artmedia.it" src="https://plausible.io/js/plausible.js"></script>*/
$(document).ready(function () {
    $('<script>')
        .attr('defer','')
        .attr('data-domain', 'artmedia.it')
        .attr('src', 'https://plausible.io/js/plausible.js')
        .appendTo('head');
});

function SetSlideshowHeight() {
    //hcalculated
    const headerH = 32;
    const footerH = 32;
    let h = $(window).height() - (headerH + footerH);
    $('.hcalculated').height(h);
    console.log('h=' + h);
}

function StartPlugins() {
    console.log("executed StartPlugins");
    SetSlideshowHeight();
    AOS.init();
}

//function StartGoogleGlobalSiteTag() {
//    // Global site tag (gtag.js) - Google Analytics anonimizzato /////
//    window.dataLayer = window.dataLayer || [];
//    function gtag() { window.dataLayer.push(arguments); }
//    gtag('js', new Date());
//    gtag('config', 'UA-3638814-1', { 'anonymize_ip': true });
//    console.log("started Global site tag (gtag.js) anonimizzato");
//}

$(document).ready(function () {
    console.log('document ready from Theme.js');
    //SetSlideshowHeight();
});

$(window).resize(function () {
    SetSlideshowHeight();
});

Artmedia.RestylingArtmediaWebSite = {

    WriteConsoleLog: function (myLogText) {
        console.log(myLogText);
    },
    DoSetSlideshowHeight: function () {
        SetSlideshowHeight();
    }
};


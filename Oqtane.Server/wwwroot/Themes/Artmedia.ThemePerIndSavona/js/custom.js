window.__PUBLIC_PATH__ = 'Themes/Artmedia.ThemePerIndSavona/fonts' //'/bootstrap-italia/dist/fonts'


/* Module Script */
var ThemePerIndSavona = ThemePerIndSavona || {};

ThemePerIndSavona = {
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

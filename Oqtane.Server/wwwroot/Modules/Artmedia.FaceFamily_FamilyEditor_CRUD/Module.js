/* Module Script */
var Artmedia = Artmedia || {};

Artmedia.FamilyEditor_Crud = {

    SetActiveTab: function (activeIdOfButton, activeIdOfDivContent) {
        $('.nav-link').removeClass("active");
        $('#' + activeIdOfButton).addClass("active");
        $('.tab-pane').removeClass("active").removeClass("show");
        $('#' + activeIdOfDivContent).addClass("show").addClass("active");
    },
    ConsoleLog: function (myLogText) {
        console.log(myLogText);
    }

};

function ConsoleLog(myLogText) {
    console.log(myLogText);
}



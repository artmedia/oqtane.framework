/* Module Script */
var Artmedia = Artmedia || {};
var strutturaFamily = [];
var strutturaRel = [];
var myDotNetObjRef;

function ConsoleLog(myLogText) {
    console.log(myLogText);
}

Artmedia.FaceFamily_Persons_LIST = {

    //popolaStrutturaFamily: function (myJsonArray, dotNetObjRef) {
    popolaStrutturaFamily: function (myJsonArray) {
        const o = JSON.parse(myJsonArray);
        const _objtype = o.objtype;
        const _objContent = o.objContent;
        strutturaFamily = JSON.parse(_objContent);
        return true;
    },
    popolaStrutturaRel: function (myJsonArray2) {
        const o = JSON.parse(myJsonArray2);
        const _objtype = o.objtype;
        const _objContent = o.objContent;
        strutturaRel = JSON.parse(_objContent);
        return true;
    },
    loadPage: function () {

        console.log('loadPage');
        //alert("Page load");
        popolaChart();
        return true;
    },
    ConsoleLog: function (myLogText) {
        console.log(myLogText);
    },
    InstantiatePhotogallery: function () {
        console.log("called InstantiatePhotogallery");

        //clear
        //$('#mygridmasonry').removeClass().removeAttr("style");

        // close all collapse sections
        //let myCollapseImages = document.getElementById('collapseImages');
        //let bsCollapseImages = new bootstrap.Collapse(myCollapseImages, { toggle: false });
        //bsCollapseImages.hide();

        let mycollapseHtmlText_type30 = document.getElementById('collapseHtmlText_type30');
        let bscollapseHtmlText_type30 = new bootstrap.Collapse(mycollapseHtmlText_type30, { toggle: false });
        bscollapseHtmlText_type30.hide();

        let mycollapseHtmlText_type40 = document.getElementById('collapseHtmlText_type40');
        let bscollapseHtmlText_type40 = new bootstrap.Collapse(mycollapseHtmlText_type40, { toggle: false });
        bscollapseHtmlText_type40.hide();

        let mycollapseHtmlText_type50 = document.getElementById('collapseHtmlText_type50');
        let bscollapseHtmlText_type50 = new bootstrap.Collapse(mycollapseHtmlText_type50, { toggle: false });
        bscollapseHtmlText_type50.hide();

        let mycollapseHtmlText_type60 = document.getElementById('collapseHtmlText_type60');
        let bscollapseHtmlText_type60 = new bootstrap.Collapse(mycollapseHtmlText_type60, { toggle: false });
        bscollapseHtmlText_type60.hide();

        let mycollapseHtmlText_type70 = document.getElementById('collapseHtmlText_type70');
        let bscollapseHtmlText_type70 = new bootstrap.Collapse(mycollapseHtmlText_type70, { toggle: false });
        bscollapseHtmlText_type70.hide();

        // expand collapseImages
        let myCollapseImages = document.getElementById('collapseImages');
        let bsCollapseImages = new bootstrap.Collapse(myCollapseImages, { toggle: false });
        bsCollapseImages.show();

        //render an accordion that’s expanded
        $('accordion').addClass('open');

        //initialize Masonry after all images have been loaded
        $grid = $('#mygridmasonry').imagesLoaded(function () {
            $grid.masonry({
                itemSelector: '.grid-item',
                columnWidth: '.grid-sizer',
                percentPosition: true
            }).masonry('reloadItems');
        });

        //$('#mygridmasonry').masonry({
        //    // set itemSelector so .grid-sizer is not used in layout
        //    itemSelector: '.grid-item',
        //    // use element for option
        //    columnWidth: '.grid-sizer',
        //    percentPosition: true
        //})

        //// init Masonry
        //var $grid = $('#mygridmasonry').masonry({
        //    // set itemSelector so .grid-sizer is not used in layout
        //    itemSelector: '.grid-item',
        //    // use element for option
        //    columnWidth: '.grid-sizer',
        //    percentPosition: true
        //});

        // layout Masonry after each image loads
        //$grid.imagesLoaded().progress(function () {
        //    $grid.masonry('layout');
        //});

        // trigger initial layout
        //$grid.masonry();


        return true;
    },
    InstantiatePhotogalleryParent: function () {
        //photogallery in page parent masonry plugin
        $('#mygridpersons').masonry({
            // set itemSelector so .grid-sizer is not used in layout
            itemSelector: '.grid-item-parent',
            // use element for option
            columnWidth: '.grid-sizer-parent',
            percentPosition: true
        });
    },
    //setDotNetObjRef: function (dotNetObjRef) {
    //    //istanzio l'oggetto DotNetObjRef una sola volta in JS cosi' non devo passarlo ad ogni function
    //    //console.log("called setDotNetObjRef");
    //    myDotNetObjRef = dotNetObjRef;
    //    return true;
    //},
    PopolaStrutturaFamily2: function (myJsonArray, dotNetObjRef) {
        const o = JSON.parse(myJsonArray);
        const _objtype = o.objtype;
        const _objContent = o.objContent;
        strutturaFamily = JSON.parse(_objContent);
        myDotNetObjRef = dotNetObjRef;
        return true;
    },
    VisualizzaFamilyTreeTab: function () {
        const someTabTriggerEl = document.querySelector('#btnVisualizzaFamilyTree')
        const tab = new bootstrap.Tab(someTabTriggerEl)
        tab.show()
    },
    VisualizzaPersonsListTab: function () {
        const someTabTriggerEl = document.querySelector('#btnVisualizzaPersonsList')
        const tab = new bootstrap.Tab(someTabTriggerEl)
        tab.show();

        // Sul click del TAB "Persone" distruggo l'orgchart
        // altrimenti da errore quando fa resize
        isVisibleTabTree = false;
        try {
            chart?.destroy();
            chart = null;
        }
        catch (err) {
            console.log('nav-tree-tab EventListener error=' + err.message);
        }
    },
    InizializzaOrgChart: function () {
        InizializzaOrgChartFn();
    }
    //,loadIsotopePlugin: function () {
    //    $('.grid').isotope({
    //        // options...
    //        itemSelector: '.grid-item',
    //        masonry: {
    //            columnWidth: 200
    //        }
    //    });
    //    return true;
    //}

};

var $grid;
//var $grid = $('#mygridmasonry').masonry({
//    // disable initial layout
//    //initLayout: false,
//    itemSelector: '.grid-item',
//    columnWidth: '.grid-sizer',
//    percentPosition: true
//});


function popolaStrutturaRel2(myJsonArray) {
    const o = JSON.parse(myJsonArray);
    const _objtype = o.objtype;
    const _objContent = o.objContent;
    strutturaRel = JSON.parse(_objContent);
    return true;
}



OrgChart.templates.empty = Object.assign({}, OrgChart.templates.base);
OrgChart.templates.empty.size = [0, 0];
OrgChart.templates.empty.node = '';
OrgChart.templates.empty.plus = '';
OrgChart.templates.empty.minus = '';
OrgChart.templates.empty.img_0 = '';

OrgChart.templates.root = Object.assign({}, OrgChart.templates.olivia);
OrgChart.templates.root.link = '';
//OrgChart.templates.root.node = '';
OrgChart.templates.root.plus = '';
OrgChart.templates.root.minus = '';

OrgChart.templates.emptyroot = Object.assign({}, OrgChart.templates.empty);
OrgChart.templates.emptyroot.link = '';


function InizializzaOrgChartFn() {

    isVisibleTabTree = false;
    chart?.destroy();



    isVisibleTabTree = true;
    try {
        istanziaChart();
        popolaChart();

        chart?.on('click', function (sender, args) {
            var data = sender.get(args.node.id);

            //alert("hai cliccato " + data.id);
            console.log("hai cliccato " + data.id);
            myDotNetObjRef.invokeMethodAsync("openModalPersonDetail", parseInt(data.id));
        });

    }
    catch (err) {
        console.log('nav-tree-tab EventListener error=' + err.message);
    }

}

var isVisibleTabTree = false;
var chart;
function istanziaChart() {
    try {

        chart = new OrgChart(document.getElementById("orgchart"), {
            nodeMouseClick: OrgChart.action.none,
            template: "olivia",
            tags: {
                "selectedperson": { template: "ana" },
                "empty": { template: 'empty' },
                "emptyroot": { template: 'emptyroot' },
                "root": { template: 'root' }
            },
            //mouseScrool: OrgChart.action.none,
            enableSearch: false,
            nodeBinding: {
                field_0: "name",
                field_1: "title",
                img_0: "img"
            }
        });

    }
    catch (err) {
        console.log('istanziaChart error=' + err.message);
    }
}


function popolaChart() {

    try {
        //nodo root=Capostipite
        let personCapostipite = getPersonCapostipite(); //l'unica che non ha parent
        if (personCapostipite != null) {

            try {

                chart?.add({ "id": personCapostipite.id, "name": personCapostipite.name, "title": personCapostipite.title, "img": personCapostipite.img });
                fnricorsiva(personCapostipite);

                //reset width of orgchart from parent DIV (wrapperorgchart)
                let _Width = parseInt($("#wrapperorgchart").innerWidth());
                $("#orgchart").width(_Width);

                chart?.draw(OrgChart.action.init);
                chart?.fit();


            }
            catch (err) {
                console.log('chart error=' + err.message);
            }

        } else {
            console.log('personCapostipite=NULL');
        }
    }
    catch (err) {
        console.log('popolaChart error=' + err.message);
    }

}

var timeout = null;
window.addEventListener('resize', function () {
    if (timeout) {
        clearTimeout(timeout)
    }
    timeout = setTimeout(function () {

        let _width = parseInt($("#wrapperorgchart").innerWidth());
        $("#orgchart").width(_width);

        if (isVisibleTabTree) {
            try {
                chart?.fit();
            }
            catch (err) {
                console.log('resize error=' + err.message);
            }
        }

    }, 500);
})

function fnricorsiva(myPersonParent) {

    // ciclo sui Partner (es.mogli) del capostipite
    let partnerList = getChildList(myPersonParent.id, 'partner');

    // *****************************************
    // Il Parent ha partner (uno o piu' di uno)?
    // *****************************************
    if (partnerList.length == 0) {

        // Parent NON ha Partner
        // per cui ricavo i suoi figli: Figli UNICAMENTE del Capostipite
        let childOfCapostipiteONLYList = getChildList(myPersonParent.id, 'child');
        $(childOfCapostipiteONLYList).each(function (i, objPersonChild) {

            if (objPersonChild != null) {
                try {

                    chart?.add({ "id": objPersonChild.id, "pid": myPersonParent.id, "name": objPersonChild.name, "title": objPersonChild.title, "img": objPersonChild.img });
                    //ricorsione
                    fnricorsiva(objPersonChild);

                }
                catch (err) {
                    console.log('popolaChart error=' + err.message);
                }
            }
        });

    } else {

        $(partnerList).each(function (i, objPersonPartner) {

            if (objPersonPartner != null) {
                try {

                    chart?.add({ "id": objPersonPartner.id, "pid": myPersonParent.id, "tags": ['partner'], "name": objPersonPartner.name, "title": objPersonPartner.title, "img": objPersonPartner.img });

                    // ************************************************************************************************
                    // 3 CASI:
                    // 1) FIGLI SOLO DEL CAPOSTIPITE (E NON DEL PARTNER) ossia hanno una sola Rel con Capostipite
                    // 2) FIGLI SOLO DEL PARTNER (E NON DEL CAPOSTIPITE) ossia hanno una sola Rel con il Partner
                    // 3) FIGLI DELLA COPPPIA CAPOSTIPITE-PARTNER ossia hanno 2 Rel sia con Capostipite che con Partner
                    // ************************************************************************************************

                    // Figli UNICAMENTE del Capostipite (e NON del Partner)
                    let childOfCapostipiteONLYList = [];
                    // Figli UNICAMENTE del Partner (e NON del Capostipite)
                    let childOfPartnerONLYList = [];
                    // Figli IN COMUNE Capostipite-Partner
                    let childOfCapostipitePartnerList = [];

                    // per cui
                    // ricavo tutti i Figli del Capostipite
                    let childOfCapostipiteAllList = getChildList(myPersonParent.id, 'child');
                    // ricavo tutti i Figli del Partner
                    let childOfPartnerAllList = getChildList(objPersonPartner.id, 'child');


                    // Step 1) ricavo i figli della coppia Capostipite-Partner e  UNICAMENTE delCapostipite
                    // ciclo su TUTTI i Figli del Capostipite
                    $(childOfCapostipiteAllList).each(function (i1, objPersonChildOfCapostipite) {

                        let isChildOfPartner = false;
                        // ciclo su TUTTI i Figli del Partner
                        $(childOfPartnerAllList).each(function (i2, objPersonChildOfPartner) {
                            if (objPersonChildOfCapostipite.id == objPersonChildOfPartner.id) {

                                // se matcha allora è figlio della coppia Capostipite-Partner
                                childOfCapostipitePartnerList.push(getPersonById(objPersonChildOfPartner.id));
                                isChildOfPartner = true;
                            }
                        });
                        // se non è figlio in comune allora è figlio unicamente del Capostipite
                        if (isChildOfPartner == false) {
                            // Figlo UNICAMENTE del Capostipite (e NON del Partner)
                            childOfCapostipiteONLYList.push(getPersonById(objPersonChildOfCapostipite.id));
                        }
                    });

                    // Step 2) per differenza, ricavo Figli UNICAMENTE del Partner (e NON del Capostipite)
                    // ciclo su TUTTI i Figli del Partner
                    $(childOfPartnerAllList).each(function (i1, objPersonChildOfPartner) {

                        let isChildOfPartner = false;
                        // la Person su cui sto ciclando è figlia COMUNE della coppia Capostipite-Partner?
                        // (appartiene alla collection che ho ricavato prima) ?
                        $(childOfCapostipitePartnerList).each(function (i2, objPersonChildOfCapostipitePartner) {
                            if (objPersonChildOfPartner.id == objPersonChildOfCapostipitePartner.id) {
                                isChildOfPartner = true;
                            }
                        });
                        // la Person su cui sto ciclando è figlia UNICAMENTE del Capostipite?
                        // (appartiene alla collection che ho ricavato prima) ?
                        $(childOfCapostipiteONLYList).each(function (i3, objPersonChildOfCapostipite) {
                            if (objPersonChildOfPartner.id == objPersonChildOfCapostipite.id) {
                                isChildOfPartner = true;
                            }
                        });
                        // se non è figlio in comune e neppure figlio unicamente del Capostipite, allora è figlio UNICAMENTE del Partner
                        if (isChildOfPartner == false) {
                            // Figlo UNICAMENTE del Partner (e NON del Capostipite e neppure in COMUNE)
                            childOfPartnerONLYList.push(getPersonById(objPersonChildOfPartner.id));
                        }

                    });

                    // ****************************************************
                    // popolo i nodi per ognuna delle 3 collection di Child
                    // ****************************************************

                    // Figli UNICAMENTE del Capostipite (e NON del Partner)
                    $(childOfCapostipiteONLYList).each(function (i, objPersonChild) {

                        if (objPersonChild != null) {
                            try {

                                chart?.add({ "id": objPersonChild.id, "pid": myPersonParent.id, "name": objPersonChild.name, "title": objPersonChild.title, "img": objPersonChild.img });
                                //ricorsione
                                fnricorsiva(objPersonChild);
                            }
                            catch (err) {
                                console.log('popolaChart error=' + err.message);
                            }
                        }

                    });
                    // Figli UNICAMENTE del Partner (e NON del Capostipite)
                    $(childOfPartnerONLYList).each(function (i, objPersonChild) {

                        if (objPersonChild != null) {
                            try {

                                chart?.add({ "id": objPersonChild.id, "pid": objPersonPartner.id, "name": objPersonChild.name, "title": objPersonChild.title, "img": objPersonChild.img });
                                //ricorsione
                                fnricorsiva(objPersonChild);

                            }
                            catch (err) {
                                console.log('popolaChart error=' + err.message);
                            }
                        }

                    });
                    // Figli IN COMUNE Capostipite-Partner
                    $(childOfCapostipitePartnerList).each(function (i, objPersonChild) {

                        if (objPersonChild != null) {
                            try {

                                chart?.add({ "id": objPersonChild.id, "pid": myPersonParent.id, "ppid": objPersonPartner.id, "name": objPersonChild.name, "title": objPersonChild.title, "img": objPersonChild.img });
                                //var nominativo = objPersonChild.name + objPersonChild.id;
                                //ricorsione
                                fnricorsiva(objPersonChild);

                            }
                            catch (err) {
                                console.log('popolaChart error=' + err.message);
                            }
                        }


                    });


                }
                catch (err) {
                    console.log('popolaChart error=' + err.message);
                }
            }



        });

    }
}

function getChildList(idPersonParent, relTypeDescr) {
    // restituisce array con i Figli/Partners della Person (gerarchia Parent/Child diretta)
    // relType = 'child' | 'partner' | 'norel'
    // NOTA: anche i Partners sono Child di tipo 20
    // relType=10 parent/child; relType=20 partner; relType=30 norel
    let myRelType = 10 //default='Parent/Child'
    if (relTypeDescr == "child") { myRelType = 10 };
    if (relTypeDescr == "partner") { myRelType = 20 };
    if (relTypeDescr == "norel") { myRelType = 30 };
    let ChildList = [];
    $(strutturaRel).each(function (i1, objRel) {
        let idParent = objRel.parentId;
        let idChild = objRel.childId;
        let relType = objRel.relType;
        if (idParent == idPersonParent && relType == myRelType) {
            $(strutturaFamily).each(function (i2, objPerson) {
                if (idChild == objPerson.id) {
                    let item = getPersonById(objPerson.id); // ottiene l'oggetto json {id=123,name="aaaa", ecc..}
                    //item["id"] = objPerson.id;
                    //item["name"] = objPerson.name;
                    //item["img"] = objPerson.img;
                    //item["title"] = objPerson.title;
                    ChildList.push(item);
                }
            });
        }
    });
    return ChildList;
}

function getPersonCapostipite() {
    // restituisce Id del capostipite, cioè di colui che non ha parent ulteriori
    // MA ha dei child
    // NOTA: anche la moglie è child del capostipite con una relazione di tipo 30
    let idPersonCapostipite = -999;
    let PersonCapostipite = {};

    // JSON.parse(JSON.stringify(myJsonArray));
    // strutturaFamily = JSON.parse(JSON.parse(JSON.stringify("'" + strutturaFamily + "'")));

    const _isArray = $.isArray(strutturaFamily);
    const _len = strutturaFamily.length;

    $(strutturaFamily).each(function (i1, objPerson) {

        let idPerson = objPerson.id;
        // Ha parent?
        let hasParent = false;
        $(strutturaRel).each(function (i2, objRel) {
            // cerco il capostipite: non ha parent x cui lo trovo se non esiste tra i child
            // let idParent = objRel.parentId;
            let idChild = objRel.childId;
            if (idPerson == idChild) {
                hasParent = true;
            }
        });
        // Ha child?
        let hasChild = false;
        if (hasParent == false) {
            $(strutturaRel).each(function (i2, objRel) {
                // è parent di qlcuno?
                let idParent = objRel.parentId;
                if (idPerson == idParent) {
                    hasChild = true;
                }
            });
        }
        if (hasParent == false && hasChild) {
            idPersonCapostipite = idPerson;
            //alert("idPersonCapostipite=" + idPersonCapostipite);
        }
    });

    $(strutturaFamily).each(function (i, objPerson) {
        if (idPersonCapostipite == objPerson.id) {
            PersonCapostipite = getPersonById(objPerson.id);
            //PersonCapostipite["id"] = objPerson.id;
            //PersonCapostipite["name"] = objPerson.name;
            //PersonCapostipite["img"] = objPerson.img;
            //PersonCapostipite["title"] = objPerson.title;
        }
    });
    return PersonCapostipite;
}

function getPersonById(Id) {
    // restituisce obj Person dal suo Id
    let myPerson = {};
    $(strutturaFamily).each(function (i, objPerson) {
        if (objPerson.id == Id) {
            //myPerson = {}
            myPerson["id"] = objPerson.id;
            myPerson["name"] = objPerson.name;
            myPerson["img"] = objPerson.img;
            myPerson["title"] = objPerson.title;
        }
    });
    return myPerson;
}


function doShowStrutturaFamily() {
    console.log('strutturaFamily=' + JSON.stringify(strutturaFamily));
    alert("strutturaFamily=" + JSON.stringify(strutturaFamily));
}

function doShowStrutturaRel() {
    console.log('strutturaRel=' + JSON.stringify(strutturaRel));
    alert("strutturaRel=" + JSON.stringify(strutturaRel));
}


//// ********************************************************************
//// Sul click del TAB "Albero genealogico" faccio popolare il Tree
//// altrimenti non si popola perche' il div <div id="orgchart"> è hidden
//// ********************************************************************

//var tabEl = document.querySelector("#nav-tree-tab");
//tabEl?.addEventListener('shown.bs.tab', function (event) {
//    //isVisibleTabTree = false;
//    //event.target // newly activated tab
//    //event.relatedTarget // previous active tab
//    //if (event.target.id == "nav-tree-tab") {

//    try {

//        istanziaChart();
//        popolaChart();
//        isVisibleTabTree = true;

//        chart?.on('click', function (sender, args) {
//            var data = sender.get(args.node.id);

//            //alert("hai cliccato " + data.id);
//            console.log("hai cliccato " + data.id);
//            myDotNetObjRef.invokeMethodAsync("openModalPersonDetail", parseInt(data.id));
//        });

//    }
//    catch (err) {
//        console.log('nav-tree-tab EventListener error=' + err.message);
//    }

//});

// ********************************************************************
// Sul click del TAB "Persone" distruggo l'orgchart
// altrimenti da errore quando fa resize
// ********************************************************************
//var tabElPersons = document.querySelector("#nav-pictures-tab");
//tabElPersons.addEventListener('shown.bs.tab', function (event) {
//    isVisibleTabTree = false;
//    chart?.destroy();
//});



function openModalPersonDetailFn() {
    let myModalPersonDetail = new bootstrap.Modal(document.getElementById('modalPersonDetail'), {
        keyboard: false
    });
    myModalPersonDetail.show();
};
function closeModalPersonDetailFn() {
    let myModalPersonDetail = new bootstrap.Modal(document.getElementById('modalPersonDetail'), {});
    myModalPersonDetail.hide();
};


$(function () {
    console.log('ready from Module.js');
});
$(document).ready(function () {
    console.log('document ready from Module.js');

    //alert("document ready");
    //istanziaChart();

    $grid = $('#mygridmasonry').imagesLoaded(function () {
        $grid.masonry({
            itemSelector: '.grid-item',
            columnWidth: '.grid-sizer',
            percentPosition: true
        });
    });
});
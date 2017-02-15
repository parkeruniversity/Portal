//Initialize these position counters for non-IE browsers.
var xPos = 0; var yPos = 0;

//if (!document.all) {
    document.onmousemove = earGetMouseXY;
//}

//use browser sniffing to determine if IE or Opera (ugly, but required)
var isOpera, isIE = false;
if (typeof (window.opera) != 'undefined') { isOpera = true; }
if (!isOpera && navigator.userAgent.indexOf('Internet Explorer')) { isIE = true; }

//fix both IE and Opera (adjust when they implement this method properly)
if (isOpera || isIE) {
    document.nativeGetElementById = document.getElementById;
    //redefine it!
    document.getElementById = function(id) {
        var elem = document.nativeGetElementById(id);
        if (elem) {
            //verify it is a valid match!
            if (elem.id == id) {
                //valid match!
                return elem;
            } else {
                //not a valid match!
                //the non-standard, document.all array has keys for all name'd, and id'd elements
                //start at one, because we know the first match, is wrong!
                for (var i = 1; i < document.all[id].length; i++) {
                    if (document.all[id][i].id == id) {
                        return document.all[id][i];
                    }
                }
            }
        }
        return null;
    };
}

function earShowPopup(popupId) {
    if (!document.getElementById) return;

    var parent = document.getElementById('earForm');
    var elems = parent.getElementsByTagName('div');

    for (var i = 0; i < elems.length; i++) {
        var sub = elems[i].id.substring(5, 0);
        if (sub == 'popup') earHidePopup(elems[i].id);
    }

    //Get the popup div.
    var popupNav = document.getElementById(popupId);

    //Figure out whether the popup should be on the other side of the mouse pointer.
    var rightEdge;
    if (document.all) {
        rightEdge = document.body.clientWidth;
    }
    else {
        rightEdge = window.innerWidth;
    }

    //Figure out the offsets.
    xPos -= (xPos > (rightEdge - popupNav.clientWidth) ? rightEdge - popupNav.clientWidth : 0);

    //Set the location of the popup to the position of the mouse.
    popupNav.style.position = 'absolute';
    popupNav.style.left = xPos + 'px';
    popupNav.style.top = yPos + 'px';
    popupNav.style.display = 'block';
}

function earHidePopup(popupID) {
    var el = document.getElementById(popupID).style.display = 'none';
}

function earGetMouseXY(e) {
    if (!document.all)
    {
    xPos = e.pageX;
    yPos = e.pageY;
}
    else
    {
        //offsets for IE scrolling
        xPos = event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
        yPos = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
    }
}

function earUpdateDisplay(name) {
    var els = document.getElementsByName(name);
    var length = els.length;
    var val = "";

    if (length != undefined) { // if the button group is an array (one button is not an array)
        for (var i = 0; i < length; i++) {
            var req = els[i].getAttribute('data-req');
            if (earElemHasValue(els[i])) {
                val = els[i].value;
                if (req != null && req != '') {
                    var reqEl = document.getElementById(req);
                    reqEl.innerHTML = 'Required';
                }
                var el = document.getElementById("div" + name + val);
                if (el != undefined)
                    el.style.display = 'block';
            }
            else {
                val = els[i].value;
                if (req != null && req != '') {
                    var reqEl = document.getElementById(req);
                    reqEl.innerHTML = 'Optional';
                    reqEl.className = '';
                }
                var el = document.getElementById("div" + name + val);
                if (el != undefined)
                    el.style.display = 'none';
            }
        }
        return;
    }

    val = els.value;
    var req = els[i].getAttribute('data-req');
    var el = document.getElementById(name + val);
    if (earElemHasValue(els)) {
        if (req != null && req != '') {
            var reqEl = document.getElementById(req);
            reqEl.innerHTML = 'Required';
        }
        if (el != undefined) {
            el.style.display = 'block';
        }
    }
    else {
        if (req != null && req != '') {
            var reqEl = document.getElementById(req);
            reqEl.innerHTML = 'Optional';
            reqEl.className = '';
        }
        if (el != undefined) {
            el.style.display = 'none';
        }
    }
}

function earValidateSubmit() {
    var parent = document.getElementById('earForm');
    var elems1 = parent.getElementsByTagName('input');
    var elems2 = parent.getElementsByTagName('select');
    var elems3 = parent.getElementsByTagName('textarea');

    var elems = earJoinLists(elems1, elems2);
    elems = earJoinLists(elems, elems3);

    /* DEBUG CODE
    var st = '';
    for (var i = 0; i < elems.length; i++) {
        st += elems[i].name + '|' + elems[i].value + '|';
    }
    alert(st);
    */

    var showAlert = false;
    var reqEl;

    if (elems.length != undefined) {
        var val = 'XXXXX';
        var valOpt = '';
        var isReq = false;
        var hasVal = false;

        var inSub = false;
        var isReqSub = false;
        var hasValSub = false;

        for (var i = 0; i < elems.length; i++) {
            if (val != elems[i].name) {
                if (elems[i].name.indexOf(val) != -1) {
                    inSub = true;
                    hasValSub = false;
                    if (!earElemHasValue(elems[i - 1])) {
                        isReqSub = false;
                    }
                    else {
                        reqEl = document.getElementById(elems[i].name + 'REQ');
                        if (reqEl != undefined) {
                            reqEl.className = '';
                            isReqSub = (reqEl.innerHTML == 'Required');
                        }
                        else
                            isReqSub = false;
                    }
                    valOpt = val;
                    val = elems[i].name;
                }
                else if (inSub) {
                    inSub = false;
                    val = valOpt;
                }

                if (val != elems[i].name) {
                    inSub = false;
                    hasVal = false;
                    if ((isReq && !hasVal) || (isReqSub && !hasValSub)) {
                        reqEl.className = 'erpUDError';
                        showAlert = true;
                    }
                    reqEl = document.getElementById(elems[i].name + 'REQ');
                    if (reqEl != undefined) {
                        reqEl.className = '';
                        isReq = (reqEl.innerHTML == 'Required');
                    }
                    else
                        isReq = false;
                    val = elems[i].name;
                }
            }
            if (inSub) {
                if (isReqSub && !hasValSub) {
                    hasValSub = earElemHasValue(elems[i]);
                    if (hasValSub) isReqSub = false;
                }
            }
            else {
                if (isReq && !hasVal) {
                    hasVal = earElemHasValue(elems[i]);
                    if (hasVal) isReq = false;
                }
            }
        }
        if (isReq && !hasVal) {
            reqEl.className = 'erpUDError';
            showAlert = true;
        }
    }
    else {
        if (!elems.checked) {
            reqEl = document.getElementById(elems.name + 'REQ');
            if (reqEl != undefined)
                showAlert = (reqEl.innerHTML == 'Required');

            if (showAlert) reqEl.className = 'erpUDError';
            else reqEl.className = '';
        }
    }

    if (showAlert) alert('Required questions not answered.');
    return !showAlert;
}

function earElemHasValue(elem) {
    var ret;
    if (elem.tagName.toUpperCase() == 'SELECT')
        return (!elem.options[0].selected);

    if (elem.tagName.toUpperCase() == 'TEXTAREA')
        return (elem.value != '');

    if (elem.type.toUpperCase() == 'TEXT')
        return (elem.value != '');

    return elem.checked;
}

function earSort(a, b) {
    if (a == undefined) return 1;
    if (b == undefined) return -1;
    if (a.name < b.name) return -1;
    if (a.name > b.name) return 1
    return 0;
}

function earJoinLists(list1, list2) {
    var list = new Array();
    var l = list1.length + list2.length;
    var l1 = 0;
    var l2 = 0;

    for (var i = 0; i < l; i++) {
        if (earSort(list1[l1], list2[l2]) <= 0)
            list[i] = list1[l1++];
        else
            list[i] = list2[l2++];
    }

    return list;
}
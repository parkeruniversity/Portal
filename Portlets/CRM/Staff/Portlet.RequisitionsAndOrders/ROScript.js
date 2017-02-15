function numberWithCommas(x)
{
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function ShowSelectedShipAddress(ShipAddresses, ShipAddress) {
    var ddlShipAddresses = document.getElementById(ShipAddresses);
    var selectedAddress = ddlShipAddresses.options[ddlShipAddresses.selectedIndex].value;
    var separated = selectedAddress.split(";");

    var address = '';

    if (separated[1] != '') {
        address += separated[1];
    }

    if (separated[2] != '') {
        address += '<br/>' + separated[2];
    }

    if (separated[3] != '') {
        address += '<br/>' + separated[3];
    }
    
    document.getElementById(ShipAddress).innerHTML = address;
}

function showHide(el) {
    el.style.display = (el.style.display == "block") ? "none" : "block";
}

function setSelectedIndex(ddl, val) {
    for (var i = 0; i < ddl.options.length; i++) {
        if (ddl.options[i].value == val) {
            ddl.options[i].selected = true;
            return;
        }
    }
}

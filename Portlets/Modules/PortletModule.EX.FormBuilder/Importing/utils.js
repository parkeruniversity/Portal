function doCheck(headerIsChecked, eleName, gridName){
	var i, obj;
	for (i = 0; i < document.forms[0].elements.length; i ++) {
		obj = document.forms[0].elements[i];
		if (obj.type == "checkbox") {
			if (obj.name.indexOf(eleName) != -1 && obj.name.indexOf(gridName) != -1){
				obj.checked = headerIsChecked;
			}
		}
	}
}
function SelectThisOnly(gridCount, grdName) {
	var i, obj;
	for (i = 0; i < document.forms[0].elements.length; i ++) {
		obj = document.forms[0].elements[i];
		if (obj.type == "radio") {
			if (obj.name.indexOf(grdName) != -1){
				if( obj.name.indexOf("row" + gridCount + "$") != -1 ){
					obj.checked = true;
				}else{
					obj.checked = false;
				}
			}
		}
	}
}


//CampusDirectory related javascript
var blnDataChanged = false;

// used to notify that data was changed
function DataChanged()
{
	blnDataChanged = true;
}

// returns true if was changed
function IsDataChanged()
{
	return blnDataChanged;
}

// used to set for all checkboxes which id contains txtNamePart
//checked property to blnChecked
function checkAllCheckboxesWithIDFromRadioChoice(doCheck,txtIdPart)
{
	//alert(doCheck);
	var x = document.getElementsByTagName('input');
	for(i = 0; i < x.length; i ++){
		if(x[i].type == 'checkbox' && x[i].id != null && x[i].id.indexOf(txtIdPart) >= 0){
			x[i].checked = doCheck;
		}
		/*if(x[i].type == 'radio' && x[i].id != null && x[i].id.indexOf(txtIdPart) >= 0){
			x[i].checked = blnChecked;
		}*/
	}
}

// returns true data was not changed or user click "OK" on message
function RemindToSaveData(message)
{
	if(blnDataChanged){
		return confirm(message);
	}
	return true;
}
// deselect everyone and change style of spanEveryone depend on checkbox state
function DeselectEveryone(id){
	if(id!=null){
		var chb = document.getElementById(id);
		if(chb!=null){
			if(chb.checked){
				chb.checked = false;
				ChangeEveryoneStyle(id);
			}
		}
	}
}
// change style of spanEveryone depend on checkbox state
function ChangeEveryoneStyle(id){
	if(id != null){
		var chb = document.getElementById(id);
		var spanid = new String(id);
		spanid = spanid.replace("chbEveryone", "spanEveryone");
		var span = document.getElementById(spanid);
		if(chb != null && span != null){
			span.className = chb.checked? "Everyone" : "";
		}
	}
}
function ToggleEveryoneStyle(id,state){
	if(id != null){
		var chb = document.getElementById(id);
		var spanid = new String(id);
		spanid = spanid.replace("chbEveryone", "spanEveryone");
		var span = document.getElementById(spanid);
		span.className = state == "on" ? "Everyone" : "";
	}
}

function CDchangeParentStyle(o){
	o.parentNode.className = o.parentNode.className == 'Everyone' ? '' : 'Everyone';
}
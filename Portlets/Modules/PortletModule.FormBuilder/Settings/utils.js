
//***************** Payment Options ******************************
function checkFeeAmt( source, args ){
	feeAmt = eval("document.forms[0]." + tbFeeAmtClientName + ".value");
	args.IsValid = true;
	if( args.Value == 1 || args.Value == 2 ){
		//Charge Fee: Yes
		if( !feeAmtIsValid(feeAmt) ){
			args.IsValid = false;
		}else if( feeAmt <= 0 ){
			args.IsValid = false;
		}
	}else{
		//Charge Fee: No
		if( feeAmt.length > 0 ){
			if( !feeAmtIsValid(feeAmt) ){
				args.IsValid = false;
			}
		}
	}
}
function checkEmail( source, args ){
	args.IsValid = true;
	email = eval("document.forms[0]." + tbEmailClientName + ".value");
	if( email.length > 0 || args.Value == 1 ){
		if( !emailIsValid(email) ){
			args.IsValid = false;
		}
	}
}
function feeAmtIsValid(feeAmt){
	if( isNaN(feeAmt) ){
		return false;
	}else if( isStringWhitespace(feeAmt) ){
		return false;
	}else{
		return true;
	}
}
//***************** End Payment Options ****************************



//***************** Completion Messages ****************************
function setDivs(_type,_format){
	switch( _type ){
		case "success":
			if( _format == "rich" ){
				document.getElementById(divFormatMsgTbSucc).style.display = "none";
				document.getElementById(divFormatMsgTbeSucc).style.display = "block";
			}else if( _format == "plain" ){
				document.getElementById(divFormatMsgTbSucc).style.display = "block";
				document.getElementById(divFormatMsgTbeSucc).style.display = "none";
			}
			break;

		case "unsuccess":
			if( _format == "rich" ){
				document.getElementById(divFormatMsgTbUnSucc).style.display = "none";
				document.getElementById(divFormatMsgTbeUnSucc).style.display = "block";
			}else if( _format == "plain" ){
				document.getElementById(divFormatMsgTbUnSucc).style.display = "block";
				document.getElementById(divFormatMsgTbeUnSucc).style.display = "none";
			}
			break;
	}
}
//***************** End Completion Messages ************************



//***************** Shared Utils ***********************************
function emailIsValid(email){
	invalidChars = " /:,;"
	str_email = email;
	for(var i = 0; i < invalidChars.length; i++){
		badChar = invalidChars.charAt(i)
		if(str_email.indexOf(badChar,0) != -1){
			return false;
		}
	}
	atPos = str_email.indexOf("@", 1)
	if(atPos == -1){
		return false;
	}
	if(str_email.indexOf("@",atPos + 1) != -1){
		return false;
	}
	periodPos = str_email.indexOf(".",atPos)
	if(periodPos == -1){
		return false;
	}
	if( periodPos == atPos + 1 ){
		return false;
	}
	if(periodPos + 3 > str_email.length){
		return false;
	}
	return true;
}

var whitespace = " \t\n\r";
function isEmpty(s){   
	return ((s == null) || (s.length == 0));
}
function isStringWhitespace(s){   
	var i;
	if (isEmpty(s)) return true;
	for (i = 0; i < s.length; i++){
		var c = s.charAt(i);
		if (whitespace.indexOf(c) == -1) return false;
	}
	return true;
}
//***************** End Shared Utils *******************************

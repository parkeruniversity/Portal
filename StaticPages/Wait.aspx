<%@ Page language="c#" Codebehind="Wait.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.Wait" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
<head>
<title>Wait</title>
<script>
function createXmlHttpRequest(){
	var r=false;
    // branch for native XMLHttpRequest object
    if(window.XMLHttpRequest) {
    	try {
			return new XMLHttpRequest();
        } catch(e) {
			return false;
        }
    // branch for IE/Windows ActiveX version
    } else if(window.ActiveXObject) {
       	try {
        	return new ActiveXObject("Msxml2.XMLHTTP");
      	} catch(e) {
        	try {
          		return new ActiveXObject("Microsoft.XMLHTTP");
        	} catch(e) {
          		return false;
        	}
		}
    }
    return false;
}

var stat=[];
function checkStatus(){
	var z=createXmlHttpRequest();
	if(!z)document.forms[0].submit();
	z.onreadystatechange=function(){
		if (z.readyState==4) {
			var status=z.responseXML.getElementsByTagName('status')[0].firstChild.nodeValue;
			if(status=='Executing'){
				document.getElementById('message').innerHTML = z.responseXML.getElementsByTagName('message')[0].firstChild.nodeValue;
				startCheckingStatus();
			}
			else if(status=="Failed"){
				//document.getElementById('message').innerHTML = "Process Failed";
				document.forms[0].submit();
			}
			else if(status=="Succeded"){
				//document.getElementById('message').innerHTML = "Process Complete";
				document.forms[0].submit();
			}
		}
	}
	z.open("GET","<%=this.Context.Request.ApplicationPath%>/StaticPages/ProcessStatus.ashx",true);
	z.send(null);
}

function startCheckingStatus(){
	window.setTimeout("checkStatus();",3000);
}
window.onload=function(){
	startCheckingStatus();
}
</script>
<style>
* { margin: 0; background: #fff; font-family: verdana, arial, sans-serif; }
#wrap { height: 20em; top: 50%; margin-top: -10em; text-align: center; position: absolute; width: 100% }
h1 { color: #252875; font-size: 150%;}
</style>
</head>
<body>
<div id="wrap">
<form action="<%=this.Context.Request.RawUrl%>" method="post">
<input type="hidden" name="__PORTLET" value="<%=this.Request["__PORTLET"]%>" />
<input type="hidden" name="__VIEWSTATE" value="<%=this.Request["__VIEWSTATE"]%>" />
<input type="hidden" name="AllowPostback" value="true" />
<h1><cmn:GlobalizedLiteral runat="server" TextKey="TXT_PLEASE_WAIT" /></h1>
<div><img src="<%=this.Context.Request.ApplicationPath%>/UI/Common/Images/wait.gif" alt=""/></div>
<p id="message"><%=this.CurrentlyExecutingLongProcess.Message%></p>
</form>
</div>
</body>
</html>

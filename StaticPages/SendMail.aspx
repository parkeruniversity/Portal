<%@ Page language="c#" Codebehind="SendMail.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.SendMailPage" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jweb" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<!DOCTYPE html PUBLIC "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
<title>Send Mail</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<link href="UI/Common/Styles/siteStyle.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" type="text/javascript" src="UI/Common/Scripts/Utility.js"></SCRIPT>
<script language="JavaScript" type="text/javascript" src="UI/Common/Scripts/jenz.js"></script>
<script language="javascript" type="text/javascript">
window.onload=function(){
	document.getElementById('file1').onchange=addFile;
	document.getElementById('txtTo').focus();
}
function addFile(){
	var prnt=this.parentNode;
	var ins=prnt.getElementsByTagName('input');
	for(var x=0;x<ins.length;x++)
		if(ins[x].value.length==0)
			return;
	var i=document.createElement('input');
	i.type='file';
	i.id='file'+ins.length;
	i.name='file'+ins.length;
	i.onchange=addFile;
	prnt.appendChild(i);
}
</script>

BODY#mail #hotkeys {
	FONT-SIZE: 80%; COLOR: #006; LINE-HEIGHT: 2em; TEXT-ALIGN: center
}
BODY#mail #hotkeys SPAN {
	MARGIN: 1em; WHITE-SPACE: nowrap
}
BODY#mail #message TEXTAREA {
	WIDTH: 100%; HEIGHT: 20em;
}
</style>
</head>
<body id="mail">

<jweb:SiteHeader id="siteHeader" runat="server" />

<div id="preamble">
<h2>Send Mail</h2>
</div>

<form id="composer" encType="multipart/form-data" runat="server">


<h4>Recipients</h4>
<div class="pSection">
	<fieldset>
	<p class="hint">Enter the email adddresses that you wish to send this message to separated by a comma(,) if you wish to sent the message to more than one address.</p>
	<table>
	<tr><th><label id="lblTo" for="txtTo">To:</label></th><td><input id="txtTo" accesskey="t" tabindex="10" type="text" name="txtTo" runat="server"></td></tr>
	</table>	
	<cmn:Collapsiblepanel id="cpTo" runat="server" text="Select Users &amp; Groups">
		<p class="hint">Select the users and or the Groups that you wish to address your message to.</p>
		<jenz:principalselector id="psTo" runat="server" />
	</cmn:Collapsiblepanel>
	</fieldset>
</div>

<h4>Message</h4>
<div class="pSection" id="message">
	<fieldset>
	<table>
	<tr><th><label id="lblSub" for="txtSub">Subject:</label></th><td><input id="txtSub" accesskey="s" tabindex="30" type="text" name="txtSub" runat="server"></td></tr>
	<tr><th><label id="lblMessage" for="txtMessage">Body:</label></th><td><textarea id="txtMessage" accesskey="m" tabindex="40" name="txtMessage" runat="server"></textarea></td></tr>
	</table>
	</fieldset>
</div>

<h4>Attachments</h4>
<div class="pSection" id="attachments">
	<fieldset>
	<p class="hint">Click 'browse' to search for a file and add as an attachment to your e-Mail message. Files over 2MB will not be sent.</p>
	<table class="formLayout">
	<tr><th><label for="file1">File:</label></th><td><input id="file1" accesskey="a" type="file" name="file1"></td></tr>
	</table>
	</fieldset>
</div>

<div class="pSection">
	<input id="btnSend" type="button" value="Send" name="btnSend" runat="server" />
	<input id="btnCancel" onclick="window.close()" type="button" value="Cancel" /> 
</div>

</form>

<div id=hotkeys>
<h3>Keyboard Shortcuts</h3>
<span>[Alt - T] Goto 'To' field</span>
<span>[Alt - C] Goto 'CC' field</span>
<span>[Alt - S] Goto 'Subject' field</span>
<span>[Alt - M] Goto email message body</span>
<span>[Alt - A] Goto attachments</span>
</div>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Response.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.IdentityProvider.Response" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title><%= Globalizer.GetGlobalizedString("TXT_JICS_SSO") %></title>

	<script type="text/javascript" language="javascript">
	    function SubmitLoginForm() {
	        var action = document.getElementById("FormSamlResponse").action;
			if(action.substring((action.length - 4), action.length) != "none") document.forms[0].submit();
		}
	</script>

</head>
<body onload="SubmitLoginForm();">
	<form id="FormSamlResponse" method="post" action="<%= ActionUrl %>" style="display:none;">
        <input id="SAMLResponse" runat="server" type="hidden" />
	    <input id="RelayState" runat="server" type="hidden" />
	</form>
	<asp:Literal ID="message" runat="server" />
</body>
</html>
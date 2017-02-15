<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.IdentityProvider.Logout" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jics" TagName="CustomSamlHeader" Src="~/ClientConfig/Controls/CustomSamlHeader.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomSamlFooter" Src="~/ClientConfig/Controls/CustomSamlFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%= Globalizer.GetGlobalizedString("TXT_JICS_SSO") %></title>
    <link rel="stylesheet" type="text/css" href="../../../UI/Common/Styles/siteStyle.css" /> 
</head>
<body>
	<jics:CustomSamlHeader id="customSamlHeader" runat="server" />
    <form id="form1" runat="server">
    <div class="pSection">
        <%= Globalizer.GetGlobalizedString("MSG_SAML_LOGOUT") %>
		<% if (Request.UrlReferrer != null) 
		   { 
		       Response.Write("<br /><br />Return to <a href=\"" + 
                   Request.UrlReferrer + "\">previous page</a>."); 
		   } 
		%>
    </div>
    </form>
	<jics:CustomSamlFooter id="customSamlFooter" runat="server" />
</body>
</html>
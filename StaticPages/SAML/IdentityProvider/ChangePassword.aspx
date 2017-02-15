<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.IdentityProvider.ChangePassword" %>
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
    <div>
        <% Response.Redirect(ResolveUrl("~/default.aspx?tool=accountInfo"));  %>
    </div>
    </form>
    <jics:CustomSamlFooter id="customSamlFooter" runat="server" />
</body>
</html>
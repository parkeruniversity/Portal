<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.ServiceProvider.Request" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%= Globalizer.GetGlobalizedString("TXT_JICS_SSO") %></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%= Globalizer.GetGlobalizedString("MSG_AUTH_REQUEST") %>
    </div>
    </form>
</body>
</html>
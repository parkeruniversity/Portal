<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureBrowserConfirmation.aspx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Pages.SecureBrowserConfirmation" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.LockDownBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/UI/Common/Styles/siteStyle.css") %>" /> 
    <link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx") %>" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="secureBrowserInfo">
        <div class="confirmed">
            <h5><%= Globalizer.GetString("HDR_CWK_SECURE_BROWSER_CONFIRMED") %></h5>
            <p><%= Globalizer.GetString("MSG_CWK_SUCCESSFULLY_VIEWING_SECURED_BROWSER") %></p>
            <p><a href="<%= RespondusConstants.ExitUrl %>"><%= Globalizer.GetString("MSG_CWK_CLOSE_BROWSER_RETURN_TO_ASSIGNMENT_SCREEN")%></a></p>
        </div>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ACS.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SAML.ServiceProvider.ACS" ValidateRequest="false" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><%= Globalizer.GetGlobalizedString("TXT_JICS_SSO") %></title>
    <script type="text/javascript" language="javascript">
        function LoadPageOrParent() {
            if (window.location !== window.parent.location) {
                // The page is in an iframe
                window.parent.location.href = window.parent.location.href;
            } else {
                // The page is not in an iframe
                window.location.href = '<%= RedirectUrl %>';
            }
        }
	</script>
</head>
<body id="body" runat="server">
    <form id="form1" runat="server">
        <asp:Literal ID="litMessage" runat="server" />
    </form>
</body>
</html>
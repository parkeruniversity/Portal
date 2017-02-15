<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureBrowserHighSecurityRedirector.aspx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Pages.SecureBrowserHighSecurityRedirector"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function doClick() {
            var fireOnThis = document.getElementById('redir');
            if (document.createEvent) {
                var evObj = document.createEvent('MouseEvents');
                evObj.initEvent('click', true, false);
                fireOnThis.dispatchEvent(evObj);
            } else {
                fireOnThis.click();
            }
        }
    </script> 
</head>
<body runat="server" id="Body">
    <form id="form1" runat="server">
    <div>
        <asp:literal ID="InfoLiteral" runat="server" />
    </div>
    <asp:Literal ID="Link" runat="server"></asp:Literal>
    </form>
</body>
</html>

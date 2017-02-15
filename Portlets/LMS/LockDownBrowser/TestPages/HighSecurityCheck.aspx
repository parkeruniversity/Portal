<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighSecurityCheck.aspx.cs" Inherits="Jenzabar.LMS.Portlets.LockDownBrowser.TestPages.HighSecurityCheck" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.LockDownBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>High Security Check</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        High Security Check
    </h2>
    <p>
        This screen represents the intermediate step required to complete the cookie handshake with the locked browser.
    </p>
    <p>
        Current User: <asp:Literal ID="UsernameLiteral" runat="server" />
    </p>
    <p>
        Cookies: <asp:Literal ID="CookiesLiteral" runat="server" />
    </p>
    <p>
        <a href="SecuredTest.aspx">Start Test</a> 
    </p>
    <p>
        <a href="<%= RespondusConstants.ExitUrl %>">Exit Browser</a>
    </p>
    </form>
</body>
</html>


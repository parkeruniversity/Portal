<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighSecurityRedirector.aspx.cs" Inherits="Jenzabar.LMS.Portlets.LockDownBrowser.TestPages.HighSecurityRedirector" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Locked Browser High Security Redirector</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Locked Browser High Security Redirector
    </h2>
    <p>
        This screen represents the intermediate step that is required to open the locked browser in high security mode.
    </p>
    <p>
        Current user: <asp:Literal ID="UsernameLiteral" runat="server" />
    </p>
    <p>
        Cookies: <asp:Literal ID="CookiesLiteral" runat="server" />
    </p>
    <p>
        <a href="HighSecurityCheck.aspx?rldbsv=1&rldbep=(password)" target="popwin">Proceed to High Security Check</a>
    </p>
    </form>
</body>
</html>

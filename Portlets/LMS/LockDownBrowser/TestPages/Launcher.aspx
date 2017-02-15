<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Launcher.aspx.cs" Inherits="Jenzabar.LMS.Portlets.LockDownBrowser.TestPages.Launcher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Locked Browser Launcher</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Locked Browser Launcher
    </h2>
    <p>
        This screen represents the a page has a link to the test to be taken which is loaded in a browser besides the locked browser.
    </p>
    <p>
        Current user: <asp:Literal ID="UsernameLiteral" runat="server" />
    </p>
    <p>
        <a id="LockDownBrowserLink" runat="server">Launch LockDownBrowser</a>
    </p>
    </form>
</body>
</html>

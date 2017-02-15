<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecuredTest.aspx.cs" Inherits="Jenzabar.LMS.Portlets.LockDownBrowser.TestPages.SecuredTest"  EnableViewState="false"  %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.LockDownBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Locked Browser Secured Test</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Locked Browser Secured Test Page 1
    </h2>
    <p>
        This screen represents a test ready to be taken in high security mode.
    </p>
    <p>
        Current User: <asp:Literal ID="UsernameLiteral" runat="server" />
    </p>
    <p>
        Cookies: <asp:Literal ID="CookiesLiteral" runat="server"/>
    </p>
    <p>
        <a href="SecuredTest2.aspx">Test Page 2</a>
    </p>
    <p>
        <a href="/ics/staticpages/equationeditor.aspx" target="_blank">Equation Editor</a>
    </p>
    <p>
        <asp:Button id="PostbackTestButton" runat="server" Text="Postback Test" OnClick="PostbackTestButtonClick" />
        <asp:Literal id="PostbackTestLiteral" runat="server" />
    </p>
    <p>
        <a href="<%= RespondusConstants.ExitUrl %>">Exit Browser</a>
    </p>
    </form>
</body>
</html>

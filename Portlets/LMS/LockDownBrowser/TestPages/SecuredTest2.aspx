<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecuredTest2.aspx.cs" Inherits="Jenzabar.LMS.Portlets.LockDownBrowser.TestPages.SecuredTest2" EnableViewState="false" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.LockDownBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Locked Browser Secured Test</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Locked Browser Secured Test Page 2
    </h2>
    <p>
        This screen represents a second page of the test.
    </p>
    <p>
        Current User: <asp:Literal ID="UsernameLiteral" runat="server" />
    </p>
    <p>
        Cookies: <asp:Literal ID="CookiesLiteral" runat="server" />
    </p>
    <p>
        <a href="SecuredTest.aspx?rldbqn=1">Test Page 1</a>
    </p>
    <p>
        <a href="<%= RespondusConstants.ExitUrl %>">Exit Browser</a>
    </p>
    </form>
</body>
</html>

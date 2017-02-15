<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureBrowserCheckFailed.aspx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Pages.SecureBrowserCheckFailed" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.LockDownBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        The browser security check failed.  You're not allowed to take the test.
    </p>
    <p>
        <a href="<%= RespondusConstants.ExitUrl %>">Exit Browser</a>
    </p>
    </form>
</body>
</html>

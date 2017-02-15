<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureBrowserLauncher.aspx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Pages.SecureBrowserLauncher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%= Globalizer.GetString("HDR_CWK_SECURE_BROWSER_LAUNCHER") %></title>
    <meta http-equiv="refresh" content="300" />
    <link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/UI/Common/Styles/siteStyle.css") %>" /> 
    <link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx") %>" /> 
</head>
<body onload="javascript:setTimeout('location.reload(true);', <%= TestLaunchPlaceHolder.Visible ? 15000 : 300000 %>)">
    <form id="form1" runat="server">
    <div class="pSection">
        <asp:PlaceHolder ID="TestLaunchPlaceHolder" runat="server">
        <div class="secureBrowserInfo"> 
            <div class="launch">
                <h5 class="emphasis"><%= Globalizer.GetString("HDR_CWK_SECURE_BROWSER_LAUNCHER") %></h5>
                <p>
                    <%= Globalizer.Format("MSG_CWK_SECURE_BROWSER_LAUNCHER_INTRO", AssignmentTypeName)%>
                </p>
                <p>
                    <a id="LaunchSecureBrowserLink" runat="server" class="launchLink">
                        <%= Globalizer.Format("MSG_CWK_LAUNCH_SECURE_BROWSER", AssignmentTypeName)%>
                    </a>
                </p>
                <p class="textWithEmbeddedLink">
                    <%= Globalizer.GetString("MSG_CWK_SECURE_BROWSER_CONFIRM_FAIL")%>
                </p>
            </div>
        </div>
        <p>
            <a id="ReturnLink" runat="server">  
                <%= Globalizer.Format("MSG_CWK_RETURN_TO_ASSIGNMENT_SCREEN", AssignmentTypeName)%>
            </a>
        </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="TestFinishedPlaceHolder" runat="server">
        <div class="secureBrowserInfo"> 
            <div>
                <p>
                    <%= Globalizer.Format("MSG_CWK_SECURE_BROWSER_TEST_FINISHED", AssignmentTypeName)%>
                </p>
                <p>
                    <a id="ReturnLink2" runat="server" class="returnLink">
                        <%= Globalizer.Format("MSG_CWK_RETURN_TO_ASSIGNMENT_SCREEN", AssignmentTypeName)%>
                    </a>
                </p>
            </div>
        </div>
        </asp:PlaceHolder>
    </div>
    </form>
</body>
</html>

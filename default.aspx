<%@ Page Language="c#" CodeBehind="default.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Default" EnableViewState="True" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web.UI" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~/UI/Controls/Head.ascx" %>
<%@ Register TagPrefix="jics" TagName="ThemeHead" Src="~/UI/Controls/ThemeHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomHead" Src="~/ClientConfig/Controls/CustomHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomBody" Src="~/ClientConfig/Controls/CustomBody.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomSideBarBefore" Src="~/ClientConfig/Controls/CustomSideBarBefore.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomSideBarAfter" Src="~/ClientConfig/Controls/CustomSideBarAfter.ascx" %>
<%@ Register TagPrefix="jics" TagName="SiteHeader" Src="~/UI/Controls/SiteHeader.ascx" %>
<%@ Register TagPrefix="jics" TagName="SiteFooter" Src="~/UI/Controls/SiteFooter.ascx" %>
<%@ Register TagPrefix="jics" TagName="SiteTabs" Src="~/UI/Controls/SiteTabs.ascx" %>
<%@ Register TagPrefix="jics" TagName="SideBar" Src="~/UI/Controls/SideBar.ascx" %>
<%@ Register TagPrefix="jics" TagName="PortalPageTitle" Src="~/UI/Controls/PortletGrid.ascx" %>
<%@ Register TagPrefix="jics" TagName="AdminBar" Src="~/UI/Controls/AdminBar.ascx"  %>
<!DOCTYPE html>
<html lang="<%= JavaScriptGlobalizer.GetLanguage() %>">
<head runat="server"> <meta http-equiv="X-UA-Compatible" content="IE=EDGE" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= Title %></title>
    <asp:Literal ID="BasePath" runat="Server" EnableViewState="false" />
    <jics:Head ID="head" runat="server" />
    <jics:CustomHead ID="customHead" runat="server" />
    <jics:ThemeHead ID="themeHead" runat="server" />
</head>
<body onload="doLoad();">
    <div id="siteWrapper">
    <jics:SiteForm ID="MAINFORM" enctype="multipart/form-data" method="post" autocomplete="off" runat="server">
        <ajax:ToolkitScriptManager ID="_scriptManager" runat="server" OnAsyncPostBackError="Async_Postback_Error" />
        <input type="hidden" id="___BrowserRefresh" runat="server" />
        <p class="screenReaderText"><a href="#" onclick="window.location.hash='content'; return false;">Skip To Content</a></p>
        <jics:SiteHeader ID="siteHeader" runat="server" EnableViewState="false" />
        <jics:WelcomeBackBar ID="welcomeBackBar" runat="server" />
        <div id="errorMessage" runat="server" />
        <jics:TargetedMessageDisplay ID="targetedMessage" runat="server" />
        <jics:SiteTabs ID="siteTabs" runat="server" EnableViewState="false" />
        <div id="mainCrumbs">
            <jics:EmulationSelector ID="_emulSelector" runat="server" EnableViewState="false" />
            <div id="youAreHere">
                <jics:ContextualBreadCrumb ID="PageContextBreadCrumb" runat="Server" DisplayEndPointLink="True" DisplayPathLinks="True" Seperator=">" EnableViewState="false" />
            </div>
        </div>
        <div id="mainLayout" class="container">
            <% if (!IsCustomizingSomething || IsSidebarVisibleInStaticView){ %>
            <div id="sideBar" class="container">
            <% } %>
                <jics:CustomSideBarBefore ID="customSideBarBefore" runat="server" HideWithSideBar="true" />
                <jics:SideBar ID="SideBar" runat="server" EnableViewState="false" />
                <jics:CustomSideBarAfter ID="customSideBarAfter" runat="server" HideWithSideBar="true" />
            <% if (!IsCustomizingSomething || IsSidebarVisibleInStaticView){ %>
                <div class="sideBarFoot containerFoot"></div>
            </div>
            <% } %>
            <div id="portlets" class="container">
                <div id="pageTitle" runat="server" >
                    <jics:PortalPageTitle ID="pageTitleControl" runat="server" />
                </div>
                <div id="pageTitleButtons"  runat="server">
                    <a id="pagePreferences" runat="server" title="Preferences" Visible="false">
                         <img alt="preferences" style="display: block; float: left;" src="<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/cog.png")%>" />
                    </a>
                    <a id="helpButton" runat="server" title="Help" target="blank">
                        <img alt="Help" style="display: block; float: left;" src="<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png")%>" />
                    </a>
                    <input type="button" 
                        class="print-preview"
                        id="btnPrintView" 
                        runat="server" 
                        title="Print this page"
                        value="Print this page" 
                        onclick="window.print();"
                        />
                </div>
                <jics:AdminBar runat="server" Visible="false" ID="adminBar" />
                <jics:CustomPageMessages ID="customMessages" runat="server"/>
                <span id="content"></span>
                <asp:PlaceHolder ID="PORTLETGRID" runat="server" />
                <div class="portletsFoot containerFoot"></div>
            </div>
            <div class="mainLayoutFoot containerFoot"></div>
        </div>
        <jics:SiteFooter ID="SiteFooter" runat="server" />
        <jics:CustomBody ID="customBody" runat="server" />
    </jics:SiteForm>
    </div>
</body>
</html>

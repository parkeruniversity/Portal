<%@ Page language="c#" Codebehind="portletView.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.PortletView" enableViewState="True" validateRequest="false" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %><%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~/UI/Controls/Head.ascx" %>
<%@ Register TagPrefix="jics" TagName="PortletViewHead" Src="~/UI/Controls/PortletViewHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="ThemeHead" Src="~/UI/Controls/ThemeHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomPortletViewHead" Src="~/ClientConfig/Controls/CustomPortletViewHead.ascx" %>
<asp:Literal ID="litDocType" runat="server" />
<html>
<head runat="server" >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= this.Title %></title>
    <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    <jics:Head id="head" runat="server" />
    <jics:PortletViewHead id="pvhead" runat="server" />
    <jics:CustomPortletViewHead id="customPVHead" runat="server" />
    <jics:ThemeHead id="themeHead" runat="server" />
    <style type="text/css" media="all" id="printStyleSheet" visible="false" runat="server">@import url( UI/Common/Styles/print.css );</style>
</head>
<body onload="doLoad();">
    <div id="siteWrapper">
        <jics:SiteForm id="MAINFORM" enctype="multipart/form-data" method="post" autocomplete="off" runat="server">
            <ajax:ToolkitScriptManager ID="_scriptManager" runat="server" OnAsyncPostBackError="Async_Postback_Error" />
            <input type="hidden" id="___BrowserRefresh" runat="server" />
            <div id="mainLayout" class="container">
                <jics:SimpleLogin runat="server" />
                <div id="portletOnlyClose" class="pSection">
                    <a runat="server" id="aClose"><%= Globalizer.GetGlobalizedString("TXT_CLOSE") %></a>
                </div>
                <br />
                <div id="portlets" class="container">
	                <asp:PlaceHolder id="PORTLETGRID" runat="server" />
                    <div class="portletsFoot containerFoot"></div>
                </div>
                <div class="mainLayoutFoot containerFoot"></div>
            </div>
        </jics:SiteForm>
    </div>
</body>
</html>

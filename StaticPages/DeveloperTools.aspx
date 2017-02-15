<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeveloperTools.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.DeveloperTools" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.ICS.Web.Portlets.LoginPortlet" Assembly="Portlet.Login" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" TagName="Head" Src="~/UI/Controls/Head.ascx" %>
<%@ Register TagPrefix="jics" TagName="ThemeHead" Src="~/UI/Controls/ThemeHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomHead" Src="~/ClientConfig/Controls/CustomHead.ascx" %>
<%@ Register TagPrefix="jics" TagName="CustomBody" Src="~/ClientConfig/Controls/CustomBody.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JICS Developer Tools</title>
    <asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
    <jics:Head id="head" runat="server" />
    <jics:CustomHead id="customHead" runat="server" />
    <jics:ThemeHead id="themeHead" runat="server" />
    <style type="text/css" media="all" id="printStyleSheet" visible="false" runat="server">@import url( UI/Common/Styles/print.css );</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="pSection">
            <h3>JICS Developer Tools</h3>
            <ul>
                <li><a href="StaticPages/ControlExamples/ControlExamples.aspx">Control Examples</a></li>
                <li><a href="StaticPages/CSSExamples/CSSExamples.aspx">CSS Examples</a></li>
                <li><a href="StaticPages/PortletLDIF.aspx">Portlet LDIF Generator</a></li>
            </ul>
        </div>
    </form>
</body>
</html>

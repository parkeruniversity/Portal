<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomHead.ascx.cs" Inherits="Jenzabar.Portal.Web.ClientConfig.Controls.CustomHead" %>
<%@ Import Namespace="System.Web.Optimization" %>
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon"/>
<style id="custom" runat="server" type="text/css" media="all">
	@import url( <%: Styles.Url("~/ClientConfig/HtmlContent/custom-bundle.css") %>);
</style>

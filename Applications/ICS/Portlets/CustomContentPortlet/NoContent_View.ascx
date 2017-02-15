<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="NoContent_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.NoContent_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<common:ErrorDisplay id="PageErrors" runat="server" />
	<p><common:globalizedLiteral runat="server" textKey="TXT_NO_CONTENT_IN_PORTLET" ID="Globalizedliteral1" /></p>
	<p id="pWaysToAddContent" runat="server"><common:GlobalizedLabel id="lblWaysToAddContent" runat="server" TextKey="LBL_WAYS_TO_ADD_CONTENT" /></p>
	<ul id="olWaysToCreate" runat="Server">
		<li id="liCreate" runat="server">
			<common:GlobalizedLinkButton id="lnkCreateContent" runat="server" TextKey="TXT_CREATE_CONTENT" /></li>
		<li id="liUploadFile" runat="server">
			<common:GlobalizedLinkButton id="lnkLoadFromFile" runat="server" TextKey="TXT_CUSTOMCONTENTPORTLET_LOAD_FROM_SERVER_FILE" /></li>
		<li id="liRemoteContent" runat="server">
			<common:GlobalizedLinkButton id="lnkRemoteContent" runat="server" TextKey="TXT_SHOW_EXTERNAL_REMOTE_CONTENT" /></li>
	</ul>
</div>

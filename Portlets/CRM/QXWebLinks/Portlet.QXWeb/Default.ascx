<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.QXWebLinks.Web.Portlets.QXWebPortlet.Default" %>
<div id="divError" runat="server" visible="false" class="pSection">
	<jenzabar:ErrorDisplay ID="ctlError" Runat="server" />
</div>
<div id="divContents" runat="server" visible="false" class="pSection">
	<asp:PlaceHolder ID="plhQXWeb" Runat="server" />
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.DefaultView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
	<cmn:SubHeader id="shInbox" runat="server" />
	<cmn:GroupedGrid id="ggInbox" runat="server">
	<columns>
		<cmn:CheckboxColumn />
		<asp:BoundColumn datafield="subject" />
		<asp:BoundColumn datafield="from" />
		<asp:BoundColumn datafield="date" />
	</columns>
	</cmn:GroupedGrid>
	<asp:Button id="btnTestHijack" text="Hijack!" runat="server" />
</div>
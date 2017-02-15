<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewAllMessagesView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.ViewAllMessagesView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="msg" tagname="MessageViewer" src="~/Portlets/ICS/MessageCenterPortlet/MessageViewer.ascx" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pSection">

	<cmn:PageNavigator id="pnTop" runat="server" />

	<asp:Repeater id="rptMessages" runat="server">
	<ItemTemplate>
	<msg:MessageViewer id="mv" runat="server" message='<%# (Jenzabar.ICS.Message) Container.DataItem %>' />
	</ItemTemplate>
	</asp:Repeater>

	<cmn:PageNavigator id="pnBottom" runat="server" />

</div>

<div class="pActionsTransp"><cmn:GlobalizedLinkButton textkey="TXT_GO_BACK_TO_MESSAGE_CENTER_INBOX" tooltipkey="MSG_GO_BACK_TO_MESSAGE_CENTER_INBOX" id="glbBackToMain" runat="server" /></div>

</div>
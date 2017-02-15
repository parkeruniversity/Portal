<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewMessageView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.ViewMessageView" targetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="msg" tagname="MessageViewer" src="~/Portlets/ICS/MessageCenterPortlet/MessageViewer.ascx" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<div class="pActionsTransp">
	<cmn:GlobalizedLinkButton textkey="TXT_PREVIOUS_MESSAGE" tooltipkey="MSG_PREVIOUS_MESSAGE" commandname="NEXT" id="glbNextTop" runat="server" />
	|
	<cmn:GlobalizedLinkButton textkey="TXT_NEXT_MESSAGE" tooltipkey="MSG_NEXT_MESSAGE" commandname="PREVIOUS" id="glbPreviousTop" runat="server" />
</div>

<div class="pSection">
<msg:MessageViewer id="mv" runat="server" />
</div>

<div class="pActionsTransp">
	<cmn:GlobalizedLinkButton textkey="TXT_PREVIOUS_MESSAGE" tooltipkey="MSG_PREVIOUS_MESSAGE" commandname="NEXT" id="glbNextBottom" runat="server" />
	|
	<cmn:GlobalizedLinkButton textkey="TXT_NEXT_MESSAGE" tooltipkey="MSG_NEXT_MESSAGE" commandname="PREVIOUS" id="glbPreviousBottom" runat="server" />
</div>

<div class="pActionsTransp"><cmn:GlobalizedLinkButton textkey="TXT_GO_BACK_TO_MESSAGE_CENTER_INBOX" tooltipkey="MSG_GO_BACK_TO_MESSAGE_CENTER_INBOX" id="glbBackToMain" runat="server" /></div>

</div>
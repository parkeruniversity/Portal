<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MessageViewer.ascx.cs" Inherits="MessageCenterPortlet.MessageViewer" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<table cellpadding="0" cellspacing="0" class="messageGrid">
<tr>
	<th class="messageType"><%# GetMessageTypeMarkup( Message ) %></th>
	<td class="subject" colspan="2"><%# Message.Subject %></td>
</tr>
<tr>
	<th class="from" rowspan="2">
		<cmn:GlobalizedLiteral id="Globalizedliteral1" runat="server" textkey="LBL_FROM" />
		<div class="author"><%# GetAuthorMarkup(Message) %></div>
	</th>
	<td class="sent"><%# Globalizer.Format( "LBL_FMT_SENT_X", Message.Sent ) %></td><td class="reply"><cmn:GlobalizedLinkButtonWithIcon id="itButt" runat="server" textkey="TXT_REPLY" IconSrc="ui/Common/images/reply_to.gif"  /></td>
</tr>
<tr>
	<td class="body" colspan="2"><%# Message.Body.Replace(Environment.NewLine,"<br>") %><%# this.GetAttachmentListMarkup() %></td>
</tr>
<tr><td colspan=2 align=center><cmn:GlobalizedButton textkey="TXT_DELETE" id="bDeleteMessage" runat="server"/></td></tr>
</table>

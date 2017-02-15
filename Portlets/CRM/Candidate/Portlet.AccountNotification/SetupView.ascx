<%@ Register TagPrefix="Jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SetupView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AccountNotificationPortlet.SetupView" %>
<br>
<table width="100%" cellpadding="2" cellspacing="2">
	<tr>
		<td width="30%" nowrap><asp:Label ID="lblSecGroup" Runat="server" /></td>
		<td width="70%">
			<asp:DropDownList ID="ddlSecGroup" AutoPostBack="True" Runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap><asp:Label ID="lblTemplate" Runat="server" /></td>
		<td nowrap>
			<asp:DropDownList ID="ddlTemplate" Runat="server" />&nbsp;
			<asp:ImageButton ID="imgEdit" Runat="server"></asp:ImageButton>
			<asp:ImageButton ID="ImgAdd" Runat="server"></asp:ImageButton>
		</td>
	</tr>
	<tr>
		<td nowrap><asp:Label ID="lblMethod" Runat="server" /></td>
		<td>
			<asp:DropDownList ID="ddlMethod" Runat="server" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSave" Runat="server"></asp:Button>
			<asp:Button ID="btnCancel" CausesValidation="False" Runat="server"></asp:Button>
		</td>
	</tr>
</table>
<asp:Label ID="lblValidationError" CssClass="PortletError" Runat="server" />
<Jenzabar:ErrorDisplay id="errDisplay" Runat="server" />

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SelectCreditCard.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.SelectCreditCard" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table width="704" cellpadding="3" cellspacing="3" height="40">
	<tr>
		<td colspan="2">
			<asp:Label id="lblSelectCreditCardText" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="123">
			<asp:Label id="lblCreditCardText" runat="server"></asp:Label></td>
		<td>
			<asp:DropDownList id="ddlCreditCardList" runat="server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td width="123">&nbsp;</td>
		<td>
			<asp:Button id="btnOK" runat="server"></asp:Button>&nbsp;&nbsp;&nbsp;
			<asp:Button id="btnCancel" runat="server"></asp:Button></td>
	</tr>
</table>

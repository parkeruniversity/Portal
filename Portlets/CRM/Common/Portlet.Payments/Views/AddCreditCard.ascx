<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AddCreditCard.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.AddCreditCard" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table height="40" cellSpacing="3" cellPadding="3" width="704">
	<tr>
		<td colSpan="2"><asp:label id="lblAddCreditCardText" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="259"><asp:label id="lblCreditCardText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtCreditCard" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td width="259"><asp:label id="lblCreditCardDescriptionText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtCreditCardDescription" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td width="259">&nbsp;</td>
		<td><asp:button id="btnAdd" runat="server" onclick="btnAdd_Click"></asp:button>&nbsp;&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" onclick="btnCancel_Click"></asp:button></td>
	</tr>
</table>

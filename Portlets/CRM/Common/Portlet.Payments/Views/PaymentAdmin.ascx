<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PaymentAdmin.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.PaymentAdmin" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<meta name=vs_showGrid content="False">
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table height="40" cellSpacing="3" cellPadding="3" width="704">
	<tr>
		<td colSpan="2"><asp:label id="lblMessage" runat="server" CssClass="PortletItemStatus"></asp:label></td>
	</tr>
	<tr>
		<td width=349><asp:linkbutton id="lnkWorkWithCreditCard" runat="server" onclick="lnkWorkWithCreditCard_Click"></asp:linkbutton></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width=349><asp:label id="lblPaymentConfiguration" runat="server" AssociatedControlID="ddlPortlets"></asp:label></td>
		<td><asp:dropdownlist id="ddlPortlets" runat="server" OnSelectedIndexChanged="ddlPortlets_SelectedIndexChanged"
				AutoPostBack="True"></asp:dropdownlist>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width=349><asp:label id="lblTestingMode" runat="server"></asp:label></td>
		<td>&nbsp;&nbsp;&nbsp;<asp:radiobutton id="rbYes" runat="server" GroupName="TestingMode"></asp:radiobutton>&nbsp;&nbsp;&nbsp;<asp:radiobutton id="rbNo" runat="server" GroupName="TestingMode"></asp:radiobutton></td>
	</tr>
	<tr>
		<td width=349><asp:label id="lblLoginID" runat="server" AssociatedControlID="txtLoginID"></asp:label></td>
		<td><asp:textbox id="txtLoginID" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td width=349><asp:label id="lblTransKey" runat="server" AssociatedControlID="txtTransKey"></asp:label></td>
		<td><asp:textbox id="txtTransKey" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td width=349>&nbsp;</td>
		<td><asp:button id="btnSave" runat="server" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;
			<asp:Button id="btnCancel" runat="server" onclick="btnCancel_Click"></asp:Button></td>
	</tr>
</table>

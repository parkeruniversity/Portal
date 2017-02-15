<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PortletSpecificConfig.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.PortletSpecificConfig" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<table height="40" cellSpacing="3" cellPadding="3" width="704">
	<tr>
		<td colSpan="2"><asp:label id="lblMessage" runat="server" CssClass="PortletItemStatus"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="2"><asp:label id="lblConfigurePaymentInfo" runat="server" CssClass="PortletItemTitle"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentConfigDesc" runat="server"></asp:label></td>
		<td><asp:textbox id="txtPaymentConfigDesc" runat="server" Width="408px"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblTransCode" runat="server"></asp:label></td>
		<td><asp:textbox id="txtTransCode" runat="server" MaxLength="255"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblAuthorizePayments" runat="server"></asp:label></td>
		<td><asp:radiobutton id="rbOnline" runat="server" GroupName="AuthorizePayments"></asp:radiobutton>&nbsp;<asp:radiobutton id="rbOffline" runat="server" GroupName="AuthorizePayments"></asp:radiobutton></td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentOptions" runat="server"></asp:label></td>
		<td><asp:checkbox id="cbxCreditCard" runat="server"></asp:checkbox>&nbsp;<asp:checkbox id="cbxECheck" runat="server"></asp:checkbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblNotAuthorizedEmail" runat="server"></asp:label></td>
		<td><asp:textbox id="txtNotAuthorizedEmail" runat="server" MaxLength="255" Width="408px"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="2"><asp:label id="lblPaymentSelectionHeader" runat="server" CssClass="PortletItemTitle"></asp:label></td>
	</tr>
	<tr>
		<td vAlign="top"><asp:label id="lblPaymentSelectionMessage" runat="server"></asp:label></td>
		<td>
			<P><asp:dropdownlist id="ddlPaymentSelection" runat="server" OnSelectedIndexChanged="ddlPaymentSelection_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist>&nbsp;
				<asp:ImageButton ID="imgPSNew" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgPSModify" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgPSDelete" Runat="server" CausesValidation="False"></asp:ImageButton>
				
				<asp:requiredfieldvalidator id="valPaymentSelection" runat="server" ControlToValidate="ddlPaymentSelection"></asp:requiredfieldvalidator></P>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentSelectionMessageText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtPSMessage" runat="server" ReadOnly="True" Width="296px" TextMode="MultiLine"
				Rows="6"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="2"><asp:label id="lblMakeAPaymentHeader" runat="server" CssClass="PortletItemTitle"></asp:label></td>
	</tr>
	<tr>
		<td vAlign="top"><asp:label id="lblMakeAPaymentMessage" runat="server"></asp:label></td>
		<td>
			<P><asp:dropdownlist id="ddlMakeAPayment" runat="server" OnSelectedIndexChanged="ddlMakeAPayment_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist>&nbsp;
				<asp:ImageButton ID="imgMPNew" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgMPModify" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgMPDelete" Runat="server" CausesValidation="False"></asp:ImageButton>
				
				<asp:requiredfieldvalidator id="valMakeAPayment" runat="server" ControlToValidate="ddlMakeAPayment"></asp:requiredfieldvalidator></P>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblMakeAPaymentMessageText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtMPMessage" runat="server" ReadOnly="True" Width="296px" TextMode="MultiLine"
				Rows="6"></asp:textbox></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><asp:button id="btnSave" runat="server"></asp:button>&nbsp;&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></td>
	</tr>
</table>

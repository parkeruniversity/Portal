<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormPaymentInfo.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormPaymentInfo" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<table cellSpacing="3" cellPadding="3">
	<tr>
		<td colSpan="2"><asp:label id="lblMessage" runat="server" Font-Italic="True"></asp:label></td>
	</tr>
	<tr>
		<td><jenzabar:globalizedlabel id="lblChargeAppFee" runat="server"></jenzabar:globalizedlabel></td>
		<td><jenzabar:globalizedradiobutton id="rbChargeFeeYes" runat="server" OnCheckedChanged="rbChargeFeeYes_CheckedChanged"
				AutoPostBack="True" GroupName="ChargeAppFee"></jenzabar:globalizedradiobutton>&nbsp;&nbsp;&nbsp;
			<jenzabar:globalizedradiobutton id="rbChargeFeeNo" runat="server" OnCheckedChanged="rbChargeFeeNo_CheckedChanged"
				AutoPostBack="True" GroupName="ChargeAppFee"></jenzabar:globalizedradiobutton></td>
	</tr>
	<tr>
		<th align="left">
			<jenzabar:globalizedlabel id="lblAppFee" runat="server" Visible="False"></jenzabar:globalizedlabel></th>
		<td><asp:textbox id="txtAppFeeAmt" runat="server" Visible="False"></asp:textbox><asp:requiredfieldvalidator id="valAppFee" runat="server" Visible="False" Enabled="False" ControlToValidate="txtAppFeeAmt"></asp:requiredfieldvalidator></td>
	</tr>
	<tr>
		<th align="left">
			<jenzabar:globalizedlabel id="lblPaymentConfiguration" runat="server" Visible="False"></jenzabar:globalizedlabel></th>
		<td><asp:dropdownlist id="ddlPaymentConfiguration" runat="server" AutoPostBack="True" Visible="False"
				OnSelectedIndexChanged="ddlPaymentConfiguration_SelectedIndexChanged"></asp:dropdownlist>
				<asp:label id="lblPlaceHolder1" runat="server" Visible="False">&nbsp;</asp:label>
				<asp:ImageButton ID="imgNew" Runat="server" Visible="False" CausesValidation="False"></asp:ImageButton>
				<asp:label id="lblPlaceHolder2" runat="server" Visible="False">&nbsp;</asp:label>
				<asp:ImageButton ID="imgModify" Runat="server" Visible="False" CausesValidation="False"></asp:ImageButton>
				<asp:label id="lblPlaceHolder3" runat="server" Visible="False">&nbsp;</asp:label>
				<asp:ImageButton ID="imgDelete" Runat="server" Visible="False" CausesValidation="False"></asp:ImageButton>
				<asp:requiredfieldvalidator id="valPaymentConfiguration" runat="server" ControlToValidate="ddlPaymentConfiguration"></asp:requiredfieldvalidator>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblTransCode" runat="server" Visible="False"></asp:label></td>
		<td><asp:textbox id="txtTransCode" runat="server" Visible="False" ReadOnly="True" MaxLength="255"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblAuthorizePayments" runat="server" Visible="False"></asp:label></td>
		<td><asp:radiobutton id="rbOnline" runat="server" GroupName="AuthorizePayments" Visible="False" Enabled="False"></asp:radiobutton><asp:label id="lblPlaceHolder4" runat="server" Visible="False">&nbsp;</asp:label><asp:radiobutton id="rbOffline" runat="server" GroupName="AuthorizePayments" Visible="False" Enabled="False"></asp:radiobutton></td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentOptions" runat="server" Visible="False"></asp:label></td>
		<td><asp:checkbox id="cbxCreditCard" runat="server" Visible="False" Enabled="False"></asp:checkbox><asp:label id="lblPlaceHolder5" runat="server" Visible="False">&nbsp;</asp:label><asp:checkbox id="cbxECheck" runat="server" Visible="False" Enabled="False"></asp:checkbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblNotAuthorizedEmail" runat="server" Visible="False"></asp:label></td>
		<td><asp:textbox id="txtNotAuthorizedEmail" runat="server" Visible="False" ReadOnly="True" MaxLength="255"
				Width="408px"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentSelectionMessageText" runat="server" Visible="False"></asp:label></td>
		<td><asp:textbox id="txtPSMessage" runat="server" Visible="False" ReadOnly="True" Rows="6" TextMode="MultiLine"
				Width="296px"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblMakeAPaymentMessageText" runat="server" Visible="False"></asp:label></td>
		<td><asp:textbox id="txtMPMessage" runat="server" Visible="False" ReadOnly="True" Rows="6" TextMode="MultiLine"
				Width="296px"></asp:textbox></td>
	</tr>
	<tr>
		<td><jenzabar:globalizedlabel id="lblSetupComplete" runat="server"></jenzabar:globalizedlabel></td>
		<td><jenzabar:globalizedradiobutton id="rbSetupCompleteYes" runat="server" GroupName="SetupComplete"></jenzabar:globalizedradiobutton>&nbsp;&nbsp;&nbsp;
			<jenzabar:globalizedradiobutton id="rbSetupCompleteNo" runat="server" GroupName="SetupComplete"></jenzabar:globalizedradiobutton></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="left" colSpan="2"><jenzabar:globalizedbutton id="btnSave" runat="server"></jenzabar:globalizedbutton>&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></td>
	</tr>
</table>

<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MakeAPayment.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.MakeAPaymentMethod" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet" %>
<jenzabar:ErrorDisplay id="error" Runat="server"></jenzabar:ErrorDisplay>
<style>
    .pSection span[id*="_val"][style*="visibility: visible;"] {
        display: block;
        color: red;
    }
    .pSection table tr th {
        vertical-align: top;
    }
</style>
<div class="pSection">
	<table height="40" cellSpacing="3" cellPadding="3" width="70%">
		<tr>
			<td><asp:label id="lblMessage" runat="server"></asp:label></td>
		</tr>
	</table>
	<table height="40" cellSpacing="3" cellPadding="3" width="70%">
		<tr>
			<td><asp:label id="lblRequiredMessage" runat="server"></asp:label></td>
		</tr>
	</table>
</div>
<div class="pSection">
	<table height="40" cellSpacing="3" cellPadding="3">
		<tr>
			<td colSpan="4">
				<h6><asp:label id="lblHeader1" runat="server"></asp:label></h6>
			</td>
		</tr>
		<tr>
			<td noWrap align="left"><asp:label id="lblPaymentAmtText" runat="server"></asp:label></td>
			<td colSpan="3"><asp:label id="lblPaymentAmt" runat="server" Visible="False"></asp:label>
				<asp:TextBox id="txtPaymentAmt" runat="server" Visible="False"></asp:TextBox></td>
		</tr>
		<tr>
			<td noWrap align="left"><asp:label id="lblPaymentDescText" runat="server"></asp:label></td>
			<td colSpan="3"><asp:label id="lblPaymentDesc" runat="server"></asp:label></td>
		</tr>
		<tr>
			<td colSpan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colSpan="4">
				<h6><asp:label id="lblHeader2" runat="server"></asp:label></h6>
			</td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblLabel1" runat="server"></asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlCCType" runat="server" Visible="False"></asp:dropdownlist><asp:textbox id="txtABARoutingNum" runat="server" Visible="False"></asp:textbox><asp:hyperlink id="lnkCheckInstructions" runat="server" Visible="False"></asp:hyperlink><asp:requiredfieldvalidator id="valCCType" runat="server" Visible="False" ControlToValidate="ddlCCType"></asp:requiredfieldvalidator><asp:requiredfieldvalidator id="valABARoutingNum" runat="server" Visible="False" ControlToValidate="txtABARoutingNum"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblLabel2" runat="server"></asp:label></th>
			<td colSpan="3"><asp:textbox id="txtCCNum" runat="server" Visible="False"></asp:textbox><asp:textbox id="txtBankAccountNum" runat="server" Visible="False"></asp:textbox><asp:requiredfieldvalidator id="valCCNum" runat="server" Visible="False" ControlToValidate="txtCCNum"></asp:requiredfieldvalidator><asp:requiredfieldvalidator id="valBankAccountNum" runat="server" Visible="False" ControlToValidate="txtBankAccountNum"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblLabel3" runat="server"></asp:label></th>
			<td colSpan="3"><asp:textbox id="txtCCCode" runat="server" Visible="False" MaxLength="4" Width="64px"></asp:textbox><asp:label id="lblCCCodeInstructions" runat="server" Visible="False"></asp:label><asp:dropdownlist id="ddlAccountType" runat="server" Visible="False"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colSpan="3"><asp:requiredfieldvalidator id="valCCCode" runat="server" Visible="False" ControlToValidate="txtCCCode"></asp:requiredfieldvalidator><asp:requiredfieldvalidator id="valAccountType" runat="server" Visible="False" ControlToValidate="ddlAccountType"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblLabel4" runat="server"></asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlExpMonth" runat="server" Visible="False"></asp:dropdownlist><asp:dropdownlist id="ddlExpYear" runat="server" Visible="False"></asp:dropdownlist><asp:textbox id="txtBankName" runat="server" Visible="False"></asp:textbox><asp:requiredfieldvalidator id="valExpMonth" runat="server" Visible="False" ControlToValidate="ddlExpMonth"></asp:requiredfieldvalidator>&nbsp;&nbsp;<asp:requiredfieldvalidator id="valExpYear" runat="server" Visible="False" ControlToValidate="ddlExpYear"></asp:requiredfieldvalidator><asp:requiredfieldvalidator id="valBankName" runat="server" Visible="False" ControlToValidate="txtBankName"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblAccountName" runat="server" Visible="False"></asp:label></th>
			<td colSpan="3"><asp:textbox id="txtAccountName" runat="server" Visible="False" Width="232px"></asp:textbox><asp:label id="lblAccountNameInstructions" runat="server" Visible="False"></asp:label><asp:requiredfieldvalidator id="valAccountName" runat="server" Visible="False" ControlToValidate="txtAccountName"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<td colSpan="4"></td>
		</tr>
		<tr>
			<td colSpan="4">
				<h6><asp:label id="lblHeader3" runat="server"></asp:label></h6>
			</td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblName" runat="server"></asp:label></th>
			<td><asp:textbox id="txtFirstName" runat="server"></asp:textbox></td>
			<td colSpan="2"><asp:textbox id="txtLastName" runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><asp:requiredfieldvalidator id="valFirstName" runat="server" ControlToValidate="txtFirstName"></asp:requiredfieldvalidator>&nbsp;&nbsp;</td>
			<td colSpan="2"><asp:requiredfieldvalidator id="valLastName" runat="server" ControlToValidate="txtLastName"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<td noWrap align="left"><asp:label id="lblCompanyName" runat="server"></asp:label></td>
			<td colSpan="3"><asp:textbox id="txtCompanyName" runat="server" Width="248px"></asp:textbox><asp:label id="lblCompanyInstructions" runat="server"></asp:label></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblAddress" runat="server"></asp:label></th>
			<td colSpan="3"><asp:textbox id="txtAddress" runat="server" Width="248px"></asp:textbox><asp:requiredfieldvalidator id="valAddress" runat="server" ControlToValidate="txtAddress"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th align="left">
				<asp:label id="lblCityStateZip" runat="server"></asp:label></th>
			<td><asp:textbox id="txtCity" runat="server" Width="192px"></asp:textbox></td>
			<td><asp:dropdownlist id="ddlState" runat="server"></asp:dropdownlist></td>
			<td nowrap><asp:textbox id="txtZip" runat="server" Width="88px"></asp:textbox><asp:regularexpressionvalidator id="valZipFormat" runat="server" ControlToValidate="txtZip" ValidationExpression="(\d{5}(-\d{4})?)|([- 0-9a-zA-Z]{3,9})" Enabled="false" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><asp:requiredfieldvalidator id="valCity" runat="server" ControlToValidate="txtCity"></asp:requiredfieldvalidator></td>
			<td><asp:requiredfieldvalidator id="valState" runat="server" ControlToValidate="ddlState" Enabled="false" /></td>
			<td noWrap><asp:requiredfieldvalidator id="valZip" runat="server" ControlToValidate="txtZip" Enabled="false" /></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblCountry" runat="server"></asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlCountry" runat="server"></asp:dropdownlist><asp:requiredfieldvalidator id="valCountry" runat="server" ControlToValidate="ddlCountry"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th noWrap align="left">
				<asp:label id="lblPhone" runat="server"></asp:label></th>
			<td colSpan="3"><asp:textbox id="txtPhone" runat="server" Width="144px"></asp:textbox><asp:label id="lblPhoneInstructions" runat="server"></asp:label><asp:regularexpressionvalidator id="valPhoneFormat" runat="server" ControlToValidate="txtPhone" ValidationExpression="(((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4})|(\+\d{1,4} [- 0-9]{1,18})"></asp:regularexpressionvalidator></td>
			</TD></tr>
		<tr>
			<td>&nbsp;</td>
			<td colSpan="3"><asp:requiredfieldvalidator id="valPhone" runat="server" ControlToValidate="txtPhone"></asp:requiredfieldvalidator></td>
			</TD></tr>
		<tr>
			<td colSpan="4"></td>
		</tr>
		<tr>
			<td colSpan="4">
				<h6><asp:label id="lblHeader4" runat="server"></asp:label></h6>
			</td>
		</tr>
		<tr>
			<td noWrap align="left">
				<asp:label id="lblEmail" runat="server"></asp:label></td>
			<td colSpan="3"><asp:textbox id="txtEmail" runat="server" Width="248px"></asp:textbox><asp:regularexpressionvalidator id="valEmailFormat" runat="server" ControlToValidate="txtEmail" ValidationExpression="^.+@[^\.].*\.[A-Za-z]{2,}$"></asp:regularexpressionvalidator></td>
		</tr>
		<tr>
			<td colSpan="4"></td>
		</tr>
		<tr>
			<td colSpan="4"><asp:button id="btnContinue" runat="server" onclick="btnContinue_Click"></asp:button>&nbsp;&nbsp;&nbsp;
				<asp:button id="btnCancel" runat="server" CausesValidation="False" onclick="btnCancel_Click"></asp:button></td>
		</tr>
	</table>
<jenzabar:HighlightedHint ID="hntBottomWarning" Runat="server" Visible="false" /></jenzabar:HighlightedHint>
</div>

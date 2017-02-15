<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormMessages.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormMessages" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<table height="40" width="100%">
	<tr>
		<td colSpan="2"><asp:label id="lblMessage" runat="server" CssClass="PortletItemStatus"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="2"><h6><asp:label id="lblInstructionsSetup" runat="server"></asp:label></h6></td>
	</tr>
	<tr>
		<td vAlign="top" width="30%"><asp:label id="lblInstructionsTemplateName" runat="server"></asp:label></td>
		<td nowrap width="70%">
			<P>
				<asp:dropdownlist id="ddlInstructionsTemplate" tabIndex="5" runat="server" OnSelectedIndexChanged="ddlInstructionsTemplate_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist>&nbsp;
				<asp:ImageButton ID="imgITNew" TabIndex="7" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgITModify" TabIndex="6" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgITDelete" TabIndex="8" Runat="server" CausesValidation="False"></asp:ImageButton><br />
				<asp:requiredfieldvalidator id="valInstructionsTemplate" runat="server" ControlToValidate="ddlInstructionsTemplate"></asp:requiredfieldvalidator>
			</P>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblInstructionsTemplateMessageText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtInstructionsTemplate" runat="server" ReadOnly="True" Width="296px" TextMode="MultiLine"
				Rows="6"></asp:textbox></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>	
	<tr>
		<td colSpan="2"><h6><asp:label id="lblSuccessfulSubmissionSetup" runat="server"></asp:label></h6></td>
	</tr>
	<tr>
		<td vAlign="top"><asp:label id="lblSuccessfulSubmissionName" runat="server"></asp:label></td>
		<td nowrap>
			<P>
				<asp:dropdownlist id="ddlSuccessfulSubmission" tabIndex="5" runat="server" OnSelectedIndexChanged="ddlSuccessfulSubmission_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist>&nbsp;
				<asp:ImageButton ID="imgSSNew" TabIndex="7" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgSSModify" TabIndex="6" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgSSDelete" TabIndex="8" Runat="server" CausesValidation="False"></asp:ImageButton><br />
				<asp:requiredfieldvalidator id="valSuccessfulSubmission" runat="server" ControlToValidate="ddlSuccessfulSubmission"></asp:requiredfieldvalidator>
			</P>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblSuccessfullSubmissionText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtSuccessfulSubmission" runat="server" ReadOnly="True" Width="296px" TextMode="MultiLine"
				Rows="6"></asp:textbox></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td colSpan="2"><h6><asp:label id="lblUnsuccessfulSubmissionSetup" runat="server"></asp:label></h6></td>
	</tr>
	<tr>
		<td vAlign="top"><asp:label id="lblUnsuccessfulSubmissionName" runat="server"></asp:label></td>
		<td>
			<P><asp:dropdownlist id="ddlUnsuccessfulSubmission" tabIndex="9" runat="server" OnSelectedIndexChanged="ddlUnsuccessfulSubmission_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist>&nbsp;
				<asp:ImageButton ID="imgUSNew" TabIndex="11" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgUSModify" TabIndex="10" Runat="server" CausesValidation="False"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="imgUSDelete" TabIndex="12" Runat="server" CausesValidation="False"></asp:ImageButton><br />
				<asp:requiredfieldvalidator id="valUnsuccessfulSubmission" runat="server" ControlToValidate="ddlUnsuccessfulSubmission"></asp:requiredfieldvalidator></P>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblUnsuccessfulSubmissionText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtUnsuccessfulSubmission" runat="server" ReadOnly="True" Width="296px" TextMode="MultiLine"
				Rows="6"></asp:textbox></td>
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
		<td colspan="2" align="left"><asp:button id="btnSave" tabIndex="13" runat="server"></asp:button>&nbsp;
			<asp:button id="btnCancel" tabIndex="14" runat="server" CausesValidation="False"></asp:button></td>
	</tr>
</table>
</div>
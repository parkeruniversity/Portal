<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddEditSection_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddEditSection_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<h4><asp:Literal ID="litSurveyName" Runat="server" /></h4>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr><td colspan="3"><asp:Label id="lblTemplateWarn" runat="server" Visible="False"></asp:Label></td></tr>
		<tr><td>&nbsp</td></tr>
		<tr>
			<th width="141" align="right">
				<cmn:globalizedliteral id="glitName" TextKey="LBL_NAME" Runat="server"></cmn:globalizedliteral></th>&nbsp;
			<td width="435"><asp:textbox id="tbName" Runat="server" MaxLength="250" Width="256px"></asp:textbox></td>
			<td><cmn:GlobalizedRequiredFieldValidator id="SectionName" runat="server" textKey="CUS_MSG_SECTION_NAME_REQUIRED" ControlToValidate="tbName"
					Display="dynamic" /></td>
		</tr>
		<tr>
			<th width="141" align="right" valign="top">
				<cmn:globalizedliteral id="glitInstructions" TextKey="LBL_INSTRUCTIONS" Runat="server"></cmn:globalizedliteral></th>&nbsp;
			<td width="435"><asp:textbox id="tbInstructions" Runat="server" MaxLength="3600" TextMode="MultiLine" Rows="6"
					Font-Size="x-small" Columns="85"></asp:textbox></td>
		</tr>
		<tr>
			<th width="141" align="right">
				<cmn:GlobalizedLiteral ID="glitPosition" Runat="server" TextKey="LBL_POSITION" /></th>&nbsp;
			<td width="435"><asp:DropDownList ID="ddlPosition" Runat="server" /></td>
		</tr>
		<tr>
			<th width="141" align="right" nowrap>
				<cmn:GlobalizedLiteral ID="glitNumChoices" Runat="server" TextKey="CUS_LBL_NUMBER_OF_CHOICES" /></th>&nbsp;
			<td width="435"><asp:DropDownList ID="ddlNumChoices" Runat="server" AutoPostBack="True" /></td>
		</tr>
		<tr>
			<td width="141">&nbsp;</td>
			<td width="435">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap><cmn:globalizedliteral id="glitHighOpTerm" Runat="server" TextKey="CUS_LBL_HIGH_OP_TERM" /></td>
							<td><asp:textbox id="tbChoice1" Runat="server" MaxLength="250" Width="256px"></asp:textbox></td>
							<td><asp:textbox id="tbPointValue1" Runat="server" MaxLength="4" Width="25px"></asp:textbox></td>
						</tr>
						<tr>
							<td width="165"></td>
							<td><asp:textbox id="tbChoice2" Runat="server" MaxLength="250" Width="256px" Visible="True"></asp:textbox></td>
							<td><asp:textbox id="tbPointValue2" Runat="server" MaxLength="4" Width="25px"></asp:textbox></td>
						</tr>
						<tr>
							<td width="165"></td>
							<td><asp:textbox id="tbChoice3" Runat="server" MaxLength="250" Width="256px" Visible="True"></asp:textbox></td>
							<td><asp:textbox id="tbPointValue3" Runat="server" MaxLength="4" Width="25px"></asp:textbox></td>
						</tr>
						<tr>
							<td width="165"></td>
							<td><asp:textbox id="tbChoice4" Runat="server" MaxLength="250" Width="256px" Visible="True"></asp:textbox></td>
							<td><asp:textbox id="tbPointValue4" Runat="server" MaxLength="4" Width="25px"></asp:textbox></td>
						</tr>
						<tr>
							<td width="165" nowrap><cmn:globalizedliteral id="glitLowOpTerm" Runat="server" TextKey="CUS_LBL_LOW_OP_TERM" /></td>
							<td><asp:textbox id="tbChoice5" Runat="server" MaxLength="250" Width="256px"></asp:textbox></td>
							<td><asp:textbox id="tbPointValue5" Runat="server" MaxLength="4" Width="25px"></asp:textbox></td>
						</tr>
						<tr>
							<td width="165" nowrap><cmn:globalizedliteral id="glitNA" Runat="server" TextKey="CUS_LBL_NA" /></td>
							<td><asp:textbox id="tbChoice6" Runat="server" MaxLength="250" Width="256px"></asp:textbox></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td width="141">&nbsp;</td>
			<td width="435"><cmn:globalizedbutton ID="gbtnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;&nbsp;<cmn:globalizedbutton ID="gbtnCancel" Runat="server" TextKey="TXT_CANCEL" CausesValidation="False" /></td>
		</tr>
	</table>
</div>

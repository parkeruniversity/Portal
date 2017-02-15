<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddEditSurvey_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddEditSurvey_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<div class="pSection">
	<style>
	.courseEvalButtons INPUT { MARGIN: 0px 5px }
	</style>
	<fieldset>
		<table>
			<tr>
				<th>
					<%= Globalize("CUS_LBL_NAME") %>
				</th>
				<td>
					<asp:TextBox ID="txtSurveyName" MaxLength="250" Runat="server" Columns="40" />
					<common:GlobalizedRequiredFieldValidator id="SurveyName" runat="server" textKey="CUS_MSG_SURVEY_NAME_REQUIRED" ControlToValidate="txtSurveyName"
						Display="dynamic" />
					<asp:Label ID="lblNameUnique" Runat="server" />
				</td>
			</tr>
			<TR>
				<TD></TD>
				<TD noWrap colSpan="2" rowSpan="1">
					<asp:Label id="lblTemplateWarn" runat="server" Visible="False"></asp:Label></TD>
			</TR>
			<tr>
				<th>
					<%= Globalize("CUS_LBL_DESCRIPTION") %>
				</th>
				<td>
					<asp:TextBox ID="txtSurveyDesc" Runat="server" MaxLength="2000" Columns="70" Font-Size="x-small"
						Rows="6" TextMode="MultiLine" /><br>
					<asp:Label id="lblMaxChar" runat="server" />
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td><br>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label id="lblRecipWarn" runat="server" Visible="False"></asp:Label></td>
			</tr>
			<tr style="BACKGROUND:#ddd">
				<th>
					<%= Globalize("CUS_RECIPIENTS") %>
				</th>
				<td>
					<asp:Label ID="RecipientList" Runat="server" />
					<asp:LinkButton ID="lnkAddRecipients" Runat="server" />
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					<asp:Label id="lblTemplateDispWarn" runat="server" Visible="False"></asp:Label><br>
				</td>
			</tr>
			<tr>
				<th>
					<%= Globalize("CUS_LBL_REQUIRED") %>
				</th>
				<td>
					<common:GlobalizedCheckBox id="required" runat="server" TextKey="CUS_TXT_REQUIRED" />
				</td>
			</tr>
			<tr>
				<th>
					<%= Globalize("CUS_LBL_DISPLAY_BETWEEN") %>
				</th>
				<td>
					<common:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="True" />
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td class="courseEvalButtons">
					<asp:Button id="btnSave" runat="server" />
					<asp:Button id="btnSaveAsTemplate" Runat="server" />
					<asp:Button ID="btnSaveAsSurvey" Runat="server" />
					<asp:Button ID="btnSaveTemplate" Runat="server" />
					<asp:Button id="btnCancel" runat="server" CausesValidation="False" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>

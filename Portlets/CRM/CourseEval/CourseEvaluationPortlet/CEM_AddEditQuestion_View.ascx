<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddEditQuestion_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddEditQuestion_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="custom" TagName="SurveyBuilderHeader" Src="SurveyBuilderHeader.ascx" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ import namespace="Jenzabar.Common.Globalization" %>
<div>
	<custom:SurveyBuilderHeader ID="SurveyBuilder" Runat="server" />
</div>
<div class="pSection" id="AddMultipleChoice" runat="server">
	<b>
		<%= Globalizer.GetGlobalizedString("CUS_LBL_ADD_MULTIPLE_CHOICE") %>
	</b>
</div>
<div class="pSection" id="AddComment" runat="server">
	<b>
		<%= Globalizer.GetGlobalizedString("CUS_LBL_ADD_COMMENT") %>
	</b>
</div>
<div class="pSection" id="EditMultipleChoice" runat="server">
	<b>
		<%= Globalizer.GetGlobalizedString("CUS_LBL_EDIT_MULTIPLE_CHOICE") %>
	</b>
</div>
<div class="pSection" id="EditComment" runat="server">
	<b>
		<%= Globalizer.GetGlobalizedString("CUS_LBL_EDIT_COMMENT") %>
	</b>
</div>
<div class="pSection" id="Question1" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="100%">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TR>
							<TD style="HEIGHT: 19px" noWrap align="left" colSpan="2">
								<asp:Label id="lblTemplateWarn" runat="server" Visible="False"></asp:Label></TD>
							<TD style="HEIGHT: 19px"></TD>
						</TR>
						<tr>
							<td width="165" nowrap align="right">
								<common:globalizedliteral ID="QuestionTextRow1" TextKey="CUS_LBL_QUESTION_TEXT" runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="txtQuestion1" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6"
									Font-Size="x-small" Columns="85" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:CheckBox ID="cbRequired1" Runat="server" />&nbsp;
								<common:globalizedliteral ID="glitRequired1" TextKey="CUS_TXT_REQUIRED" runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="chkboxQuestionPool1" Runat="server" />&nbsp;
								<common:globalizedliteral ID="chkboxLiteral1" TextKey="CUS_CHKBOX_QUESTION_POOL" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="Question2" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="435">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap align="right">
								<common:globalizedliteral ID="QuestionTextRow2" TextKey="CUS_LBL_QUESTION_TEXT" runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="txtQuestion2" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6"
									Font-Size="x-small" Columns="85" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:CheckBox ID="cbRequired2" Runat="server" />&nbsp;
								<common:globalizedliteral ID="glitRequired2" TextKey="CUS_TXT_REQUIRED" runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="chkboxQuestionPool2" Runat="server" />&nbsp;
								<common:globalizedliteral ID="chkboxLiteral2" TextKey="CUS_CHKBOX_QUESTION_POOL" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="Question3" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="435">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap align="right">
								<common:globalizedliteral ID="QuestionTextRow3" TextKey="CUS_LBL_QUESTION_TEXT" runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="txtQuestion3" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6"
									Font-Size="x-small" Columns="85" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:CheckBox ID="cbRequired3" Runat="server" />&nbsp;
								<common:globalizedliteral ID="glitRequired3" TextKey="CUS_TXT_REQUIRED" runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="chkboxQuestionPool3" Runat="server" />&nbsp;
								<common:globalizedliteral ID="chkboxLiteral3" TextKey="CUS_CHKBOX_QUESTION_POOL" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="Question4" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="435">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap align="right">
								<common:globalizedliteral ID="QuestionTextRow4" TextKey="CUS_LBL_QUESTION_TEXT" runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="txtQuestion4" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6"
									Font-Size="x-small" Columns="85" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:CheckBox ID="cbRequired4" Runat="server" />&nbsp;
								<common:globalizedliteral ID="glitRequired4" TextKey="CUS_TXT_REQUIRED" runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="chkboxQuestionPool4" Runat="server" />&nbsp;
								<common:globalizedliteral ID="chkboxLiteral4" TextKey="CUS_CHKBOX_QUESTION_POOL" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="Question5" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="435">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap align="right">
								<common:globalizedliteral ID="QuestionTextRow5" TextKey="CUS_LBL_QUESTION_TEXT" runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="txtQuestion5" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6"
									Font-Size="x-small" Columns="85" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:CheckBox ID="cbRequired5" Runat="server" />&nbsp;
								<common:globalizedliteral ID="glitRequired5" TextKey="CUS_TXT_REQUIRED" runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="chkboxQuestionPool5" Runat="server" />&nbsp;
								<common:globalizedliteral ID="chkboxLiteral5" TextKey="CUS_CHKBOX_QUESTION_POOL" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
<div class="pSection">
	<table>
		<tr>
		</tr>
		<tr>
			<td width="132">&nbsp;</td>
			<td width="435">
				<common:globalizedbutton ID="gbtnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;&nbsp;
				<common:globalizedbutton ID="gbtnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>

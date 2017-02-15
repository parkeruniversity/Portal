<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddQuestionPool_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddQuestionPool_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<h4><cmn:GlobalizedLiteral id="glitAddQuestions" Runat="server" TextKey="CUS_TXT_ADD_QUESTION_TO_POOL" /></h4>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td width="1">&nbsp;</td>
			<td width="100%">
				<div class="hint">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
						<tr>
							<td width="165" nowrap align="right">
								<cmn:GlobalizedLiteral ID="glitQuestion" TextKey="CUS_LBL_QUESTION_TEXT" Runat="server" />&nbsp;
							</td>
							<td>
								<asp:TextBox id="tbQuestion" Runat="server" MaxLength="2000" TextMode="MultiLine" Rows="6" Font-Size="x-small"
									Columns="85" />
							</td>
						</tr>
						<tr>
							<td width="165" nowrap align="right">
								<cmn:GlobalizedLiteral ID="glitQuestionType" TextKey="LBL_QUESTION_TYPE" Runat="server" />&nbsp;
							</td>
							<td>
								<asp:DropDownList ID="ddlQuestionType" Runat="server" />&nbsp;&nbsp;
								<asp:CheckBox ID="cbRequired" Runat="server" />&nbsp;
								<cmn:globalizedliteral ID="glitRequired" TextKey="CUS_TXT_REQUIRED" runat="server" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td width="132">&nbsp;</td>
			<td width="500">
				<cmn:globalizedbutton ID="gbtnSave" Runat="server" TextKey="TXT_SAVE" />&nbsp;&nbsp;
				<cmn:globalizedbutton ID="gbtnSaveAndAddAnother" Runat="server" TextKey="CUS_SAVE_AND_ADD_ANOTHER" />&nbsp;&nbsp;
				<cmn:globalizedbutton ID="gbtnCancel" Runat="server" TextKey="TXT_CANCEL" />
			</td>
		</tr>
	</table>
</div>

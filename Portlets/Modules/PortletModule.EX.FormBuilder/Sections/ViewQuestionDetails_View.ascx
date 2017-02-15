<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="formbuilder" namespace="Jenzabar.FRM.EX" assembly="FRM.EX" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewQuestionDetails_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Sections.ViewQuestionDetails_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server" /></h4>
	</div>
	<div class="pSection">
		<common:superbreadcrumbs id="brdCrumbs" runat="server" />
		<h5><strong>
			<common:globalizedliteral id="ViewQuestionLiteral" Runat="server" TextKey="TXT_VIEW_A_QUESTION" />
		</strong></h5>
		<fieldset>
			<table cellPadding="5" class="SmallText">
				<TBODY>
					<tr>
						<td align="right">
							<%= Globalizer.GetGlobalizedString("TXT_QUESTION_LABEL_COLON") %>
						</td>
						<td><b><asp:literal id="litQuestionLabel" Runat="server" /></b></td>
					</tr>
					<tr>
						<td align="right">
							<common:GlobalizedLiteral TextKey="LBL_QUESTION_TYPE" runat="server" id=GlobalizedLiteral1 />
						</td>
						<td><asp:literal id="litQuestionType" Runat="server" /></td>
					</tr>
					<tr id="trEditQ" runat="server">
						<td align="right">
							<common:GlobalizedLiteral TextKey="TXT_EDIT_COLON" runat="server" id=GlobalizedLiteral2 />
						</td>
						<td>
							<asp:imagebutton ImageUrl="~/UI/Common/Images/PortletImages/Icons/edit.gif" id="imgbtnEdit" Runat="server" />&nbsp;
							<common:GlobalizedHyperLink id="hypEdit" Runat="server" TextKey="TXT_EDIT_THIS_QUESTION" />
						</td>
					</tr>
					<tr id="trMappingRow" runat="server">
						<td align="right">
							<common:GlobalizedLiteral TextKey="TXT_MAPPING_TABLE_COLUMN" runat="server" id="GlobalizedLiteral3" />
						</td>
						<td>
							<asp:Literal ID="litMapping" Runat="server" />
							<common:GlobalizedHyperLink id="hypViewMapping" runat="server" visible="false" />
						</td>
					</tr>
					<tr>
						<td align="right">
							<common:GlobalizedLiteral TextKey="TXT_QUESTION_PREVIEW_COLON" runat="server" id="GlobalizedLiteral4" />
						</td>
						<td></td>
					</tr>
				</TBODY>
			</table>
		</fieldset>
		<div>
			<table id="tblQuestionPreview" cellPadding="10" width="100%" align="center">
				<tr>
					<td id="qwcCell" runat="server"></td>
				</tr>
			</table>
		</div>
		<span id="spanSaveCancel" runat="server">
			<common:GlobalizedButton id="gbtnSave" TextKey="TXT_SAVE" runat="server" />&nbsp;
			<common:GlobalizedButton id="gbtnCancel" CausesValidation="false" TextKey="TXT_CANCEL" runat="server" />&nbsp;	
		</span>
		<common:GlobalizedLinkButton class="SmallText" id="lnkbtnBack" TextKey="TXT_BACK_TO_PREVIOUS_SCREEN" runat="server" />
	</div>	
</div>
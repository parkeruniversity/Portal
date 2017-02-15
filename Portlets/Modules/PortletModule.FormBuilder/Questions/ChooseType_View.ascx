<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ChooseType_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Questions.ChooseType_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server"></common:SuperBreadcrumbs>
		<h5>
		<strong>
			<common:GlobalizedLiteral Runat="server" TextKey="TXT_CHOOSE_QUESTION_TYPE" id="litChooseQuestionType"></common:GlobalizedLiteral>
		</strong>
		</h5>
		<p style="PADDING-RIGHT:0px;PADDING-LEFT:0px;PADDING-BOTTOM:0px;MARGIN:0px;PADDING-TOP:0px"
			id="pTypeDescription" runat="server"><asp:Panel id="pnlIntro" CssClass="hint" runat="server"></asp:Panel></p>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<TBODY>
					<tr>
						<td colspan="2">
							<B>
								<%= Globalizer.GetGlobalizedString("LBL_ADD_A_QUESTION") %>
							</B>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign=center>
							<asp:HyperLink id="hypTextFieldImage" runat="server"></asp:HyperLink>
							<asp:HyperLink id="hypTextFieldText" runat="server"></asp:HyperLink>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign=center>
							<asp:HyperLink id="hypEssayImage" runat="server"></asp:HyperLink>
							<asp:HyperLink id="hypEssayText" runat="server"></asp:HyperLink>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign=center>
							<asp:HyperLink id="hypDropDownImage" runat="server"></asp:HyperLink>
							<asp:HyperLink id="hypDropDownText" runat="server"></asp:HyperLink>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign=center>
							<asp:HyperLink id="hypMultipleChoiceImage" runat="server"></asp:HyperLink>
							<asp:HyperLink id="hypMultipleChoiceText" runat="server"></asp:HyperLink>
						</td>
					</tr>
					<tr id="trFUI" runat="server">
					    <td>&nbsp;</td>
					    <td>
					        <asp:HyperLink ID="hypFUImg" runat="server" />
					        <asp:HyperLink ID="hypFUTxt" runat="server" />
					    </td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:HyperLink ID="hypBackToMain" Runat="server"></asp:HyperLink>
						</td>
					</tr>
				</TBODY>
			</table>
		</fieldset>
	</div>
</div>

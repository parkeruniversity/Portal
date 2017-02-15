<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="FWK" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditSection_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Sections.AddEditSection_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.Common.Globalization"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server" /></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
		<strong>
			<common:GlobalizedLiteral Runat="server" TextKey="TXT_ADD_A_SECTION" id="AddASectionLiteral" />
		</strong>
		</h5>
		<div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litErr" Runat="server" /></div></div>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<TBODY>
					<tr>
						<td align="right"><%= Globalizer.GetGlobalizedString("TXT_SECTION_NAME_COLON") %></td>
						<td>&nbsp;</td>
						<td colspan="2">
							<asp:TextBox ID="tbSectionName" MaxLength="200" Runat="server" />
							<asp:RequiredFieldValidator ID="NameRequired" ControlToValidate="tbSectionName" Runat="server" /><input type="text" style="visibility:hidden;">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<b>
								<common:FormLabel TextKey="TXT_SECTION_DESCRIPTION_INSTRUCTIONS" runat="server" id="InstructionsLabel" />
							</b>
						</td>
					</tr>
					<tr>
						<FWK:ImagePlacementandText id="iptSection" runat="server" />
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
						<td>
							<common:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" />
							<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" CausesValidation="False" Runat="server" />
						</td>
					</tr>
				</TBODY>
			</table>
		</fieldset>
	</div>
</div>

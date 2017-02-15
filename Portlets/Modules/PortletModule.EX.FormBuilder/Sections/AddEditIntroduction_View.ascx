<%@ Import namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditIntroduction_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Sections.AddEditIntroduction_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="FWK" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server" /></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
		<strong>
			<common:GlobalizedLiteral Runat="server" TextKey="TXT_FORM_INTRODUCTION" id="litIntroduction" />
		</strong>
		</h5>
		<p class="hint" style="text-align:center;">
			<a id="lnkImport" runat="server"><asp:Image ID="imgAdd" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" /> <%= Globalizer.Format("FB_SETTINGS_IMPORTURT_TXT",Globalizer.GetGlobalizedString("TXT_FORM_INTRODUCTION")) %></a>
		</p>
		<p style="PADDING-RIGHT:0px;PADDING-LEFT:0px;PADDING-BOTTOM:0px;MARGIN:0px;PADDING-TOP:0px" id="pIntroIntructions" runat="server"><common:hint id="hntIntro" TextKey="TXT_FORM_INTRODUCTION_INSTRUCTIONS" runat="server" /></p>
		<div class="FormBuilder"><div class="ErrorMsg"><asp:Literal ID="litErr" Runat="server" /></div></div>
		<fieldset>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<TBODY>
					<tr>
						<td colspan="3">
							<FWK:ImagePlacementandText id="_iptIntroduction" runat="server" />
						</td>	
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
						<td>
							<common:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" />
							<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" CausesValidation="False" Runat="server" /> &nbsp; 
							<asp:Image ID="imgImport" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/delete.gif" Visible="False" /> <asp:LinkButton ID="lbDelete" Runat="server" Visible="False" />
						</td>
					</tr>
				</TBODY>
			</table>
		</fieldset>
	</div>
</div>

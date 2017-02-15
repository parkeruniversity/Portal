<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditHeader_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Questions.AddEditHeader_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" id="glBodyTitle" />
		</strong></h5>
		<p class="hint">
			<%= Globalizer.GetGlobalizedString("FB_HINT_ADD_A_HEADER_TXT") %>
		</p>
		<fieldset>
			<div class="FormBuilder"><div class="ErrorMsg"><p><asp:literal id="litErrorMsg" Runat="server" Visible="False" /></p></div></div>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<tr>
					<td align="right"><cmn:FormLabel id="flHeader" runat="server" TextKey="FB_HEADER_TXT" /></td>
					<td>
						<asp:TextBox ID="tbHeader" Width="300px" Runat="server" /> <asp:RequiredFieldValidator ID="rfvName" Runat="server" ControlToValidate="tbHeader" /><input type="text" style="visibility:hidden;">
					</td>
				</tr>
				<tr>
					<td align="right"><cmn:FormLabel id="flDescription" runat="server" TextKey="FB_DESCRIPTION_TXT" /></td>
					<td><jics:TextEditor id="tbeDescription" MaxLength="6000" Runat="server" /></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="FB_ADD_HEADER_SAVE_TXT" /> &nbsp; 
						<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FB_ADD_HEADER_CANCEL_TXT" CausesValidation="False" />
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReorderSections_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Sections.ReorderSections_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.FRM" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server"></common:SuperBreadcrumbs>
		<h5>
		<strong>
			<common:GlobalizedLiteral Runat="server" TextKey="TXT_REORDER_SECTIONS" id="AddASectionLiteral"></common:GlobalizedLiteral>
		</strong>
		</h5>
		<div class="ErrorMsg">
			<asp:Literal ID="litErrorMsg" Visible="False" Runat="server"></asp:Literal>
		</div>
		<table class="GridStyle GridStyleHalfWidth" cellSpacing="0" cellPadding="0">
			<thead>
				<tr>
					<td colspan="2">
						<i>
							<common:GlobalizedLiteral Runat="server" TextKey="TXT_FORM_COLON" id="litFormReorderHeader"></common:GlobalizedLiteral>
						</i>
					</td>
				</tr>
				<tr>
					<th>
						<common:GlobalizedLiteral Runat="server" TextKey="TXT_ORDER" id="GlobalizedLiteral1"></common:GlobalizedLiteral>
					</th>
					<th class="RightTableCell">
						<common:GlobalizedLiteral Runat="server" TextKey="TXT_SECTION_NAME" id="GlobalizedLiteral2"></common:GlobalizedLiteral>
					</th>
				</tr>
			</thead>
			<tbody>
				<asp:Repeater id="rptReorderSections" runat="server">
					<ItemTemplate>
						<tr id="trRow" runat="server">
							<td class="ReorderCell">
								<asp:TextBox id="tbSectionOrder" Width="60" Runat="server" />
							</td>
							<td class="RightTableCell">
								<asp:literal id="litSectionName" Runat="server" />
							</td>
							<td class="HiddenCell">
								<input type="hidden" id="inSectionOldOrder" runat="server">
							</td>
						</tr>
					</ItemTemplate>
				</asp:Repeater>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<common:GlobalizedButton TextKey="TXT_REORDER" ID="btnReorder" Runat="server" />&nbsp;
						<common:GlobalizedLinkButton TextKey="TXT_DONE_REORDERING" ID="lnkbtnDone" Runat="server" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

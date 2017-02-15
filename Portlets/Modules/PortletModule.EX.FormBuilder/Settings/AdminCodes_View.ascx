<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminCodes_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Settings.AdminCodes_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<style>.groupedGrid{width:400px;}</style>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i><span id="spnFormName" runat="server"></span></h4>
	</div>
	<div class="pSection"><cmn:superbreadcrumbs id="brdCrumbs" runat="server"></cmn:superbreadcrumbs>
		<h5>
		<strong><cmn:globalizedliteral id="glBodyTitle" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CDS"></cmn:globalizedliteral></strong>
		</h5>
		<p class="hint">
			<%= Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_CDS_HINT") %>
		</p>
		<table class="SmallText" cellSpacing="3" cellPadding="3">
			<tr>
				<td>
					<asp:linkbutton id="lbAdd" runat="server">
						<asp:Image ID="imgImport" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" />&nbsp;<%= Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_WC_ADD") %>
					</asp:linkbutton>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblError" Runat="server" Visible="False" ForeColor="Red" />
					<cmn:groupedgrid id="jenzGridCodes" runat="server" RenderGroupHeaders="true">
						<Columns>
							<asp:TemplateColumn HeaderText="Code">
								<ItemTemplate>
									<asp:Literal ID="litID" Runat="server" Visible="False" />
									<asp:Label ID="labCode" Runat="server" />
									<asp:TextBox ID="tbCode" Runat="server" Visible="False" MaxLength="10" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Note (optional)">
								<ItemTemplate>
									<asp:Literal ID="litNote" Runat="server" />
									<asp:TextBox ID="tbNote" Runat="server" Visible="False" MaxLength="200" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:LinkButton ID="EditLink" Runat="server" CommandName="EditCode"><asp:Image ID="imgEditLink" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/edit.gif" /></asp:LinkButton>
									<asp:LinkButton ID="DeleteLink" Runat="server" CommandName="DeleteCode"><asp:Image ID="imgDeleteCode" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/delete.gif" /></asp:LinkButton>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</cmn:groupedgrid>
				</td>
			</tr>
			<tr>
				<td>
					<a id="lnkBack" runat="server"><%= Globalizer.GetGlobalizedString("FORMBUILDER_FORM_SETTINGS_WC_BACK") %></a>
				</td>
			</tr>
			<tr>
				<td>
					<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_SAVE_BTN" visible="false" /> &nbsp; 
					<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="FORMBUILDER_FORM_SETTINGS_CANCEL_BTN" CausesValidation="False" visible="false" />
				</td>
			</tr>
		</table>
	</div>
</div>

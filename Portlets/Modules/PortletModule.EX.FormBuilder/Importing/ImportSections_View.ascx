<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportSections_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Importing.ImportSections_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<p class="hint">
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_MAIN_HINT_TXT" id="glHint" />
		</p>
		<table class="groupedGrid " cellspacing="1" cellpadding="0" border="0" style="margin-bottom:-2px;">
			<thead>
				<tr>
					<td>
						<%= Globalizer.GetGlobalizedString("FB_BROWSEFORMS_TXT") %> &nbsp; 
						<asp:DropDownList ID="ddlFormTypes" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged" />
					</td>
				</tr>
			</thead>
		</table>
		<cmn:groupedgrid id="ggForms" runat="server" RenderGroupHeaders="true">
			<Columns>
				<asp:TemplateColumn HeaderText="Application">
					<ItemTemplate>
						<asp:Literal ID="litID" Runat="server" Visible="False" />
						<asp:HyperLink ID="hlFormName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="# of Sections">
					<ItemTemplate>
						<asp:Label ID="lbNumSections" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Import entire form*">
					<ItemTemplate>
						<asp:Literal ID="litDash" Runat="server" />
						<asp:LinkButton ID="lbImport" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<i><%= Globalizer.GetGlobalizedString("FB_IMPORT_ASTERISK_TXT") %></i>
	</div>
</div>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportHiddenData_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Importing.ImportHiddenData_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_HIDDENDATA_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<p class="hint" id="pHint" runat="server">
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORT_HD_MAIN_HINT_TXT" id="glHint" />
		</p>
		
		<table class="groupedGrid " cellspacing="1" cellpadding="0" border="0" style="margin-bottom:-2px;">
			<thead>
				<tr>
					<td>
						<%= Globalizer.GetGlobalizedString("FB_IMPORT_YOURFORMS_TXT") %> &nbsp; 
						<asp:DropDownList ID="ddlFormTypes" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged" />
					</td>
				</tr>
			</thead>
		</table>
		
		<cmn:groupedgrid id="ggItems" runat="server" RenderGroupHeaders="true">
			<Columns>
				<asp:TemplateColumn HeaderText="Form Name">
					<ItemTemplate>
						<asp:Literal ID="litFormID" Runat="server" Visible="False" />
						<asp:HyperLink ID="hlFormName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="# of Items">
					<ItemTemplate>
						<asp:Label ID="lbNumItems" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Import all hidden data">
					<ItemTemplate>
						<asp:LinkButton ID="lbImport" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<br/>
		<a id="aBack" runat="server"><%= Globalizer.GetGlobalizedString("FB_BACKMAINSCREEN_TXT") %></a>
	</div>
</div>

<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportQuestions_View_Step2.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Importing.ImportQuestions_View_Step2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<cmn:GlobalizedLiteral Runat="server" TextKey="FB_IMPORTQ_TXT" id="glBodyTitle" />
			</strong>
		</h5>
		<cmn:groupedgrid id="ggSections" runat="server" RenderGroupHeaders="true">
			<TableHeaderTemplate>
				<%= Globalizer.Format("FB_IMPORT_SECTIONSIN_TXT",_formThisName) %>
			</TableHeaderTemplate>
			<Columns>
				<asp:TemplateColumn HeaderText="Sections">
					<ItemTemplate>
						<asp:Literal ID="litID" Runat="server" Visible="False" />
						<asp:HyperLink ID="hlSectionName" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="# of Questions">
					<ItemTemplate>
						<asp:Label ID="lbNumQuestions" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Import all questions">
					<ItemTemplate>
						<asp:LinkButton ID="lbImport" Runat="server" />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<br/>
		<a id="aStartOver" runat="server"><%= Globalizer.GetGlobalizedString("FB_STARTOVER_TXT") %></a> &nbsp; 
		<a id="aBackToSearch" runat="server"><%= Globalizer.GetGlobalizedString("FB_IMPORT_BACKSEARCH_TXT") %></a>
	</div>
</div>
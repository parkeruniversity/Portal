<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.DegreeAudit.DefaultView" %>
<div class="pSection">
	<asp:Literal ID="litCurrentUser" Runat="server" />
	<common:groupedgrid id="ggDegreeSummary" RenderGroupHeaders="true" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_REQUIREMENTS_SUMMARY") %>
		</TableHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="NAME">
				<ItemTemplate>
					<asp:Literal ID="litDescription" Runat="server" />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="STATUS">
				<ItemTemplate>
					<asp:Literal id="litSummary" runat="server" />
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</common:groupedgrid>
	<p>
		<common:GlobalizedLinkButton id="btnViewDetails" runat="server" TextKey="TXT_VIEW_ALL_DETAILS" />
	</p>
</div>

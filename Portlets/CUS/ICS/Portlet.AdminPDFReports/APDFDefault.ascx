<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFDefault.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFDefault" %>
<div class="pSection">
	<div><h4>Defined Reports</h4>
	</div>
	<div><asp:LinkButton ID="lnkManageCategories" Runat="server" Text="Manage categories" /></div>
	<div><asp:LinkButton ID="lnkAddReport" Runat="server" Text="Add new report" /></div>
	<div><asp:LinkButton ID="lnkManageDropDowns" Runat="server" Text="Manage drop downs" Visible="False" /></div>
	<div><common:GlobalizedLiteral ID="glitViewRptForCat" runat="server" TextKey="CUS_PDF_VIEW_REPORTS_FOR_CATEGORY" />&nbsp;
	<asp:DropDownList ID="ddViewReportsForCategory" Runat="server" AutoPostBack="true" DataTextField="CategoryName" DataValueField="ID" /></div>
	<div>
		<common:GroupedGrid id="dgReports" runat="server" DataKeyField="ID" RenderTableHeaders="true">
			<EmptyTableTemplate>No reports yet defined for category</EmptyTableTemplate>
			<Columns>
				<asp:BoundColumn DataField="ReportName" HeaderText="Report Name" />
				<asp:BoundColumn DataField="LinkName" HeaderText="Link Name" />
				<common:EditButtonColumn HeaderText="Edit" />
				<common:DeleteButtonColumn HeaderText="Delete" />
			</Columns>
		</common:GroupedGrid>
	</div>
</div>

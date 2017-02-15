<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFManageCategories.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFManageCategories" %>
<div class="pSection">
	<div><h4>Manage Categories</h4>
	</div>
	<div><asp:LinkButton ID="lnkAddCategory" Runat="server" Text="Add new category" /></div>
	<div>
		<common:GroupedGrid id="dgCategories" runat="server" DataKeyField="ID" RenderTableHeaders="true">
			<EmptyTableTemplate>No categores yet defined</EmptyTableTemplate>
			<Columns>
				<asp:BoundColumn DataField="CategoryName" HeaderText="Category Name" />
				<common:EditButtonColumn HeaderText="Edit" />
				<common:DeleteButtonColumn HeaderText="Delete" />
			</Columns>
		</common:GroupedGrid>
	</div>
</div>

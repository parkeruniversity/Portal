<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFManageDropDowns.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFManageDropDowns" %>
<div class="pSection">
	<div><h4>Manage Drop Downs</h4>
	</div>
	<div><asp:LinkButton ID="lnkAddDropDown" Runat="server" Text="Add new drop down" /></div>
	<div>
		<common:GroupedGrid id="dgDropDowns" runat="server" DataKeyField="ID" RenderTableHeaders="true">
			<EmptyTableTemplate>No drop downs yet defined</EmptyTableTemplate>
			<Columns>
				<asp:BoundColumn DataField="DropDownName" HeaderText="Drop Down Name" />
				<common:EditButtonColumn HeaderText="Edit" />
				<common:DeleteButtonColumn HeaderText="Delete" />
			</Columns>
		</common:GroupedGrid>
	</div>
</div>

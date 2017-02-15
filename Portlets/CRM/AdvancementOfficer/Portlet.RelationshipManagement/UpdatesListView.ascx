<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UpdatesListView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.UpdatesListView" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
		<td width="90%">
			<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
		</td>
		<td width="10%">
			<asp:Button ID="btnSubmit" Runat="server" />
		</td>
	</tr>
</table>
<table class="groupedGrid" cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tbody class="ghead">
	<tr>
		<td class="header" width="14%">
			<asp:Label ID="lblCategory" Runat="server" /></td>
		<td class="header" width="9%">
			<asp:Label ID="lblDate" Runat="server" /></td>
		<td class="header" width="9%">
			<asp:Label ID="lblStatus" Runat="server" /></td>
		<td class="header" width="64%">
			<asp:Label ID="lblInfo" Runat="server" /></td>
		<td class="header" width="2%">
			&nbsp;</td>
		<td class="header" width="2%">
			&nbsp;</td>
	</tr>
	</tbody>
	<asp:repeater id="rptConstituent" Runat="server">
		<ItemTemplate>
			<tr>
				<td colspan="6" class="header">
					<%#DataBinder.Eval(Container.DataItem, "ConstName")%>
					-
					<asp:Label ID="lblID" Runat="server" />:&nbsp;<%#DataBinder.Eval(Container.DataItem, "ConstID")%>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<jenzabar:GroupedGrid ID="dgUpdates" Runat="server" Width="99%" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
						CssClass="groupedGrid" DataKeyField="RecordID" OnItemCommand="dgUpdates_ItemCommand">
						<Columns>
							<asp:BoundColumn DataField="Category" ItemStyle-Width="14%" />
							<asp:BoundColumn DataField="Date" ItemStyle-Width="10%" />
							<asp:BoundColumn DataField="Status" ItemStyle-Width="10%" />
							<asp:BoundColumn DataField="Comments" ItemStyle-Width="64%" />
							<asp:TemplateColumn ItemStyle-Width="1%">
								<ItemTemplate>
									<asp:ImageButton ID="btnEdit" CommandName="EditItem" Runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn ItemStyle-Width="1%">
								<ItemTemplate>
									<asp:ImageButton ID="btnDelete" CommandName="DeleteItem" Runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</jenzabar:GroupedGrid>
				</td>
			</tr>
		</ItemTemplate>
	</asp:repeater></table><br>
	&nbsp;<asp:Label CssClass="PortletError" ID="lblError" Runat="server"/><br>
	&nbsp;<asp:LinkButton ID="lnkBack" Runat="server"/>

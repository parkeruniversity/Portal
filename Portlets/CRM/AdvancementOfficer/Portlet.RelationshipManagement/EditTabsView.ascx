<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditTabsView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.EditTabsView" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table class="groupedGrid" cellSpacing="0" cellPadding="0" width="100%" border="0">
	<asp:repeater id="rptAuxTabSet" Runat="server">
		<ItemTemplate>
			<tbody class="ghead">
				<tr>
					<td width="96%" align="left">
						<%#DataBinder.Eval(Container.DataItem, "TabGroup")%>
					</td>
					<td width="4%" align="left">
						<asp:LinkButton ID="lnkTabSet" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>'>
						</asp:LinkButton>
					</td>
				</tr>
			</tbody>
			<tr>
				<td colspan="2">
					<asp:DataGrid ID="ggTabItems" Runat="server" Width="99%" GridLines="None" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
						CssClass="groupedGrid">
						<Columns>
							<asp:BoundColumn DataField="TabItem" ItemStyle-Width="96%"></asp:BoundColumn>
							<asp:TemplateColumn ItemStyle-Width="4%">
								<ItemTemplate>
									<asp:LinkButton ID="lnkTabItem" Runat="server"></asp:LinkButton>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</asp:DataGrid>
				</td>
			</tr>
		</ItemTemplate>
	</asp:repeater>
</table>

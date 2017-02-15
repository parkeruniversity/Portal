<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderTabsView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.OrderTabs" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td colspan="2">
			<asp:DataGrid ID="ggTabSets" Runat="server" Width="99%" GridLines="None" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
				CssClass="groupedGrid" ShowHeader="True" AutoGenerateColumns="False" HeaderStyle-CssClass="alt"
				DataKeyField="ID">
				<COLUMNS>
					<ASP:TEMPLATECOLUMN ItemStyle-Width="95%">
						<ITEMTEMPLATE>
							<asp:TextBox id="txtOrder" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TabOrder") %>' Width="25px" MaxLength="3">
							</asp:TextBox>
							<%# DataBinder.Eval( Container.DataItem, "TabGroup" )%>
							<INPUT id=OldOrder type=hidden value='<%# DataBinder.Eval(Container.DataItem, "TabOrder") %>' name=OldOrder runat="server">
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<asp:TemplateColumn ItemStyle-Width="5%" ItemStyle-Wrap="False">
						<ItemTemplate>
							<asp:LinkButton ID="lnkEdit" Runat="server" CommandName="EditSet">Edit</asp:LinkButton>
							<asp:LinkButton ID="lnkDelete" Runat="server" CommandName="DeleteSet">Delete</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</COLUMNS>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<td align="left" width='20%'>
			<asp:button id="btnSave" Runat="server"></asp:button>&nbsp<asp:button id="btnCancel" Runat="server"></asp:button>&nbsp;</td>
	</tr>
</table>

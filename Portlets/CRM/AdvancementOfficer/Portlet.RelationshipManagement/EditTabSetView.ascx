<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditTabSetView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.EditTabSet" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table cellSpacing="0" cellPadding="2" width="100%" border="0">
	<tr>
		<td align="right" width="15%"><asp:label id="lblTitle" Runat="server"></asp:label>:</td>
		<td width="85%"><asp:textbox id="txtTitle" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td align="right"><asp:label id="lblPosition" Runat="server"></asp:label>:</td>
		<td><asp:listbox id="lstPosition" Runat="server" Rows="1"></asp:listbox></td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="2" width="100%" class="groupedGrid">
	<tbody class="ghead">
		<tr>
			<td colspan="2">
				<asp:Label ID="lblItemsHeader" Runat="server"></asp:Label>
			</td>
		</tr>
	</tbody>
</table>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td colspan="2">
			<asp:DataGrid ID="ggTabItems" Runat="server" Width="99%" GridLines="None" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
				CssClass="groupedGrid" AutoGenerateColumns="False" DataKeyField="ID">
				<COLUMNS>
					<ASP:TEMPLATECOLUMN ItemStyle-Width="5%">
						<ITEMTEMPLATE>
							<asp:TextBox id="txtOrder" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ItemOrder") %>' Width="25px" MaxLength="3">
							</asp:TextBox>
							<INPUT id=OldOrder type=hidden value='<%# DataBinder.Eval(Container.DataItem, "ItemOrder") %>' name=OldOrder runat="server">
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<ASP:TEMPLATECOLUMN ItemStyle-Width="90%">
						<ITEMTEMPLATE>
							<ASP:Label ID="lblTabItem" Runat="server">
								<%# DataBinder.Eval( Container.DataItem, "TabItem" )%>
							</ASP:Label>
						</ITEMTEMPLATE>
					</ASP:TEMPLATECOLUMN>
					<asp:TemplateColumn ItemStyle-Width="5%">
						<ItemTemplate>
							<asp:LinkButton ID="lnkTabItem" CommandName="EditItem" Runat="server"></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</COLUMNS>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<td align="right" width="8%"><asp:button id="btnSave" Runat="server"></asp:button>&nbsp;</td>
		<td><asp:button id="btnCancel" Runat="server"></asp:button></td>
	</tr>
</table>

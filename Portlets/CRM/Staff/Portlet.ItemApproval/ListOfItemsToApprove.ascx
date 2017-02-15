<%@ Import namespace="Jenzabar.CRM.Staff.Web.Portlets.ItemApprovalPortlet"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ListOfItemsToApprove.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.ItemApprovalPortlet.ListOfItemsToApprove" %>
<table id="tblListOfItemsToApprove" cellPadding="3" width="100%">
	<tr>
		<td><asp:datagrid id="dgItemsToApproveList" runat="server" ShowHeader="True" AutoGenerateColumns="False"
				GridLines="None">
				<Columns>
					<asp:TemplateColumn HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:DropDownList ID="ddlbUserAction" Runat="server"></asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="ItemType" HeaderStyle-Font-Bold="True"></asp:BoundColumn>
					<asp:BoundColumn DataField="Vendor" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
					<asp:BoundColumn DataField="Requestor" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
					<asp:BoundColumn DataField="ReferenceNum" HeaderStyle-Font-Bold="True"></asp:BoundColumn>
					<asp:BoundColumn DataField="Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-Font-Bold="True"
						HeaderStyle-HorizontalAlign="Right"></asp:BoundColumn>
					<asp:BoundColumn DataField="ReferenceKey" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="ApprovalKey" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="Description" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="ApprovedDeclined" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="ApproverID" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="DisplayDetail" Visible="False"></asp:BoundColumn>
					<asp:TemplateColumn Visible="False" HeaderText="Item Details" HeaderStyle-Font-Bold="True">
						<ItemTemplate>
							<asp:DataGrid Visible="True" ID="dgItemDetails" Runat="server" AutoGenerateColumns="False" GridLines="None"
								ShowHeader="False">
								<Columns>
									<asp:BoundColumn DataField="DetailData"></asp:BoundColumn>
								</Columns>
							</asp:DataGrid>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:Button ID="btnShowRowDetail" Runat="server"></asp:Button>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="a"></asp:BoundColumn>
					<asp:BoundColumn DataField="b"></asp:BoundColumn>
				</Columns>
			</asp:datagrid>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table cellPadding="20">
				<tr>
					<td><asp:button id="btnSave" Runat="server"></asp:button></td>
					<td><asp:button id="btnCancel" Runat="server"></asp:button></td>
					<td><asp:button id="btnShowAllDetail" Runat="server"></asp:button></td>
					<td><asp:button id="btnCloseAllDetail" Runat="server"></asp:button></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblError" Runat="server"></asp:label></td>
	</tr>
</table>

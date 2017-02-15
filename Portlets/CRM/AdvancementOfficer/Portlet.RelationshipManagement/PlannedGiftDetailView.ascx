<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PlannedGiftDetailView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.PlannedGiftDetailView" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<div class="pSection">
<table border="0" width="100%">
		<tr>
			<td colSpan="2"><h4><asp:label id="lblHeader" Runat="server"></asp:label></h4></td>
		</tr>
		<tr>
			<td vAlign="middle" colSpan="2" class="header">&nbsp;<asp:label id="lblConstName" Runat="server" Font-Bold="True"></asp:label>&nbsp;-
				<asp:label id="lblID" Runat="server" Font-Bold="True"></asp:label><asp:label id="lblConstID" Runat="server" Font-Bold="True"></asp:label></td>
		</tr>
		<tr>
			<td valign="top">
				<asp:datagrid id="dgRowElements" Runat="server" AlternatingItemStyle-CssClass="alt"
					CssClass="GroupedGrid" AutoGenerateColumns="False" ShowHeader="False" BorderWidth="0">
					<Columns>
						<asp:BoundColumn DataField="Label" ItemStyle-Font-Bold="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="Value"></asp:BoundColumn>
					</Columns>
				</asp:datagrid></td>
			<td valign="top">
				<jenzabar:GroupedGrid id="dgDesig" Runat="server" ShowHeader="False" AutoGenerateColumns="True">
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLabel id="litDesig" TextKey="TXT_REL_MGMT_DESIGNATIONS" runat="server"></jenzabar:GlobalizedLabel>
					</TableHeaderTemplate>
				</jenzabar:GroupedGrid>
							
				<jenzabar:GroupedGrid id="dgStatus" Runat="server" ShowHeader="True" AutoGenerateColumns="False">
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLabel id="litStatus" TextKey="TXT_REL_MGMT_CHANGES_IN_STATUS" runat="server"></jenzabar:GlobalizedLabel>
					</TableHeaderTemplate>
				</jenzabar:GroupedGrid>
				<jenzabar:GroupedGrid id="dgExpContacts" Runat="server" ShowHeader="True" AutoGenerateColumns="False">
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLiteral id="litExpContacts" TextKey="TXT_REL_MGMT_EXPECTED" runat="server"></jenzabar:GlobalizedLiteral>
					</TableHeaderTemplate>
				
				<Columns>
					<asp:TemplateColumn>
								<ItemTemplate>
									<%#DataBinder.Eval(Container.DataItem, "ResponsibleName")%>&nbsp;
									<%#DataBinder.Eval(Container.DataItem, "ExpectedContact")%><br>
									<asp:TextBox TextMode="MultiLine" ReadOnly="True" Text='<%#DataBinder.Eval(Container.DataItem, "ExpectedDetails")%>' Rows="6" Columns="50" Runat="server" ID="Textbox1">
									</asp:TextBox>
								</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>			
				</jenzabar:GroupedGrid>
				
				<jenzabar:GroupedGrid id="dgCompContacts" Runat="server" ShowHeader="True" AutoGenerateColumns="False">
					<TableHeaderTemplate>
						<jenzabar:GlobalizedLiteral id="litCompContacts" TextKey="TXT_REL_MGMT_COMPLETED" runat="server"></jenzabar:GlobalizedLiteral>
					</TableHeaderTemplate>
					<Columns>
						<asp:TemplateColumn>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem, "ContactedByName")%>&nbsp;
										<%#DataBinder.Eval(Container.DataItem, "CompletedContact")%><br>
										<asp:TextBox TextMode="MultiLine" ReadOnly="True" Text='<%#DataBinder.Eval(Container.DataItem, "CompletedDetails")%>' Rows="6" Columns="50" Runat="server" ID="txtCompDesc" NAME="Textbox1">
										</asp:TextBox>
									</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>	
				</jenzabar:GroupedGrid>				
				
								
			</td>
			
		</tr>
		<tr>
			<td colspan="3">
				<jenzabar:GroupedGrid id="dgGifts" Runat="server" BorderWidth="0" ShowHeader="True" AutoGenerateColumns="False"
					CssClass="groupedGrid" AlternatingItemStyle-CssClass="alt" CellSpacing="2" CellPadding="2" Width="98%"></jenzabar:GroupedGrid>
			</td>
		</tr>
</table>
</div>

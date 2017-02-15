<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Detail.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.PlannedGivingPortlet.Detail" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblConstituent" Runat="server" />
<div class="pSection">
	<asp:Table Runat="server" ID="tblTop" GridLines="None" CellPadding="0" CellSpacing="0" Width="100%"
		BorderStyle="None">
		<asp:TableRow>
			<asp:TableCell Width="49%" VerticalAlign="Top">
				<asp:DataGrid ID="dgPGDetails" Runat="server" GridLines="None" Width="100%" CellPadding="0" CellSpacing="1"
					ShowHeader="False" AlternatingItemStyle-CssClass="alt" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="Label" ItemStyle-Font-Bold="True" />
						<asp:BoundColumn DataField="Value" />
					</Columns>
				</asp:DataGrid>
			</asp:TableCell>
			<asp:TableCell Width="1%">&nbsp;</asp:TableCell>
			<asp:TableCell Width="50%" VerticalAlign="Top">
				<asp:DataGrid ID="dgDesig" Runat="server" GridLines="None" Width="100%" CellPadding="0" CellSpacing="1"
					ShowHeader="True" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="crmheader" HeaderStyle-HorizontalAlign="Center">
				</asp:DataGrid>
				<hr>
				<asp:DataGrid ID="dgStatus" Runat="server" GridLines="None" Width="100%" CellPadding="0" CellSpacing="1"
					ShowHeader="True" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="crmheader">
					<Columns>
						<asp:BoundColumn DataField="StatusDate"></asp:BoundColumn>
						<asp:BoundColumn DataField="StatusDesc"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow><asp:TableCell ColumnSpan="3"><hr></asp:TableCell></asp:TableRow>
		<asp:TableRow>
			<asp:TableCell ColumnSpan="3">
				<asp:DataGrid ID="dgContacts" Runat="server" GridLines="None" Width="100%" CellPadding="0" CellSpacing="1"
					ShowHeader="True" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="crmheader" ItemStyle-VerticalAlign="Top">
					<Columns>
						<asp:BoundColumn DataField="Status" ItemStyle-Font-Bold="True"/>
						<asp:BoundColumn DataField="Name"/>
						<asp:BoundColumn DataField="Contact"/>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:TextBox TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "Comment")%>' ReadOnly="True" Rows="3" Columns="50" MaxLength="4000" Runat="server">
								</asp:TextBox>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:DataGrid>
			</asp:TableCell>
		</asp:TableRow>
		

	</asp:Table>
</div>

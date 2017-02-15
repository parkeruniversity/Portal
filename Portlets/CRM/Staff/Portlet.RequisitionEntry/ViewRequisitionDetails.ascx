<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewRequisitionDetails.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.ViewRequisitionDetails" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<asp:label id="lblError" runat="server" Height="22px"></asp:label>
<table height="80%" cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<td width="728" colSpan="2">
			<common:groupedgrid id="dgReqDtl" AutoGenerateColumns="False" Width="100%" runat="server" RenderTableHeaders="True"
				GridLines="None" HeaderRightColumns="(Collection)">
				<Columns>
					<asp:BoundColumn DataField="ReqNum"></asp:BoundColumn>
					<asp:BoundColumn DataField="ReqEnteredDate"></asp:BoundColumn>
					<asp:BoundColumn DataField="ReqNeedByDate"></asp:BoundColumn>
					<asp:BoundColumn DataField="ReqStatus"></asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemStyle Wrap="False"></ItemStyle>
						<ItemTemplate>
							<asp:HyperLink ID="hlnkDisplayEmail" Runat="server" NavigateUrl='<%#"mailto:"+DataBinder.Eval(Container.DataItem,"ReqPendingApprEmail")%>'>
								<%# DataBinder.Eval(Container.DataItem,"ReqPendingApprName") %>
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderStyle-CssClass="header" HeaderStyle-Width="28%" ItemStyle-Width="28%">
						<ItemTemplate>
							<asp:LinkButton CommandArgument='<%#DataBinder.Eval(Container.DataItem, "PONumber")%>' ID="lnkPONumber" Runat="server">
								<%#DataBinder.Eval(Container.DataItem, "PONumber")%>
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn Visible="False" DataField="PODate"></asp:BoundColumn>
					<asp:BoundColumn Visible="False" DataField="POExpDate"></asp:BoundColumn>
					<asp:BoundColumn Visible="False" DataField="PODateToOrder"></asp:BoundColumn>
					<asp:BoundColumn Visible="False" DataField="PODesiredShipDate"></asp:BoundColumn>
					<asp:BoundColumn Visible="False" DataField="POShipToLocation"></asp:BoundColumn>
				</Columns>
			</common:groupedgrid>
		</td>
	</tr>
</table>
<div align="center">
	<table cellPadding="20">
		<tr>
			<td><asp:button id="button_newSearch" runat="server" Height="22px"></asp:button></td>
			<td><asp:button id="button_cancel" runat="server" Height="22px"></asp:button></td>
		</tr>
	</table>
</div>

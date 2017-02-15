<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CampaignManagerDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.CampaignManagerDetail" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblCampaignName" Runat="server" />
<div class="pSection">
	<asp:label id="lblDates" Runat="server" />
	<table cellpadding="0" cellspacing="1" width="100%" border="0">
		<tr>
			<td class="crmsubheader" valign="top" colspan="6">
				<asp:Label ID="lblCampManagerName" Runat="server" />
			</td>
		</tr>
		<tr>
			<td class="crmheader" width="30%" align="center">
				<asp:Label ID="lblProspName" Runat="server" />
			</td>
			<td class="crmheader" width="10%" align="center">
				<asp:Label ID="lblLastContact" Runat="server" />
			</td>
			<td class="crmheader" width="15%" align="center">
				<asp:Label ID="lblAmtSolicited" Runat="server" />
			</td>
			<td class="crmheader" width="15%" align="center">
				<asp:Label ID="lblCampGifts" Runat="server" />
			</td>
			<td class="crmheader" width="15%" align="center">
				<asp:Label ID="lblCampPledges" Runat="server" />
			</td>
			<td class="crmheader" width="15%" align="center">
				<asp:Label ID="lblLifetimeGiving" Runat="server" />
			</td>
		</tr>
		<asp:Repeater ID="rptCampStaff" Runat="server">
			<ItemTemplate>
				<tr>
					<td class="crmsubheader" colspan="6">
						<asp:Label ID="lblCampStaffName" Visible="True" Runat="server">
							<%#DataBinder.Eval(Container.DataItem, "CampStaffVolName")%>&nbsp;-&nbsp;
							<%#DataBinder.Eval(Container.DataItem, "CampRole")%>,&nbsp;
							<%#DataBinder.Eval(Container.DataItem, "CampAssignment")%>
						</asp:Label>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<asp:DataGrid ID="dgProspects" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" BorderWidth="0" AlternatingItemStyle-CssClass="alt" DataKeyField="ProspectID" OnItemCommand="dgProspects_ItemCommand">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="30%">
									<ItemTemplate>
										<asp:LinkButton CommandName="ProspNameData" ID="lnkProspNameData" Runat="server" Visible="True">
											<%#DataBinder.Eval(Container.DataItem, "ProspectName")%>
										</asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="10%" DataField="LastContact" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="15%" DataField="AmountSolicited" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="15%" DataField="CampaignGifts" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="15%" DataField="CampaignPledges" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="15%" DataField="LifetimeGiving" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
</div>

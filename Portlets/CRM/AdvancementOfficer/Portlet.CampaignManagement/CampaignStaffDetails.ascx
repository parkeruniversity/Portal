<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CampaignStaffDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.CampaignStaffDetail" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblCampaignName" Runat="server" />
<div class="pSection">
	<asp:label id="lblDates" Runat="server" />
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td>
				<asp:DataGrid ID="dgProspects" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="True" BorderWidth="0" AlternatingItemStyle-CssClass="alt" DataKeyField="ProspectID"
					OnItemCommand="dgProspects_ItemCommand">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center">
							<ItemTemplate>
								<asp:LinkButton CommandName="ProspNameData" ID="lnkProspNameData" Runat="server" Visible="True">
									<%#DataBinder.Eval(Container.DataItem, "ProspectName")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn ItemStyle-VerticalAlign="Top" DataField="LastContact" ItemStyle-HorizontalAlign="Right"
							HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn ItemStyle-VerticalAlign="Top" DataField="AmountSolicited" ItemStyle-HorizontalAlign="Right"
							HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn ItemStyle-VerticalAlign="Top" DataField="CampaignGifts" ItemStyle-HorizontalAlign="Right"
							HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn ItemStyle-VerticalAlign="Top" DataField="CampaignPledges" ItemStyle-HorizontalAlign="Right"
							HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn ItemStyle-VerticalAlign="Top" DataField="LifetimeGiving" ItemStyle-HorizontalAlign="Right"
							HeaderStyle-Cssclass="crmheader" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="InitiativeSummary.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.StewardshipManagementPortlet.InitiativeSummary" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<div class="pSection">
	<table cellpadding="0" cellspacing="1" width="100%" border="0">
		<tr>
			<td class="crmheader" width="50%" align="center">
				<asp:Label ID="lblIni" Runat="server" />
			</td>
			<td class="crmheader" width="30%" align="center">
				<asp:Label ID="lblCamp" Runat="server" />
			</td>
			<td class="crmheader" width="20%" align="center">
				<asp:Label ID="lblGoal" Runat="server" />
			</td>
		</tr>
		<asp:Repeater ID="rptInitiative" Runat="server">
			<ItemTemplate>
				<tr>
					<td class="crmsubheader" colspan="3">
						<asp:Label ID="lblGroupHeader" Runat="server">
							<%#DataBinder.Eval(Container.DataItem, "ZoneDesc")%>&nbsp;-&nbsp;
							<%#DataBinder.Eval(Container.DataItem, "ChannelDesc")%>
						</asp:Label>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:DataGrid ID="dgInitiative" Runat="server" Width="100%" CellPadding="0" CellSpacing="1"
							ShowHeader="False" OnItemCommand="dgInitiative_ItemCommand" DataKeyField="InitiativeKey"
							BorderWidth="0" AlternatingItemStyle-CssClass="alt" AutoGenerateColumns="False" GridLines="None">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="50%">
									<ItemTemplate>
										<asp:LinkButton ID="lnkInitiativeName" Runat="server" Visible="True" CommandName="InitiativeName" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "InitiativeKey")%>'>
											<%#DataBinder.Eval(Container.DataItem, "InitiativeName")%>
										</asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="30%" DataField="CampaignDesc"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Right" DataField="GoalAmount"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
</div>
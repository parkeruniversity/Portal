<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CampaignDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.CampaignDetail" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblCampaignName" Runat="server" />
<div class="pSection">
	<asp:label id="lblDates" Runat="server" />
	<table cellpadding="0" cellspacing="2" width="100%" border="0">
		<tr>
			<td valign="top">
				<div class="crmsubheader">
					<asp:Label ID="lblGoalComp" Runat="server" />
				</div>
				<asp:DataGrid id="dgGoalComp" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="crmheader">
					<Columns>
						<asp:BoundColumn DataField="Total"></asp:BoundColumn>
						<asp:BoundColumn DataField="Amount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="Percent" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
			<td valign="top">
				<div class="crmsubheader">
					<asp:Label ID="lblGiftSum" Runat="server" />
				</div>
				<asp:DataGrid id="dgGiftSummary" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt" HeaderStyle-Cssclass="crmheader">
					<Columns>
						<asp:BoundColumn DataField="GiftType"></asp:BoundColumn>
						<asp:BoundColumn DataField="GiftCount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="GiftAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
			<td valign="top">
				<div class="crmsubheader">
					<asp:Label ID="lblPledgeSum" Runat="server" />
				</div>
				<asp:DataGrid id="dgPledgeSummary" Runat="server" Width="100%" CellPadding="0" CellSpacing="1"
					AutoGenerateColumns="False" GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
					HeaderStyle-Cssclass="crmheader">
					<Columns>
						<asp:BoundColumn DataField="PledgeStatus"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeCount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeTotalAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeUnpaidTotal" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="2" width="100%" border="0">
		<tr>
			<td valign="top">
				<div class="crmsubheader">
					<asp:Label ID="lblDesignations" Runat="server" />
				</div>
				<asp:DataGrid id="dgDesignations" Runat="server" Width="100%" CellPadding="0" CellSpacing="1"
					AutoGenerateColumns="False" GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
					HeaderStyle-Cssclass="crmheader">
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:Label ID="lblDesignation" Runat="server" Visible="False">
									<%#DataBinder.Eval(Container.DataItem, "DesgDescription")%>
								</asp:Label>
								<asp:LinkButton CommandArgument='<%#DataBinder.Eval(Container.DataItem, "DesgCode")%>' OnCommand="Designation_Click" ID="lnkDesignation" Runat="server" Visible="False">
									<%#DataBinder.Eval(Container.DataItem, "DesgDescription")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="DesgPledges" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="DesgMatches" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="DesgGifts" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
			<td valign="top">
				<div class="crmsubheader">
					<asp:Label ID="lblAppealAnalysis" Runat="server" />
				</div>
				<asp:DataGrid id="dgAppealAnalysis" Runat="server" Width="100%" CellPadding="0" CellSpacing="1"
					AutoGenerateColumns="False" GridLines="None" DataKeyField="ApplCode" OnItemCommand="dgAppealAnalysis_ItemCommand"
					ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt" HeaderStyle-Cssclass="crmheader">
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:Label ID="lblAppeal" Runat="server" Visible="False">
									<%#DataBinder.Eval(Container.DataItem, "ApplDescription")%>
								</asp:Label>
								<asp:LinkButton CommandName="AppealDetails" ID="lnkAppeal" Runat="server" Visible="False">
									<%#DataBinder.Eval(Container.DataItem, "ApplDescription")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="ApplReturn" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="ApplCost" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="ApplROI" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="1" width="100%" border="0">
		<tr>
			<td class="crmsubheader" valign="top" colspan="3">
				<asp:Label ID="lblCampManager" Runat="server" />
			</td>
		</tr>
		<tr>
			<td class="crmheader" width="34%">
				<asp:Label ID="lblStaffVol" Runat="server" />
			</td>
			<td class="crmheader" width="33%">
				<asp:Label ID="lblRole" Runat="server" />
			</td>
			<td class="crmheader" width="33%">
				<asp:Label ID="lblAssignment" Runat="server" />
			</td>
		</tr>
		<asp:Repeater ID="rptCampManager" Runat="server" OnItemCommand="rptCampManager_ItemCommand">
			<ItemTemplate>
				<tr>
					<td class="crmsubheader" colspan="3">
						<asp:Label ID="lblCampManagerName" Visible="False" Runat="server">
							<%#DataBinder.Eval(Container.DataItem, "CampManagerName")%>
						</asp:Label>
						<asp:LinkButton ID="lnkCampManagerName" Visible="False" CommandName="CampManagerName" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "CampManagerID")%>' Runat="server">
							<%#DataBinder.Eval(Container.DataItem, "CampManagerName")%>
						</asp:LinkButton>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:DataGrid ID="dgCampManager" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" OnItemCommand="dgCampManager_ItemCommand"
							DataKeyField="CampStaffVolID" AutoGenerateColumns="False" GridLines="None" ShowHeader="False"
							BorderWidth="0" AlternatingItemStyle-CssClass="alt">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="34%">
									<ItemTemplate>
										<asp:Label ID="lblCampManagerData" Runat="server" Visible="False">
											<%#DataBinder.Eval(Container.DataItem, "CampStaffVolName")%>
										</asp:Label>
										<asp:LinkButton ID="lnkCampManagerData" Runat="server" Visible="False" CommandName="CampManagerData">
											<%#DataBinder.Eval(Container.DataItem, "CampStaffVolName")%>
										</asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="33%" DataField="CampRole"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="33%" DataField="CampAssignment"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
</div>

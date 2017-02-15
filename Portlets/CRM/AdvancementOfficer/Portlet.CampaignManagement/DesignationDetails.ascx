<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DesignationDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.DesignationDetail" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblCampaignName" Runat="server" />
<div class="pSection">
	<asp:label id="lblDates" Runat="server" />
	<table cellpadding="0" cellspacing="2" width="100%" border="0">
		<tr>
			<td>
				<asp:DataGrid id="dgDesgDetails" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt">
					<Columns>
						<asp:BoundColumn DataField="StatusType" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="22%"
							ItemStyle-Font-Bold="True" ItemStyle-Width="22%"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeCount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="9%"
							ItemStyle-Width="9%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeAmount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="17%"
							ItemStyle-Width="17%" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="MatchCount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="9%" ItemStyle-Width="9%"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="MatchAmount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="17%"
							ItemStyle-Width="17%" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="OutrightCount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="9%"
							ItemStyle-Width="9%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="OutrightAmount" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="17%"
							ItemStyle-Width="17%" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="2" width="100%" border="0">
		<tr>
			<td valign="top">
				<asp:DataGrid id="dgDesignations" Runat="server" Width="100%" CellPadding="0" CellSpacing="1"
					AutoGenerateColumns="False" GridLines="None" DataKeyField="DesgCode" OnItemCommand="dgDesignations_ItemCommand"
					ShowHeader="true" ShowFooter="True" BorderWidth="0" AlternatingItemStyle-CssClass="alt">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="28%" FooterStyle-Width="28%"
							ItemStyle-Width="28%">
							<ItemTemplate>
								<asp:LinkButton CommandName="DesignationDetail" ID="lnkDesignation" Runat="server">
									<%#DataBinder.Eval(Container.DataItem, "DesgDescription")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="DesgPledges" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="24%"
							FooterStyle-Width="24%" ItemStyle-Width="24%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="DesgMatches" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="24%"
							FooterStyle-Width="24%" ItemStyle-Width="24%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="DesgGifts" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="24%" FooterStyle-Width="24%"
							ItemStyle-Width="24%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AppealDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.AppealDetail" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:subheader id="lblCampaignName" Runat="server" />
<div class="pSection">
	<asp:label id="lblDates" Runat="server" />
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td>
				<asp:DataGrid id="dgApplDetails" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="true" BorderWidth="0" AlternatingItemStyle-CssClass="alt">
					<Columns>
						<asp:BoundColumn DataField="StatusType" HeaderStyle-Width="22%" ItemStyle-Width="22%" HeaderStyle-Cssclass="crmheader"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeCount" HeaderStyle-Width="9%" ItemStyle-Width="9%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="PledgeAmount" HeaderStyle-Width="17%" ItemStyle-Width="17%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="MatchCount" HeaderStyle-Width="9%" ItemStyle-Width="9%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="MatchAmount" HeaderStyle-Width="17%" ItemStyle-Width="17%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="OutrightCount" HeaderStyle-Width="9%" ItemStyle-Width="9%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
						<asp:BoundColumn DataField="OutrightAmount" HeaderStyle-Width="17%" ItemStyle-Width="17%" HeaderStyle-Cssclass="crmheader"
							HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td valign="top" width="48%">
				<asp:DataGrid id="dgApplStats" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" ShowHeader="false" BorderWidth="0" AlternatingItemStyle-CssClass="alt">
					<Columns>
						<asp:BoundColumn DataField="Title" HeaderStyle-Width="70%" ItemStyle-Width="70%"></asp:BoundColumn>
						<asp:BoundColumn DataField="Amount" HeaderStyle-Width="30%" ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
			<td valign="top" width="52%">&nbsp;
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td valign="top">
				<asp:DataGrid id="dgAppeals" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" AutoGenerateColumns="False"
					GridLines="None" DataKeyField="AppealCode" OnItemCommand="dgAppeals_ItemCommand" ShowHeader="True"
					ShowFooter="True" BorderWidth="0" AlternatingItemStyle-CssClass="alt">
					<Columns>
						<asp:TemplateColumn HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="40%" FooterStyle-Width="40%"
							ItemStyle-Width="28%">
							<ItemTemplate>
								<asp:LinkButton CommandName="AppealDetail" ID="lnkAppeal" Runat="server">
									<%#DataBinder.Eval(Container.DataItem, "AppealDescription")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="AppealReturn" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="20%"
							FooterStyle-Width="20%" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="AppealCost" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="20%"
							FooterStyle-Width="20%" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						<asp:BoundColumn DataField="AppealROI" HeaderStyle-Cssclass="crmheader" HeaderStyle-Width="20%" FooterStyle-Width="20%"
							ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
</div>

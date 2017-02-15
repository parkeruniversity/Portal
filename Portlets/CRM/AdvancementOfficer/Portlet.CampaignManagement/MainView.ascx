<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MainView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.CampaignManagementPortlet.MainView" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<div class="pSection">
	<jenzabar:GroupedGrid id="ggCampaigns" Runat="server" RenderTableHeaders="true" ShowHeader="true">
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_CAMP_INQ_ANA_CAMPAIGN">
				<ItemTemplate>
					<asp:LinkButton ID="lnkCampaign" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "CampaignCode" )%>' OnCommand="Campaign_Click" Runat="server">
						<%# DataBinder.Eval( Container.DataItem, "CampaignName" )%>
					</asp:LinkButton>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn>
				<ItemTemplate>
					<%# GetLabelNames() %>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_CAMP_INQ_ANA_GOAL_COMP" ItemStyle-HorizontalAlign="Right">
				<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "CampaignGoal" )%>
						</b><br>
						<%# DataBinder.Eval( Container.DataItem, "AmountRealized" )%>
						<br>
						<%# DataBinder.Eval( Container.DataItem, "AmountOutstanding" )%>
					</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_CAMP_INQ_ANA_PERCENT" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center">
				<ItemTemplate>
						&nbsp;<br>
						<%# DataBinder.Eval( Container.DataItem, "PercentRealized" )%>
						<br>
						<%# DataBinder.Eval( Container.DataItem, "PercentOutstanding" )%>
					</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
		</Columns>
	</jenzabar:GroupedGrid>
	<table width="100%">
		<tr>
			<td>
				<asp:Label ID="lblNoRows" Runat="server" CssClass="PortletError"></asp:Label>
			</td>
		</tr>
	</table>
</div>

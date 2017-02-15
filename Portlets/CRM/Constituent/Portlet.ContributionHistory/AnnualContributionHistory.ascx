<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AnnualContributionHistory.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ContributionHistoryPortlet.AnnualContributionHistory" %>
<table height="112" cellSpacing="3" cellPadding="3" width="651">
	<tr>
		<td width="728" colSpan="2"><asp:label id="txtAnnlContHistory" Runat="server"></asp:label><asp:datagrid id="dgAnnualSummary" runat="server" Width="280px" AutoGenerateColumns="False">
				<Columns>
					<asp:BoundColumn DataField="Year"></asp:BoundColumn>
					<asp:BoundColumn DataField="Gifts"></asp:BoundColumn>
					<asp:BoundColumn DataField="SoftCredit"></asp:BoundColumn>
					<asp:BoundColumn DataField="NonCash"></asp:BoundColumn>
					<asp:BoundColumn DataField="PromiseMade"></asp:BoundColumn>
					<asp:BoundColumn DataField="PromisePaid"></asp:BoundColumn>
					<asp:BoundColumn DataField="MatchMade"></asp:BoundColumn>
					<asp:BoundColumn DataField="DeferredGiving"></asp:BoundColumn>
				</Columns>
			</asp:datagrid></td>
	</tr>
</table>

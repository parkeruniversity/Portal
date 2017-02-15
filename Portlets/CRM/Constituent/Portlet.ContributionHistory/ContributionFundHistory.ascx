<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContributionFundHistory.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ContributionHistoryPortlet.ContributionFundHistory" %>
<P>
	<asp:Label id="txtYourContFundHist" Width="160px" runat="server"></asp:Label>
	<asp:DataGrid id="dgFundHistory" runat="server" AutoGenerateColumns="False">
		<Columns>
			<asp:BoundColumn DataField="Year"></asp:BoundColumn>
			<asp:BoundColumn DataField="FundDescription"></asp:BoundColumn>
			<asp:BoundColumn DataField="Gifts"></asp:BoundColumn>
			<asp:BoundColumn DataField="SoftCredit"></asp:BoundColumn>
			<asp:BoundColumn DataField="NonCash"></asp:BoundColumn>
			<asp:BoundColumn DataField="PromiseMade"></asp:BoundColumn>
			<asp:BoundColumn DataField="PromisePaid"></asp:BoundColumn>
			<asp:BoundColumn DataField="MatchMade"></asp:BoundColumn>
			<asp:BoundColumn DataField="DeferredGiving"></asp:BoundColumn>
		</Columns>
	</asp:DataGrid></P>

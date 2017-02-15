<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GivingClubMembershipHistory.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ContributionHistoryPortlet.GivingClubMembershipHistory" %>
<P>
	<asp:Label id="txtGCMH" Width="232px" runat="server" Height="24px"></asp:Label>
	<asp:DataGrid id="dgGGCS" runat="server" AutoGenerateColumns="False">
		<Columns>
			<asp:BoundColumn DataField="Year"></asp:BoundColumn>
			<asp:BoundColumn DataField="ClubDescription"></asp:BoundColumn>
			<asp:BoundColumn DataField="DateAttained"></asp:BoundColumn>
			<asp:BoundColumn DataField="YTDGifts"></asp:BoundColumn>
		</Columns>
	</asp:DataGrid></P>

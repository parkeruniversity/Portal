<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainTabPage.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ContributionHistoryPortlet.MainTabPage" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<common:tabgroup id="DefaultPageTabs" runat="server">
	<common:Tab id="tbLifeTimeContSumm" runat="server">
	<div class="pSection">
		<table height="112" cellSpacing="3" cellPadding="3" width="100%">
			<tr>
				<td noWrap width="573">
					<asp:label id="lblTitle" Runat="server" Font-Bold="True"></asp:label>
					<br>
					<br>
					<common:groupedgrid id="GGContributionSummary" AutoGenerateColumns="False" Width="100%" runat="server">
						<Columns>
							<asp:BoundColumn DataField="column1"></asp:BoundColumn>
							<asp:BoundColumn DataField="column2"></asp:BoundColumn>
							<asp:BoundColumn DataField="column3"></asp:BoundColumn>
							<asp:BoundColumn DataField="column4"></asp:BoundColumn>
						</Columns>
					</common:groupedgrid>
				</td>	
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtAdditionalCI" Runat="server" Font-Bold="True" ></asp:label></td>
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtContribute" Runat="server"></asp:label></td>
			</tr>
			<tr>
				<td noWrap width="100%">
					<asp:label id="txtAvgGA" Runat="server" BackColor=WhiteSmoke ></asp:label></td>
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtRemainders" Runat="server" Font-Bold="True"></asp:label>
					<common:groupedgrid id="dgRemainders" AutoGenerateColumns="False" Width="100%" runat="server">
						<Columns>
							<asp:BoundColumn DataField="column"></asp:BoundColumn>
						</Columns>
					</common:groupedgrid></td>
			</tr>
			<tr>
				<td noWrap width="573"></td>
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtReunion" Runat="server" Width="576px"></asp:label></td>
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtPersonalNN" Runat="server" Font-Bold="True"></asp:label>
					<common:groupedgrid id="dgEligibleCom" AutoGenerateColumns="False" Width="100%" runat="server">
						<Columns>
							<asp:BoundColumn DataField="eligible_comments"></asp:BoundColumn>
						</Columns>
					</common:groupedgrid></td>
			</tr>
			<tr>
				<td noWrap width="573">
					<asp:label id="txtCommentsEligible" Runat="server"></asp:label></td>
			</tr>
		</table>
	</div>
	</common:Tab>
	<common:Tab id="tbAnnualSummary" runat="server">
	<div class="pSection">
		<table height="112" cellSpacing="3" cellPadding="3" width="100%">
			<tr>
				<td width="728" colSpan="2">
					<asp:label id="txtAnnlContHistory" Runat="server" Font-Bold="True"></asp:label>
					<br>
					<br>
					<common:groupedgrid id="dgAnnualSummary" AutoGenerateColumns="False" Width="100%" runat="server" RenderTableHeaders="True">
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
					</common:groupedgrid>
				</td>
			</tr>
		</table>
	</div>
	</common:Tab>
	<common:Tab id="TabGivingClubs" runat="server">
	<div class="pSection">
		<table height="112" cellSpacing="3" cellPadding="3" width="100%">
			<tr>
				<td width="728" colSpan="2">
					<asp:Label id="txtGCMH" runat="server" Font-Bold="True"></asp:Label>
					<br>
					<br>
					<common:groupedgrid id="dgGGCS" AutoGenerateColumns="False" Width="100%" runat="server" RenderTableHeaders="True">
						<Columns>
							<asp:BoundColumn DataField="Year"></asp:BoundColumn>
							<asp:BoundColumn DataField="ClubDescription"></asp:BoundColumn>
							<asp:BoundColumn DataField="DateAttained"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDGifts"></asp:BoundColumn>
						</Columns>
					</common:groupedgrid>
				</td>
			</tr>
		</table>
	</div>
	</common:Tab>
	<common:Tab id="tabFundHistory" runat="server">
	<div class="pSection">
		<table height="112" cellSpacing="3" cellPadding="3" width="100%">
			<tr>
				<td width="728" colSpan="2">
					<asp:Label id="txtYourContFundHist" runat="server" Font-Bold="True"></asp:Label>
					<br>
					<br>					
					<common:groupedgrid id="dgFundHistory" AutoGenerateColumns="False" Width="100%" runat="server" RenderTableHeaders="True">
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
					</common:groupedgrid>
				</td>
			</tr>
		</table>
	</div>
	</common:Tab>
</common:tabgroup>
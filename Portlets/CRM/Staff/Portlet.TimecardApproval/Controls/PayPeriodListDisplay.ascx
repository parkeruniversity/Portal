<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PayPeriodListDisplay.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.PayPeriodListDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<asp:Repeater ID="PayPeriodList" runat="server">
<HeaderTemplate>
	<table class="tabularData">
		<thead>
			<tr class="header">
				<td colspan="2">
					<asp:Label ID="Header" style="float:left;" runat="server" />
					<span id="YearSpan" style="float:left; padding-left:10px;" runat="server">
						<asp:DropDownList ID="YearDropDown" AutoPostBack="true" runat="server" />
					</span>
					<div id="QuickLinks" style="float:right; padding-left:30px; white-space:nowrap; font-size:80%; font-weight:normal;" runat="server">
						<common:GlobalizedLabel ID="lblGoTo" TextKey="LBL_GO_TO" runat="server" />
						<common:GlobalizedLinkButton id="PayGroupsButton" runat="server" CommandName="ViewPayGroups" TextKey="TXT_PAY_GROUPS" /> | 
						<common:GlobalizedLinkButton id="AllPayPeriodsButton" CommandName="ViewAllPayPeriods" runat="server" TextKey="TXT_ALL_PAY_PERIODS" /> 
					</div>
					<div style="clear:both" />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr id="NoDataRow" visible="false" runat="server">
				<td colspan="2"><asp:Label ID="NoDataText" runat="server" /></td>
			</tr>
</HeaderTemplate>
<ItemTemplate>
			<tr class="<%# (Container.ItemIndex % 2 == 1) ? "alt" : "" %>">
				<td><asp:LinkButton ID="PeriodButton" CommandName="ViewPayPeriod" runat="server" /></td>
				<td id="StatusColumn" runat="server"><asp:Label ID="PeriodStatus" runat="server" /></td>
			</tr>
</ItemTemplate>
<FooterTemplate>
		</tbody>
	</table>
</FooterTemplate>
</asp:Repeater>

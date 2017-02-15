<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardTotalsDisplay.ascx.cs" Inherits="Portlet.Timecard.Controls.TimecardTotalsDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<link href="<%= this.ResolveUrl("Styles/TimecardTotalsDisplay.css") %>?v=182" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]>
	<link href="<%= this.ResolveUrl("Styles/TimecardTotalsDisplay_IE7.css") %>?v=182" rel="stylesheet" type="text/css" />
<![endif]-->

<div class="tcTotalsDisplay <%= this.CssClass %>">
	<common:GlobalizedLabel ID="TotalsHeader" TextKey="LBL_TOTAL_PERIOD_HOURS" CssClass="tcHeader" runat="server" />
	<ul>
		<li id="RegularHoursRow" runat="server">
			<asp:Label ID="RegularHoursLabel" CssClass="tcLabel" runat="server" />
			<asp:Label ID="RegularHours" CssClass="tcValue" runat="server" />
		</li>
		<asp:Repeater ID="OtherHoursRepeater" runat="server">
			<ItemTemplate>
				<li id="SpecialHoursRow" runat="server">
					<asp:Label ID="HoursLabel" CssClass="tcLabel" runat="server" />
					<asp:Label ID="HoursValue" CssClass="tcValue" runat="server" />
				</li>
			</ItemTemplate>
		</asp:Repeater>
		<asp:Repeater ID="TimeOffHoursRepeater" runat="server">
			<ItemTemplate>
				<li id="SpecialHoursRow" runat="server">
					<asp:Label ID="HoursLabel" CssClass="tcLabel" runat="server" />
					<asp:Label ID="HoursValue" CssClass="tcValue" runat="server" />
				</li>
			</ItemTemplate>
		</asp:Repeater>
		<li>
			<hr /><hr />
		</li>
		<li id="TotalRow" class="tcGrandTotal" runat="server">
			<common:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" CssClass="tcLabel" runat="server" />
			<asp:Label ID="TotalHours" CssClass="tcValue" runat="server" />
		</li>
	</ul>
</div>

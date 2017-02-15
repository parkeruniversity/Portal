<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AllPeriodsView.ascx.cs" Inherits="Portlet.Timecard.AllPeriodsView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecard" TagName="PositionTabs" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/PositionTabs.ascx" %>

<common:Subheader ID="PageHeader" runat="server" />

<div class="pSection">
	<timecard:PositionTabs ID="Positions" runat="server" />
	<p><common:GlobalizedLinkButton ID="BackButton" TextKey="MSG_TIMECARDPORTLET_BACK_TO_CURRENT_PERIOD" runat="server" /></p>
	<p>
		<strong><common:GlobalizedLabel ID="YearLabel" TextKey="LBL_PAY_PERIODS_FOR" runat="server" /></strong>
		<asp:DropDownList ID="YearDropDown" AutoPostBack="true" runat="server" />
		<common:GlobalizedLabel ID="YearNote" TextKey="MSG_TIMECARDPORTLET_BY_END_DATE_NOTE" runat="server" />
	</p>

	<asp:BulletedList ID="PayPeriodListLeft" DisplayMode="LinkButton" CssClass="tcAllPayPeriods" runat="server" />
	<asp:BulletedList ID="PayPeriodListRight" DisplayMode="LinkButton" CssClass="tcAllPayPeriods tcRight" runat="server" />
	<div style="clear:both"></div>

	<common:GlobalizedLabel ID="NoPayPeriodsMessage" TextKey="MSG_TIMECARDPORTLET_NO_PAY_PERIODS" Visible="false" runat="server" />
</div>

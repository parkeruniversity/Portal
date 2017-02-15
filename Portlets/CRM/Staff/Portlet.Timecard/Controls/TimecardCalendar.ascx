<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardCalendar.ascx.cs" Inherits="Portlet.Timecard.Controls.TimecardCalendar" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<div class="tcMainHeader">
	<framework:PortalImageButton ID="PreviousButton" ImageCategory="PortletIcon" ImageUrl="previous-arrow-blue.gif" 
			CssClass="tcPreviousButton" runat="server" />
	<framework:PortalImageButton ID="NextButton" ImageCategory="PortletIcon" ImageUrl="next-arrow-blue.gif" 
			CssClass="tcNextButton" runat="server" />
	<asp:Label ID="PayPeriodTitle" CssClass="tcCalendarTitle" runat="server" />
</div>
<common:CalendarDisplay ID="Calendar" runat="server" />

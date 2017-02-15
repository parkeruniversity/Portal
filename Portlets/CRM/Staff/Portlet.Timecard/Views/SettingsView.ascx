<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SettingsView.ascx.cs" Inherits="Portlet.Timecard.SettingsView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="timecard" TagName="PositionTabs" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/PositionTabs.ascx" %>
<!--[if lte IE 7]>
	<link href="<%= this.ResolveUrl("TimecardStyle_IE7.css") %>?v=182" rel="stylesheet" type="text/css" />
<![endif]-->

<common:Subheader ID="SettingsHeader" runat="server" />
<div class="pSection tcSettings">
	<timecard:PositionTabs ID="Positions" runat="server" />
	
	<h5><common:GlobalizedLiteral ID="DefaultsHeader" TextKey="TXT_YOUR_DEFAULTS" runat="server" /></h5>
	
	<div class="pSection tcBoxes">
	
		<common:ContentBox ID="PeriodRegularHoursBox" TextKey="TXT_YOUR_REGULAR_PERIOD_HOURS" runat="server">
			<common:GlobalizedLabel ID="PeriodRegularHoursDescription" TextKey="MSG_TIMECARDPORTLET_PERIODREGULARHOURS_DESCRIPTION" 
					EnableViewState="false" CssClass="pSection" runat="server" />

			<div class="tcDataEntry">
				<common:GlobalizedLabel ID="PeriodRegularHoursLabel" TextKey="LBL_HOURS_WORKED_IN_A_REGULAR_PAY_PERIOD" 
						EnableViewState="false" CssClass="tcLabel" runat="server" />
				<asp:TextBox ID="PeriodRegularHours" MaxLength="5" Columns="3" runat="server" />
			</div>
		</common:ContentBox>
		
		<common:ContentBox ID="DefaultViewBox" TextKey="TXT_YOUR_DEFAULT_TIMECARD_VIEW" runat="server">
			<ul class="tcDataEntry tcViewSelect">
				<li>
					<asp:RadioButton ID="DefaultViewCalendarButton" GroupName="DefaultViewButtons" runat="server" />
					<asp:Label ID="DefaultViewCalendarIconLabel"
							AssociatedControlID="DefaultViewCalendarButton" EnableViewState="false" runat="server">
					<framework:PortalImage ID="DefaultViewCalendarIcon" ImageCategory="PortletIcon" ImageUrl="calendar_big.gif" 
							EnableViewState="false" runat="server" />
					</asp:Label>
					<common:GlobalizedLabel ID="DefaultViewCalendarLabel" TextKey="TXT_CALENDAR_VIEW" 
							AssociatedControlID="DefaultViewCalendarButton" EnableViewState="false" runat="server" />
				</li>
				<li>
					<asp:RadioButton ID="DefaultViewGridButton" GroupName="DefaultViewButtons" runat="server" />
					<asp:Label ID="DefaultViewGridIconLabel"
							AssociatedControlID="DefaultViewGridButton" EnableViewState="false" runat="server">
				<framework:PortalImage ID="DefaultViewGridIcon" ImageCategory="PortletIcon" ImageUrl="grid_big.gif" 
						EnableViewState="false" runat="server" />
					</asp:Label>
					<common:GlobalizedLabel ID="DefaultViewGridLabel" TextKey="TXT_GRID_VIEW" 
							AssociatedControlID="DefaultViewGridButton" EnableViewState="false" runat="server" />
				</li>
			</ul>
		</common:ContentBox>
		
		<common:ContentBox ID="HourlyRegularHoursBox" TextKey="TXT_YOUR_REGULAR_WORK_SHIFT" runat="server">
			<common:GlobalizedLabel ID="HourlyRegularHoursDescription" TextKey="MSG_TIMECARDPORTLET_HOURLYREGULARHOURS_DESCRIPTION" 
					EnableViewState="false" CssClass="pSection" runat="server" />

			<div class="tcDataEntry">
			</div>
		</common:ContentBox>
		
		<common:ContentBox ID="RegularDaysOffBox" TextKey="TXT_YOUR_REGULAR_DAYS_OFF" runat="server">
			<common:GlobalizedLabel ID="RegularDaysOffDescription" TextKey="MSG_TIMECARDPORTLET_REGULARDAYSOFF_DESCRIPTION" 
					EnableViewState="false" CssClass="pSection" runat="server" />

			<ul class="tcDataEntry tcWeek">
				<li class="tcLabel">
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Sunday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Monday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Tuesday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Wednesday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Thursday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Friday]%></div>
					<div><%= System.Globalization.DateTimeFormatInfo.CurrentInfo.AbbreviatedDayNames[(int)DayOfWeek.Saturday]%></div>
				</li>
				<li>
					<div><asp:CheckBox ID="SundayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="MondayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="TuesdayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="WednesdayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="ThursdayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="FridayCheckbox" runat="server" /></div>
					<div><asp:CheckBox ID="SaturdayCheckbox" runat="server" /></div>
				</li>
			</ul>
		</common:ContentBox>

	</div>
</div>

<div class="tcAuxButtonBar">
	<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE" CssClass="tcEnhanced" runat="server" />
	<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server" />
</div>

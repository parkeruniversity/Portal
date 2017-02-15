<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainView.ascx.cs" Inherits="Portlet.Timecard.MainView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="timecard" TagName="PositionTabs" src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/PositionTabs.ascx" %>
<%@ Register TagPrefix="timecard" TagName="CommentList" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/CommentListDisplay.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardCalendar" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/TimecardCalendar.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardTotalsDisplay" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/TimecardTotalsDisplay.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardEntryPanel" Src="~/Portlets/CRM/Staff/Portlet.Timecard/Controls/TimecardEntryPanel.ascx" %>
<!--[if lte IE 7]>
	<link href="<%= this.ResolveUrl("TimecardStyle_IE7.css") %>?v=182" rel="stylesheet" type="text/css" />
<![endif]-->

<common:Subheader ID="TimecardHeader" runat="server">
	<framework:PortalImageAndTextButton ID="SwitchView" 
			ImageCategory="PortletIcon" ImageUrl="calendar.gif" TextKey="TXT_SWITCH_TO_GRID_VIEW" 
			EnableViewState="true" runat="server" />
	<framework:PortalImageAndTextButton ID="ViewSettings" 
			ImageCategory="PortletIcon" ImageUrl="edit.gif" TextKey="TXT_TIMECARD_SETTINGS" 
			EnableViewState="false" runat="server" />
</common:Subheader>

<div class="pSection">
	<timecard:PositionTabs ID="PositionTabs" runat="server" />
	<div id="ManagerComments" class="tcManagerCommentsDisplay" runat="server">
		<timecard:CommentList ID="ManagerCommentList" HeaderTextKey="LBL_MANAGER_COMMENTS" runat="server" />
	</div>
	<table border="0" cellpadding="0" cellspacing="0" class="tcMainDisplay">
	<tr>
		<td>
			<timecard:TimecardCalendar id="Calendar" runat="server" />
			<common:Mirror ID="GridFinalizeDisplay" ControlID="HiddenFinalizeDisplay" runat="server" />
		</td>
		<td>
			<div id="TotalsPanel" runat="server">
				<div class="tcMainHeader">
					<framework:PortalImageAndTextButton ID="ViewAll" 
							ImageCategory="PortletIcon" ImageUrl="view-icon.gif" TextKey="TXT_VIEW_ALL_PERIODS" 
							runat="server" />
				</div>
				<timecard:TimecardTotalsDisplay id="TotalsDisplay" CssClass="tcTotals" runat="server" />
				<div id="OverrideNote" Visible="false" class="tcTotalsNote" runat="server">
					*
					<common:GlobalizedLabel ID="ManagerChangesMessage" 
							TextKey="MSG_TIMECARDPORTLET_MANAGER_MADE_CHANGES" runat="server" />
					<div class="tcContact"><framework:PortalImageAndTextButton ID="ContactButton" 
							ImageCategory="PortletIcon" ImageUrl="email.gif" TextKey="MSG_CONTACT_YOUR_MANAGER"
							EnableViewState="false" runat="server" /></div>
				</div>
				<common:Mirror ID="CalendarFinalizeDisplay" ControlID="HiddenFinalizeDisplay" runat="server" />
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<timecard:TimecardEntryPanel ID="TimecardEntry" CssClass="tcControlHighlight" runat="server" />
		</td>
	</tr>
	</table>

	<framework:PortalImageAndTextButton ID="CopyHoursButton" 
			TextKey="TXT_COPY_HOURS_FROM_LAST_TIMECARD" ImageCategory="PortletIcon" ImageUrl="copy_time.gif"
			Visible="false" EnableViewState="false" runat="server" />

	<common:GlobalizedLabel ID="ReadonlyHoursNote" TextKey="MSG_TIMECARDPORTLET_OVERRIDE_READONLY_NOTE" 
			Visible="false" runat="server" />
	<common:EmbeddedLinkButton ID="MaximizeLink" 
			OuterTextKey="MSG_FORMAT_FOR_MORE_OPTIONS" TextKey="MSG_TIMECARDPORTLET_VIEW_YOUR_FULL_TIMECARD" 
			Visible="false" runat="server" />
</div>

<common:HiddenMirror ID="HiddenFinalizeDisplay" runat="server">
	<div class="tcFinalizeDisplay">
		<framework:PortalImage ID="FinalizeIcon" ImageCategory="PortletIcon" ImageUrl="rubberstamp.gif"
				runat="server" />
		<ul>
			<li><common:GlobalizedLabel ID="FinalizeMessage" 
					TextKey="MSG_TIMECARDPORTLET_TIMECARD_NOT_YET_FINALIZED" runat="server" /></li>
			<li id="FinalizeButtonRow" runat="server"><common:GlobalizedHyperLink ID="FinalizePopUpButton" 
					TextKey="MSG_TIMECARDPORTLET_CLICK_HERE_TO_FINALIZE" NavigateUrl="javascript:openMarkFinalWindow();" 
					EnableViewState="false" runat="server" /></li>
		</ul>
	</div>
</common:HiddenMirror>

<script type="text/javascript">

	var confirmPopup = null;

	function openMarkFinalWindow()
	{
		if (confirmPopup == null)
		{
			confirmPopup = new JCSL.ui.windows.DialogWindow(
							document.getElementById('ConfirmationPopup'), 
							'<%= Globalizer.GetJavascriptSafeString("TXT_MARK_THIS_TIMECARD_FINAL") %>'
							);
			confirmPopup.can_postback = true;
		}
		confirmPopup.open(null);
	}

	function closeMarkFinalWindow()
	{
		if (confirmPopup != null)
			confirmPopup.close();
	}

</script>

<div id="ConfirmationPopup" class="tcMarkFinalConfirm" style="display:none">
	<ul>
		<li><%= Globalizer.GetJavascriptSafeString("MSG_TIMECARDPORTLET_FINALIZE_MESSAGE_1") %></li>
		<li><%= Globalizer.GetJavascriptSafeString("MSG_TIMECARDPORTLET_FINALIZE_MESSAGE_2") %></li>
		<li class="tcButtons">
			<common:GlobalizedButton ID="FinalizeButton" TextKey="TXT_MARK_AS_FINAL" runat="server" />
			<input type="button" onclick="closeMarkFinalWindow();" value="<%= Globalizer.GetGlobalizedString("TXT_CANCEL") %>" />
		</li>
	</ul>
</div>

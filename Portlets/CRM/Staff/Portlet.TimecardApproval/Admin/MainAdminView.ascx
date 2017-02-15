<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainAdminView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.MainAdminView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" TextKey="TXT_ADMIN_OPTIONS" runat="server" />

<div id="MainSection" class="pSection" runat="server">
	<table id="tblMainSection" runat="server" class="tcaDashedTable">
		<tr>
			<td class="tcaDashedTableCellTop">
				<framework:PortalImage ID="SubmissionDeadlinesIcon" ImageCategory="PortletIcon" ImageUrl="submission-deadline-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			</td>
			<td class="tcaDashedTableCellTop">
				<common:GlobalizedLinkButton id="SubmissionDeadlinesButton" runat="server" TextKey="TXT_TIMECARD_SUBMISSION_DEADLINES" /><br/>
				<common:GlobalizedLabel ID="SubmitDeadlineLabel" ForControl="SubmissionDeadlinesButton" 
						TextKey="MSG_TCAPPROVALPORTLET_MAIN_TIMEFRAMES_DESCRIPTION" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<framework:PortalImage ID="HourEntryRulesIcon" ImageCategory="PortletIcon" ImageUrl="time-entry-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			</td>
			<td>
				<common:GlobalizedLinkButton id="HourEntryRulesButton" runat="server" TextKey="TXT_TIMECARD_ENTRY_RULES" /><br/>
				<common:GlobalizedLabel ID="HourEntryRulesLabel" ForControl="HourEntryRulesButton" 
						TextKey="MSG_TCAPPROVALPORTLET_HOUR_ENTRY_DESCRIPTION" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<framework:PortalImage ID="AlternateApprovalIcon" ImageCategory="PortletIcon" ImageUrl="supervisor-alt-app-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			</td>
			<td>
				<common:GlobalizedLinkButton id="AlternateApprovalButton" runat="server" 
						TextKey="TXT_SUPERVISOR_AND_APPROVER_ASSIGNMENTS"/><br/>
				<common:GlobalizedLabel ID="AltApprovalLabel" ForControl="AlternateApprovalButton" 
						TextKey="MSG_TCAPPROVALPORTLET_MAIN_ALTERNATE_APPROVAL_DESCRIPTION" runat="server" />
			</td>
		</tr>
		<tr style="display:none;">
			<td>
				<framework:PortalImage ID="NotificationsIcon" ImageCategory="PortletIcon" ImageUrl="notification-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			</td>
			<td>
				<common:GlobalizedLinkButton id="NotificationsButton" runat="server" 
						TextKey="TXT_OVERDUE_NOTIFICATION_CONTACTS" /><br/>
				<common:GlobalizedLabel ID="NotifyLabel" ForControl="NotificationsButton" 
						TextKey="MSG_TCAPPROVALPORTLET_MAIN_NOTIFICATIONS_DESCRIPTION" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<framework:PortalImage ID="RoundingIcon" ImageCategory="PortletIcon" ImageUrl="rounding-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
			</td>
			<td>
				<common:GlobalizedLinkButton id="RoundingButton" runat="server" TextKey="TXT_ROUNDING_OF_HOURS" /><br/>
				<common:GlobalizedLabel ID="RoundingLabel" ForControl="RoundingButton" 
						TextKey="MSG_TCAPPROVALPORTLET_MAIN_ROUNDING_DESCRIPTION" runat="server" />
			</td>
		</tr>
	</table>

	<common:GlobalizedLinkButton id="BackButton" runat="server" TextKey="TXT_BACK_TO_MAIN" />
</div>

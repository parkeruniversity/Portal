<%@ Control Language="c#" AutoEventWireup="True" Codebehind="HourEntryRulesView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.HourEntryRulesView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" TextKey="TXT_TIMECARD_ENTRY_RULES" runat="Server" />

<div class="pSection tcaAdminPage">
	<common:ContentBox ID="HourEntryRulesContent" TextKey="TXT_DEFINE_TIMECARD_ENTRY_RULES" runat="server">
		<p class="tcaDescription">
			<framework:PortalImage ID="HourEntryRulesIcon" ImageCategory="PortletIcon" ImageUrl="time-entry-icon.gif" 
					CssClass="tcaFloatLeft" runat="server" />
			<common:GlobalizedLabel ID="HourEntryDescription" TextKey="MSG_TCAPPROVALPORTLET_HOUR_ENTRY_DESCRIPTION" runat="server" />
		</p>
		<hr />
		<ul>
			<li class="tcaHeader"><common:GlobalizedLabel ID="LateEntryLabel" TextKey="LBL_ALLOW_FUTURE_DATE_AND_TIME_ENTRY" runat="server" /></li>
			<li>
				<asp:Checkbox ID="AllowFutureEntry" runat="server" />
				<common:GlobalizedLabel ID="LateEntryDescription" TextKey="MSG_TCAPPROVALPORTLET_HOUR_ENTRY_LATE_ENTRY_DESCRIPTION" runat="server" />
			</li>
		</ul>
		<hr />
		<div class="buttonBarCenteredVer2">
			<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_ENTRY_RULES" runat="server"/>
			<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server"/>
		</div>
	</common:ContentBox>
	
	<p><common:GlobalizedLinkButton ID="BackButton" TextKey="TXT_BACK_TO_ADMIN_OPTIONS" runat="server" /></p>
</div>

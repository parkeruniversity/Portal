<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SubmissionDeadlinesView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.SubmissionDeadlinesView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" TextKey="TXT_TIMECARD_SUBMISSION_DEADLINES" runat="server" />
<div id="MainSection" class="pSection" runat="server">
	<common:ContentBox id="SubmissionDeadlinesBox" CssClass="tcaContentBox" TextKey="TXT_SET_UP_DEADLINES" runat="server">
	<table id="tblMainSection" class="tcaTimecardTableFormat" style="margin: 0px;" runat="server">
    <tr>
        <td>
			<framework:PortalImage ID="SubmissionDeadlinesIcon" ImageCategory="PortletIcon" ImageUrl="submission-deadline-icon.gif" 
					CssClass="tcaFloatLeft" runat="server" />
			<common:GlobalizedLabel ID="SubmitDeadlineLabel" ForControl="imgSubmitDeadline" TextKey="MSG_CONFIG_SUBMISSION_DEADLINES" runat="server" />
	    </td>
	</tr>
	<tr>
	    <td>
			<p><common:GlobalizedLabel ID="lblPayPeriodClose" TextKey="LBL_TIME_ENTRY_CUTOFF_DATE_BOLD" runat="server" /></p>
			<p><common:GlobalizedLabel ID="lblPayPeriodEndMsg" ForControl="" TextKey="MSG_TC_PAY_PERIOD_END" runat="server" /></p>
			<p>
				<asp:TextBox ID="PeriodCloseDays" Columns="3" MaxLength="5" runat="server" /> 
				<common:GlobalizedLabel ID="lblDaysAfterEnd" ForControl="" TextKey="MSG_TC_DAYS_AFTER_PAY_PERIOD_END" runat="server" />
			</p>
	    </td>
	</tr>
	<tr>
	    <td>
	    <p><b><common:GlobalizedLabel ID="lblMgrSubmitDeadline" ForControl="" TextKey="LBL_TIME_ENTRY_SUBMISSION_DEADLINE" runat="server" /></b></p>
		<p><common:GlobalizedLabel ID="lblPayPeriodCloseMsg" ForControl="" TextKey="MSG_TC_TIME_ENTRY_CUTOFF_DATE" runat="server" /></p>
		<p>
			<asp:TextBox ID="DeadlineDays" Columns="3" MaxLength="5" runat="server" /> 
			<common:GlobalizedLabel ID="lblDaysAfterClose" ForControl="" TextKey="MSG_TC_DAYS_AFTER_TIME_ENTRY_CUTOFF_DATE" runat="server" />
	    </p>
	    </td>
	</tr>
	<tr><td style="border-bottom: none;">&nbsp</td></tr>
	<tr>
	    <td class="buttonBarCenteredVer2" style="border-bottom: none;">
			<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE_DEADLINES" runat="server"/>
			<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server"/>
	    </td>
	 </tr>
	 </table>
	</common:ContentBox>
	
	<p><common:GlobalizedLinkButton id="BackButton" TextKey="TXT_BACK_TO_ADMIN_OPTIONS" runat="server" /></p>

</div>

<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EmployeeDetailView.ascx.cs" Inherits="Portlet.TimecardApproval.EmployeeDetailView" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" Src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardTotals" src="../../Portlet.Timecard/Controls/TimecardTotalsDisplay.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardEntry" Src="../../Portlet.Timecard/Controls/TimecardEntryPanel.ascx" %>
<%@ Register TagPrefix="timecard" TagName="CommentListDisplay" Src="../../Portlet.Timecard/Controls/CommentListDisplay.ascx" %>

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />
<div class="portletContent">
	<div class="tcaBasicHeader">
		<asp:Label ID="EmployeeName" CssClass="tcaBasicHeaderText" runat="server" />
		<asp:LinkButton ID="BackToPayGroupButton" CssClass="tcaBasicHeaderLink" runat="server" />
	</div>
	
	<div class="tcaEmpDetailsColumn">
		<ul class="tcaEmpDetailsElement tcaEmpDetailsUserPanel">
			<li class="tcaPhotoPanel"><asp:Image ID="EmployeePhoto" runat="server" /></li>
			<li class="tcaPositionPanel">
				<asp:Label ID="Position" CssClass="tcaEmpDetailsPosition" runat="server" />
				<asp:DropDownList ID="PositionSelect" AutoPostBack="true" Visible="false" runat="server" />
			</li>
			<li class="tcaContactPanel">
				<framework:PortalImageAndTextButton ID="ContactButton" TextKey="TXT_CONTACT" 
						ImageCategory="PortletIcon" ImageUrl="email.gif" runat="server" />
			</li>
		</ul>
		
		<!-- Recent Timecards list will go here. -->
	</div>
	
    <table class="tcaEmpDetailsColumn contentBox tcaTimecardEntryContainer">
        <tr>
            <td>
		<!--
			<div class="contentTabs tcaEmpDetailsElement">
				<ul>
					<li style="visibility:hidden;margin:0;padding:0;">&nbsp</li>
					<li class="selected"><common:GlobalizedLinkButton ID="TimecardTab" TextKey="TXT_TIMECARD" runat="server" /></li>
					<li><common:GlobalizedLinkButton ID="AllTimecardsTab" TextKey="TXT_ALL_TIMECARDS" runat="server" /></li>
					<li><common:GlobalizedLinkButton ID="EmployeeInfoTab" TextKey="TXT_EMPLOYEE_INFO" runat="server" /></li>
				</ul>
			</div>
		-->

		<h4><asp:Label ID="TotalsContent" runat="server" /></h4>
                <br />
			<div id="FinalNoteDisplay" visible="false" class="tcaFinalNote" runat="server">
				<framework:PortalImage ID="FinalImage" ImageCategory="PortletIcon" ImageUrl="check_yellow.gif" 
						EnableViewState="false" runat="server" />
				<asp:Label ID="FinalMessage" runat="server" />
				<common:GlobalizedLinkButton ID="FinalReopenButton" TextKey="MSG_TCAPPROVALPORTLET_REOPEN_FINALIZED" 
						runat="server" />
			</div>
			<div ID="NoHoursNote" Visible="false" class="tcaEmpDetailsTotalsNote" runat="server" />
			<common:EmbeddedLinkButton ID="OverrideNote" CssClass="tcaEmpDetailsTotalsNote"
					OuterTextKey="MSG_FORMAT_TIMECARDAPPROVALPORTLET_DELETE_OVERRIDE_BUTTON"
					TextKey="MSG_TIMECARDAPPROVALPORTLET_REMOVE_THESE_CHANGES" runat="server" />
			<timecard:TimecardTotals ID="TotalsDisplay" CssClass="tcaEmpDetailsTotals" runat="server" />
			<timecard:CommentListDisplay ID="CommentsDisplay" HeaderTextKey="LBL_MANAGER_COMMENTS" runat="server" />
            <common:GlobalizedLabel CssClass="tcaErrorColor" TextKey="MSG_TIMECARDPORTLET_WARNING_MANAGER_MODIFY_TIMECARD"
                runat="server" /><br />
            <timecard:TimecardEntry ID="OverrideHoursEntry" CommentLabelTextKey="LBL_ADD_COMMENTS" 
				CssClass="tcaControlHighlight" visible="false" runat="server" />
			<div id="TotalsButtons" class="tcaEmpDetailsTotalsFooter tcaButtonBar" runat="server">
				<framework:PortalImageAndTextButton ID="EditHoursButton" 
						ImageCategory="PortletIcon" EnableViewState="true" runat="server" />
			</div>

		<common:ContentBox ID="EmployeeHoursContent" CssClass="tcaEmpDetailsElement" runat="server">
			<timecard:TimecardEntry ID="EmployeeHoursDisplay" ShowHeader="false"
					CommentLabelTextKey="LBL_EMPLOYEE_COMMENTS" CssClass="tcaEmpDetailsHours" runat="server" />
		</common:ContentBox>
        </td>
        </tr>
        </table>

	<div class="tcaEmpDetailsFooter">
		<asp:LinkButton ID="BackToPayGroupButton2" runat="server" />
	</div>
</div>

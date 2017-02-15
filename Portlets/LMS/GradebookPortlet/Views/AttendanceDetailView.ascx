<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.AttendanceDetailView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="EvaluationStudentList" Src="Controls/EvaluationStudentList.ascx" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="lms" TagName="PagingDropdown" Src="../../Common/Controls/PagingDropdown.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<portlet:NavBar ID="NavBar" runat="server">
<TopNavBarContent>
	<lms:PagingDropdown ID="EvaluationPaging" DropdownTextKey="TXT_OTHER_EVALUATIONS" TopMoreWindowOffset="1" runat="server" />
</TopNavBarContent>
</portlet:NavBar>

<framework:PortletFeedback ID="Feedback" runat="server" />

<div class="portletScreen evaluationDetailScreen">

<div class="intro">
	<common:EmbeddedHyperLink ID="AttendanceIntroMessage"
			OuterTextKey="MSG_FORMAT_GBK_ADMIN_ATTENDANCE_DETAIL_INTRO" TextKey="MSG_GBK_LINKTEXT_ADMIN_ATTENDANCE_DETAIL_INTRO"
			CssClass="messageText" runat="server" />
</div>

<div id="AttendanceAdminPanel" class="attendanceAdmin" runat="server">
	<common:GlobalizedLabel ID="NotYetSetIntro" TextKey="MSG_GBK_ATTENDANCE_INTRO" CssClass="instructions" runat="server" />

	<common:GlobalizedLinkButton ID="IncludeAttendanceButton" TextKey="MSG_GBK_YES_INCLUDE_ATTENDANCE"
			CssClass="includeButton" runat="server" />
	<common:GlobalizedLinkButton ID="DoNotIncludeAttendanceButton" TextKey="MSG_GBK_NO_DO_NOT_INCLUDE_ATTENDANCE"
			CssClass="doNotIncludeButton" runat="server" />

	<common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_IS_INCLUDED" CssClass="isIncludedText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_IS_NOT_INCLUDED" CssClass="isNotIncludedText" runat="server" />

	<common:GlobalizedHyperLink ID="HelpLink" TextKey="TXT_HELP" NavigateUrl="javascript:" CssClass="helpLink" runat="server" />
	<lms:Modal ID="HelpWindow" TargetControlID="HelpLink" runat="server">
	<ContentArea>
		<p><common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_DETAIL_HELP_MESSAGE" runat="server" /></p>
	</ContentArea>
	</lms:Modal>

	<common:GlobalizedLinkButton ID="AddAttendanceButton" TextKey="TXT_ADD_ATTENDANCE_TO_THE_FINAL_GRADE" CssClass="addButton" runat="server" />
	<common:GlobalizedLinkButton ID="RemoveAttendanceButton" TextKey="TXT_REMOVE_ATTENDANCE_FROM_THE_FINAL_GRADE" CssClass="removeButton" runat="server" />
</div>

<div class="pageColumn studentListColumn">
	<common:Subheader TextKey="HDR_ATTENDANCE_STATUS" runat="server" />
	<portlet:EvaluationStudentList ID="StudentList" CssClass="attendanceStudentList" runat="server" />

	<common:Subheader ID="EmulatedStudentsHeader" TextKey="HDR_GUEST_STUDENTS" runat="server" />
	<portlet:EvaluationStudentList ID="EmulatedStudentList" CssClass="attendanceStudentList" runat="server" />

	<common:Subheader ID="WithdrawnStudentsHeader" TextKey="HDR_WITHDRAWN_STUDENTS" runat="server" />
	<portlet:EvaluationStudentList ID="WithdrawnStudentList" CssClass="attendanceStudentList" runat="server" />
</div>

<div class="pageColumn infoColumn">
	<asp:Label ID="TotalPointsDisplay" CssClass="totalPoints" runat="server" />
</div>

<div class="pageFooter"></div>
</div>

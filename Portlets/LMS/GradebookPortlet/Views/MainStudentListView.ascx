<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainStudentListView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.MainStudentListView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="StudentGradeList" Src="Controls/StudentGradeList.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<div class="portletScreen mainStudentListScreen">

<table cellpadding="0" cellspacing="0">
<tr>
	<td class="studentListColumn">
		<portlet:StudentGradeList ID="MainStudentList" HeaderTextKey="HDR_YOUR_STUDENTS_GRADES" runat="server" />
		<portlet:StudentGradeList ID="EmulatedStudentList" HeaderTextKey="HDR_GUEST_STUDENTS" Visible="false" runat="server" />
		<portlet:StudentGradeList ID="WithdrawnStudentList" HeaderTextKey="HDR_WITHDRAWN_STUDENTS" Visible="false" runat="server" />

		<common:GlobalizedLabel id="NoStudentsMessage" TextKey="MSG_GBK_NO_STUDENTS" CssClass="noStudentsText" Visible="false" runat="server" />
	</td>
	<td class="otherFeaturesColumn">
		<div id="MissingWeightsWarning" class="missingWeightsPanel" visible="false" runat="server">
			<common:GlobalizedLabel TextKey="HDR_ITEMS_WITH_MISSING_WEIGHTS" CssClass="gbkHeader" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_MISSING_WEIGHTS_INTRO" runat="server" />
			<asp:Repeater ID="MissingWeightsRepeater" runat="server">
				<ItemTemplate><asp:HyperLink ID="MissingWeightItem" CssClass="missingWeight" runat="server" /></ItemTemplate>
			</asp:Repeater>
			<common:GlobalizedLabel TextKey="MSG_GBK_MISSING_WEIGHTS_NOTE" runat="server" />
		</div>

		<div id="StaticMissingWeightsWarning" class="missingWeightsPanel" visible="false" runat="server">
			<common:GlobalizedLabel TextKey="HDR_MISSING_WEIGHTS" CssClass="gbkHeader" runat="server" />
			<common:EmbeddedHyperLink ID="StaticMissingWeightsMessage"
					OuterTextKey="MSG_FORMAT_GBK_GENERIC_MISSING_WEIGHTS_LINK" TextKey="MSG_GBK_GENERIC_MISSING_WEIGHTS_LINK_TEXT"
					runat="server" />
		</div>

		<common:GlobalizedHyperLink ID="FullGradebookLink" TextKey="TXT_VIEW_THE_FULL_GRADEBOOK" CssClass="fullGradebookLink" runat="server" />

		<div id="AttendancePanel" class="attendancePanel" visible="false" runat="server">
			<common:GlobalizedLabel TextKey="MSG_GBK_WANT_TO_INCLUDE_ATTENDANCE?" CssClass="messageText" runat="server" />
			<common:GlobalizedLinkButton ID="IncludeAttendanceButton" TextKey="TXT_YES" CssClass="includeButton" runat="server" />
			<common:GlobalizedLinkButton ID="DoNotIncludeAttendanceButton" TextKey="TXT_NO" CssClass="doNotIncludeButton" runat="server" />
			<common:GlobalizedHyperLink ID="MoreInfoLink" TextKey="TXT_MORE_INFO" NavigateUrl="javascript:" CssClass="helpLink" runat="server" />
			<lms:Modal ID="HelpWindow" TargetControlID="MoreInfoLink" runat="server">
			<ContentArea>
				<p><common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_DETAIL_HELP_MESSAGE" runat="server" /></p>
			</ContentArea>
			</lms:Modal>
		</div>

		<common:GlobalizedLabel TextKey="TXT_OTHER_SCREENS" CssClass="otherScreensHeader" runat="server" />
		<ul>
			<li><common:GlobalizedHyperLink ID="FinalWeightingLink" TextKey="TXT_FINAL_GRADE_WEIGHTING" CssClass="weightingLink" runat="server" /></li>
			<li><common:GlobalizedHyperLink ID="EvaluationsLink" TextKey="TXT_EVALUATIONS" CssClass="evaluationsLink" runat="server" /></li>
			<li><common:GlobalizedHyperLink ID="LetterGradingLink" TextKey="TXT_LETTER_GRADE_RANGES" CssClass="letterGradingLink" runat="server" /></li>
			<li><common:GlobalizedHyperLink ID="SubmitGradesLink" TextKey="TXT_SUBMIT_YOUR_GRADES" CssClass="submitGradesLink" runat="server" /></li>
		</ul>
	</td>
</tr>
</table>

<div class="pageFooter" />
</div>

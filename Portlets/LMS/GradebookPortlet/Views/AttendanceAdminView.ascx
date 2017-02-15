<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceAdminView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.AttendanceAdminView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<framework:PortletFeedback ID="Feedback" runat="server" />

<div class="portletScreen evaluationAdminScreen">

<div class="intro">
	<common:GlobalizedLabel TextKey="HDR_CONFIGURE_ATTENDANCE" CssClass="headerText" runat="server" />
	<common:EmbeddedHyperLink ID="AttendanceIntroMessage"
			OuterTextKey="MSG_FORMAT_GBK_ADMIN_ATTENDANCE_INTRO" TextKey="MSG_GBK_ADMIN_ATTENDANCE_INTRO_ATTENDANCE_PAGE"
			CssClass="messageText" runat="server" />
</div>

<ul class="entryFields">
	<li class="nameEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_NAME" AssociatedControlID="NameEntry" CssClass="entryLabel" runat="server" />
		<asp:TextBox ID="NameEntry" Columns="40" MaxLength="250" runat="server" />
	</li>
	<li class="pointValueEntryRow">
		<common:NumberValidator ControlToValidate="PointValueEntry" runat="server" />
		<common:GlobalizedLabel LabelKey="TXT_POINT_VALUE" AssociatedControlID="PointValueEntry" CssClass="entryLabel" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_SCORED_OUT_OF_X_POINTS_1" AssociatedControlID="PointValueEntry" runat="server" />
		<asp:TextBox ID="PointValueEntry" Columns="5" MaxLength="10" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_SCORED_OUT_OF_X_POINTS_2" AssociatedControlID="PointValueEntry" runat="server" />
	</li>
	<li class="descriptionEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_DESCRIPTION" AssociatedControlID="DescriptionEntry" CssClass="entryLabel" runat="server" />
		<div class="complexTextBox"><common:TextBoxEditor ID="DescriptionEntry" runat="server" /></div>
	</li>
	<li class="settingsEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_SETTINGS" CssClass="entryLabel" runat="server" />
		<ul class="settingsOptions">
			<li id="UnexcuseAbsencePanel" runat="server">
				<common:NumberValidator ControlToValidate="UnexcusedAbsenceCountEntry" runat="server" />
				<asp:CheckBox ID="UnexcusedAbsenceEntry" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_ADMIN_ATTENDANCE_COUNT_UNEXCUSED_ABSENCE_1" AssociatedControlID="UnexcusedAbsenceEntry"
						CssClass="description" runat="server" />
				<asp:TextBox ID="UnexcusedAbsenceCountEntry" runat="server" Columns="1" MaxLength="3" />
				<common:GlobalizedLabel TextKey="MSG_GBK_ADMIN_ATTENDANCE_COUNT_UNEXCUSED_ABSENCE_2" AssociatedControlID="UnexcusedAbsenceCountEntry"
						CssClass="description" runat="server" />
			</li>
			<li>
				<common:NumberValidator ControlToValidate="NoAttendanceCreditCountEntry" runat="server" />
				<asp:CheckBox ID="NoAttendanceCreditEntry" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_ADMIN_ATTENDANCE_NO_ATTENDANCE_CREDIT_1" AssociatedControlID="NoAttendanceCreditEntry"
						CssClass="description" runat="server" />
				<asp:TextBox ID="NoAttendanceCreditCountEntry" runat="server" Columns="1" MaxLength="3" />
				<common:GlobalizedLabel ID="NoAttendanceCreditSessionText" TextKey="MSG_GBK_ADMIN_ATTENDANCE_NO_ATTENDANCE_CREDIT_2" AssociatedControlID="NoAttendanceCreditCountEntry"
						CssClass="description" runat="server" />
                <asp:DropDownList ID="NoAttendanceCreditUnit" runat="server" />
			</li>
			<li>
				<common:NumberValidator ControlToValidate="AutoCourseFailureCountEntry" runat="server" />
				<asp:CheckBox ID="AutoCourseFailureEntry" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_ADMIN_ATTENDANCE_AUTO_COURSE_FAILURE_1" AssociatedControlID="AutoCourseFailureEntry"
						CssClass="description" runat="server" />
				<asp:TextBox ID="AutoCourseFailureCountEntry" runat="server" Columns="1" MaxLength="3" />
				<common:GlobalizedLabel ID="AutoCourseFailureSessionText" TextKey="MSG_GBK_ADMIN_ATTENDANCE_AUTO_COURSE_FAILURE_2" AssociatedControlID="AutoCourseFailureCountEntry"
						CssClass="description" runat="server" />
                <asp:DropDownList ID="AutoCourseFailureUnit" runat="server" />
			</li>
		</ul>
	</li>
	<li class="buttonsRow">
		<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE" runat="server" />
		<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server" />
	</li>
</ul>

<div class="pageFooter"></div>

</div>

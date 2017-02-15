<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EvaluationsListView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.EvaluationsListView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<div class="portletScreen evaluationsMainScreen">

<framework:PortletFeedback ID="Feedback" runat="server" />

<div class="evaluationsIntro">
	<common:GlobalizedLabel TextKey="HDR_EVALUATIONS" CssClass="headerText" runat="server" />
	<common:EmbeddedHyperLink ID="EvaluationsIntroMessage"
			OuterTextKey="MSG_FORMAT_GBK_EVALUATIONS_INTRO" TextKey="MSG_GBK_EVALUATIONS_INTRO_COURSEWORK"
			CssClass="messageText" runat="server" />
	<common:GlobalizedHyperLink ID="AddEvaluationLink" TextKey="TXT_ADD_AN_EVALUATION" CssClass="addEvaluationLink" runat="server" />
</div>

<common:StyledGridView ID="EvaluationsGrid" CssClass="evaluationGrid" runat="server">
	<Columns>
		<asp:TemplateField>
			<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_EVALUATION" runat="server" /></HeaderTemplate>
			<ItemTemplate>
				<common:GlobalizedHyperLink ID="EvaluationName" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_STATUS" runat="server" /></HeaderTemplate>
			<ItemTemplate>
				<asp:Label ID="StatusText" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				<asp:HyperLink ID="EditLink" runat="server">
					<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="edit.gif" runat="server" />
				</asp:HyperLink>
				<framework:PortalImageButton ID="DeleteButton" ImageCategory="PortletIcon" ImageUrl="delete.gif" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</common:StyledGridView>

<div id="AttendanceAdmin" class="attendancePanel" runat="server">
	<div class="attendanceIntro">
		<common:GlobalizedLabel TextKey="HDR_ATTENDANCE" CssClass="headerText" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_INTRO" CssClass="messageText" runat="server" />
	</div>
	<div class="gbkButtonBar">
		<common:GlobalizedLinkButton ID="IncludeAttendanceButton" TextKey="MSG_GBK_YES_INCLUDE_ATTENDANCE"
				CssClass="includeButton" runat="server" />
		<common:GlobalizedLinkButton ID="DoNotIncludeAttendanceButton" TextKey="MSG_GBK_NO_DO_NOT_INCLUDE_ATTENDANCE"
				CssClass="doNotIncludeButton" runat="server" />
	</div>
	<common:GlobalizedHyperLink ID="AttendanceLink" TextKey="TXT_VIEW_THE_CURRENT_COURSE_ATTENDANCE_STATUS"
			CssClass="attendanceLink" runat="server" />

	<common:GlobalizedHyperLink Id="HelpLink" TextKey="TXT_HELP" NavigateUrl="javascript:" CssClass="helpLink" runat="server" />
	<lms:Modal ID="HelpWindow" TargetControlID="HelpLink" runat="server">
	<ContentArea>
		<p><common:GlobalizedLabel TextKey="MSG_GBK_ATTENDANCE_DETAIL_HELP_MESSAGE" runat="server" /></p>
	</ContentArea>
	</lms:Modal>
</div>

<div class="screenFooter"></div>

</div>

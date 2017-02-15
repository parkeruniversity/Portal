<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EvaluationDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.EvaluationDetailView" %>
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

<div class="portletScreen evaluationDetailScreen">

<framework:PortletFeedback ID="Feedback" runat="server" />

<div class="pageColumn studentListColumn">
	<portlet:EvaluationStudentList ID="StudentList" runat="server" />

	<common:Subheader ID="EmulatedStudentsHeader" TextKey="HDR_GUEST_STUDENTS" runat="server" />
	<portlet:EvaluationStudentList ID="EmulatedStudentList" runat="server" />

	<common:Subheader ID="WithdrawnStudentsHeader" TextKey="HDR_WITHDRAWN_STUDENTS" runat="server" />
	<portlet:EvaluationStudentList ID="WithdrawnStudentList" runat="server" />
</div>

<div class="pageColumn infoColumn">
	<asp:Label ID="TotalPointsDisplay" CssClass="totalPoints" runat="server" />

	<common:GlobalizedHyperLink ID="HowToEnterGradesLink" NavigateUrl="javascript:" TextKey="TXT_HOW_TO_ENTER_GRADES" CssClass="helpLink" runat="server" />
	<lms:Modal ID="HowToEnterGradesPopup" TargetControlID="HowToEnterGradesLink" runat="server">
	<ContentArea>
		<div id="HowToEnterGradesMessage" class="howToEnterGrades" runat="server"></div>
	</ContentArea>
	</lms:Modal>
</div>

<div class="pageFooter"></div>

</div>

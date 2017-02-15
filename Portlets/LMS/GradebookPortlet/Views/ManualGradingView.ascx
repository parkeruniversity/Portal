<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManualGradingView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.ManualGradingView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="StudentGradeList" Src="Controls/StudentGradeList.ascx" %>

<div class="portletScreen mainStudentListScreen">

<framework:PortletFeedback ID="Feedback" runat="server" />

<table cellpadding="0" cellspacing="0">
<tr>
	<td class="studentListColumn">
		<portlet:StudentGradeList ID="MainStudentList" HeaderTextKey="HDR_YOUR_STUDENTS_GRADES" IsEditable="true" runat="server" />
		<portlet:StudentGradeList ID="EmulatedStudentList" HeaderTextKey="HDR_GUEST_STUDENTS" IsEditable="true" Visible="false" runat="server" />
		<portlet:StudentGradeList ID="WithdrawnStudentList" HeaderTextKey="HDR_WITHDRAWN_STUDENTS" IsEditable="true" Visible="false" runat="server" />

		<common:GlobalizedLabel id="NoStudentsMessage" TextKey="MSG_GBK_NO_STUDENTS" CssClass="noStudentsText" Visible="false" runat="server" />
	</td>
	<td class="otherFeaturesColumn">
		<common:GlobalizedLinkButton ID="EditAllGradesLink" TextKey="TXT_EDIT_ALL_GRADES" CssClass="editAllGradesLink" runat="server" />
		<div id="ManualMethodHint" runat="server" class="hint"></div>
        <br />
        <common:GlobalizedLabel ID="OtherScreensLabel" TextKey="TXT_OTHER_SCREENS" CssClass="otherScreensHeader" runat="server" />
		<ul>
			<li><common:GlobalizedHyperLink ID="FinalWeightingLink" TextKey="TXT_FINAL_GRADE_WEIGHTING" CssClass="weightingLink" runat="server" /></li>
			<li><common:GlobalizedHyperLink ID="LetterGradingLink" TextKey="TXT_LETTER_GRADE_RANGES" CssClass="letterGradingLink" runat="server" /></li>
			<li><common:GlobalizedHyperLink ID="SubmitGradesLink" TextKey="TXT_SUBMIT_YOUR_GRADES" CssClass="submitGradesLink" runat="server" /></li>
		</ul>
	</td>
</tr>
</table>

<div class="pageFooter" />
</div>
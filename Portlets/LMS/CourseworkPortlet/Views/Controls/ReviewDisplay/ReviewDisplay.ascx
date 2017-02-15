<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.ReviewDisplay" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<%@ Register TagPrefix="lms" TagName="GradeInput" Src="../../../../Common/Controls/GradeInput.ascx" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register tagname="TrueFalse" tagprefix="cwk"  src="TrueFalseReview.ascx" %>
<%@ Register tagname="Essay" tagprefix="cwk"  src="EssayReview.ascx" %>
<%@ Register tagname="Equation" tagprefix="cwk"  src="EquationReview.ascx" %>
<%@ Register tagname="Short" tagprefix="cwk"  src="ShortAnswerReview.ascx" %>
<%@ Register tagname="Multi" tagprefix="cwk"  src="MultiReview.ascx" %>
<%@ Register tagname="Match" tagprefix="cwk"  src="MatchReview.ascx" %>
<%@ Register tagname="Order" tagprefix="cwk"  src="OrderingReview.ascx" %>
<%@ Register tagname="Feedback" tagprefix="cwk"  src="../../../../Common/Controls/FeedbackEditor.ascx" %>

<div id="_divReview" runat="server" class="questionDisplay showCollapse">
	<div class="questionSection" ><asp:Literal ID="_litNum" runat="server" /></div>
	<div class="questionSection questionSpacer reviewContainer" >
		<div class="questionSection">
			<div class="collapseGrade reviewCollapse">
				<asp:Panel ID="_panMiniGrade" runat="server">
					<asp:Literal ID="_litGrade" runat="server" />
				</asp:Panel>
				<asp:Panel ID="_panFeedback" CssClass="collapseFeedback" runat="server"/>
				<asp:Panel ID="_panExtra" CssClass="collapseExtra" runat="server"/>
			</div>
			<div class="expandGrade reviewExpand">
				<asp:Panel ID="_panExpandGrade" runat="server">
					<asp:Literal ID="_litExpandGrade" runat="server"/>
					<asp:Label ID="_lblScoreThis" runat="server" />
				</asp:Panel>
				<lms:GradeInput id="_gradeInput" EnableViewState="false" runat="server" />
			</div>
		</div>
		<div class="questionSection questionSpacer">
			<div class="questionSection reviewQuestionText">
				<cwk:RichText id="_rtQuestion" runat="server" />
			</div>
			<div class="pointDisplay reviewExpand"><asp:Literal ID="_litPoints" runat="server" /></div>
			<div class="pointDisplay reviewCollapse"><framework:PortalImageAndHyperLink id="_phiExpand" runat="server" /></div>
			<div class="questionTypeDisplay reviewExpand">
				<asp:Panel ID="_panChange" runat="server" CssClass="questionReviewChange"></asp:Panel>
				<cwk:TrueFalse id="_tf" runat="server" />
				<cwk:Essay id="_essay" runat="server" />
				<cwk:Equation id="_equation" runat="server" />
				<cwk:Short id="_short" runat="server" />
				<cwk:Multi id="_multi" runat="server" />
				<cwk:Match id="_match" runat="server" />
				<cwk:Order id="_order" runat="server" />	
			</div>
		</div>
		<div id="_divFeedback" runat="server" class="questionSection reviewExpand feedbackDisplay">
			<div class="reviewWedge"></div>
			<div class="reviewWedgeOutline"></div>
			<div id="_divFeedbackEntry" runat="server" class="feedbackEntry">
			</div>
		</div>
		<div class="reviewExpand expandFooter">
			<asp:Panel ID="_panYourFeedback" CssClass="yourFeedback" runat="server" />
			<cwk:Feedback id="_fbEditor" runat="server" />
			<div class="expandFooterDivide"><framework:PortalImageAndHyperLink id="_phiCollapse" runat="server" /></div>
			<div id="_divUserPage" runat="server" class="expandFooterDivide"><asp:HyperLink ID="_hypUserPage" runat="server" /></div>
			<div id="_divGradeByQuestion" runat="server" class="expandFooterDivide"><framework:PortalImageAndHyperLink id="_phiGradeByQuestion" runat="server" /></div>
		</div>
	</div>
	<div style="clear:both;"></div>
</div>

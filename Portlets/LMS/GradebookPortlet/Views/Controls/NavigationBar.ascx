<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationBar.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.NavigationBar" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Src="../../../Common/Controls/MoreWindow.ascx" TagName="MoreWindow" TagPrefix="lms" %>

<div id="MainNavBar" class="navBar" runat="server">

	<ul id="NavTabs">
		<li id="StudentListTab" class="regularTab">
			<common:GlobalizedHyperLink ID="StudentListLink" runat="server">
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/house.png" runat="server" />
			</common:GlobalizedHyperLink>
		</li>
		<li id="FullGradebookTab" class="regularTab">
			<common:GlobalizedHyperLink ID="FullGradebookLink" runat="server">
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/book_open.png" runat="server" />
			</common:GlobalizedHyperLink>
		</li>
		<li id="EvaluationsTab" class="regularTab">
			<common:GlobalizedHyperLink ID="EvaluationsLink" runat="server">
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/medal_gold_1.png" runat="server" />
			</common:GlobalizedHyperLink>
		</li>
		<li id="WeightingTab" class="regularTab">
			<common:GlobalizedHyperLink ID="WeightingLink" runat="server">
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/chart_pie.png" runat="server" />
			</common:GlobalizedHyperLink>
		</li>
		<li id="GradeLetterTab" class="regularTab">
			<common:GlobalizedHyperLink ID="GradeLetterLink" runat="server" ToolTip="Grade scale">
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/font.png" runat="server" />
			</common:GlobalizedHyperLink>
		</li>
		<li id="MainNavCustomTab" class="customTab" runat="server" />
	</ul>

	<div id="CustomDetailsPanel" visible="false" class="customDetailsPanel" runat="server" />

	<ul id="DetailsPanel">
		<li id="EvaluationDetails">
			<asp:Label ID="EvaluationNameDisplay" CssClass="evaluationHeader" runat="server" />
		</li>

		<li id="WeightingMethodDetails">
			<div class="weightingMethodDisplay">
				<common:GlobalizedLabel LabelKey="TXT_YOUR_CURRENT_WEIGHTING_METHOD" CssClass="label" runat="server" />
				<asp:Label ID="CurrentWeightingMethodDisplay" CssClass="textDisplay" runat="server" />
			</div>

			<common:GlobalizedHyperLink ID="GeneralWeightingLink" TextKey="TXT_CHANGE_WEIGHTING_METHOD"
					CssClass="navigationLink generalWeightingLink" runat="server" />
			<common:GlobalizedHyperLink ID="GradeWeightingBackLink" TextKey="MSG_GBK_BACK_TO_FINAL_GRADE_WEIGHTING"
					CssClass="navigationLink gradeWeightingLink" runat="server" />
		</li>

		<li id="EvaluationDetailWindow">
			<lms:MoreWindow id="EvaluationDetailMoreWindow" TopWindowOffset="11" LeftWindowOffset="-100" runat="server">
			<ContentArea>
				<div id="EvaluationButtonPanel" class="buttonPanel" visible="false" runat="server">
					<common:GlobalizedHyperLink ID="EditEvaluationLink" TextKey="TXT_EDIT_THIS_EVALUATION"
							CssClass="editButton" runat="server" />
					<common:GlobalizedLinkButton ID="DeleteEvaluationButton" TextKey="TXT_DELETE_THIS_EVALUATION"
							CssClass="deleteButton" runat="server" />
				</div>
				<ul class="detailsPanel">
					<li class="name">
						<common:GlobalizedLabel LabelKey="TXT_NAME" CssClass="label" runat="server" />
						<div class="value"><asp:Label ID="EvaluationDetailNameDisplay" runat="server" /></div>
					</li>
					<li class="points">
						<common:GlobalizedLabel LabelKey="TXT_POINTS" CssClass="label" runat="server" />
						<asp:Label ID="EvaluationDetailPointsDisplay" CssClass="value" runat="server" />
					</li>
					<li class="description">
						<common:GlobalizedLabel LabelKey="TXT_DESCRIPTION" CssClass="label" runat="server" />
						<div class="value"><asp:Label ID="EvaluationDetailDescriptionDisplay" runat="server" /></div>
					</li>
					<li class="settings">
						<common:GlobalizedLabel LabelKey="TXT_SETTINGS" CssClass="label" runat="server" />
						<ul class="value">
							<li id="EvaluationTardyCountForAbsenceDisplay" runat="server" />
							<li id="EvaluationAbsenceCountForNoCreditDisplay" runat="server" />
							<li id="EvaluationAbsenceCountForCourseFailDisplay" runat="server" />
						</ul>
					</li>
				</ul>
			</ContentArea>
			</lms:MoreWindow>
		</li>
	</ul>

</div>
<div class="controlFooter"></div>

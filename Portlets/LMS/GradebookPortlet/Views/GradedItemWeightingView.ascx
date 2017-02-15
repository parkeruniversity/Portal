<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GradedItemWeightingView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.GradedItemWeightingView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="portlet" TagName="WeightingList" Src="Controls/WeightingList.ascx" %>
<%@ Register TagPrefix="portlet" TagName="OverrideModal" Src="Controls/OrgHeaderWeightOverrideModal.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<div id="PortletScreen" class="portletScreen gradedItemWeightingScreen" runat="server">

<div class="introPanel groupTogetherText">
	<common:GlobalizedLabel TextKey="HDR_FINAL_GRADE_WEIGHTING" CssClass="headerText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_FINALWEIGHTING_INTRO" CssClass="messageText" runat="server" />

	<common:GlobalizedHyperLink ID="FinalGradingHelpLink" TextKey="MSG_GBK_WHAT_IS_FINAL_GRADE_WEIGHTING" NavigateUrl="javascript:" CssClass="helpLink" runat="server" />
	<lms:Modal ID="FinalGradingHelpPopup" TargetControlID="FinalGradingHelpLink" runat="server">
	<ContentArea>
		<p><common:EmbeddedHyperLink ID="WeightingMethodHelpLink"
				OuterTextKey="MSG_FORMAT_GBK_WHAT_IS_FINAL_GRADING_HELP_TEXT" TextKey="MSG_GBK_WHAT_IS_FINAL_GRADING_HELP_LINK_TEXT"
				runat="server" /></p>
	</ContentArea>
	</lms:Modal>
</div>

<div class="introPanel groupByOrgHeaderText">
	<asp:Label ID="OrgHeaderName" CssClass="headerText" runat="server" />
	<asp:Label ID="OrgUnitWeightDisplay" CssClass="weightDisplay orgUnitText" runat="server" />
	<asp:Label ID="OrgTypeWeightDisplay" CssClass="weightDisplay orgTypeText" runat="server" />
	<asp:Label ID="OrgUnitWeightMethodDisplay" CssClass="weightMethodDisplay orgUnitText" runat="server" />
	<asp:Label ID="OrgTypeWeightMethodDisplay" CssClass="weightMethodDisplay orgTypeText" runat="server" />
	<common:EmbeddedHyperLink ID="OverrideLink" TextKey="MSG_GBK_MAKE_A_WEIGHTING_EXCEPTION_HERE" CssClass="overrideLink" runat="server" />
</div>

<div class="instructions">
	<asp:Label ID="AssignmentsWeightMethodDisplay" CssClass="groupTogetherText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_ENTER_WEIGHT_WITHIN_THIS_UNIT" CssClass="groupByOrgHeaderText orgUnitText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_ENTER_WEIGHT_WITHIN_THIS_TYPE" CssClass="groupByOrgHeaderText orgTypeText" runat="server" />
</div>

<div class="breakdownPanel">
	<portlet:WeightingList ID="GradedItemWeightingList" runat="Server" />

	<common:GlobalizedHyperLink ID="ChangeWeightsLink" NavigateUrl="javascript:"
			TextKey="MSG_GBK_CHANGE_THESE_WEIGHTS" CssClass="helpLink changeWeightsLink" runat="server" />
	<lms:Modal ID="ChangeWeightsWindow" TargetControlID="ChangeWeightsLink" runat="server">
	<ContentArea>
		<p><common:EmbeddedHyperLink ID="ChangeWeightsMainWeightingLink"
				OuterTextKey="MSG_FORMAT_GBK_GRADED_ITEM_CHANGE_WEIGHTS_MESSAGE" TextKey="MSG_GBK_GRADED_ITEM_CHANGE_WEIGHTS_LINK_TEXT"
				runat="server" /></p>
	</ContentArea>
	</lms:Modal>

	<common:GlobalizedHyperLink ID="MicromanageLink" NavigateUrl="javascript:"
			TextKey="MSG_TOO_MUCH_MICROMANAGEMENT" CssClass="helpLink micromanageLink" runat="server" />

	<lms:Modal ID="MicromanagePopup" TargetControlID="MicromanageLink" runat="server">
	<ContentArea>
		<p><common:EmbeddedHyperLink ID="MicromanagementMainWeightingLink"
				OuterTextKey="MSG_FORMAT_GBK_TOO_MUCH_MICROMANAGMENT_TEXT_1" TextKey="MSG_GBK_TOO_MUCH_MICROMANAGMENT_GRADE_WEIGHTING_METHOD"
				runat="server" /></p>
		<p>
			<common:GlobalizedLabel TextKey="MSG_GBK_TOO_MUCH_MICROMANAGEMENT_TEXT_2_UNIT" CssClass="orgUnitText" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_TOO_MUCH_MICROMANAGEMENT_TEXT_2_TYPE" CssClass="orgTypeText" runat="server" />
		</p>
	</ContentArea>
	</lms:Modal>

</div>

<div class="dropPanel">
	<common:GlobalizedLabel TextKey="HDR_DROPPING_ASSIGNMENTS" CssClass="headerText" runat="server" />
	<div class="dropAdmin">
		<asp:UpdatePanel runat="server">
		<ContentTemplate>
			<asp:CheckBox ID="DropCheckBox" AutoPostBack="true" runat="server" />

			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_SCORE_1"
					AssociatedControlID="DropCheckBox" CssClass="groupTogetherText" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_FROM_UNIT_1"
					AssociatedControlID="DropCheckBox" CssClass="orgUnitText groupByOrgHeaderText" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_FROM_TYPE_1"
					AssociatedControlID="DropCheckBox" CssClass="orgTypeText groupByOrgHeaderText" runat="server" />

			<asp:DropDownList ID="DropCountDropDown" AutoPostBack="true" runat="server" />

			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_SCORE_2"
					AssociatedControlID="DropCheckBox" CssClass="groupTogetherText" runat="server" /><!--
			--><common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_FROM_UNIT_2"
					AssociatedControlID="DropCountDropDown" CssClass="orgUnitText groupByOrgHeaderText" runat="server" /><!--
			--><common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_FROM_TYPE_2"
					AssociatedControlID="DropCountDropDown" CssClass="orgTypeText groupByOrgHeaderText" runat="server" /><!--
			-->*
		</ContentTemplate>
		</asp:UpdatePanel>
	</div>
	<div class="footerNote">
		*
		<common:GlobalizedLabel TextKey="MSG_GBK_DROP_INDIVIDUAL_GRADES_NOTE" CssClass="groupTogetherText" runat="server" />
		<common:EmbeddedHyperLink ID="FinalGradeWeightingLink"
				OuterTextKey="MSG_FORMAT_GBK_DROP_INDIVIDUAL_GRADES_FROM_COURSE_NOTE" TextKey="HDR_FINAL_GRADE_WEIGHTING"
				CssClass="groupByOrgHeaderText" runat="server" />
	</div>
</div>

<portlet:OverrideModal ID="OverrideModal" TargetControlID="OverrideLink" runat="Server" />

<div class="screenFooter"></div>
</div>

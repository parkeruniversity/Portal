<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrgHeaderWeightingView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.OrgHeaderWeightingView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="portlet" TagName="WeightingList" Src="Controls/WeightingList.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<div id="PortletScreen" class="portletScreen orgHeaderWeightingScreen" runat="server">

<div class="introPanel">
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

<div class="breakdownPanel">
	<common:GlobalizedLabel TextKey="HDR_OVERALL_GRADE_BREAKDOWN" CssClass="headerText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_OVERALLBREAKDOWN_INTRO" CssClass="messageText manualWeightingText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_UNITS_WEIGHTED_EQUALLY" CssClass="messageText orgUnitText automaticWeightingText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_TYPES_WEIGHTED_EQUALLY" CssClass="messageText orgTypeText automaticWeightingText" runat="server" />

	<div class="orgHeaderPanel">
		<portlet:WeightingList ID="OrgHeaderWeightingList" ArePointsHidden="true" AreFinalPercentagesHidden="true" runat="Server" />
	</div>

	<common:GlobalizedHyperLink ID="ChangeWeightingLink" TextKey="TXT_CHANGE_WEIGHTING_METHOD" CssClass="generalWeightingLink" runat="server" />
</div>

<div class="dropPanel">
	<common:GlobalizedLabel TextKey="HDR_DROPPING_ASSIGNMENTS" CssClass="headerText" runat="server" />
	<div class="dropAdmin">
		<asp:UpdatePanel runat="server">
		<ContentTemplate>
			<asp:CheckBox ID="DropCheckBox" AutoPostBack="true" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_SCORE_1" AssociatedControlID="DropCheckBox" runat="server" />
			<asp:DropDownList ID="DropCountDropDown" AutoPostBack="true" runat="server" />
			<common:GlobalizedLabel TextKey="MSG_GBK_DROP_EACH_STUDENTS_X_LOWEST_SCORE_2" AssociatedControlID="DropCountDropDown" runat="server" />*
		</ContentTemplate>
		</asp:UpdatePanel>
	</div>
	<div class="footerNote">
		*
		<common:GlobalizedLabel TextKey="MSG_GBK_DROP_INDIVIDUAL_UNITS_NOTE" CssClass="orgUnitText" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_DROP_INDIVIDUAL_TYPES_NOTE" CssClass="orgTypeText" runat="server" />
	</div>
</div>

<div class="screenFooter"></div>
</div>
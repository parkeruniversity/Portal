<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EvaluationAdminView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.EvaluationAdminView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<framework:PortletFeedback ID="Feedback" runat="server" />

<div class="portletScreen evaluationAdminScreen">

<div class="intro">
	<common:GlobalizedLabel TextKey="HDR_ADD_AN_EVALUATION" CssClass="headerText" runat="server" />
	<common:EmbeddedHyperLink ID="EvaluationIntroMessage"
			OuterTextKey="MSG_FORMAT_GBK_ADD_EVALUATION_INTRO" TextKey="MSG_GBK_ADD_EVALUATION_INTRO_COURSWORK_ASSIGNMENTS"
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
	<li class="extraCreditEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_EXTRA_CREDIT" AssociatedControlID="ExtraCreditEntry" CssClass="entryLabel" runat="server" />
		<asp:CheckBox ID="ExtraCreditEntry" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_EXTRACREDIT_DESCRIPTION" AssociatedControlID="ExtraCreditEntry" CssClass="description" runat="server" />
	</li>
	<li class="hiddenEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_HIDDEN" AssociatedControlID="HiddenEntry" CssClass="entryLabel" runat="server" />
		<asp:CheckBox ID="HiddenEntry" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_HIDDEN_DESCRIPTION" AssociatedControlID="HiddenEntry" CssClass="description" runat="server" />
	</li>
	<li class="descriptionEntryRow">
		<common:GlobalizedLabel LabelKey="TXT_DESCRIPTION" AssociatedControlID="DescriptionEntry" CssClass="entryLabel" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_DESCRIPTION_DESCRIPTION" AssociatedControlID="DescriptionEntry" CssClass="description" runat="server" />
		<div class="complexTextBox"><common:TextBoxEditor ID="DescriptionEntry" runat="server" /></div>
	</li>
	<li class="buttonsRow">
		<common:GlobalizedButton ID="SaveButton" TextKey="TXT_SAVE" runat="server" />
		<common:GlobalizedButton ID="CancelButton" TextKey="TXT_CANCEL" runat="server" />

		<common:GlobalizedHyperLink ID="MoreOptionsLink" TextKey="TXT_NEED_MORE_OPTIONS?" NavigateUrl="javascript:" CssClass="helpLink" runat="server" />
		<lms:Modal ID="MoreOptionsPopup" TargetControlID="MoreOptionsLink" runat="server">
		<ContentArea>
			<p><common:GlobalizedLabel TextKey="MSG_GBK_EVALUATIONADMIN_MOREOPTIONS_TEXT" runat="server" /></p>
		</ContentArea>
		</lms:Modal>
	</li>
</ul>

</div>

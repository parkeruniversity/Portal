<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrgHeaderWeightOverrideModal.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.OrgHeaderWeightOverrideModal" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<lms:Modal ID="OverrideWeightingMethodWindow" OkButtonVisible="false" runat="server">
<ContentArea>
	<div class="portletScreen">
		<common:EmbeddedHyperLink ID="RegularIntroLink" runat="server" />
		<asp:Label ID="OverriddenIntro" runat="server" />

		<ul class="overrideGradingMethodList">
			<li id="RemoveOverrideItem" runat="server"><asp:LinkButton ID="RemoveOverrideButton" runat="server" /></li>
			<li id="SetOverrideItem1" runat="server"><asp:LinkButton ID="SetOverrideButton1" runat="server" /></li>
			<li id="SetOverrideItem2" runat="server"><asp:LinkButton ID="SetOverrideButton2" runat="server" /></li>
			<li id="CancelOverrideItem" runat="server"><asp:LinkButton ID="CancelOverrideButton" runat="server" /></li>
		</ul>

		<common:EmbeddedHyperLink ID="OverrideNoteLink"
				OuterTextKey="" TextKey="MSG_GBK_GRADE_WEIGHTING_METHOD_LOWERCASE" runat="server" />
	</div>
</ContentArea>
</lms:Modal>

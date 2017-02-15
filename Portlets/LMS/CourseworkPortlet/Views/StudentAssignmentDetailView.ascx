<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAssignmentDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.StudentAssignmentDetailView" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="Controls/StudentAssignmentDetails/GeneralAssignmentInfo.ascx" TagName="GeneralAssignmentInfo" TagPrefix="JICS" %>
<%@ Register Src="Controls/StudentAssignmentDetails/OfflineAssignmentDetails.ascx" TagName="OfflineAssignmentDetails" TagPrefix="JICS" %>
<%@ Register Src="Controls/StudentAssignmentDetails/OnlineAssignmentDetails.ascx" TagName="OnlineAssignmentDetails" TagPrefix="JICS" %>
<%@ Register Src="Controls/StudentAssignmentDetails/UploadAssignmentDetails.ascx" TagName="UploadAssignmentDetails" TagPrefix="JICS" %>
<%@ Register Src="Controls/StudentAssignmentDetails/StudentAssignmentInfo.ascx" TagName="StudentAssignmentInfo" TagPrefix="cwk" %>
<%@ Register Src="Controls/DetailHeader.ascx" TagName="Header" TagPrefix="JICS" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="Controls/HistoryModal.ascx" TagName="HistoryModal" TagPrefix="lms" %>
<%@ Register TagPrefix="cwk" Src="Controls/StudentAssignmentDetails/SubmissionNotes.ascx" TagName="Notes"  %>
<%@ Register TagPrefix="cwk" TagName="FeedbackDisplay" Src="../../Common/Controls/FeedbackDisplay.ascx"%>

<JICS:Header runat="server" ID="HeaderNavigation" />
<div class="pSection">
<asp:UpdatePanel ID="_updatePanel" runat="server">
    <ContentTemplate>
	<JICS:GeneralAssignmentInfo runat="server" ID="GeneralAssignmentInfo" />
	<cwk:Notes id="_notes" runat="server" />
</ContentTemplate>
</asp:UpdatePanel>
	<div class="facAssignmentDetailSection">
		<cwk:FeedbackDisplay id="_feedbackDisplay" runat="server" />
	</div >
<asp:UpdatePanel ID="_updatePanelType" runat="server">
    <ContentTemplate>
	<div id="_divHistory" runat="server" class="overrideDisplay overrideHistory">
		<asp:Label ID="_lblHistory" runat="server" />
		<lms:HistoryModal id="_historyModal" runat="server" />
	</div>
	<cwk:StudentAssignmentInfo ID="_stuAssgnInfo" runat="server" />
	<JICS:OfflineAssignmentDetails runat="server" ID="OfflineAssignmentDetails" />
	<JICS:OnlineAssignmentDetails runat="server" ID="OnlineAssignmentDetails"  />
	<JICS:UploadAssignmentDetails runat="server" ID="UploadAssignmentDetails" />
</ContentTemplate>
</asp:UpdatePanel>

</div>
<cmn:Mirror ID="_mirHeaderNavigation" ControlID="HeaderNavigation" runat="server" />
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAssignmentFacultyView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.StudentAssignmentFacultyView" %>
<%@ Register  tagprefix="cwk" src="Controls/DetailHeader.ascx" tagname="Header" %>
<%@ Register  tagprefix="cwk" src="Controls/StudentAssignmentDetails/StudentHeaderNav.ascx" tagname="StudentHeader" %>
<%@ Register TagPrefix="lms" TagName="GradeInput" Src="../../Common/Controls/GradeInput.ascx" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="cwk" TagName="FacOnline" Src="Controls/StudentAssignmentDetails/FacOnline.ascx" %>
<%@ Register TagPrefix="cwk" TagName="FacUpload" Src="Controls/StudentAssignmentDetails/FacUpload.ascx" %>
<%@ Register TagPrefix="cwk" TagName="FeedbackDisplay" Src="../../Common/Controls/FeedbackDisplay.ascx"%>
<%@ Register TagPrefix="cwk" Src="Controls/StudentAssignmentDetails/GeneralAssignmentInfo.ascx" TagName="GeneralAssignmentInfo"  %>
<%@ Register TagPrefix="cwk" Src="Controls/StudentAssignmentDetails/OverrideModals.ascx" TagName="OverrideModals"  %>
<%@ Register TagPrefix="cwk" Src="Controls/StudentAssignmentDetails/SubmissionNotes.ascx" TagName="Notes"  %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="Controls/HistoryModal.ascx" TagName="HistoryModal" TagPrefix="lms" %>
<cwk:Header id="_header" runat="server" />
<cwk:StudentHeader id="_stuHeader" runat="server" />
<div class="pSection">
<asp:UpdatePanel runat="server" ID="_updatePanel">
    <ContentTemplate>
		<div class="facAssignmentDetailSection" >
			<div>
				<div style="float:left;">
					<cwk:GeneralAssignmentInfo runat="server" ID="_generalInfo" />
				</div>
				<div  style="float:left;">
					<framework:PortalImageAndHyperLink id="_phiChangeGrade" runat="server" />
					<br />
					<asp:Panel ID="_panGradeInput" runat="server">
						<lms:GradeInput id="_gradeInput" EnableViewState="false" runat="server" />
					</asp:Panel>
					<asp:Panel ID="_panGradeInfo" CssClass="assignmentGradeInfo" runat="server">
						<asp:Label ID="_lblGradeUser" runat="server" />
						<asp:Label ID="_lblGradeDue" runat="server" />
					</asp:Panel>
				</div>
                <asp:Panel ID="_panGradeVisibility" CssClass="assignmentGradeVisibility" runat="server" />
			</div>
			<div class="facAssignmentDetailSection">
				<cwk:OverrideModals runat="server"  ID="_overrideModals" />
				<asp:Panel ID="_panTime" runat="server" CssClass="overrideDisplay overrideTime">
					<asp:HyperLink id="_hypTime" runat="server" />
					<asp:Label ID="_lblTime" runat="server" />
				</asp:Panel>
				<asp:Panel ID="_panClose" CssClass="overrideDisplay overrideClose" runat="server">
					<asp:LinkButton ID="_lbtnClose" runat="server" />
					<asp:Label ID="_lblClose" runat="server" />
				</asp:Panel>
				<asp:Panel ID="_panReopen" CssClass="overrideDisplay overrideReopen"  runat="server">
					<asp:HyperLink ID="_hypReOpen" runat="server" />
					<asp:Label ID="_lblReopen" runat="server" />
				</asp:Panel>
				<asp:Panel ID="_panRetake" CssClass="overrideDisplay overrideRetake" runat="server">
					<asp:HyperLink ID="_hypRetake" runat="server" />
					<asp:HyperLink ID="_hypReopenAssignment" runat="server" />
					<asp:Label ID="_lblRetake" runat="server" />
				</asp:Panel>

				<asp:Panel ID="_panHistory" runat="server" CssClass="overrideDisplay overrideHistory">
					<asp:Label ID="_lblHistory" runat="server" />
                    <lms:HistoryModal id="_historyModal" runat="server" />
					<asp:Label ID="_lblHistoryMore" runat="server" />
				</asp:Panel>
				<cwk:Notes id="_notes" runat="server" />
			</div>
		</div>
</ContentTemplate>
</asp:UpdatePanel>
	<div class="facAssignmentDetailSection">
		<cwk:FeedbackDisplay id="_feedbackDisplay" runat="server" />
	</div>
<asp:UpdatePanel runat="server" ID="_updatePanelType">
<ContentTemplate>
	<div class="facAssignmentDetailSection">
		<cwk:FacOnline id="_facOnline" runat="server" />
		<cwk:FacUpload id="_facUpload" runat="server" />
	</div>
</ContentTemplate>
</asp:UpdatePanel>
</div>
<cmn:Mirror ID="_mirStuHeader" ControlID="_stuHeader" runat="server" />
<cmn:Mirror ID="_mirHeader" ControlID="_header" runat="server" />
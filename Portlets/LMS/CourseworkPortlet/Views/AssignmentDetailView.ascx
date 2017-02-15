<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignmentDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.AssignmentDetailView" %>
<%@ Register src="Controls/DetailHeader.ascx" tagname="Header" tagprefix="cwk" %>
<%@ Register src="Controls/DetailSubHeader.ascx" tagname="SubHeader" tagprefix="cwk" %>
<%@ Register src="Controls/StudentResultGrid.ascx" tagname="StudentResultGrid" tagprefix="cwk" %>
<%@ Register Src="Controls/ClassWideBonus.ascx" TagName="Bonus" TagPrefix="JICS" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<cwk:Header ID="_header" runat="server" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<cwk:SubHeader ID="_subHeader" runat="server" />
		<div class="pSection">
            <asp:Panel ID="_panSaveFC" runat="server"></asp:Panel>
			<asp:Panel ID="_panNotVisible" CssClass="feedbackMessage notVisible" runat="server">
				<asp:Label ID="_lblNotVisible" runat="server" />
				<asp:Literal ID="_litNotVisibleDetail" runat="server" />
			</asp:Panel>
            <asp:Panel ID="_panManageContent" runat="server">
                <asp:Literal ID="_litManageContent" runat="server" />
            </asp:Panel>
			<asp:HiddenField ID="_hidden" runat="server" />
            <asp:Panel runat="server" ID="_panNoStu" CssClass="noStudents"></asp:Panel>
			<div>
				<div class="studentResults">
					<cwk:StudentResultGrid ID="_stuActive" runat="server" />
                    <asp:LinkButton ID="_lbtnShowNonActiveStudents" CssClass="showHideNonActiveStudents" runat="server" />
					<cwk:StudentResultGrid ID="_stuWithdrawn" runat="server" />
					<cwk:StudentResultGrid ID="_stuGuest" runat="server" />
                    <asp:LinkButton ID="_lbtnHideNonActiveStudents" CssClass="showHideNonActiveStudents" runat="server" />
				</div>
				<div class="studentResultsMeta">
					<asp:Image ID="_imgScore" runat="server" />
					<asp:Literal ID="_litScore" runat="server" />
                    <div class="bonusContainer">
                        <asp:Label ID="_lblBonus" CssClass="bonusDetail" runat="server" />
                        <asp:HyperLink ID="_hypBonus" runat="server" />
                        <JICS:Bonus id="_bonus" runat="server" />
                    </div>
					<asp:Panel ID="_panInstr" CssClass="editGradeInstr" runat="server">
					<asp:Label ID="_lblHowTo" CssClass="howTo" runat="server" />
					<asp:Label ID="_lblEditInfo"  runat="server" />
					<ul>
						<li><asp:Literal ID="_litPoints" runat="server" /></li>
						<li><asp:Literal ID="_litLetter" runat="server" /></li>
						<li><asp:Literal ID="_litPercent" runat="server" /></li>
						<li><asp:Literal ID="_litFull" runat="server" /></li>
					</ul>
					</asp:Panel>
                    <ul ID="_stats" class="stats" runat="server">
                        <li ID="_completedStat" class="completedStat" runat="server" />
                        <li ID="_gradedStat" class="gradedStat" runat="server" />
                        <li ID="_averageStat" class="averageStat" runat="server" />
                        <li ID="_highGradeStat" class="highGradeStat" runat="server" />
                        <li ID="_lowGradeStat" class="lowGradeStat" runat="server" />
                    </ul>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
		<asp:Panel ID="_panAction" CssClass="detailAction" runat="server">
			<div class="buttons">
				<cmn:GlobalizedButton ID="_gbtnSubmit" runat="server" OnClick="GBtnSubmit_Click" />
				&nbsp;
				<cmn:GlobalizedButton ID="_gbtnCancel" runat="server" OnClick="GBtnCancel_Click" />
			</div>
			<div class="detailActionInfo">
				<asp:Image ID="_imgRemember"  runat="server"/>
				<asp:Label Font-Bold="true" ID="_lblRemember" runat="server" />
			</div>
		</asp:Panel>
	</ContentTemplate>
</asp:UpdatePanel>
<cmn:Mirror ID="_mirHeader" ControlID="_header" runat="server" />
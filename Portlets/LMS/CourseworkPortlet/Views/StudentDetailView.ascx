<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.StudentDetailView" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../../Common/Controls/GradeInput.ascx" TagName="GradeInput" TagPrefix="LMS" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register  tagprefix="cwk" src="Controls/StudentPrevNext.ascx" tagname="StudentHeader" %>
<div class="cwkBorderButtonBar top">
    <cwk:StudentHeader id="_stuHeader" runat="server" />
    <framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon" runat="server" />    
</div>
<div class="pSection">
    <div style="width:700px;">
        <div class="studentDetailLinks">
            <div style="padding: 5px 0px 5px 0px;">
                <asp:Label ID="lblYouCanAlsoView" runat="server" Style="padding: 5px 0px 5px 0px;" />
            </div>
            <div style="padding: 5px 0px 5px 0px;">
                <asp:Image ID="imgGradebook" runat="server" />
                <asp:HyperLink ID="lnkGradebook" runat="server">
                    <asp:Label ID="lblGradebook" runat="server" Style="padding: 10px 0px 10px 0px;" />
                </asp:HyperLink>
            </div>
            <div style="padding: 5px 0px 5px 0px;">
                <asp:Image ID="imgAttendance" runat="server" />
                <asp:HyperLink ID="lnkAttendance" runat="server">
                    <asp:Label ID="lblAttendance" runat="server" Style="padding: 5px 0px 5px 0px;" />
                </asp:HyperLink>
            </div>
            <div style="padding: 5px 0px 5px 0px;">
                <asp:Image ID="imgUsageStats" runat="server" />
                <asp:HyperLink ID="lnkUsageStats" runat="server">
                    <asp:Label ID="lblUsageStats" runat="server" Style="padding: 5px 0px 5px 0px;" />
                </asp:HyperLink>
            </div>
        </div>
        <div style="width: 400px;">
            <div style="float: left; margin: 0 10px 10px 0;">
                <asp:Image ID="imgUser" runat="server" />
                <br />
                <div class="iconBar">
                    <div class="myInfoIcon">
				        <framework:MyInfoPopup ID="InfoPopup" HideUserName="true" runat="server" />
			        </div>
			        <div class="mailIcon">
				        <asp:HyperLink ID="MailLink" runat="server">
					        <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/email.png" AlternateTextKey="TXT_EMAIL" runat="server" />
				        </asp:HyperLink>
			        </div>			        
		        </div>
            </div>
            <div style="float: left; margin-bottom: 10px;">
                <asp:Label ID="lblStudentName" runat="server" CssClass="studentDetailStudentName" />
                <br />
				<div id="FinalGradePanel" runat="server">
					<br />
					<asp:Label ID="lblCurrentCourseGrade" runat="server" />
					<br />
					<asp:Label ID="lblGradeDisplay" runat="server" CssClass="studentDetailAssignmentText" />
					<br />
				</div>
                <br />
                <asp:Label ID="lblAssignmentsComplete" runat="server" />
                <br />
                <asp:Label ID="lblAssignmentsCompleteValue" runat="server" CssClass="studentDetailAssignmentText" />
                <asp:Label ID="lblSlash" runat="server" Text="/" CssClass="studentDetailAssignmentText" />
                <asp:Label ID="lblNumberOfTotalAssignments" runat="server" CssClass="studentDetailAssignmentText" />
            </div>
        </div>
    </div>
    <div class="studentDetailUnits">
        <asp:Repeater ID="rptUnits" runat="server">
            <ItemTemplate>
                <asp:Panel ID="panTitle" CssClass="assignmentTitle" runat="server" Style="margin-bottom: 0px;">
                    <asp:Label ID="lblUnitName" CssClass="unitName" runat="server" />
                    <asp:Label ID="lblStatus" CssClass="unitStatus" Visible="false" runat="server" />
                    <asp:Label ID="lblShowHide" CssClass="unitCollapse" Visible="false" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlAssignments" runat="server" CssClass="assignmentView">
                    <asp:Label ID="lblDateRange" runat="server" />
                    <br />
                    <br />
                    <asp:UpdatePanel ID="upAssignments" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdAssignments" runat="server" CssClass="assignmentGrid itemHover"
                                AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"
                                CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" EnableViewState="false">
                                <columns>
                                <asp:TemplateField ItemStyle-Width="15px">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assignment">
                                    <ItemTemplate>
                                        <asp:Image ID="imgFormatIcon" runat="server" />
                                        <asp:HyperLink ID="lnkAssignment" runat="server">
                                            <asp:Label ID="lblName" runat="server" />
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grade" ItemStyle-CssClass="gridGradeColumn">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrade" runat="server" />
                                        <LMS:GradeInput ID="gradeInput" EnableViewState="false" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Completed">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompleted" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="noAssignments">
                        <asp:Label ID="lblNoAssignments" runat="server" Visible="false" />
                    </div>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CourseStatus.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.CourseStatus" %>
<div>
<div class="coOverviewHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
    <div class="coOverviewName"><asp:Label ID="_lblGrade" runat="server" /><br /></div>
    <asp:Label ID="_lblAttendanceTitle" runat="server" /> <asp:Label ID="_lblAttendance" runat="server" /><br />
    <asp:Label ID="_lblCommentTitle" runat="server" /><br />
    <asp:Label ID="_lblComment" runat="server" /> <asp:HyperLink ID="_linkViewComment" runat="server" /> <br />
    <div class="coOverviewLink"><asp:HyperLink ID="_linkViewGradeSheet" runat="server" /> <asp:Image ID="_imgViewGradeSheet" runat="server" /></div>
</div>
<div style="clear: both;"></div>
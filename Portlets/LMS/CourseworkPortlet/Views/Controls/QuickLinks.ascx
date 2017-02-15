<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinks.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuickLinks" %>
<div class="quickLinks">
    <ul class="menu" runat="server" id="_menu">
        <li id="_liAdd" runat="server"  class="addAssignment strongLink"><asp:HyperLink ID="_hypAddAssignment" runat="server" /></li>
        <li id="_liStudent" runat="server" class="student strongLink"> <asp:HyperLink ID="_hypStudentList" runat="server" /></li>
        <li id="_liManage" runat="server" class="manageUnits"><asp:HyperLink ID="_hypManageUnit" runat="server" /></li>
        <li id="_liConfig" runat="server" class="configuration"><asp:HyperLink ID="_hypConfig" runat="server" /></li>
        <li id="_liGradebook" runat="server" class="viewGradebook"><asp:HyperLink ID="_hypGradebook" runat="server" /></li>
    </ul>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NextDueDate.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.NextDueDate" %>
<div>
    <div class="coOverviewHeader"><asp:Label ID="_lblTitle" runat="server" /> </div>
    <div class="coOverviewDateTitle"><asp:Label ID="_lblDueDate" runat="server" /></div>
    <div class="coOverviewName"><asp:Label ID="_lblName" runat="server" /></div>
    <asp:Label ID="_lblType" runat="server" /><br />
    <asp:Label ID="_lblInstrux" runat="server" /><br />
    <div class="coOverviewLink"><asp:HyperLink ID="_linkViewThisAssignment" runat="server" /> <asp:Image ID="_imgViewAssignment" runat="server" /></div>
</div>
<div style="clear:both;"></div>
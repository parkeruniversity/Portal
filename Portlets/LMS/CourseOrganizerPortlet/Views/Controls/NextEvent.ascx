<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NextEvent.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.NextEvent" %>
<div>
    <div class="coOverviewHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
    <div class="coOverviewDateTitle"> <asp:Label ID="_lblDateTime" runat="server" /></div>
    <div class="coOverviewName"><asp:Label ID="_lblEventName" runat="server" /></div>
    <asp:Label ID="_lblEventDetails" runat="server" /><br />
    <div class="coOverviewLink"><asp:HyperLink ID="_linkViewEvent" runat="server" /> <asp:Image ID="_imgViewEvent" runat="server" /></div>
</div>
<div style="clear:both;"></div>
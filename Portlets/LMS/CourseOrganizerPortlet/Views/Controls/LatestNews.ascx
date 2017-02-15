<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestNews.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.LatestNews" %>
<div>
    <div class="coOverviewHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
    <div class="coOverviewDateTitle"><asp:Label ID="_lblDateTime" runat="server" /></div>
    <div class="coOverviewName"><asp:Label ID="_lblNewsTitle" runat="server" /></div>
    <div class="coOverviewByLine"><asp:Label ID="_lblAuthor" runat="server" /></div>
    <asp:Label ID="_lblNewsDetails" runat="server" /><br />
    <div class="coOverviewLink"><asp:HyperLink ID="_linkViewNews" runat="server" /> <asp:Image ID="_imgViewNews" runat="server" /></div>
</div>
<div style="clear: both;"></div>
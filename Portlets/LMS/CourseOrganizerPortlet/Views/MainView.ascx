<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.MainView" %>
<%@ Register TagPrefix="JICS" src="Controls/CourseStatus.ascx" tagname="CourseStatus" %>
<%@ Register TagPrefix="JICS" src="Controls/NextEvent.ascx" tagname="NextEvent" %>
<%@ Register TagPrefix="JICS" src="Controls/LatestNews.ascx" tagname="LatestNews" %>
<%@ Register TagPrefix="JICS" src="Controls/NextDueDate.ascx" tagname="NextDueDate" %>
<%@ Register TagPrefix="JICS" src="Controls/Unit.ascx" tagname="UnitDetails" %>
<%@ Register TagPrefix="JICS" src="Controls/Calendar.ascx" tagname="CalendarDetails" %>
<%@ Register TagPrefix="JICS" src="Controls/Assignments.ascx" tagname="AssignmentsDetails" %>
<%@ Register TagPrefix="JICS" src="Controls/Resources.ascx" tagname="ResourcesDetails" %>
<%@ Register TagPrefix="JICS" src="Controls/Discussion.ascx" tagname="DiscussionDetails" %>

<div class="pSection">
    <asp:HiddenField ID="_hfSectionId" runat="server" />
    <asp:Label ID="_lblErrMsg" runat="server" />
    <div class="coSectionHeader coSectionHeaderOverview" id="_divCourseOverview" runat="server"><asp:Label ID="_lblCourseOverview" runat="server" CssClass="coSectionHeaderText"/><div class="coOverviewArrow"></div></div>
    <div class="coOverviewContainer1" id="_divCourseOverviewContainer" runat="server">
        <div class="coOverviewLeft">
            <div id="_divCourseStatus" class="coOverviewChild coOverviewStatus" runat="server"><JICS:CourseStatus ID="_courseStatusOverview" runat="server" /></div>
            <div class="coOverviewChild coOverviewLastNews" runat="server"><JICS:LatestNews ID="_latestNewsOverview" runat="server" /></div>
        </div>
        <div class="coOverviewRight">
            <div class="coOverviewChild coOverviewNextEvent" runat="server"><JICS:NextEvent ID="_nextEventOverview" runat="server" /></div>
            <div id="_divNextDueDate" class="coOverviewChild coOverviewNextDueDate" runat="server"><JICS:NextDueDate ID="_nextDueDateOverview" runat="server" /></div>
        </div>
    </div>
    <div class="coUnitDetailContainer">        
        <JICS:UnitDetails ID="_unitDetails" runat="server" />
        <JICS:CalendarDetails ID="_calendarDetails" runat="server" />
        <JICS:AssignmentsDetails ID="_assignmentsDetails" runat="server" />
        <JICS:ResourcesDetails ID="_resourcesDetails" runat="server" />
        <JICS:DiscussionDetails ID="_discussionDetails" runat="server" />
    </div> 
</div>
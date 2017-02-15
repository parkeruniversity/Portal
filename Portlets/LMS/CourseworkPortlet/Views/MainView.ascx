<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.MainView" %>
<%@ Register src="Controls/QuickLinks.ascx" tagname="QuickLinks" tagprefix="JICS" %>
<%@ Register src="Controls/GettingStartedDisplay.ascx" tagname="GettingStarted" tagprefix="JICS" %>
<%@ Register src="Controls/Welcome.ascx" tagname="Welcome" tagprefix="JICS" %>
<%@ Register src="Controls/AssignmentView.ascx" tagname="AssignmentView" tagprefix="JICS" %>
<%@ Register src="Controls/RecentActionSubmissionView.ascx" tagname="RecentActionSubmission" tagprefix="JICS" %>
<%@ Register src="Controls/DueNextView.ascx" tagname="DueNextView" tagprefix="JICS" %>
<JICS:Welcome id="_welcome" runat="server" />
<div class="pSection">
	<div class="mainTop">
        <asp:Literal ID="litMsg" runat="server" />
		<div class="mainTopLeft" runat="server" id="_divTopLeft" >
            <JICS:QuickLinks id="_quickLinks" runat="server" />
			<JICS:DueNextView id="_dueNext" runat="server" />
		</div>
		<div class="mainTopRight" runat="server" id="_divTopRight">
			<JICS:GettingStarted id="_gettingStarted" runat="server" />
			<JICS:RecentActionSubmission id="_recentActionSub" runat="server" />
		</div>
	</div>
	<div class="assignmentBody">        
		<JICS:AssignmentView id="_assignmentView" runat="server" />
	</div>
</div>
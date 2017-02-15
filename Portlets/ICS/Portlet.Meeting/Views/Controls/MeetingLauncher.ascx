<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeetingLauncher.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.MeetingLauncher" %>
<%@ Register TagPrefix="jics" TagName="StartMeeting" Src="StartMeeting.ascx" %>
<div id="meetingLauncherMain" class="meetingLauncherMain">
    <span><asp:Label runat="server" ID="lblLaunchText"></asp:Label></span><br />
    <jics:StartMeeting runat="server" ID="startMeeting" Target="_blank"></jics:StartMeeting>
    <asp:Label runat="server" ID="lblFooter"></asp:Label>
</div>

<asp:Repeater ID="ConcurrentMeetingList" runat="server">
    <HeaderTemplate>
        <br />
        <table class="ConcurrentMeetingListTable">
            <tr>
                <td colspan="3" class="headrow">Other Active Meetings</td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="time">
                <asp:Label ID="lblTime" runat="server" /></td>
            <td>
                <asp:HyperLink ID="MeetingInfoLink" runat="server" class="meetingInfoLink"></asp:HyperLink>
              -- 
                <jics:StartMeeting ID="LaunchMeetingLink" runat="server"></jics:StartMeeting></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
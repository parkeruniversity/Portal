<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeetingList.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.MeetingList" %>

<div id="Message" runat="server" class="message"></div>
<asp:Repeater ID="FutureMeetingList" runat="server">
    <HeaderTemplate>
        <table class="MeetingListTable">
            <tr>
                <th colspan="3" class="headrow">Future Meetings</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="time">
                <asp:Label ID="lblTime" runat="server" /></td>
            <td>
                <asp:HyperLink ID="MeetingInfoLink" runat="server" class="meetingInfoLink"></asp:HyperLink></td>
            <td>
                <asp:PlaceHolder ID="WillRecord" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
<asp:Repeater ID="PastMeetingList" runat="server" Visible="False">
    <HeaderTemplate>
        <table class="MeetingListTable">
            <tr>
                <th colspan="3" class="headrow">Past Meetings</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="time">
                <asp:Label ID="lblTime" runat="server" /></td>
            <td>
                <asp:HyperLink ID="MeetingInfoLink" runat="server" class="meetingInfoLink" />
            </td>
            <td>
                <asp:PlaceHolder ID="RecordOrAttend" runat="server" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>

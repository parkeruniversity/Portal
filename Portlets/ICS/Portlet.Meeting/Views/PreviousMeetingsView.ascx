<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PreviousMeetingsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.PreviousMeetingsView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jics" TagName="StartMeeting" Src="Controls/StartMeeting.ascx" %>
<div class="pSection">

    <div>
        <div class="meetingAllPreviousMeetingsContainer">
            <asp:Label runat="server" ID="lblAllPreviousMeetings"></asp:Label>
        </div>
        <div class="meetingBackToListOfMeetingsContainer">
            <asp:HyperLink runat="server" ID="lnkBackToMainScreen" />
        </div>
    </div>
    <br />
    <br />
    <asp:Label runat="server" ID="lblDescription" />

    <div id="divPreviousMeetings" class="meetingsPreviousMeetingsContainer" runat="server">
        <table class="previousMeetingTable">
            <asp:Repeater runat="server" ID="rptPreviousMeetings">
                <ItemTemplate>
                    <tr>
                        <td class="meetingPreviousMeetingsColumn">
                            <asp:Label runat="server" ID="lblStartTime" />
                        </td>
                        <td class="meetingPreviousMeetingsColumn">
                            <asp:HyperLink runat="server" ID="lnkMeeting" />
                        </td>
                        <td class="meetingPreviousMeetingsColumn">
                            <div id="divUserIcon" runat="server" class="meetingUserIconContainer"></div>
                            <asp:Label runat="server" ID="lblYouAttendedThisMeeting" />

                            <div id="divRecorderIcon" runat="server" class="meetingRecorderIconContainer"></div>
                            <jics:StartMeeting runat="server" ID="lnkWatchRecording" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    
    
     <common:Mirror ControlID="lnkBackToMainScreen" runat="server" />
</div>

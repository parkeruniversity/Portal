<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeetingInfoView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.MeetingInfoView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jics" TagName="StartMeeting" Src="Controls/StartMeeting.ascx" %>
<%@ Register TagPrefix="jics" TagName="Emailer" Src="Controls/Emailer.ascx" %>
<%@ Register TagPrefix="jics" TagName="BlogAnnouncement" Src="Controls/BlogAnnouncement.ascx" %>
<%@ Register TagPrefix="jics" TagName="AddToCalendar" Src="Controls/AddToCalendar.ascx" %>
<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<script>
    function confirmMeetingDelete() {
        var message = "<%= DeleteConfirmationMessage%>";
        return confirm(message);
    }
</script>

<div class="pSection meetingInfoView">
    <div class="meetingScreenSection">
        <div class="meetingDetailViewHeader">
            <div class="meetingNameContainer">
                <asp:Label ID="lblName" runat="server" />
            </div>
            <div id="divBackToListOfMeetingsContainer" class="meetingBackToListOfMeetingsContainer" runat="server">
                <asp:HyperLink runat="server" ID="lnkBackToListOfMeetings" />
            </div>
        </div>
    </div>
    <div class="meetingScreenSection">
        <div class="meetingMeetingDetailStartJoinMeetingContainer" id="divStartJoinMeetingContainer" runat="server" visible="False">
            <div id="divStartMeeting" runat="server" visible="False" class="meetingMeetingDetailStartMeetingContainer">
                <asp:HyperLink runat="server" ID="lnkStartMeetingNow" Target="_blank" />
            </div>
            <div id="divJoinMeeting" runat="server" visible="False" class="meetingMeetingDetailJoinMeeting">
                <asp:Label runat="server" ID="lblSessionInProgress" CssClass="meetingSubHeader" />
                <div class="meetingJoinNowLinkContainer">
                    <jics:StartMeeting runat="server" ID="lnkJoinNow" Target="_blank" />
                </div>
            </div>
        </div>
        <div class="meetingStatusContainer">
            <div class="meetingSubHeader">
                <asp:Label runat="server" ID="lblThisMeetingIs" />
            </div>
            <div class="meetingStartTimeDisplay">
                <asp:Label runat="server" ID="lblMeetingTimeDisplay" />
            </div>
            <div id="divStartMeetingNowInstead" class="meetingStartMeetingNowLinkContainer" visible="False" runat="server">
                (<asp:LinkButton runat="server" ID="lnkStartMeetingNowInstead" OnClientClick="window.document.forms[0].target='_blank';" />)
            </div>
            <div id="divComeBack" runat="server" class="meetingMeetingDetailComeBackToJoin" visible="False">
                <asp:Label runat="server" ID="lblComeBackToJoin"></asp:Label>
            </div>
        </div>
        <div id="divEditDeleteMeeting" class="meetingEditDeleteLinkContainer" runat="server">
            <div class="meetingEditLinkContainer">
                <asp:HyperLink runat="server" ID="lnkEdit" CssClass="meetingEditLink" />
            </div>
            <div class="meetingDeleteLinkContainer">
                <asp:HyperLink runat="server" ID="lnkDelete" CssClass="meetingDeleteLink" onclick="return confirmMeetingDelete();" />
            </div>
        </div>
    </div>
    <div>
        <div class="meetingMeetingDetailWatchRecording" id="divWatchRecording" runat="server" visible="False">

            <div>
                <div class="meetingSubHeader">
                    <asp:Label runat="server" ID="lblMeetingWasRecorded" />
                </div>
                <div class="meetingWatchRecodingContainer">
                    <div class="meetingRecorderIconContainerLarge"></div>
                    <jics:StartMeeting runat="server" ID="lnkWatchRecording" Style="vertical-align: middle" />
                </div>
            </div>
        </div>
        <div id="divLetPeopleKnow" class="meetingLetPeopleKnowContainer" runat="server">
            <asp:Label runat="server" ID="lblLetPeopleKnow" CssClass="meetingSubHeader" />
            <div class="meetingEmailAndBlogContainer">
                <div class="meetingLetPeopleKnowEmailCell">
                    <jics:Emailer ID="emlLetPeopleKnowEmailer" runat="server" />
                </div>
                <div class="meetingLetPeopleKnowBlogCell">
                    <jics:BlogAnnouncement ID="blogAnnouncementLetPeopleKnow" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div style="clear: left;"></div>
    <div id="divAttendnace" runat="server" class="meetingScreenSection" visible="False">
        <div class="meetingSubHeader">
            <asp:Label runat="server" ID="lblAttendance" />
        </div>
        <div class="meetingMeetingDetailAttendeesContainer">
            <div id="divAttendees" runat="server" class="meetingMeetingDetailParticpantsContainer">
                <div class="meetingMeetingDetailAttendeeUserIconContainer">
                    <div class="meetingUserIconContainerLarge"></div>
                </div>
                <div class="meetingMeetingDetailSessionParticipantsContainer">
                    <div class="meetingSubHeader">
                        <asp:Label runat="server" ID="lblSessionParticipants"></asp:Label>
                    </div>
                    <asp:Repeater ID="rptAttendees" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:Label ID="lblParticipant" runat="server" />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="divViewers" runat="server" class="meetingMeetingDetailViewersContainer">
                <div class="meetingMeetingDetailAttendeeWatchedRecordingIconContainer">
                    <div class="meetingRecorderIconContainerLarge"></div>
                </div>
                <div class="meetingMeetingDetailViewersListContainer">
                    <div class="meetingSubHeader">
                        <asp:Label runat="server" ID="lblWatchedTheRecording" />
                    </div>
                    <asp:Repeater ID="rptViewers" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:Label ID="lblParticipant" runat="server" />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <div class="meetingSubHeader">
        <asp:Label runat="server" ID="lblDescription" />
    </div>
    <div id="divDescriptionContainer" runat="server">
        <asp:Label runat="server" ID="lblDescriptionValue"></asp:Label>
    </div>
    <div class="meetingScreenSection">
        <div id="divMeetingRecordedAndPasswordStatus" runat="server" class="meetingRecordedAndPasswordStatusContainer">
            <%--<div id="divMeetingRecorded" runat="server" class="meetingRecordedStatusContainer">
                <div class="meetingRecorderIconContainer"></div>
                <asp:Label runat="server" ID="lblMeetingRecorded" />
            </div>--%>
            <div id="divPasswordRequired" runat="server" class="meetingPasswordStatusContainer">
                <div class="meetingPasswordIconContainer"></div>
                <asp:Label runat="server" ID="lblPasswordRequired"></asp:Label>
            </div>
        </div>
    </div>
    <div id="divGetTheWordOut" runat="server" class="meetingGetTheWordOutParent" visible="False">
        <div>
            <span class="text"><asp:Literal runat="server" ID="litGetTheWordOut"></asp:Literal></span>
        </div>
        <div id="divGetWordOutInternal" class="meetingGetTheWordOut">
            <div>
                <div class="meetingGetTheWordOutEmailCell">
                    <jics:Emailer runat="server" id="emlEmailer" />
                </div>
                <div class="meetingGetTheWordOutCalendarCell">
                    <jics:AddToCalendar runat="server" ID="addToCalendar" />
                </div>
                <div class="meetingGetTheWordOutBlogCell">
                    <jics:BlogAnnouncement runat="server" Id="blogAnnouncement" />
                </div>
            </div>
        </div>
    </div>
    <div>
        <common:Mirror ControlID="lnkBackToListOfMeetings" runat="server" />
    </div>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMeetingView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.AdminMeetingView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<script>

    function chkRequirePasswordForRecordingClick() {
        var checkBox = $("#<%=chkRequireMeetingPassword.ClientID%>");
        var isChecked = checkBox.is(":checked");

        var childCheckBox = $("#<%=chkRequirePasswordForRecording.ClientID%>");
        var label = $("#<%=lblRequirePasswordForRecording.ClientID%>");
        var image = $("#divRequirePasswordForRecording");

        if (!isChecked) {
            childCheckBox.prop('checked', false);
            childCheckBox.prop('disabled', true);
            label.addClass("meetingDisabledText");
            image.addClass("meetingRecordingPasswordIconContainerDisabled");

        } else {
            childCheckBox.prop('disabled', false);
            label.removeClass("meetingDisabledText");
            image.removeClass("meetingRecordingPasswordIconContainerDisabled");
            image.addClass("meetingRecordingPasswordIconContainer");
        }
    }

    $(document).ready(function() {
        <% =ForceCheckboxChecks%>  //allows codebehind to force checkbox checks during postback
    });
</script>

<div class="pSection">

    <div class="meetingAdminMeetingDirections">
        <asp:Label runat="server" ID="lblDirections" />
    </div>

    <div id="divForm" class="meetingScreenSection">
        <div class="meetingScreenSection">
            <asp:Label runat="server" ID="lblMeetingName" AssociatedControlID="txtMeetingName" />
            <br />
            <asp:TextBox runat="server" ID="txtMeetingName" Width="300" />
        </div>

        <div id="divDescription" runat="server">
            <asp:Label runat="server" ID="lblDescription" />
            <br />
            <txt:TextEditorControl runat="server" ID="txtDescription" />
        </div>

        <div id="divStartTime" runat="server">
            <asp:Label runat="server" ID="lblStartTime" />
            <br />
            <jics:DatePicker ID="dpStartTime" runat="server" />
        </div>

        <div id="divOptions" class="meetingScreenSection">

            <div class="meetingSubHeader">
                <asp:Label runat="server" ID="lblOptions" />
            </div>

            <div>
                <asp:CheckBox runat="server" ID="chkRecordMeeting" Enabled="False" />
                <div class="meetingRecorderIconContainer"></div>
                <asp:Label runat="server" ID="lblRecordMeeting" AssociatedControlID="chkRecordMeeting" />
            </div>
            <div>
                <asp:CheckBox runat="server" ID="chkRequireMeetingPassword" onclick="chkRequirePasswordForRecordingClick();" />
                <div class="meetingPasswordIconContainer"></div>
                <asp:Label runat="server" ID="lblRequireMeetingPassword" AssociatedControlID="chkRequireMeetingPassword" />
                <asp:Label runat="server" ID="lblMeetingPassowrd" CssClass="screenReaderText" AssociatedControlID="txtMeetingPassword" />
                <asp:TextBox runat="server" ID="txtMeetingPassword" Width="250" />
                <div class="meetingAdminMeetingRequirePasswordForRecordingContainer" ID="divRecordingPasswordContainer" runat="server">
                    <asp:CheckBox runat="server" ID="chkRequirePasswordForRecording" Enabled="False" />
                    <div class="meetingRecordingPasswordIconContainerDisabled" id="divRequirePasswordForRecording"></div>
                    <asp:Label runat="server" ID="lblRequirePasswordForRecording" CssClass="meetingDisabledText" AssociatedControlID="chkRequirePasswordForRecording" />
                </div>
            </div>


        </div>

    </div>

    <div class="meetingNote">
        <asp:Label runat="server" ID="lblPublicizingOptions" Visible="False" />
    </div>

    <div class="meetingSaveCancelButtonContainer">
        <div class="meetingSaveButtonContainer">
            <asp:Button ID="btnSave" runat="server" />
        </div>
        <div class="meetingCancelButtonContainer">
            <asp:HyperLink runat="server" ID="lnkCancel" />
        </div>
    </div>




</div>

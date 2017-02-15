<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StartMeeting.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.StartMeeting" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>
<script>

    $(document).ready(function () {
        $("#<%=NameErrorClientId%>").hide();
        $("#<%=PasswordErrorClientId%>").hide();
        $("#<%=SubmitClientId%>").on("click", function () {
            if ($("#<%=NameClientId%>").val().length == 0) {
                $("#<%=NameErrorClientId%>").show();
            } else if ($("#<%=hdnPw.ClientID%>").val() == 'false') {
                $("#<%=PasswordErrorClientId%>").show();
            } else {
                window.open($(this).attr("href"));
                timeouts.push(setTimeout("location.reload();", 1));
            }
            return false;
        });
        $("#<%=PasswordClientId%>").keydown(function (event) {
            if (event.keyCode == 13) {
                $("#<%=SubmitClientId%>").click();
                return false;
            }
            return true;
        });
        $("#<%=PasswordClientId%>").keyup(function () {

            $.ajax({
                type: "POST",
                url: "Portlets/ICS/Portlet.Meeting/MeetingPortletServices.asmx/checkPassword",
                data: "{password:'" + $("#<%=PasswordClientId%>").val() + "', meetingid:'" + $("#<%=hdnId.ClientID%>").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#<%=hdnPw.ClientID%>").val(data.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    window.alert(err.Message);
                }
            });
            return true;
        });
        $("#<%=NameClientId%>").keydown(function (event) {
            if (event.keyCode == 13) {
                if ($("#<%=hdnPw.ClientID%>").val() == "true") {
                    $("#<%=SubmitClientId%>").click();

                }
                return false;
            }
            return true;
        });

        $("#<%=NameClientId%>").keyup(function () {
            $.ajax({
                type: "POST",
                url: "Portlets/ICS/Portlet.Meeting/MeetingPortletServices.asmx/addGuestName",
                data: "{guestname:'" + $("#<%=NameClientId%>").val() + "', meetingid:'" + $("#<%=hdnId.ClientID%>").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#hdnUN').val(data.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    window.alert(err.Message);
                }
            });
            return true;
        });
    });


</script>

<input type="hidden" id="hdnPw" value="false" runat="server" />
<input type="hidden" id="hdnUN" value="false" />
<input type="hidden" id="hdnId" runat="server" />
<div class="userStartLaunchDiv" runat="server" id="launchDiv">
    <asp:HyperLink runat="server" ID="_openModal">
        <asp:Literal runat="server" ID="litLinkText"></asp:Literal>
    </asp:HyperLink>
</div>

<div class="userStartLaunchDiv" runat="server" id="startDiv">
    <asp:HyperLink runat="server" ID="startMeeting">
        <asp:Literal runat="server" ID="litStartMeeting"></asp:Literal>
    </asp:HyperLink>
</div>

<div runat="server" id="divMeetingFull" Visible="False" class="meetingFull">
    <span>
        <%=Globalizer.GetString("MSG_MEETING_FULL") %>
    </span>
</div>

<JICS:Modal Id="_modal" runat="server" width="500px">
    <contentarea>
        <div class="PasswordMainTextPopup" width="500px"><asp:Literal runat="server" ID="PasswordMainText"></asp:Literal>
            <br />
            <asp:Label runat="server" ID="pwError" style="display: none" CssClass="pwError"></asp:Label>
            <asp:Label runat="server" ID="nameError" style="display: none" CssClass="pwError"></asp:Label>
            <div class="pwBox" runat="server" id="nameBox"><asp:Label runat="server" ID="lblGuestUser" Text="Enter your name:"></asp:Label><br />
            <asp:TextBox runat="server" ID="nameEntry" ></asp:TextBox></div>
            <div  runat="server" id="pwBox">
            <div class="pwImage"><asp:Image runat="server" ID="imgPassword"/></div>
            <div class="pwBox"><asp:Label runat="server" ID="lblPassword" Text="Enter the password:"></asp:Label><br />
            <asp:TextBox runat="server" ID="passwordEntry" TextMode="Password"></asp:TextBox></div></div>
            <div class="pwButton"><asp:HyperLink runat="server" ID="submitPassword" CssClass="PasswordPopupSubmitButton" Target="_blank" /></div>
        </div>
    </contentarea>
</JICS:Modal>
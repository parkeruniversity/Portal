<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LaunchView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.LaunchView" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="javascript">

    $(document).ready(function () {
        $("#<%=hlLaunch.ClientID%>").on("click", function (){
            window.open($("#<%=hdnNextPage.ClientID%>").val());
            window.location.href = $("#<%=hdnMainPage.ClientID%>").val();
        });
        $("#<%=SendId%>").on("click", function () {

            ProcessCheckedRoles();
            var content = $('#<%= BodyId%>').html();
            $.ajax({
                type: "POST",
                url: "Portlets/ICS/Portlet.Meeting/MeetingPortletServices.asmx/sendEmail",
                data: "{selected:'" + rolelist + "', subject:'" + $("#<%=SubjectId%>").val() + "', body:'" + content + "', portletid:'" + $("#<%=hdnPID.ClientID%>").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.open($("#<%=hdnNextPage.ClientID%>").val());
                    window.location.href = $("#<%=hdnMainPage.ClientID%>").val();
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    window.alert(err.Message);
                }
            });
            // $.modal.close();
        });

        function ProcessCheckedRoles() {
            var checkboxes = $('#<%=cblGlobalId %>').find('input:checkbox');
            checkboxes.each(function () {
                var selectedIndex = checkboxes.index($(this));
                if (this.checked) {
                    rolelist += "G|" + selectedIndex + "*";
                }
            });

            var contextcheckboxes = $('#<%=cblContextId %>').find('input:checkbox');
            contextcheckboxes.each(function () {
                var selectedIndex = contextcheckboxes.index($(this));
                if (this.checked) {
                    rolelist += "C|" + selectedIndex + "*";
                }
            });
        }
        var rolelist = "";
        EnableDisableButton("disable");
    });
    function EnableDisableButton(enable) {
        if (enable == "disable") {
            $("#<%=SendId%>").prop('disabled', true);
        } else {
            $("#<%=SendId%>").prop('disabled', false);
        }
    }

    function CheckForEnabling() {
        var enable = "disable";
        var checkboxes = $('#<%=cblGlobalId %>').find('input:checkbox');
            checkboxes.each(function () {
                if (this.checked && enable == "disable") {
                    enable = "enable";
                }
            });
            var contextcheckboxes = $('#<%=cblContextId %>').find('input:checkbox');
            contextcheckboxes.each(function () {
                if (this.checked && enable == "disable") {
                    enable = "enable";
                }
            });
            EnableDisableButton(enable);
        }
</script>
<asp:HiddenField runat="server" ID="hdnPID" />
<asp:HiddenField runat="server" ID="hdnNextPage"/>
<asp:HiddenField runat="server" ID="hdnMainPage"/>
        <div class="butWaitHeaderText"><asp:Literal runat="server" ID="litButWaitHeaderText"></asp:Literal></div>
        <div id="topLinks" class="butWaitTopLinks">
            <div id="launchLink" class="butWaitLaunch"><asp:HyperLink runat="server" ID="hlLaunch"></asp:HyperLink></div>
            <div id="cancelLink" class="butWaitCancel"><asp:HyperLink runat="server" ID="hlCancel"></asp:HyperLink></div>
        </div>
        <div id="waitText" class="butWaitText">
            <asp:Literal runat="server" ID="litButWaitText"></asp:Literal>
        </div>
                <div class="butWaitPopup">
                <div class="butWaitMainText"><asp:Image runat="server" ID="imgEmailMain"/><asp:Literal runat="server" ID="EmailerMainText"></asp:Literal></div>
                <div class="butWaitRecipList">
                    <div id="contextRoles" runat="server" class="butWaitContextRoles">
                        <span>To members of  <asp:Literal runat="server" ID="litMemberOf"></asp:Literal>: <br /></span>
                        <asp:CheckBoxList runat="server" ID="cblContextRoles"></asp:CheckBoxList>
                    </div>
                    <div id="globalRoles" runat="server">
                        <span>To bigger groups:<br /></span>
                        <asp:CheckBoxList runat="server" ID="cblGlobalRoles">
                        </asp:CheckBoxList>
                    </div>
                </div>
                    <div class="butWaitHelpInfo"><asp:Literal runat="server" ID="helpInfo"></asp:Literal></div>
                    <div class="butWaitSubject">Subject<br /><asp:TextBox runat="server" Width="650" ID="tbSubject"></asp:TextBox></div>
                    <div class="butWaitBody">Body<br /><txt:TextEditorControl runat="server" ID="tbBody"></txt:TextEditorControl></div>
                <div id="divSendMail">
                    <asp:Literal runat="server" ID="litSendEmailText"></asp:Literal><br/>
                    <asp:Button runat="server" ID="sendEmail" OnClientClick="return false"/>
                </div>
            </div>
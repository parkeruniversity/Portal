<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Emailer.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.Emailer" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>

<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script language="javascript">

    $(document).ready(function () {
        $("#<%=SendId%>").on("click", function () {


            ProcessCheckedRoles();
            //Javascript specific to CuteEditor to get email body.  If changing to TinyMCE, adjust this code appropriatly.
            var content = $('#<%= BodyId%>').html();
            $.ajax({
                type: "POST",
                url: "Portlets/ICS/Portlet.Meeting/MeetingPortletServices.asmx/sendEmail",
                data: "{selected:'" + rolelist + "', subject:'" + $("#<%=SubjectId%>").val() + "', body:'" + content + "', portletid:'" + $("#<%=hdnPID.ClientID%>").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //window.alert(data.d);
                    <%=CloseModal %>
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    window.alert(err.Message);
                }
            });
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




<div class="emailerLinkDiv">
    <div class="emailerLinkImage">
        <asp:Image runat="server" ID="imgLinkImage" />
    </div>

    <div class="emailerLinkTextDiv">
        <asp:HyperLink runat="server" ID="_openModal">
            <asp:Literal runat="server" ID="litLinkText"></asp:Literal>
        </asp:HyperLink>
    </div>
</div>

<JICS:Modal Id="_modal" runat="server">
    <contentarea>
                <div class="EmailerPopup">
                <div class="emailerMainText">
                    <asp:Image runat="server" ID="imgEmailMain"/>
                    <asp:Literal runat="server" ID="EmailerMainText" />
                </div>
                <div class="emailerRecipList">
                    <div id="contextRoles" runat="server" class="emailerContextRoles">
                        <span>To members of <asp:Literal runat="server" ID="litMemberOf"></asp:Literal> <br /></span>
                        <asp:CheckBoxList runat="server" ID="cblContextRoles">
                            </asp:CheckBoxList>
                    </div>
                    <div id="globalRoles" runat="server">
                        <span>To bigger groups:<br /></span>
                        <asp:CheckBoxList runat="server" ID="cblGlobalRoles">
                        </asp:CheckBoxList>
                    </div>
                    

                </div>
                <div class="emailerHelpInfo"><asp:Literal runat="server" ID="helpInfo"></asp:Literal></div>
                <div class="emailerSubject"><asp:Label runat="server" AssociatedControlID="tbSubject">Subject</asp:Label><br /><asp:TextBox runat="server" Width="650" ID="tbSubject"></asp:TextBox></div>
                <div class="emailerBody">Body<br /><txt:TextEditorControl runat="server" Width="650px" Height="150px" ID="tbBody"></txt:TextEditorControl></div>
                </div>
                    <div id="adminButtons" class="emailerButtons" runat="server">
                        <div id="divSendMail" class="emailerSendMail">
                            <asp:Literal runat="server" ID="litSendEmailText" />
                            <asp:Button runat="server" ID="sendEmail" OnClientClick="return false"/>
                        </div>
                        <div id="dontsend" class="emailerCancelMail">
                            <asp:HyperLink runat="server" ID="hlCancel"></asp:HyperLink>
                        </div>
                    </div>
    </contentarea>
</JICS:Modal>
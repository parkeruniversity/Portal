<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Modal.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.Modal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<script type="text/javascript">

    var timeouts = [];

    function blockReload() {
        for (var i = 0; i < timeouts.length; i++) {
            clearTimeout(timeouts[i]);
        }
    }
    function resetReload() {
        if (timeouts.length > 0)
            timeouts.push(setTimeout("location.reload();", 60000));
    }
</script>
<ajax:ModalPopupExtender ID="_modalPopup" runat="server" BackgroundCssClass="modalPopup" PopupControlID="_divModal">
    <Animations>
        <OnShown>
            <ScriptAction Script="blockReload();" />  
        </OnShown>
        <OnHiding>
            <ScriptAction Script="resetReload();" />  
        </OnHiding>
    </Animations>
</ajax:ModalPopupExtender>

<div id="_divModal" runat="server" class="modalDiv" style="display: none;">
    <div id="innerModal" runat="server">
        <asp:Panel runat="server" DefaultButton="">
        <div class="modalHeading">
            <asp:Image ID="_imgClose" class="modalHeadingImg" AlternateText="Close Modal" runat="server" />
            <asp:Label ID="_lblHeading" runat="server" />
        </div>

        <asp:PlaceHolder ID="_phContent" runat="server" />

        <div class="modalButtons" id="_divButtons" runat="server">
            <asp:Button ID="_btnSave" runat="server" type="button"/>
            <asp:Button ID="_btnCancel" runat="server" UseSubmitBehavior="false" CssClass="cancelButton" type="button"/>
        </div>
            </asp:Panel>
    </div>
</div>

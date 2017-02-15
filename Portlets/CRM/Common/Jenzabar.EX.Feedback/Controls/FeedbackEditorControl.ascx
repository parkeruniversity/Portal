<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackEditorControl.ascx.cs"
    Inherits="Jenzabar.EX.Feedback.FeedbackEditorControl" EnableViewState="false" %>
<%@ Import Namespace="Jenzabar.EX.Feedback" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<div class="feedbackContainer">
    <span id="_spanAddLink" runat="server">
        <asp:Image ID="_imgAddComment" CssClass="feedbackLinkImage" runat="server"
            AlternateText="Add a comment" />
        <asp:HyperLink ID="_hypAdd" Text="Add a comment" CssClass="feedbackLink" runat="server" />
    </span>
    <asp:Panel ID="_feedbackEditorContainer" CssClass="feedbackEditorContainer" runat="server">

        <ajaxToolkit:ModalPopupExtender ID="FeedbackEditorPopup" runat="server" TargetControlID="_hypAdd"
            PopupControlID="_divFeedbackModal" PopupDragHandleControlID="FeedbackModalHeader"
            BackgroundCssClass="FBModalPopup" />

        <div id="_divFeedbackModal" runat="server" class="FBModalDiv" style="display: none;">
            <div class="FBInnerModal">
                <div id="FeedbackModalHeader" class="FBModalHeading">
                    <asp:ImageButton ID="_imgFeedbackClose" CssClass="FBModalHeadingImg" runat="server" />
                    <asp:Label ID="_lblFeedbackName" CssClass="FBHeaderText" Text="Enter a Comment" runat="server" />
                </div>
               
			    <div class="feedbackEditor">
                    <asp:TextBox ID="_editor" MaxLength="1000" TextMode="MultiLine"
                        CssClass="FBStretch" runat="server" Rows="10" />
                    <br />
                    <div class="FBFloatRight">
                    <asp:Label ID="_commentLength" Text="0" CssClass="FBInformativeText"
                        runat="server" /><span class="FBInformativeText">/1000</span>
                    </div>
			    </div>

                <div class="FBModalButtons">
                    <asp:Button ID="_btnSave" Text="Save" runat="server" />
                    <asp:Button ID="_btnCancel" Text="Cancel" runat="server" UseSubmitBehavior="false" />
                </div>
            </div>
        </div>
    </asp:Panel>
</div>

<script language="javascript" type="text/javascript">
    function CharCounter(txtText, lblLengthID) {
        var lblLength = document.getElementById(lblLengthID);
        lblLength.innerText = txtText.value.length;
        lblLength.innerHTML = txtText.value.length;
    }

    var clientid;
    function fnSetFocus(txtClientId) {
        clientid = txtClientId;
        setTimeout("fnFocus()", 1000);

    }

    function fnFocus() {
        eval("document.getElementById('" + clientid + "').focus()");
    }
</script>

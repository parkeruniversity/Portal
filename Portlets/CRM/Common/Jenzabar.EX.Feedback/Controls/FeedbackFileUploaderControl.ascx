<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackFileUploaderControl.ascx.cs"
    Inherits="Jenzabar.EX.Feedback.FeedbackFileUploaderControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>


<div class="feedbackContainer">
    <table>
        <tr>
            <td class="feedbackTable">
                <span id="_spanAddLink" runat="server">
                    <asp:Image ID="_imgAddAttachment" CssClass="feedbackLinkImage" runat="server" AlternateText="Add a file" />
                    <asp:LinkButton ID="_hypAddAttachment" Text="Add a file" 
                        CssClass="feedbackLink" runat="server" />
                </span>
                <span id="_spanAddText" runat="server" visible="false">
                    <asp:TextBox id="txtData" runat="server" TextMode="MultiLine" Width="600" Height="100" />
                    <jenzabar:GlobalizedButton id="gbtnTextSave" runat="server" TextKey="TXT_SAVE" OnClick="gbtnTextSave_Click" />
                </span>
            </td>
            <td class="feedbackTable">
                <span id="_spanToggle" runat="server" visible="false">
                    <jenzabar:GlobalizedLinkButton ID="glnkEntryMethod" runat="server" TextKey="TXT_EA_ENTER_AS_TEXT" OnCommand="glnkEntryMethod_Command" />
                </span>
            </td>
        </tr>
    </table>
</div>
<div style="position: fixed; left: 0; top: 0;">
<asp:Panel ID="_feedbackEditorContainer" CssClass="feedbackEditorContainer" runat="server">
        <asp:Button ID="dummyButton" runat="server" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="FeedbackFileUploaderPopup" runat="server" PopupControlID="_divFeedbackModal"
            TargetControlID="dummyButton" PopupDragHandleControlID="FeedbackFileUploaderModalHeader"
            CancelControlID="_btnCancel" BackgroundCssClass="FBModalPopup" />
        <div id="_divFeedbackModal" runat="server" class="FBModalDiv" style="display: none;">
            <div class="FBInnerModal">
                <div id="FeedbackFileUploaderModalHeader" class="FBModalHeading">
                    <asp:ImageButton ID="_imgFeedbackClose"
                        CssClass="FBModalHeadingImg" runat="server" />
                    <asp:Label ID="_lblFeedbackName" CssClass="FBHeaderText" Text="Upload a File"
                        runat="server" />
                </div>
                <div class="feedbackEditor">
                    <table>
                        <tr>
                            <td valign="top" align="right">
                                File
                            </td>
                            <td>
                                <ajaxToolkit:AsyncFileUpload ID="_uploader" CssClass="FBModalWidth" OnUploadedComplete="Save_UploadedComplete"
                                    CompleteBackColor="White" ThrobberID="myThrobber" runat="server" />                                
                            </td>
                            <td>
                                <asp:Label runat="server" ID="myThrobber" Style="display: none;">
                                    <asp:Image ID="imgLoading" runat="server" />
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="UploadStatusLabel" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </asp:Panel>
</div>

<input type="hidden" id="hiddenIsUploading" runat="server" />
<input type="hidden" id="hiddenAttachmentUseCde" runat="server" />
<input type="hidden" id="hiddenValidFileExtensions" runat="server" />

<script type="text/javascript">

function _hypAddAttachment_Click(popupClientID, isUploadingClientID)
{
        $find('FeedbackFileUploaderPopupBehaviorID' + popupClientID).show();
        document.getElementById(isUploadingClientID).value = true;
        return false;
}

    function uploadError(sender,args)
    {
        var text = document.getElementById("<%= UploadStatusLabel.ClientID %>");
        text.innerHTML = args.get_errorMessage();
    }

    function uploadComplete<%=_uploader.ClientID%>(sender, args)
    {     
        var AsyncFileUpload = $get("<%=_uploader.ClientID%>");
        var txts = AsyncFileUpload.getElementsByTagName("input");
        for (var i = 0; i < txts.length; i++) {
            if (txts[i].type == "file") {
                txts[i].style.backgroundColor = "transparent";
                txts[i].form.reset();
            }
        }            
        
        if(document.getElementById("<%= upFeedbackListClientID %>") != null)
        {
            document.getElementById("<%= upFeedbackListClientID %>").click();
        }

        if(document.getElementById("<%= UploadStatusLabel.ClientID %>") != null)
        {
           var UploadStatusLabel = document.getElementById("<%= UploadStatusLabel.ClientID %>").innerHTML;
           if(UploadStatusLabel.length > 0)
           {
               // sender._onError(UploadStatusLabel); // it will raise the OnClientUploadError event
                return false;
           }
        }

        document.getElementById("<%= hiddenIsUploadingClientID %>").value = false;

        $find('FeedbackFileUploaderPopupBehaviorID<%=_uploader.ClientID%>').hide();
        
         return false;
     }

</script>
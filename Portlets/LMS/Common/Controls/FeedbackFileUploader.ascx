<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackFileUploader.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.FeedbackFileUploader" EnableTheming="false" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<script type="text/javascript" language="javascript">
    function ClearUploadFileLabel<%=ClientID %>() {
        var fileUploader = document.getElementById('uploaderContainer<%= ClientID %>');

        $('#<%= LabelTextBox %>').val("");
        fileUploader.innerHTML = fileUploader.innerHTML;
    }
</script>
<div class="feedbackContainer">
    <span id="_spanAddLink" runat="server">
        <asp:Image id="_imgFeedback" CssClass="feedbackLinkImage" runat="server" />
	    <asp:HyperLink ID="_hypAdd" CssClass="feedbackLink" runat="server" />
    </span>
	<lms:Modal id="_modal" runat="server">
		<ContentArea>
            <div class="pSection">
                <div id="_error" runat="server" class="ValidationError" visible="false">
                    <%= Globalizer.GetString("MSG_CWK_FEEDBACK_FILE_REQUIRED")%>
                </div>
                <table>
                    <tr>
                        <td valign="top" align="right">
                            <%= Globalizer.GetString("LBL_FILE") %>
                        </td>
                        <td>
							<div id="uploaderContainer<%= ClientID %>">
								<asp:FileUpload ID="_uploader" CssClass="fileUploader" runat="server" />
							</div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <%= Globalizer.GetLabel("TXT_LABEL") %>
                        </td>
                        <td>
                            <asp:TextBox ID="_fileLabel" MaxLength="100" Width="210" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
		</ContentArea>
	</lms:Modal>
    <asp:HiddenField id="_id" runat="server" />
</div>
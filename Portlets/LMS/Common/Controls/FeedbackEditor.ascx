<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackEditor.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.FeedbackEditor" EnableViewState="false" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="feedbackContainer">
    <span id="_spanAddLink" runat="server">
        <asp:Image id="_imgFeedback" CssClass="feedbackLinkImage" runat="server" />
	    <asp:HyperLink ID="_hypAdd" CssClass="feedbackLink" runat="server" />
    </span>
    <asp:Panel ID="_feedbackEditorContainer" CssClass="feedbackEditorContainer" runat="server">
	    <lms:Modal id="_modal" runat="server">
		    <ContentArea>
			    <div class="feedbackEditor">
                    <div id="_error" runat="server" class="ValidationError" visible="false">
                        <%= Globalizer.GetString("MSG_CWK_FEEDBACK_COMMENT_REQUIRED") %>
                    </div>
				    <cmn:TextBoxEditor id="_editor" Rows="10" runat="server" />
				    <div>
					    <asp:LinkButton ID="_lbtnClear" runat="server" />
				    </div>
			    </div>
		    </ContentArea>
	    </lms:Modal>
        <asp:HiddenField id="_id" runat="server" />
        <input type="hidden" id="feedbackTextHolder" />
        <script type="text/javascript">
            var feedbackEditorPointer;

            function showFeedbackModal(id) {
                $("#<%= _id.ClientID %>").val(id);
                $find('<%= _modal.UniqueID %>').show(); // must be uniqueid for modal to work!
                var text = $("body").find("[<%=FEEDBACK_TEXT_CLIENTSIDE_ATTRIBUTE%>='" + id + "']").html();
                // show clear link if there is text and not an assignment id
                if(text != null  && (id.length < 20 || !id.match(/0$/))){
                    $("#<%= _modal.ClientID %>__lbtnClear").removeAttr("style");
                }
                else
                {
                    $("#<%= _modal.ClientID %>__lbtnClear").attr("style", "display:none;");
                }
                if (feedbackEditorPointer) {
                    feedbackEditorPointer.SetHTML(text);
                }
                else {
                    $("#feedbackTextHolder").val(text);
                }
            }
        </script>
    </asp:Panel>
</div>
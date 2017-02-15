<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AsyncFileUpload.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.FileUploader.AsyncFileUpload" %>
<%@ Register src="../UploaderJS.ascx" tagname="UploadJS" tagprefix="jics" %>

<jics:UploadJS ID="_js" runat="server" />

<asp:PlaceHolder ID="_phScript" runat="server">
    <script type="text/javascript">
        addLoadEvent(LoadSWFFileUploadValues<%=this.Instance%>); //defined in jenz.js
        var swfuFile<%=this.Instance%>;
        
        function LoadSWFFileUploadValues<%=this.Instance%>(deleteCtrl) {
            return;    }
	</script>
</asp:PlaceHolder>
<asp:PlaceHolder ID="_phFileUpload" runat="server">
	<!--<asp:LinkButton ID="_lbtnFileDelete" runat="server" OnClick="_lbtnFileDelete_Click" />-->
<%--    <asp:FileUpload ID="UploadFiles" runat="server" AllowMultiple="true" CssClass="upload-files-button" />--%>
    <div id="swfu_container">
        <div id="_divFileErrorMsg" runat="server" class="feedbackError" style="display:none;"></div>
            <div>
				<div id="degraded_file_div<%=this.Instance%>">
				    <asp:FileUpload ID="_fupDegraded" runat="server" AllowMultiple="true" CssClass="upload-files-button" />
                    <asp:Label runat="server" AssociatedControlID="_fupDegraded" CssClass="screenReaderText">Add chosen files to post</asp:Label>
                    <asp:Button ID="_btnUploadDegraded" runat="server" OnClick="_btnUploadDegraded_Click" UseSubmitBehavior="true" />
                </div>
			</div>
            <div id="fileContainer<%=this.Instance%>">
                <asp:Panel ID="_panFiles" runat="server" />
            </div>
	      <div style="clear:both;"></div>
    </div>
</asp:PlaceHolder>
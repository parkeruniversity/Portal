<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="UploaderJS.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.UploaderJS" %>

<asp:PlaceHolder ID="_phScripts" runat="server">
    <script type="text/javascript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/SWFUpload/handlers.js") %>"></script>  
    <script type="text/javascript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/SWFUpload/swfupload.js") %>"></script>
    <script type="text/javascript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/SWFUpload/Plugins/swfupload.swfobject.js") %>"></script>
</asp:PlaceHolder>
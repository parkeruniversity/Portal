<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminPageIntroductionView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.AdminPageIntroductionView" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.ImageUploader"
    Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>


<div id="Header">
    
</div>
<div class="pSection">
    <div class="controlContainer">
        <asp:Label ID="InstructionsLabel" runat="server" />
    </div>
    <div id="TextEdit">
        <txt:TextEditorControl runat="server" ID="textEditor" />
        
        <div class="meetingFileUploaderContainer">
        <asp:PlaceHolder ID="FileUploaderPlaceHolder" runat="server" />
        </div>
        
           <div id="Buttons" class="meetingSaveCancelButtonContainer">
            <div id="SaveButtonBox" class="meetingSaveButtonContainer">
                <asp:Button ID="SaveButton" runat="server" />
            </div>
            <div id="CancelButtonBox" class="meetingCancelButtonContainer">
                <asp:Button ID="CancelButton" runat="server" />
                <div class="meetingClearThisIntroductionLinkButtonContainer">
                <asp:LinkButton ID="ClearThisIntroductionLinkButton" runat="server" CssClass="meetingDeleteLink" />
                </div>
            </div>
        </div>
        
        
    </div>
</div>
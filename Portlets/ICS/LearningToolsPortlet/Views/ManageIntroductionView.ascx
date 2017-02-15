<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageIntroductionView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.ManageIntroductionView" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Portal.Web.UI.Controls.AsyncUploader.ImageUploader"
    Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<div id="Header">
    
</div>
<div class="pSection">
    <div class="controlContainer">
        <asp:Label ID="InstructionsLabel" runat="server" />
    </div>
    <div id="TextEdit">
        <jics:TextEditor id="_textEditorDescription" runat="server" />
        <div class="controlContainer">
        <asp:PlaceHolder ID="FileUploaderPlaceHolder" runat="server" />
        </div>
        
        <div id="Buttons" class="saveCancelButtonContainer">
            <div id="SaveButtonBox" class="saveButtonContainer">
                <asp:Button ID="SaveButton" runat="server" />
            </div>
            <div id="CancelButtonBox" class="cancelButtonContainer">
                <asp:Button ID="CancelButton" runat="server" />
                <div class="clearThisIntroductionLinkButtonContainer">
                <asp:LinkButton ID="ClearThisIntroductionLinkButton" runat="server" CssClass="deleteLink" />
                </div>
            </div>
        </div>
    </div>
</div>

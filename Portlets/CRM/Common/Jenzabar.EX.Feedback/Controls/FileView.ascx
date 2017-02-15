<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileView.ascx.cs" Inherits="Jenzabar.EX.Feedback.FileView" %>
<link rel='stylesheet' type='text/css' href='<%= Page.ResolveUrl("./Portlets/CRM/Common/Jenzabar.EX.Feedback/FBStyle.css")%>' />
<%@ Import Namespace="Jenzabar.EX.Feedback" %>
<%@ Register TagPrefix="ex" TagName="FeedbackFileUploaderControl" Src="FeedbackFileUploaderControl.ascx" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<input type="hidden" name="AllowPostback" value="true" />

<div class="fdbkText">
    <div id="_fileContainer" runat="server">
        
        <asp:UpdatePanel ID="upFile" ChildrenAsTriggers="false" UpdateMode="Conditional"
            runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="HiddenFeedbackListButton" />
            </Triggers>
            <ContentTemplate>
                <ex:FeedbackFileUploaderControl ID="_feedbackFileUploader" runat="server" />
                <span id="_File" runat="server">
                    <asp:HyperLink ID="openFileLink" CssClass="imageAndText" runat="server" >
                        <asp:Image ImageUrl='<%# Page.ResolveUrl(FBConstants.IconsPath + FBConstants.IconFile) %>'
                                runat="server" Visible="false" />
                        <asp:Label ID="FileName"  runat="server"/>
                    </asp:HyperLink>
                    <br />
                    <asp:Label ID="FileTimestamp"  runat="server"/>
                    <asp:ImageButton ID="DeleteFile" runat="server" ImageUrl='<%# Page.ResolveUrl(FBConstants.IconsPath + FBConstants.IconDelete) %>' />
                </span>
                <cmn:GlobalizedLabel ID="lblNoneSubmitted" runat="server" TextKey="TXT_CM_FILEVIEW_NONE_SUBMITTED" Visible="false" />
                <asp:Button ID="HiddenFeedbackListButton" CommandName="Refresh" CommandArgument="<%# AttachmentGOID %>"
                    Style="display: none;" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<input type="hidden" id="hiddenAttachmentGOID" runat="server" />
<input type="hidden" id="hiddenAttachmentTypeCde" runat="server" />
<input type="hidden" id="hiddenAttachmentUseCde" runat="server" />

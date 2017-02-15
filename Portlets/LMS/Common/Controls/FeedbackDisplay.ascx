<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.FeedbackDisplay" EnableViewState="false" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jics" TagName="FeedbackEditor" Src="FeedbackEditor.ascx" %>
<%@ Register TagPrefix="jics" TagName="FeedbackFileUploader" Src="FeedbackFileUploader.ascx" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<input type="hidden" name="AllowPostback" value="true" />
<asp:Repeater ID="_feedback" runat="server">
    <HeaderTemplate>
        <div class="feedbackDisplayList">
    </HeaderTemplate>
    <ItemTemplate>
        <asp:Literal ID="_entry" runat="server" />
        <jics:FeedbackEditor id="_edit" runat="server" />
        <jics:PortalImageButton ID="_delete" ImageCategory="PortletIcon" ImageUrl="delete.gif" runat="server" />
        </div></div>
    </ItemTemplate>
    <FooterTemplate>
            </div>
        </div>
    </FooterTemplate>
</asp:Repeater>
<asp:Literal ID="_noFeedback" runat="server" />
<div class="fdbkText <asp:Literal ID="_noFeedbackCssClass" runat="server">noFeedback</asp:Literal>">
    <div id="_editorContainer" runat="server">
        <jics:FeedbackEditor id="_feedbackEditor" ShowFeedbackLinkText="true" runat="server" />
        <span class="spacer"></span>
        <jics:FeedbackFileUploader id="_feedbackFileUploader" runat="server" />
    </div>
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.PostView" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/Subscribe.ascx" tagname="Subscribe" tagprefix="JICS" %>
<%@ Register src="Controls/ViewOption.ascx" tagname="ViewOption" tagprefix="JICS" %>
<%@ Register src="Controls/PostAndReplyView.ascx" tagname="PostAndReplyView" tagprefix="JICS" %>
<%@ Register src="Controls/SinglePostView.ascx" tagname="SinglePostView" tagprefix="JICS" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>

<script type="text/javascript" language="javascript">

    //This code makes the text editor work properly in UpdatePanels and Modals.

    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
        $('.managePostContainer .postEntry').hide();
        $('.managePostContainer .postEntry textarea').each(function () {
            textEditor.destroy($(this));
        });
    });

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        $('.managePostContainer .postEntry textarea').each(function () {
            textEditor.create($(this));
        });
    });
</script>

<asp:PlaceHolder ID="_phFileUploader" runat="server" />

<asp:UpdatePanel ID="_upErr" runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="_phErr" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<div style="margin:10px;">
    <asp:Panel ID="_panContainer" runat="server">
        <asp:Panel ID="_panHiddenInfo" runat="server" CssClass="hiddenInfo">
            <asp:Label ID="_lblHiddenInfo" runat="server" />
            <asp:HyperLink ID="_hypHidden" runat="server" />
            <asp:LinkButton ID="_lbtnHidden" runat="server" />
            <fwk:Modal Id="_modalHidden" runat="server">
                <ContentArea>
                    <div style="margin-left:15px;">
                        <asp:DropDownList ID="_ddlHidden" runat="server" />
                    </div>
                </ContentArea>
            </fwk:Modal>
        </asp:Panel>
            <div id="_divAssignmentInstrux" runat="server" class="threadAssignmentInstrux">
                <asp:Label ID="_lblAssignmentInstrux" runat="server" />
                <br/><br/>
            </div>
            <div class="navHeader">
                <div class="nextItem"><asp:PlaceHolder ID="_phNext" runat="server" /></div>
                <JICS:Subscribe id="_subscribe" runat="server" />
                <JICS:ViewOption id="_viewOption" runat="server" />
                <div class="previousItem"><asp:PlaceHolder ID="_phPrevious" runat="server" /></div>
                <asp:Label ID="_lblOrigSubject" CssClass="navTitle" runat="server" />
                <asp:Label ID="_lblNumReplies" CssClass="navSubTitle" runat="server" />
            </div>
            <JICS:PostAndReplyView id="_postReplyView" runat="server" Visible="false" />
            <JICS:SinglePostView id="_singleView" runat="server" Visible="false" />
            <asp:Panel ID="_panMessage" CssClass="feedbackMessage postMessage" runat="server" Visible="false">
                <asp:Label ID="_lblMessage" CssClass="messageTitle" runat="server" />
                <asp:Label ID="_lblMessageInfo" runat="server" />
            </asp:Panel>
    </asp:Panel>
    <cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
    <div class="legendBox">
            <span class="originalPost legendBox"></span> <asp:Label ID="_lblOrigPost" runat="server" />
            <span id="_spanUnread" runat="server"></span> <asp:Label ID="_lblNew" runat="server" />
    </div>
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPostSection.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.EditPostSection" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<%@ Register TagPrefix="JICS" assembly="Portlet.Forum" namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls" %>

<asp:Panel id="_panEditPost" runat="server" CssClass="editPostSection">
    <asp:Panel ID="_panRestrictionMessage" CssClass="messageRestrict" runat="server">
        <asp:Label ID="_lblRestriction" runat="server" />
    </asp:Panel>
    <asp:Panel ID="_panEditContainer" runat="server">
        <asp:Panel ID="_panDisplay" runat="server" CssClass="editPostDisplay">
            <asp:Image ID="_imgDisplay" runat="server" />
            <asp:Label ID="_lblDisplay" runat="server" />
            <asp:LinkButton ID="_lbtnDisplay" runat="server" />
        </asp:Panel>
        <asp:Image ID="_imgApprove" runat="server" /><asp:LinkButton ID="_lbtnApprove" runat="server" />
        <asp:Image ID="_imgComment" runat="server" /><asp:LinkButton ID="_lbtnComment" runat="server" />
        <asp:Image ID="_imgEdit" runat="server" /><asp:LinkButton ID="_lbtnEdit" runat="server" />
        <asp:Image ID="_imgDelete" runat="server" /><asp:LinkButton ID="_lbtnDelete" runat="server" />
        <asp:Image ID="_imgMoveTo" runat="server" /><asp:LinkButton ID="_lbtnMoveTo" runat="server" />
    </asp:Panel>
</asp:Panel>

<fwk:Modal Id="_modalMove" runat="server">
    <ContentArea>
        <asp:Label runat="server" AssociatedControlID="_gddlMoveTo" CssClass="screenReaderText">Move this post to</asp:Label>
        <JICS:GroupedDropDownList id="_gddlMoveTo" runat="server" EnableViewState="false" />
    </ContentArea>
</fwk:Modal>

<fwk:Modal Id="_modalDisplay" runat="server">
    <ContentArea>
        <div style="margin:5px;">
            <asp:Literal ID="_litCurrentDisplay" runat="server" /> <asp:Label ID="_lblCurrentDisplay" runat="server" Font-Bold="true" />
        </div>
        <div style="margin-left:15px;">
            <asp:DropDownList ID="_ddlDisplay" runat="server" EnableViewState="false" />
        </div>
    </ContentArea>
</fwk:Modal>

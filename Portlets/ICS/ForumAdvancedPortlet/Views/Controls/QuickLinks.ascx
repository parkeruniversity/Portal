<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinks.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.QuickLinks" %>
<%@ Register src="Subscribe.ascx" tagname="Subscribe" tagprefix="JICS" %>
<div class="quickLinks">
    <ul class="menu" runat="server" id="_menu">
        <li id="_liEdit" runat="server" class="editForum"><asp:HyperLink ID="_hypEditForum" runat="server" /></li>
        <li id="_liSubscribe" runat="server"><JICS:Subscribe id="_subscribe" runat="server" /></li>
        <li id="_liUnread" class="unreadQuick" runat="server"><asp:HyperLink ID="_hypUnread" runat="server" /></li>
        <li id="_liMy" class="myQuick" runat="server"><asp:HyperLink ID="_hypMy" runat="server" /></li>
        <li id="_liUserList" class="userListQuick" runat="server"> <asp:HyperLink ID="_hypUserList" runat="server" /></li>
        <li id="_liApproval" runat="server" class="requiresApproval approvalQuick"><asp:HyperLink ID="_hypApproval" runat="server" /></li>
    </ul>
    <div id="_divMySub" class="viewMySub" runat="server">
        <asp:Image ID="_imgMySubscription" runat="server" />
        <asp:HyperLink ID="_hypMySubscription" runat="server" />
    </div>
    <asp:Panel ID="_panGuest" runat="server" CssClass="guestQuickLink" Visible="false">
        <asp:Label ID="_lblGuestTitle" runat="server" Font-Bold="true" />
        <br />
        <br />
        <asp:Label ID="_lblGuestInfo" runat="server" />
    </asp:Panel>
</div>
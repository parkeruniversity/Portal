<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseIcons.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.BaseIcons" %>
<div class="baseLinks">
    <ul>
        <li id="_liUnread" runat="server"><asp:Image runat="server" ID="_imgUnRead" /> <asp:Literal ID="_litUnread" runat="server" /></li>
        <li><asp:Image runat="server" ID="_imgRead" /> <asp:Literal ID="_litRead" runat="server" /></li>
        <li id="_liReadOnly" runat="server"><asp:Image runat="server" ID="_imgReadOnly" /> <asp:Literal ID="_litReadOnly" runat="server" /></li>
        <li id="_liHidden" runat="server"><asp:Image runat="server" ID="_imgHidden" /> <asp:Literal ID="_litHidden" runat="server" /></li>
    </ul>
</div>
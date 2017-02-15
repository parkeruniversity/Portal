<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopicLink.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.TopicLink" %>
<div class="fTopicInfo" runat="server" id="_divTopicInfo">
     <asp:Image ID="_imgViewed" runat="server" />
    <asp:Panel ID="_panManageAction" runat="server" CssClass="manageTopicAction" Visible="false">
        <asp:HyperLink ID="_hypEdit" runat="server" />
        <asp:LinkButton ID="_lbtnDelete" runat="server" />
    </asp:Panel>
    <div class="topicLink">
        <asp:Label ID="_lblMeta" runat="server" CssClass="private"/>
        <asp:HyperLink ID="_hypTopic" runat="server" />
        <div class="topicDescrip">
            <asp:Label ID="_lblDescription" runat="server" />
        </div>
        <div class="topicModerators">
            <asp:Label ID="_lblModerators" runat="server" />
        </div>
    </div>
</div>
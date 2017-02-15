<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentPosts.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.RecentPosts" %>
<%@ Register src="PostLink.ascx" tagname="PostLink" tagprefix="JICS" %>
<div class="recentPost">
    <div class="recentPostTitle">
        <asp:HyperLink ID="_hypMorePosts" runat="server" />
        <asp:Label id="_lblPostTitle" runat="server" />
    </div>
    <asp:Repeater ID="_rptRecentPosts" runat="server">
        <ItemTemplate>
            <JICS:PostLink id="_postLink" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
    <asp:Panel ID ="_panNoPosts" runat="server" CssClass="noPosts" Visible="false">
        <asp:Label ID="_lblNoPosts" runat="server" />
    </asp:Panel>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Default.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Default" %>
<%@ Register src="Controls/RecentPosts.ascx" tagname="RecentPosts" tagprefix="JICS" %>

<JICS:RecentPosts id="_recentPosts" runat="server" />
<div class="baseLinks">
    <ul>
        <li>
            <asp:Image runat="server" ID="_imgHome" />
            <asp:HyperLink ID="_hypMain" runat="server" />
        </li>
        <li runat="server" id="_liUserList">
            <asp:Image runat="server" ID="_imgUserList" />
            <asp:HyperLink runat="server" ID="_hypUserList" />
        </li>
        <li runat="server" id="_liApproval">
            <asp:Image runat="server" ID="_imgApproval" />
            <asp:HyperLink runat="server" ID="_hypApproval" />
        </li>
    </ul>
    
</div>
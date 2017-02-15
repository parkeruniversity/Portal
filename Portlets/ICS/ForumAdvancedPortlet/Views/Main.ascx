<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Main" %>
<%@ Register src="Controls/RecentPosts.ascx" tagname="RecentPosts" tagprefix="JICS" %>
<%@ Register src="Controls/CategoryDisplayGrid.ascx" tagname="CategoryDisplayGrid" tagprefix="JICS" %>
<%@ Register src="Controls/BaseIcons.ascx" tagname="BaseIcons" tagprefix="JICS" %>
<%@ Register src="Controls/QuickLinks.ascx" tagname="QuickLinks" tagprefix="JICS" %>

<div class="mainTop">
    <JICS:QuickLinks id="_quickLinks" runat="server" />
    <JICS:RecentPosts  id="_recentPosts" runat="server" />
</div>
<!--
<div id="_divAssignments" runat="server">
    <asp:Label ID="_lblAssignmentsTitle" runat="server" />
    <asp:Repeater ID="_rptAssignments" runat="server" EnableViewState="False">
        <ItemTemplate>
            <div>
                <asp:Label ID="_lblAssignment" runat="server" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
-->
<div class="mainContent">
    <asp:Repeater ID="_rptCategory" runat="server" EnableViewState="false">
        <ItemTemplate>
            <JICS:CategoryDisplayGrid id="_catDisplay" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
    <asp:Panel ID="_panNoCategories" runat="server" Visible="false" CssClass="noCategories">
        <asp:Label id="_lblNoCategories" runat="server" />
        <asp:Image ID="_imgAddCategory" runat="server" />
        <asp:HyperLink ID="_hypAddCategory" runat="server" />
    </asp:Panel>
</div>
<div>
    <JICS:BaseIcons id="_baseIcons" runat="server" RenderFolderIcons="true" />
</div>

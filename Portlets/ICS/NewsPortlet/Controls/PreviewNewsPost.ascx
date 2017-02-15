<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PreviewNewsPost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.PreviewNewsPost" %>

<div class="postItem previewItem">

    <div class="postTitle">
        <asp:Label ID="_lblTitle" runat="server"></asp:Label> <asp:Label ID="_lblNotVisible" runat="server"></asp:Label>
    </div>
    <asp:Label ID="_lblDateAttribution" CssClass="postInfo" runat="server"></asp:Label>
    <asp:Panel ID="_panContent" CssClass="postContent" runat="server">
    </asp:Panel>
</div>
<div style="clear:both;"></div> 
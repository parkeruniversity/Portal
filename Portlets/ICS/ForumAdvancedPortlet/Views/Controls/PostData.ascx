<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostData.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.PostData" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<div class="postData">
    <div class="postTitleDate">
        <asp:Literal ID="_litAnchor" runat="server" />
        <asp:Image ID="_imgUnRead" runat="server" />
        <asp:Label ID="_lblTitle" runat="server" CssClass="postTitle"></asp:Label>
        <asp:Label ID="_lblDate" runat="server" CssClass="postDate"></asp:Label>
        <asp:Label id="_lblPostListDate" CssClass="postDate" runat="server">
            <asp:HyperLink ID="_hypForum" runat="server" />
            <asp:Literal ID="_litCategoryName" runat="server" />
            <asp:HyperLink ID="_hypTopic" runat="server" />
            <asp:Literal ID="_litDate" runat="server" />
        </asp:Label>
    </div>
    <div id="_divContent" runat="server" class="postContent">
        <table>
            <tr>
                <td>
                    <!-- post content start -->
                    <asp:Literal ID="_litContent" runat="server" />
                    <!-- post content end -->
                </td>
            </tr>
        </table>
    </div>
    <framework:LockedContent ID="lockedContent" runat="server" Visible="false" />
    <asp:PlaceHolder ID="_phAdditionalImages" runat="server" />
    <asp:PlaceHolder ID="_phFiles" runat="server" />
    <asp:Panel ID="_panEdits" runat="server" CssClass="postEdits">
    </asp:Panel>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsPost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.NewsPost" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<div class="postWrapper" >
    <asp:Panel id="_panPostStatus" runat="server">
        <asp:Panel id="_divPostItem" runat="server" CssClass="postItem">
            <div class="postTitle">
                <asp:HyperLink ID="_hypTitle" runat="server"></asp:HyperLink> <asp:Label ID="_lblNotVisible" runat="server"></asp:Label> <asp:HyperLink ID="_hypEdit" runat="server"></asp:HyperLink><asp:ImageButton ID="_ibtnDelete" runat="server" OnClick="_ibtnDelete_Click" />
            </div>
            <asp:Label ID="_lblDateAttribution" CssClass="postInfo" runat="server"></asp:Label>
            <asp:Panel ID="_panFrom" CssClass="postFrom" runat="server">
                <cmn:GlobalizedLabel ID="_glblFrom" runat="server" TextKey="LBL_NEWS_FROM" />
                <asp:HyperLink ID="_hypFrom" runat="server" />
            </asp:Panel>
            <asp:Panel ID="_panContent" CssClass="postContent" runat="server">
            </asp:Panel>
            <asp:Panel ID="_panDiscuss" runat="server" CssClass="postDiscuss">
                <asp:HyperLink id="_hypDiscuss" CssClass="postDiscussLink" runat="server"></asp:HyperLink>
                <asp:Literal ID="_litPipe" runat="server">&nbsp;&nbsp; <b>|</b> &nbsp;&nbsp;</asp:Literal>
                <asp:HyperLink ID="_hypReadMore" runat="server"></asp:HyperLink>&nbsp;<asp:Image ID="_imgArrow" runat="server" />
            </asp:Panel>
            <asp:Panel ID="_panViewPostLinks" CssClass="postLinks" runat="server" Visible="false">
                <table cellpadding ="3"  cellspacing="0" width="100%">
                    <tr>
                        <td align="left"><asp:Image ID="_imgPrevious" runat="server" />&nbsp;<cmn:GlobalizedHyperLink ID="_ghypPrevious" runat="server"></cmn:GlobalizedHyperLink></td>
                        <td align="center"><cmn:GlobalizedHyperLink ID="_ghypMain" runat="server"></cmn:GlobalizedHyperLink></td>
                        <td align="right"><cmn:GlobalizedHyperLink ID="_ghypNext" runat="server"></cmn:GlobalizedHyperLink>&nbsp;<asp:Image ID="_imgNext" runat="server" /></td>
                </table>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</div> 
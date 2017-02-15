<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostLink.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.PostLink" %>
<%@ Register TagPrefix="web" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<asp:Panel CssClass="fPostInfo" runat="server" id="_panPostInfo">
    <asp:Image ID="_viewedImg" runat="server" />
    <div class="postLink">
        <asp:HyperLink ID="_hypPost" runat="server" />
        <asp:Panel ID="_panAttribution" runat="server" CssClass="postAttribution" />
        <asp:Panel ID="_panMessage" runat="server" CssClass="requiresApproval messageRestrict">
            <asp:Label ID="_lblMessage" runat="server" />
        </asp:Panel>
    </div>
    <web:LockedContent ID="lockedContent" runat="server" Visible="false" />
</asp:Panel>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostAndReplyView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.PostAndReplyView" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register src="Post.ascx" tagname="Post" tagprefix="JICS" %>

<JICS:Paging id="_paging" runat="server" />

<asp:UpdatePanel runat="server">
<ContentTemplate>
    <asp:Repeater ID="_rptPosts" runat="server" EnableViewState="False">
        <ItemTemplate>
            <JICS:Post id="_post" IsInPartialPostback="True" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
</ContentTemplate>
</asp:UpdatePanel>

<cmn:Mirror ID="_mirPaging" ControlID="_paging" runat="server" />
     


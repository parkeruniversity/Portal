<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SinglePostView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.SinglePostView" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Post.ascx" tagname="Post" tagprefix="JICS" %>
<%@ Register src="Subscribe.ascx" tagname="Subscribe" tagprefix="JICS" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="_updatePanel" runat="server" >
  <ContentTemplate>
        <JICS:Post id="_requestedPost" IsInPartialPostback="true" runat="server" />
  </ContentTemplate>
</asp:UpdatePanel>
<div style="margin-top:20px;">
    <div class="navHeader" >
            <JICS:Subscribe id="_subscribe" runat="server" />
        <asp:Label ID="_lblOrigPost" CssClass="origPostHeader"  runat="server" />
    </div>
    <JICS:Paging id="_paging" runat="server" />
    <asp:GridView ID="_gvReplies" runat="server" AutoGenerateColumns="false" CssClass="discussionReplies" Width="100%"  CellPadding="0" CellSpacing="0" EnableViewState="false">
        <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <div>
                    <asp:PlaceHolder ID="_phIndent" runat="server"></asp:PlaceHolder>
                    <asp:Image ID="_imgUnRead" runat="server" />
                    <asp:HyperLink ID="_hypPost" runat="server" />
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="_lblAuthor" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="_lblDatePosted" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <cmn:Mirror ID="_mirPaging" ControlID="_paging" runat="server" />
</div> 

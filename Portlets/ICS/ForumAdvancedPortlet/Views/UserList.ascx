<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="UserList.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.UserList" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>

<div style="padding:10px;">
    
    <div class="userListContainer">
        <div class="navHeader">
            <asp:Image ID="_imgUserPost" runat="server" />
            <asp:Label ID="_lblTitle" CssClass="navTitle" runat="server" />
        </div>
        <JICS:Paging id="_paging" runat="server" />
        <asp:UpdatePanel ID="_updatePanel" runat="server" >
            <ContentTemplate>
        <asp:GridView id="_gvUserInfo" runat="server" Width="100%"  CssClass="dataGrid" AlternatingRowStyle-CssClass="altDataGrid" HeaderStyle-CssClass="headerDataGrid"  CellPadding="0" CellSpacing="0"
            AutoGenerateColumns="False" AllowSorting="true" ShowFooter="false" >
            <Columns>
                <asp:TemplateField HeaderStyle-Width="45%"   HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phNameHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                     <div style="float:right">
                        <asp:HyperLink ID="_hypEmail" runat="server" /> &nbsp;
                        <framework:MyInfoPopup id="_myInfo" runat="server" />
                    </div>
                    <asp:Image id="_imgParticipation" runat="server" />
                    <asp:PlaceHolder id="_phUser" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader">
                     <HeaderTemplate>
                        <asp:PlaceHolder ID="_phPostsHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder ID="_phPosts" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader">
                     <HeaderTemplate>
                        <asp:PlaceHolder ID="_phRepliesHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder ID="_phReplies" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader">
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phOverallHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate >
                        <asp:PlaceHolder ID="_phOverall" runat="server" />
                        <asp:Image ID="_imgOverall" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phRoleHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Literal ID="_litRoles" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </ContentTemplate>
        </asp:UpdatePanel>
        <cmn:Mirror ID="_mirPaging" ControlID="_paging" runat="server" />
    </div>
    <cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
</div>
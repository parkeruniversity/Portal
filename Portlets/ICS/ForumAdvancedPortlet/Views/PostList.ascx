<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostList.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.PostList" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register src="Controls/Post.ascx" tagname="Post" tagprefix="JICS" %>
<%@ Register src="Controls/PostLink.ascx" tagname="PostLink" tagprefix="JICS" %>

<asp:PlaceHolder ID="_phFileUploader" runat="server" />
<div style="padding:10px;">
   <asp:UpdatePanel ID="_updatePanel" runat="server" >
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="_ibtnFull" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="_ibtnList" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="_ddlMySubs" />
        <asp:PostBackTrigger ControlID="_ddlPostsPerPage" />
    </Triggers>
    <ContentTemplate>
    
    <asp:PlaceHolder ID="_phHighLight" runat="server">
        <script type="text/javascript" src="UI/Common/Scripts/jquery.highlight.js"></script>
        <script language="javascript" type="text/javascript">
            function HighlightSearchResults(section, words) {
                $(section).highlight(words);
            }
        </script>
    </asp:PlaceHolder>
    
    <asp:Panel id="_panMySubscriptionForums" CssClass="mySubscriptions" runat="server">
        <div class="mySubscriptionExit">
            <asp:Image runat="server" ID="_imgExit" />
            <asp:HyperLink ID="_hypExitEditMode" runat="server" />
        </div>
        <asp:Label id="_lblMySubscription" AssociatedControlID="_ddlMySubs" runat="server" />
        <asp:DropDownList ID="_ddlMySubs" AutoPostBack="true" runat="server" />
    </asp:Panel>
  
    <div class="navHeader">
        <div id="_divPostAction" runat="server" class="postListAction">
            <div class="postsPerPage">
                <asp:DropDownList ID="_ddlPostsPerPage" runat="server" AutoPostBack="true"/>
                <asp:Label ID="_lblPostsPerPage" AssociatedControlID="_ddlPostsPerPage" runat="server" />           
            </div>
            <div id="_divBtnFull" runat="server"  class="postListBtn" enableviewstate="false">
                <asp:ImageButton ID="_ibtnFull" runat="server" AlternateText="Detailed message list" />
            </div>
            <div id="_divBtnList" runat="server" class="postListBtn" enableviewstate="false" >
                <asp:ImageButton ID="_ibtnList" runat="server" AlternateText="Simple message list" />
            </div>
        </div>
        <asp:Image ID="_imgTitle" runat="server" />
        <asp:Label ID="_lblTitle" CssClass="navTitle" runat="server" />
    </div>
    
    <JICS:Paging id="_paging" runat="server" />
        <asp:Table id="_tblFullSort" runat="server" CellPadding="0" CellSpacing="0" CssClass="dataGrid" Width="100%">
            <asp:TableRow runat="server" CssClass="headerDataGrid">
                <asp:TableHeaderCell id="_thcAuthor" runat="server" CssClass="cellTopicHeader" Width="150px" >
                    <asp:LinkButton id="_lbtnAuthor" runat="server" />
                    <asp:Image id="_imgAuthor" runat="server" />
                </asp:TableHeaderCell>
                 <asp:TableHeaderCell id="_thcFull" runat="server" CssClass="cellTopicHeader" >
                    <asp:LinkButton id="_lbtnTitle" runat="server" />
                    <asp:Image id="_imgTitleHeader" runat="server" />
                    <asp:Label id="_lblDivTitle" runat="server" />
                    <asp:LinkButton id="_lbtnCategory" runat="server" />
                    <asp:Image id="_imgCategory" runat="server" />
                    <asp:Label id="_lblDivCategory" runat="server" />
                    <asp:LinkButton id="_lbtnTopic" runat="server" />
                    <asp:Image id="_imgTopic" runat="server" />
                    <asp:Label id="_lblDivTopic" runat="server" />
                    <asp:LinkButton id="_lbtnDate" runat="server" />
                    <asp:Image id="_imgDate" runat="server" />
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Repeater ID="_rptFull" runat="server" EnableViewState="false">
            <ItemTemplate>
                <JICS:Post id="_post" runat="server" />
            </ItemTemplate>
        </asp:Repeater>
        
        <asp:GridView id="_gvPosts" Width="100%" runat="server" AutoGenerateColumns="false" CssClass="dataGrid" AlternatingRowStyle-CssClass="altDataGrid" 
        HeaderStyle-CssClass="headerDataGrid" AllowSorting="true"  CellPadding="0" CellSpacing="0">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="45%" ItemStyle-CssClass="cellTopic" HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phPostHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <JICS:PostLink id="_postLink" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phAuthorHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="_lblAuthor" runat="server" />
                        <br />
                        <asp:HyperLink ID="_hypEmail" runat="server" /> &nbsp;
                        <framework:MyInfoPopup id="_myInfo" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phCategoryTopic" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="_lblCategoryName" runat="server" />
                         <br />
                         &gt; <asp:HyperLink ID="_hypTopic" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="cellTopicHeader" >
                    <HeaderTemplate>
                        <asp:PlaceHolder ID="_phForum" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="_hypForum" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Panel id="_panEmptyResult" runat="server" CssClass="noPostList" Visible="false" >
            <asp:Label id="_lblEmptyResult" runat="server" />
        </asp:Panel>
    
        <cmn:Mirror ID="_mirPaging" ControlID="_paging" runat="server" />
    </ContentTemplate>
    </asp:UpdatePanel>

    <cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
</div>
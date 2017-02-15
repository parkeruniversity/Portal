<%@ Control Language="C#"  AutoEventWireup="true" EnableViewState="false" CodeBehind="UserParticipation.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.UserParticipation" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<script language="javascript" type="text/javascript">
    $().ready(function() { RegisterUserParticipation(); });
</script>

<div id="divUserParticipationContainer" class="userParticipationContainer">
     
     <div class="navHeader participationHeader">
        <div class="nextItem"><asp:PlaceHolder ID="_phNext" runat="server" /></div>
        <div class="previousItem"><asp:PlaceHolder ID="_phPrevious" runat="server" /></div>
        <asp:Image ID="_imgParticipation" CssClass="participationHeaderImg" runat="server" />
        <asp:Label ID="_lblUser" runat="server" />
    </div>
    <div class="participationOverview">
         <div class="participationAuthor" >
            <asp:Image runat="server" ID="_imgAuthorImg" CssClass="authorImg" />
            <asp:Label ID="_lblAuthorName" runat="server" Font-Bold="true" />
            <asp:Label ID="_lblGroups" runat="server" CssClass="userRoles" />
            <asp:HyperLink ID="_hypEmail" runat="server" /> &nbsp;
            <framework:MyInfoPopup id="_myInfo" runat="server" />
        </div>
        <div class="participationStats">
            <ul>
                <li>
                    <asp:Label ID="_lblPostWritten" runat="server" />
                    <asp:Literal ID="_litPostWritten" runat="server" />
                </li>
                <li>
                    <asp:Label ID="_lblReplyWritten" runat="server" />
                    <asp:Literal ID="_litReplyWritten" runat="server" />
                </li>
                <li>
                    <asp:Label ID="_lblPostView" runat="server" />
                    <asp:Literal ID="_litPostView" runat="server" />
                </li>
            </ul>
            <div class="timeSpentInfo">
            </div>
            <asp:Image ID="_imgReadAll" runat="server" />
            <asp:HyperLink ID="_hypReadAll" runat="server" />
        </div>
    </div>       
    <div style="clear:both;"></div>
    <asp:Repeater ID="_rptParticipation" runat="server" >
        <ItemTemplate>
            <asp:GridView ID="_gv" runat="server" AutoGenerateColumns="false" ShowFooter="true" Width="100%"  CssClass="dataGrid" HeaderStyle-CssClass="headerDataGrid" FooterStyle-CssClass="footerDataGrid"  CellPadding="0" CellSpacing="0" >
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="50%" HeaderStyle-CssClass="cellTopicHeader">
                        <HeaderTemplate>
                            <asp:Image ID="_imgHeader" CssClass="imgHeader" runat="server" />
                            <asp:Label ID="_lblCategoryName" CssClass="catName" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate >
                            <asp:PlaceHolder ID="_phItem" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Literal ID="_litTotal" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:PlaceHolder ID="_phPosts" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:PlaceHolder ID="_phPostTotal" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:PlaceHolder ID="_phReplies" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:PlaceHolder ID="_phReplyTotal" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:PlaceHolder ID="_phViewed" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Literal ID="_litViewedTotal" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Literal ID="_litTimeSpent" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Literal ID="_litTimeSpentTotal" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ItemTemplate>
    </asp:Repeater>
</div>
    <cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
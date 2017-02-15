<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopicView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.TopicView" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="JICS" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<%@ Register src="Controls/Subscribe.ascx" tagname="Subscribe" tagprefix="JICS" %>
<%@ Register src="Controls/PostLink.ascx" tagname="PostLink" tagprefix="JICS" %>
<%@ Register src="Controls/AddAPost.ascx" tagname="AddAPost" tagprefix="JICS" %>
<%@ Register src="Controls/BaseIcons.ascx" tagname="BaseIcons" tagprefix="JICS" %>

<div style="padding:10px;">
    <asp:Label runat="server" CssClass="topicCat" ID="_lblCatName"></asp:Label>
    <div class="topicMeta">
        <div class="topicTitle">
            <asp:Literal runat="server" ID="_litTitle"></asp:Literal>
        </div>
        <div class="topicDescription">
            <asp:Literal runat="server" ID="_litDescription"></asp:Literal>
        </div>
    </div>
    <div class="topicMetaAssignment" id="_divAssigment" runat="server">
        <table cellpadding="5">
            <tr>
                <td valign="top"><asp:Image ID="_imgAssignmentStar" runat="server"/></td>
                <td valign="top">
                    <div class="assignmentItem">
                        <asp:Label ID="_lblAssignmentLink" runat="server" />
                    </div>
                    <div class="assignmentItem" id="_divGrade" runat="server">
                        <asp:Label ID="_lblGrade" runat="server" />
                    </div>
                    <div id="_divRequirements" runat="server" class="assignmentItem">
                        <asp:Label ID="_lblRequirements" runat="server" />
                    </div>
                    <div id="_divRequirmentsStudent" runat="server" class="assignmentItem">
                        <div id="_divRequirementsStudentPosts" runat="server">
                            <asp:Label ID="_lblRequirementStudentPosts" runat="server" />
                        </div>
                        <div id="_divRequirementStudentReplies" runat="server">
                            <asp:Label ID="_lblRequirementStudentReplies" runat="server" />
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td valign="top"><asp:Image ID="_imgPost" CssClass="" runat="server"/></td>
                            <td>
                                <div id="_divStartDate" runat="server">
                                    <asp:Label ID="_lblStartDate" runat="server" />
                                </div>
                                <div id="_divPostDue" runat="server">
                                    <asp:Label ID="_lblPostDueDate" runat="server" />
                                </div>
                                <asp:Label ID="_lblReplyDueDate" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <asp:Label ID="_lblCourseworkLink" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div class="topicActions">
        <div class="topicNavigation">
             <asp:Label runat="server" CssClass="optionTitle" ID="_lblTopicNav"></asp:Label>
             <ul>
                 <li><asp:PlaceHolder ID="_phPrevious" runat="server" /></li>
                 <li><asp:HyperLink runat="server" CssClass="buttonAnchor" ID="_hypMain"/></li>
                 <li><asp:PlaceHolder ID="_phNext" runat="server" /></li>
             </ul>
        </div>
        <div class="topicOptions">
            <asp:Label runat="server" CssClass="optionTitle" ID="_lblTopicOptions"></asp:Label>
            <ul>
                <li><JICS:AddAPost id="_addPostTop" runat="server" /></li>
                <li><JICS:Subscribe id="_subscribe" runat="server" /></li>
                <li><cmn:ImageAndHyperLink CssClass="editTopic" ID="_ihypEdit" runat="server" /></li>
            </ul>
        </div>
    </div>
    <div style="clear:both;"></div>
    <asp:Panel ID="_panPrivacy" runat="server" CssClass="privateTopic">
        <asp:Label ID="_lblPrivacyTitle" runat="server" />
        <div>
            <asp:Literal ID="_litPrivacyInfo" runat="server" />
        </div>
    </asp:Panel>
      <asp:Panel ID="_panContainer" runat="server">
        <asp:Panel ID="_panHiddenInfo" runat="server" CssClass="hiddenInfo">
            <asp:Label ID="_lblHiddenInfo" runat="server" />
            <asp:HyperLink ID="_hypHidden" runat="server" />
        </asp:Panel>
            <asp:Panel ID="_panMessage" CssClass="feedbackMessage topicMessage" runat="server" Visible="false">
                <asp:Label ID="_lblMessage" CssClass="messageTitle" runat="server" />
                <asp:Label ID="_lblMessageInfo" runat="server" />
                <div runat="server" id="_divPendingPost">
                    <asp:Image ID="_imgPendingPost" runat="server" />
                    <asp:Label ID="_lblPendingPosts" CssClass="extraInfo" runat="server" />
                </div>
            </asp:Panel>
        <JICS:Paging id="_paging" runat="server" />
        <asp:UpdatePanel ID="_updatePanel" runat="server" >
        <ContentTemplate>
        
        <asp:GridView id="_gvThreads" runat="server" Width="100%"  CssClass="dataGrid" AlternatingRowStyle-CssClass="altDataGrid" FooterStyle-CssClass="footerDataGrid" HeaderStyle-CssClass="headerDataGrid"  CellPadding="0" CellSpacing="0"
            AutoGenerateColumns="False" ShowFooter="true" AllowSorting="true">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="40%"  ItemStyle-CssClass="cellTopic"  >
                    <HeaderTemplate >
                        <asp:Literal id="_litPostHeader" runat="server" />
                        &nbsp;
                        ( <asp:PlaceHolder id="_phPostSort" runat="server" /> )
                    </HeaderTemplate>
                    <ItemTemplate>
                        <JICS:PostLink id="_threadLink" runat="server" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <JICS:AddAPost id="_addAPost" runat="server" />
                        <asp:Label ID="_lblTotals" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:PlaceHolder id="_phUserSort" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder ID="_phUsers" runat="server" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:PlaceHolder ID="_phTotalUsers" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                         <asp:PlaceHolder id="_phApprovalSort" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder ID="_phApproval" runat="server" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:PlaceHolder ID="_phTotalApproval" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                         <asp:PlaceHolder id="_phUnreadSort" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="_lblUnRead" runat="server" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="_lblTotalUnRead" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField  >
                    <HeaderTemplate>
                         <asp:PlaceHolder id="_phRepliesSort" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder ID="_phReplies" runat="server" />
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:PlaceHolder ID="_phTotalReplies" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField  >
                    <HeaderTemplate>
                         <asp:PlaceHolder id="_phLatestPostSort" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <JICS:PostLink id="_postLink" runat="server" />
                    </ItemTemplate>         
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="_panNoThreads" runat="server" CssClass="noThreads" Visible="false">
            <asp:Label ID="_lblNoThreads" runat="server" />
        </asp:Panel>
        
        <cmn:Mirror ID="_mirPaging" ControlID="_paging" runat="server" />

    </asp:Panel>
    
     <cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
    <JICS:BaseIcons id="_baseIcons" runat="server" />

</div>
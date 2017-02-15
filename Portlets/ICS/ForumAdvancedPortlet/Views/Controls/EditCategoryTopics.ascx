<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryTopics.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.EditCategoryTopics" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register src="TopicLink.ascx" tagname="TopicLink" tagprefix="JICS" %> 
<%@ Register src="TruncateText.ascx" tagname="Truncate" tagprefix="JICS" %> 

<JICS:Truncate id="_truncate" runat="server" />

<div class="catDisplayHeader">
    <asp:LinkButton ID="_lbtnDelete" CssClass="buttonAnchor deleteAnchor" runat="server"></asp:LinkButton>
    <asp:HyperLink ID="_hypEdit" CssClass="buttonAnchor editAnchor" runat="server"></asp:HyperLink>
    <div style="padding:3px;">    
        <asp:Label ID="_lblName" runat="server" CssClass="catName" />
        <asp:Label ID="_lblDescrip" runat="server" CssClass="catDescrip" />
    </div>
</div>
<div class="topicOrdering">
    <asp:Literal id="_litOrdering" runat="server" />
</div>
<table class="headerDataGrid" cellpadding="0" cellspacing="0">
    <tr>
        <td class="cellTopicHeader"> <asp:Literal ID="_litTopic" runat="server" /> </td>
        <td class="tdCounters"> <asp:Literal ID="_litUsers" runat="server" /></td>
        <td class="tdCounters"> <asp:Literal ID="_litPosts" runat="server" /></td>
        <td class="tdCounters"> <asp:Literal ID="_litReplies" runat="server" /></td>
        <td class="tdCounters"> <asp:Literal ID="_litAccess" runat="server" /></td>
    </tr>
</table>
<div class="addTopic">
    <asp:Image ID="_imgAddTopic" runat="server" />
    <asp:HyperLink ID="_hypAddTopic" runat="server" />
</div>
<ul id="<%=CategoryDisplay.Category.ID %>" class="connectedSortable">
    <asp:Repeater ID="_rptTopic" runat="server">
        <ItemTemplate>
            <li id="<%# DataBinder.Eval( Container.DataItem, "TopicInfo.Topic.ID" )%>">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="dragHandleTD"><div class="dragHandle" title="<%=GetDragTitle() %>"></div></td>
                        <td style="width:100%;">
                           <table class="<%#GetTableCss(Container.ItemIndex) %>" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="topicLink">
                                        <JICS:TopicLink id="_topicLink" RenderManageAction="true" runat="server" />
                                    </td>
                                    <td class="tdCounters">
                                        <asp:Literal ID="_litUsers" runat="server" />
                                    </td>
                                    <td  class="tdCounters">
                                        <asp:Literal ID="_litPosts" runat="server" />
                                    </td>
                                    <td class="tdCounters">
                                        <asp:Literal ID="_litReplies" runat="server" />
                                    </td>
                                    <td  class="tdCounters">
                                        <asp:Image ID="_imgAccess" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
<table runat="server" id="_tblTotals" class="footerDataGrid" cellpadding="0" cellspacing="0">
    <tr>
        <td>Totals:&nbsp;</td>
        <td class="tdCounters"><asp:Literal ID="_litTotalUsers" runat="server"/></td>
        <td class="tdCounters"><asp:Literal ID="_litTotalPosts" runat="server"/></td>
        <td class="tdCounters"><asp:Literal ID="_litTotalReplies" runat="server"/></td>
        <td class="tdCounters"></td>
    </tr>
</table>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryDisplayGrid.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.CategoryDisplayGrid" %>
<%@ Register src="PostLink.ascx" tagname="PostLink" tagprefix="JICS" %>
<%@ Register src="TopicLink.ascx" tagname="TopicLink" tagprefix="JICS" %>
<%@ Register src="Subscribe.ascx" tagname="Subscribe" tagprefix="JICS" %>
<%@ Register src="TruncateText.ascx" tagname="Truncate" tagprefix="JICS" %> 

<JICS:Truncate id="_truncate" CtrToTruncateID="_lblDescrip" runat="server" />

<div class="catDisplayHeader">
    <JICS:Subscribe id="_subscribe" runat="server" />
    <div style="padding:3px;">    
        <asp:Label ID="_lblName" runat="server" CssClass="catName" />
        <asp:Label ID="_lblDescrip" runat="server" CssClass="catDescrip" />
    </div> 
</div>
<asp:GridView id="_gvTopics" runat="server" Width="100%"  CellPadding="0" CellSpacing="0"
    AutoGenerateColumns="False" ShowFooter="true" CssClass="dataGrid" AlternatingRowStyle-CssClass="altDataGrid" FooterStyle-CssClass="footerDataGrid" HeaderStyle-CssClass="headerDataGrid"  >
    <Columns>
        <asp:TemplateField HeaderStyle-Width="30%" ItemStyle-CssClass="cellTopic" HeaderStyle-CssClass="cellTopicHeader" >
            <ItemTemplate>
                <JICS:TopicLink ID="_topicLink" runat="server" />
            </ItemTemplate>
            <FooterTemplate>
               <asp:Label ID="_lblTotals" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <asp:PlaceHolder ID="_phUsers" runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                <asp:PlaceHolder ID="_phTotalUsers" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <asp:PlaceHolder ID="_phApproval" runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                <asp:PlaceHolder ID="_phTotalApproval" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <asp:PlaceHolder ID="_phUnread" runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                <asp:PlaceHolder ID="_phTotalUnread" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <asp:PlaceHolder ID="_phPosts" runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                <asp:PlaceHolder ID="_phTotalPosts" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <asp:PlaceHolder ID="_phReplies" runat="server" />
            </ItemTemplate>
             <FooterTemplate>
                <asp:PlaceHolder ID="_phTotalReplies" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-Width="30%" HeaderStyle-CssClass="cellLatestPostHeader" >
            <ItemTemplate>
                <JICS:PostLink id="_postLink" runat="server" />
            </ItemTemplate>         
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-CssClass="cellAccessHeader">
        <ItemTemplate>
                <asp:Image ID="_imgAccess" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:Panel ID="_panNoTopics" runat="server" Visible="false" CssClass="noTopics">
    <asp:Label id="_lblNoTopics" runat="server" />
    &nbsp;
    <asp:Image ID="_imgAddTopic" runat="server" Visible="false" />
    <asp:HyperLink ID="_hypAddTopic" runat="server" Visible="false" Font-Bold="true" />
</asp:Panel>

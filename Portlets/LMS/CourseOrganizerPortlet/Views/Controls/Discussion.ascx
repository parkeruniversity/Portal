<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Discussion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.Discussion" %>
<div class="coSectionContainer">
    <div class="coHeaderIcon"><img src="ui/common/images/PortletImages/Icons/32/newspaper.png" /></div>
    <div style='float:left;' class="coListContainer">
        <div class="coSectionHeader"><asp:Label ID="_lblTitle" runat="server" /><br /></div>
         <ul class="coListUL">
        <asp:Repeater ID="_rpterData" runat="server">
            <ItemTemplate>
                 <li><asp:HyperLink ID="_linkItem" runat="server" /> <asp:Label ID="_lblOtherTxt" runat="server" /></li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <asp:Label ID="_lblErrMsg" runat="server" />
    </div>
</div>
<div style="clear:both;"></div>
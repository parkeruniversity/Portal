<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Assignments.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.Assignments" %>
<div class="coSectionContainer">
    <div class="coHeaderIcon"><img src="ui/common/images/PortletImages/Icons/32/book.png" /></div>
    <div style='float:left;'  class="coListContainer">
        <div class="coSectionHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
        <div class="coItemGroup">
            <ul class="coListUL">
            <asp:Repeater ID="_rpterData" runat="server">
                <ItemTemplate>
                    <li><asp:HyperLink ID="_linkItem" runat="server" /> <asp:Label ID="_lblOtherTxt" runat="server" /> <asp:Image ID="_imgStatus" runat="server" /> <i><asp:Label ID="_lblStatusText" runat="server" /> <asp:Label ID="_lblStatusOtherTxt" runat="server" /></i></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>
        <asp:Label ID="_lblNoAssignments" runat="server" />
        <asp:HyperLink ID="_hpViewAll" runat="server" /> <asp:Image ID="_imgViewAll" runat="server" />
    </div>
</div>
<div style="clear:both;"></div>
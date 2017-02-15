<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Calendar.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseOrganizerPortlet.Views.Controls.Calendar" %>
<div class="coSectionContainer">
    <div class="coHeaderIcon"><img src="ui/common/images/PortletImages/Icons/32/calendar.png" /></div>
    <div style='float:left;'  class="coListContainer">
        <div class="coSectionHeader"><asp:Label ID="_lblTitle" runat="server" /></div>
        <asp:Label ID="_lblErrMsg" runat="server" />
        <div class="coItemGroup">
            <ul class="coListUL">
            <asp:Repeater ID="_rpterData" runat="server">
                <ItemTemplate>
                    <li><asp:HyperLink ID="_linkItem" runat="server" /> <asp:Label ID="_lblOtherTxt" runat="server" /></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>
        <asp:Repeater ID="_rpterLinks" runat="server">
            <ItemTemplate>
                <asp:HyperLink ID="_hpViewAll" runat="server" /> <asp:Image ID="_imgViewAll" runat="server" /> &nbsp; 
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div style="clear:both;"></div>
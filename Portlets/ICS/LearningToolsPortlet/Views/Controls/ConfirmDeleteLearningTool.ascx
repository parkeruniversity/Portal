<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmDeleteLearningTool.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.Controls.ConfirmDeleteLearningTool" %>

<div class="modalAddEdit">
    <asp:Label ID="_lblPTitle" runat="server" />
    <asp:Repeater ID="_rptrUsageList" runat="server">
        <ItemTemplate>
            <div class="textContainer">
                <asp:Label ID="_lblParentName" runat="server" /> > 
                <asp:HyperLink ID="_hlnkUsageName" runat="server" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InlineToolDisplayView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.InlineToolDisplayView" %>
<div class="inlinkLinkContainer">
    <table>
        <tr>
            <td class="inlineLink" id="_tdSettings" runat="server">
                <asp:Image ID="_imgSettings" runat="server" /> <asp:HyperLink ID="_hlSettings" runat="server" />
            </td>
            <td class="inlineLink" id="_tdRemoveTool" runat="server">
                <asp:Image ID="_imgDelete" runat="server" /> <asp:LinkButton ID="_lbtnRemove" runat="server" />
            </td>
            <td class="inlineLink" id="_tdAddAnotherTool" runat="server">
                <asp:Image ID="_imgAdd" runat="server" /> <asp:HyperLink ID="_hlAddAnotherTool" runat="server" />
            </td>
            <td class="inlineLink">
                <asp:HyperLink ID="_hlManage" runat="server" />
            </td>
            <td class="inlineLink">
                <asp:HyperLink ID="_hlManageAllTools" runat="server" />
            </td>
        </tr>
    </table>
</div>
<table cellpadding="10" cellspacing="10">
    <tr>
        <td><asp:Label ID="_lblErr" runat="server" /></td>
    </tr>
</table>
<div style="height: 100%; width: 100%;">
     <iframe id="ContentFrame" runat="server" scrolling="yes" width="100%" height="800px" />
</div>
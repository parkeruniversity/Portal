<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageAssignmentHeader.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageAssignmentHeader" %>
<table>
    <tr>
        <td>
            <asp:HyperLink ID="lnkBackToMainScreen" runat="server">
                <asp:Label ID="lblBackToMainScreen" runat="server" />
            </asp:HyperLink>
        </td>
        <td>
            <asp:HyperLink ID="lnkHelpCreatingAssignment" runat="server">
                <asp:Label ID="lblHelp" runat="server" />
            </asp:HyperLink>
        </td>
    </tr>
</table>

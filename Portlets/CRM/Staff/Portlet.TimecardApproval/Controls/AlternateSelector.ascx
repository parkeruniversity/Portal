<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="AlternateSelector.ascx.cs"
    Inherits="Portlet.TimecardApproval.Controls.AlternateSelector" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<common:Subheader ID="PageHeader" TextKey="TXT_ALTERNATE_APPROVAL" runat="server" />

<div id="AlternateApprovalSection" class="pSection" runat="server">
<common:GlobalizedLiteral id="glitAltHeaderDesc" runat="server" TextKey="MSG_TCAPPROVAL_MAINVIEW_ALTERNATE_APPROVER_HEADER" />
<p />
<asp:Repeater ID="rptPayGroups" runat="server">
    
    <HeaderTemplate>
        <table id="tblPayGroups" class="tabularData">
            <thead>
                <tr>
                    <td class="header">
                        <common:GlobalizedLiteral ID="PayGroupHeader" TextKey="TXT_PAY_GROUP(S)" runat="server" />
                    </td>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <asp:TableRow ID="tr" runat="server">
            <asp:TableCell>
                <asp:LinkButton ID="lbPayGroup" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <asp:TableRow ID="tr" runat="server">
            <asp:TableCell CssClass="alt">
                <asp:LinkButton ID="lbPayGroup" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </tbody> </table>
    </FooterTemplate>
</asp:Repeater>
<asp:Repeater ID="rptManagers" runat="server">
    <HeaderTemplate>
        <br />
        <table id="tblManagers" class="tabularData">
            <thead>
                <tr>
                    <td class="header">
                        <common:GlobalizedLiteral ID="ManagerHeader" TextKey="TXT_MANAGER(S)" runat="server" />
                    </td>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <asp:TableRow ID="tr" runat="server">
            <asp:TableCell>
                <asp:LinkButton ID="lbManager" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <asp:TableRow ID="tr" runat="server">
            <asp:TableCell CssClass="alt">
                <asp:LinkButton ID="lbManager" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </tbody> </table>
    </FooterTemplate>
</asp:Repeater>
</div>
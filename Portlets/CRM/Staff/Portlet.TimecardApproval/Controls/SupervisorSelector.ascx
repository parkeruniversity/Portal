<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="SupervisorSelector.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.SupervisorSelector" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Portlet.TimecardApproval.Utils" Assembly="Portlet.TimecardApproval" %>

<common:Subheader ID="PageHeader" TextKey="TXT_SUPERVISOR" runat="server" />

<div id="SupervisorSection" class="pSection" runat="server">
    <common:GlobalizedLiteral id="glitAltHeaderDesc" TextKey="MSG_TCAPPROVAL_MAINVIEW_SUPERVISOR_HEADER" runat="server" />
    <p />
    <asp:Repeater ID="rptPayGroups" runat="server">
        <HeaderTemplate>
            <table id="tblPayGroups" class="tabularData">
                <thead>
                    <tr>
                        <td class="header">
							<common:GlobalizedLiteral id="glitAltHeaderDesc" TextKey="TXT_PAY_GROUP(S)" runat="server" />
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
</div>

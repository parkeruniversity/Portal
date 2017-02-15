<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="USUserDisplay.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.USUserDisplay" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web.Configuration" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls"
    Assembly="Jenzabar.Portal.Framework.Web" %>
    <%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<%@ Register Src="../UserControls/USReportOptions.ascx" TagName="USReportOptions" TagPrefix="USRO" %>


<asp:Table ID="tblMain" runat="server" CssClass="USUserDisplayTable" CellPadding="0" CellSpacing="0">
    <asp:TableRow ID="trHeader" runat="server">
        <asp:TableCell>
            <asp:Image ID="imgUser" runat="server" Width="100" Height="100" /></asp:TableCell>
        <asp:TableCell CssClass="AlignTop">
            <b>
                <framework:MyInfoPopup ClickableName="false" ID="mipUser" runat="server" /></b><br />
            <asp:Literal ID="litGroupMembership" runat="server"></asp:Literal><br />
            <asp:Image ID="imgEmail" runat="server" />&nbsp;<asp:LinkButton ID="EmailUser" runat="server"
                Visible="true"></asp:LinkButton>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trMainOption" runat="server">
        <asp:TableCell ColumnSpan="2">
            <USRO:USReportOptions id="usroMainOption" runat="server"></USRO:USReportOptions>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trSubOption1" runat="server">
        <asp:TableCell ColumnSpan="2" CssClass="USDashedTableCellTop">
            <asp:Image ID="imgSubOption1" runat="server" />&nbsp;<asp:HyperLink ID="hlSubOption1"
                runat="server">
                <asp:Literal ID="litSubOption1" runat="server"></asp:Literal></asp:HyperLink>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trSubOption2" runat="server">
        <asp:TableCell ColumnSpan="2">
            <asp:Image ID="imgSubOption2" runat="server" />&nbsp;<asp:HyperLink ID="hlSubOption2"
                runat="server">
                <asp:Literal ID="litSubOption2" runat="server"></asp:Literal></asp:HyperLink>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trSubOption3" runat="server">
        <asp:TableCell ColumnSpan="2">
            <asp:Image ID="imgSubOption3" runat="server" />&nbsp;<asp:HyperLink ID="hlSubOption3"
                runat="server">
                <asp:Literal ID="litSubOption3" runat="server"></asp:Literal></asp:HyperLink>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trSubOption4" runat="server">
        <asp:TableCell ColumnSpan="2">
            <asp:Image ID="imgSubOption4" runat="server" />&nbsp;<asp:HyperLink ID="hlSubOption4"
                runat="server">
                <asp:Literal ID="litSubOption4" runat="server"></asp:Literal></asp:HyperLink>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trFooter" runat="server" CssClass="USUserDisplayTableFooter">
        <asp:TableCell ColumnSpan="2">
            <div>
                <div style="float: left;">
                    <asp:HyperLink ID="PreviousButton" runat="server"> <-Prev </asp:HyperLink></div>
                <span style="font-weight: bold;">Visitors</span>
                <div style="float: right;">
                    <asp:HyperLink ID="NextButton" runat="server">Next-></asp:HyperLink></div>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

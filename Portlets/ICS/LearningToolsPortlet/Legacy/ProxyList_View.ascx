<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProxyList_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.ProxyList_View" %>
<div class="pSection">
    <asp:Label ID="lblProxyList" runat="server" Text="Select Tool Proxy to place in this portlet: "
        Font-Bold="true" />
    <asp:DataGrid ID="ItemsGrid" BorderColor="black" BorderWidth="1" CellPadding="3"
        Visible="true" AutoGenerateColumns="false" runat="server" Width="80%">
        <HeaderStyle BackColor="#DADADA" Font-Bold="true"></HeaderStyle>
        <ItemStyle BackColor="#DAE3F2"></ItemStyle>
        <AlternatingItemStyle BackColor="#EFEFEF"></AlternatingItemStyle>
        <Columns>
            <asp:ButtonColumn HeaderText="Tool" CommandName="ToolSelectButton" ButtonType="LinkButton"
                DataTextField="ToolProxyIdText"></asp:ButtonColumn>
        </Columns>
    </asp:DataGrid>
    <br/>
    <br/>
    <asp:Label ID="lblNoItems" runat="server" Visible="false" Text="There are no tools available." />
</div>

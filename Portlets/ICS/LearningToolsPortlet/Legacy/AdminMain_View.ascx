<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMain_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.AdminMain_View" %>
<div class="pSection">
    <p>
        <asp:Label ID="lblAdminMain_View_Instructions" runat="server" Font-Bold="False"></asp:Label>
    </p>
    <asp:LinkButton ID="lnkButtonCreateProxy" Text="Create new Tool Proxy..." CommandName="CreateNew"
        Visible="true" runat="server" />
    <br />
    <br />
    <asp:DataGrid ID="ItemsGrid" BorderColor="black" BorderWidth="1" CellPadding="3"
        Visible="true" AutoGenerateColumns="false" runat="server" Width="80%">
        <HeaderStyle BackColor="#DADADA" Font-Bold="true"></HeaderStyle>
        <ItemStyle BackColor="#DAE3F2"></ItemStyle>
        <AlternatingItemStyle BackColor="#EFEFEF"></AlternatingItemStyle>
        <Columns>
            <asp:ButtonColumn HeaderText="Tool" CommandName="ToolDetailButton" ButtonType="LinkButton"
                DataTextField="ToolProxyIdText"></asp:ButtonColumn>
            <asp:BoundColumn HeaderText="JICS Wide?" DataField="TCWide"></asp:BoundColumn>
        </Columns>
    </asp:DataGrid>
    <asp:Label ID="lblDynToolLink" runat="server"></asp:Label>
</div>

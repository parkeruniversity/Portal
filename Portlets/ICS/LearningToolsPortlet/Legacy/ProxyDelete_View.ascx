<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProxyDelete_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.ProxyDelete_View" %>
<script type="text/javascript" src="Portlets/ICS/LearningToolsPortlet/ToolConsumer.js?abc=3"></script>
<script type="text/javascript">
    function delete_proxy(pid, uid, toolname) {
        var timeout = 360;
        var yesno = confirm('Are you sure that you want to remove the tool ' + toolname + ' from the system? This cannot be undone.');
        if (yesno) { ws_delete_proxy(pid, uid, timeout); }
    }

    function visit_tool_placement(rel_path) {
        var tool_path = window.Portal.url + rel_path;
        var newwin = window.open(tool_path, "VISIT_TOOL");
    }
</script>
<div class="pSection">
    <br />
    <br />
    <asp:Label ID="lblDeleteProxy" runat="server" Text="" Font-Bold="true" />
    <br />
    <br />
    <asp:Label ID="lblDeleteProxyInfo" runat="server" Font-Bold="false" />
    <br />
    <br />
    <asp:DataGrid ID="ItemsGrid" BorderColor="black" BorderWidth="1" CellPadding="3"
        Visible="true" AutoGenerateColumns="false" runat="server" Width="80%">
        <HeaderStyle BackColor="#DADADA" Font-Bold="true"></HeaderStyle>
        <ItemStyle BackColor="#DAE3F2"></ItemStyle>
        <AlternatingItemStyle BackColor="#EFEFEF"></AlternatingItemStyle>
        <Columns>
            <asp:BoundColumn HeaderText="Tool Placement" DataField="ContextTitle"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Creator" DataField="ToolPlacementCreator"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Permission" DataField="ToolPlacementAction"></asp:BoundColumn>
            <asp:ButtonColumn HeaderText="" CommandName="PlacementVisit" ButtonType="LinkButton"
                DataTextField="VisitPlacementLinkText"></asp:ButtonColumn>
        </Columns>
    </asp:DataGrid>
    <br />
    <br />
    <asp:Label runat="server" ID="lblDeleteProxyLink" Font-Bold="true"></asp:Label>
</div>

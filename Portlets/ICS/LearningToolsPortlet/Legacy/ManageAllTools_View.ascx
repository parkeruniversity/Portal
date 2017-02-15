<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageAllTools_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.ManageAllTools_View" %>
<script type="text/javascript" src="Portlets/ICS/LearningToolsPortlet/ToolConsumer.js?abc=3"></script>
<script type="text/javascript">
    function delete_proxy(pid, uid, toolname) {
        var timeout = 360;
        var yesno = confirm('Are you sure that you want to remove the tool ' + toolname + ' from the system? This cannot be undone.');
        if (yesno) {
            ws_delete_proxy(pid, uid, timeout);
            location.reload();
        }
    }

    function visit_tool_placement(rel_path) {

        var tool_path = window.Portal.url + rel_path;
        var newwin = window.open(tool_path, "VISIT_TOOL");
    }
</script>
<div class="pSection">
    <p>
        <asp:Label ID="lblManageAllTools" runat="server" Text="" Font-Bold="false"></asp:Label>
    </p>
    <p>
        <asp:Literal ID="ltrlDeleteProxyInstructions" runat="server" Text=""></asp:Literal>
    </p>
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
            <asp:BoundColumn HeaderText="Tool Name" DataField="ToolProxyName"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Tool Created By" DataField="ToolProxyCreator"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Delete Tool?" DataField="ToolDeleteLinkText"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Tool Placement" DataField="ContextTitle"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Tool Placed By" DataField="ToolPlacementCreator"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="Inspect Placement?" DataField="VisitPlacementLinkText">
            </asp:BoundColumn>
        </Columns>
    </asp:DataGrid>
    <br />
</div>

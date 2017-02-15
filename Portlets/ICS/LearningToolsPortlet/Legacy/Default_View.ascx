<%@ Control Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="Default_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Default_View" %>
<script type="text/javascript" src="UI/Common/Scripts/jquery.js"></script>
<script type="text/javascript" src="Portlets/ICS/LearningToolsPortlet/ToolConsumer.js?abc=1"></script>
<script type="text/javascript">

    function TConsumer_submit() {
        // Required
        var resource_link_id = arguments[0];
        var portlet_id = arguments[1];
        var timeout = arguments[2];
        var custom_runtime_params = arguments[3];
        var colid = arguments[4];
        if (arguments.length >= 5) {
            // custom run time parameters were passed 
            ws_TConsumer_submit(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        }
        else {
            // insufficient arguments were passed
            errmessage = 'Error. Insufficient arguments: ' + arguments.length;
            new JCSL.ui.windows.MessageBox(errmessage).open(null);
        }
    }
</script>
<div class="pSection">
    <asp:LinkButton ID="lnkButtonAdminView" Text="Manage BasicLTI Tool" CommandName="ManageTool"
        Visible="true" runat="server" />
    <br />
    <p>
        <br />
        <asp:Label ID="lblToolDescription" runat="server"></asp:Label>
        <br />
        <asp:Literal ID="ltrlLaunchIFrame" runat="server" Visible="false"></asp:Literal>
        <br />
        <asp:Label ID="lblToolLaunchLink" runat="server"></asp:Label>
        <asp:Label ID="lblLaunchForm" runat="server"></asp:Label>
</div>

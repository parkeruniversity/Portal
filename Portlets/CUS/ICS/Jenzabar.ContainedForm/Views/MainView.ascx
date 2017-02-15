<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.MainView" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.InstalledApplications" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<div class="pSection">
    <script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/commonScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/formViewScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
    <asp:HiddenField runat="server" ID="hdnPortletID"/>
    <center>
    <asp:Panel ID="pnlAdminLinks" runat="server"  CssClass="AdminLinks">
    <asp:LinkButton ID="lnkAdminPortlet" runat="server" 
        onclick="lnkAdminPortlet_Click">Manage Forms</asp:LinkButton>
        </asp:Panel>
    <asp:Panel ID="pnlReportLinks" runat="server" CssClass="AdminLinks">
    <asp:LinkButton ID="lnkReportView" runat="server"
        onclick="lnkReportView_Click">View Reports</asp:LinkButton>
    </asp:Panel>
    </center>
    <asp:Repeater ID="rptPortletForms" runat="server" 
        onitemdatabound="rptPortletForms_ItemDataBound">
        <ItemTemplate>
            <div class="jcf-form-block">
                <br/>
                <asp:Label ID="lblFormDesc" runat="server"></asp:Label>
                <asp:HyperLink ID="lnkFormLink" runat="server"></asp:HyperLink>
                <asp:Panel runat="server" ID="pnlStatus"><asp:Label runat="server" ID="lblStatus"></asp:Label></asp:Panel>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <center>
        <asp:Button runat="server" ID="btnFinalize" />
    </center>
</div>


<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteAdminView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.SiteAdminView" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.InstalledApplications" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<%@ Register src="../Controls/DataSourceBuilder.ascx" tagname="DataSourceBuilder" tagprefix="cf" %>
<%@ Register src="../Controls/LSRView.ascx" tagname="LSRView" tagprefix="cf" %>
<%@ Register src="../Controls/ValidationBuilder.ascx" tagname="ValidationBuilder" tagprefix="cf" %>
<%@ Register Src="../Controls/DatabaseView.ascx" TagPrefix="cf" TagName="DatabaseBuilder" %>
<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/commonScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/buildFormScripts.js") %>'></script>
<div class="pSection jcf-site-admin-view">
    <div class="jcf-breadcrumbs">
        <cc1:BreadCrumbTrail ID="BreadCrumbTrail" runat="server"></cc1:BreadCrumbTrail>&nbsp;<asp:Label runat="server" ID="lblScreenName"></asp:Label>
    </div>
    <div class="cssmenu">
        <ul id="SCFToolBar">
            <li><asp:LinkButton runat="server" ID="lnkValidations" OnClick="lnkValidations_Click">Data Validation</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkStringReplacer" OnClick="lnkStringReplacer_Click">String Replacer</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkDatabases" OnClick="lnkDatabases_Click">Databases</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkDataSources" OnClick="lnkDataSources_Click">Data Sources</asp:LinkButton></li>
        </ul>
    </div>
    <table width="100%">
        <tr>
            <td><b>Version:</b></td>
            <td><asp:Label runat="server" ID="lblVersionNum"></asp:Label></td>
        </tr>
    </table>
    <cf:DatabaseBuilder ID="DatabaseBuilder1" runat="server" Visible="False" />
    <cf:DataSourceBuilder ID="DataSourceBuilder1" runat="server" Visible="False"/>
    <cf:LSRView ID="LSRView1" runat="server" Visible="False"/>
    <cf:validationbuilder ID="ValidationBuilder1" runat="server" Visible="False"/>
</div>
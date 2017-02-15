<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.FormView" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.InstalledApplications" %>
<%@ Import Namespace="Jenzabar.ContainedForm.Helpers" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<script>
    jQuery(document).ready(function () {
        if (location.href.indexOf("_portletview_") >= 0) {
            $('body').addClass('portletOnly');
        }
        jQuery('.formTabs ul:first li').each(function () {
            var id = jQuery('a', this).attr('data-tabid');
            var href = jQuery('a', this).attr('href');
            var newid = jQuery('.formTabs div[id*=' + id + ']').attr('id');
            jQuery('a', this).attr('href', href.replace('Tab' + id, newid));
        });
    });
</script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/commonScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/formViewScripts.js?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName)) %>'></script>
<script>
    jQuery(document).ready(function () {
        var tabs = jQuery('.formTabs').tabs();
        if (tabs.hasClass('jcf-vertical-tabs')) {
            tabs.addClass("ui-tabs-vertical ui-helper-clearfix");
            jQuery('li', tabs).removeClass("ui-corner-top").addClass("ui-corner-left");
        }

        var currentTab = getUrlParameter("tab");
        if (currentTab != null && currentTab != '')
            SelectTab(currentTab);

        if (jQuery('[id*="_hdnUnanswered"]').val() != '') {
            var items = JSON.parse(jQuery('[id*="_hdnUnanswered"]').val());

            for (var x in items) {
                jQuery('[itemid="' + items[x] + '"]').addClass('required');
            }
        }

        if (jQuery('[id*=hdn_requiredQuestions]').length > 0) {
            var reqField = jQuery('[id*=hdn_requiredQuestions]').val();
            var req = (reqField).split(';');
            for (var x in req) {
                if (req[x] != null && req[x] != '') {
                    if (jQuery('.reqIndicator', '[itemgroup=' + req[x] + ']').length == 0) {
                        jQuery('[piece=label]', '[itemgroup=' + req[x] + ']').prepend('<span class=\'reqIndicator\'>*</span>');
                    }
                }
            }
        }
    });
</script>
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/generatedScripts.ashx?v=" + new InstalledApplicationService().GetApplicationVersion(FormResources.ApplicationName) + "&formId=" + FormId) %>'></script>
<div id="pSection">
    <asp:HiddenField ID="_hdnUnanswered" runat="server" />
    <asp:HiddenField runat="server" ID="hdnSetTab"/>
    <center>
        <asp:Panel ID="_pnlAdminLinks" runat="server"  CssClass="AdminLinks">
        <asp:LinkButton ID="_lnkAdminPortlet" runat="server" 
            onclick="_lnkAdminPortlet_Click">Manage Forms</asp:LinkButton>
            </asp:Panel>
        <asp:Panel ID="_pnlReportLinks" runat="server" CssClass="AdminLinks">
        <asp:LinkButton ID="_lnkReportView" runat="server"
            onclick="_lnkReportView_Click">View Reports</asp:LinkButton>
        </asp:Panel>
    </center>
    <asp:Panel ID="_pnlFormDisplay" CssClass="jcf-form-display" runat="server"></asp:Panel>
</div>
<asp:Literal runat="server" id="litIframe"></asp:Literal>
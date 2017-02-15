<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextAdminEmberApp.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TextMessagingAdministrationPortlet.Views.Controls.TextAdminEmberApp" %>
<%@ Import Namespace="System.Web.Optimization" %>

<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>
<%: Styles.Render("~/Portlets/ICS/TextMessagingAdministrationPortlet/Styles/dependency-bundle.css") %>
<%: Scripts.Render("~/Portlets/ICS/TextMessagingAdministrationPortlet/Scripts/dependency-bundle.js") %>

<script type="text/javascript">
    jenzabar.textMessagingAdmin = jenzabar.textMessagingAdmin || {};

    (function (textMessagingAdmin, $) {
        'use strict';

        // If uncommented out, shows all deprecation warnings
        //Ember.ENV.RAISE_ON_DEPRECATION = true;

        var rootUrl = jenzabar.framework.portalSettings.webApiRootUrl;

        textMessagingAdmin.settings = {
            emberDataNamespace: rootUrl.substring(1, rootUrl.length - 1),
            webApiRoot: rootUrl + '/textmessages/'

        };

        <%--if ('<%= DefaultView %>' !== '') {
            textMessagingAdmin.settings.currentFullCalendarView = '<%= DefaultView %>';
        }--%>

        // Portlet ID is an important key for web service communication.
        textMessagingAdmin.settingsPortletId = '<%= GetSettingsPortletId() %>';
        textMessagingAdmin.portletId = '<%= GetPortletId() %>';

        // FireFox form issue work around
        jenzabar.framework.emberFirefoxFormFix();

    }(jenzabar.textMessagingAdmin, jQuery));
</script>

<%: Scripts.Render("~/Portlets/ICS/TextMessagingAdministrationPortlet/Scripts/text-messaging-administration-bundle.js") %>

<div id="view-container"></div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CalendarPortlet.Views.DefaultView" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web.UI.Authentication" %>

<script type="text/javascript">
    jenzabar.calendar = jenzabar.calendar || {};


    (function (cal, $) {
        'use strict';

        var rootUrl = jenzabar.framework.portalSettings.webApiRootUrl;

        cal.settings = {
            calendarServiceUrl: rootUrl + 'calendars',
            calendarEventServiceUrl: rootUrl + 'calendarevents/',
            globWebServiceUrl: rootUrl + 'calendarglobalization/'
        };

        var viewData = {};
        // Portlet ID is an important key for web service communication.
        viewData.portletId = '<%= GetPortletId() %>';
        viewData.settingsPortletId = '<%= GetSettingsPortletId() %>';
        viewData.targetDiv = '#<%= ViewContainer.ClientID %>';
        viewData.portletUrl = '<%= ParentPortlet.GetChangeScreenURL("MainView")%>';
        viewData.permissions = {};
        viewData.permissions.canAdminEvents = <%= ParentPortlet.AccessCheck(PermissionConstants.CanAdminEvents).ToString().ToLower()%>;

        $(function () {
            cal.initDefaultView(viewData);
        });
    }(jenzabar.calendar, jQuery));
</script>

<%: Scripts.Render("~/Portlets/ICS/CalendarPortlet/Scripts/calendarDefaultView-bundle.js") %>

<div class="default-view">
    <div id="ViewContainer" runat="server"></div> 
</div>
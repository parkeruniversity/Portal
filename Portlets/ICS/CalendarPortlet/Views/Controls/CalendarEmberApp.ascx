<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarEmberApp.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CalendarPortlet.Views.Controls.CalendarEmberApp" %>
<%@ Import Namespace="System.Web.Optimization" %>


<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>
<%: Styles.Render("~/Portlets/ICS/CalendarPortlet/Styles/dependency-bundle.css") %>
<%: Scripts.Render("~/Portlets/ICS/CalendarPortlet/Scripts/dependency-bundle.js") %>

<script type="text/javascript">
    jenzabar.calendar = jenzabar.calendar || {};

    (function (cal, $) {
        'use strict';

        // If uncommented out, shows all deprecation warnings
        //Ember.ENV.RAISE_ON_DEPRECATION = true;

        var rootUrl = jenzabar.framework.portalSettings.webApiRootUrl;

        cal.settings = {
            emberDataNamespace: rootUrl.substring(1, rootUrl.length - 1),
            calendarServiceUrl: rootUrl + 'calendars',
            calendarEventServiceUrl: rootUrl + 'calendarevents/',
            calendarRecurrenceOptionsServiceUrl: rootUrl + 'calendarrecurrenceoptions',
            globWebServiceUrl: rootUrl + 'calendarglobalization/',
            calendarValidationWebServiceUrl: rootUrl + 'calendarvalidation/',
            calendarEventValidationWebServiceUrl: rootUrl + 'calendareventvalidation/',
            calendarRecurrenceWebServiceUrl: rootUrl + 'calendarrecurrenceoptions/',
            calendarSeriesNextOccurenceWebServiceUrl: rootUrl + 'CalendarEventSeriesNextOccurence/',
            currentFullCalendarDate: moment('<%= DefaultDate.ToString("d")%>', 'MM/DD/YYYY'),
            isMyPages: <%= IsMyPages().ToString().ToLower()%>,
            isGuest: <%= IsGuest().ToString().ToLower() %>,
            canManageExCalendars: <% = CanManageExiCalendars().ToString().ToLower() %>
        };

        if ('<%= DefaultView %>' !== '') {
            cal.settings.currentFullCalendarView = '<%= DefaultView %>';
        }

        // Portlet ID is an important key for web service communication.
        cal.settingsPortletId = '<%= GetSettingsPortletId() %>';
        cal.portletId = '<%= GetPortletId() %>';

        // FireFox form issue work around
        jenzabar.framework.emberFirefoxFormFix();

    }(jenzabar.calendar, jQuery));
</script>

<%: Scripts.Render("~/Portlets/ICS/CalendarPortlet/Scripts/calendar-bundle.js") %>

<div id="view-container"></div>
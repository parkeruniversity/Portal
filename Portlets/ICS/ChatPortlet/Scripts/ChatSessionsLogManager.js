jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};

(function (chatSessionLogManager, portalSettings, $, handlebars, resourceManager) {

    var selectors = {
        Session: {
            container: "[data-id='sessionContainer']"
        },
        AllLogs: {
            container :"[data-id=portlet-log]",
            deleteAll: "[data-id='deleteAll']",
            downloadAll: "[data-id='downloadAll']"
        },
        MonthlyLogs: {
            container: "[data-id='monthly-portlet-log']",
            deleteAll: "[data-id='deleteAllMonthly']",
            downloadAll: "[data-id='downloadAllMonthly']"
        },SessionLog: {
            deleteSessionLogs: "[data-id='delete']",
            downloadSessionLogs: "[data-id='download']"
        }
    };


    var openHtmlToNewWindow = function (sessionId) {
        $.when(resourceManager.SessionLogs.getActivityforSession(sessionId)).done(function (sessionLogHtml) {
                var newWindow = window.open();
                newWindow.document.write(sessionLogHtml);
                newWindow.document.close();
      });
    };
    chatSessionLogManager.load = function() {

        $(selectors.SessionLog.downloadSessionLogs).click(function () {
            openHtmlToNewWindow($(this).data("session-id"));
        });

        $(selectors.SessionLog.deleteSessionLogs).each(function () {
            var sessionId = $(this).data("session-id");
            var deleteLink = $(this);

            $(this).click(function () {
                $.when(resourceManager.SessionLogs.deleteAllSessionLogs(sessionId)).done(function () {
                    deleteLink.closest(selectors.Session.container).hide('slow', function () {
                        deleteLink.closest(selectors.Session.container).remove();
                  });
                });
            });
        });

        $(selectors.MonthlyLogs.deleteAll).each(function () {
            $(this).click(function () {
                var deleteLink = $(this);
                var portletId = deleteLink.data("portlet-id");
                var month = deleteLink.data("month");

                $.when(resourceManager.SessionLogs.deleteLogsForMonth(portletId, month)).done(function () {
                    deleteLink.closest(selectors.MonthlyLogs.container).hide('slow', function () {
                        deleteLink.closest(selectors.MonthlyLogs.container).remove();
                    });
                });
            });
        });

        $(selectors.AllLogs.deleteAll).each(function () {
            $(this).click(function () {
                var deleteLink = $(this);
                var portletId = deleteLink.data("portlet-id");

                $.when(resourceManager.SessionLogs.deleteAllLogs(portletId)).done(function () {
                    $(selectors.MonthlyLogs.container).hide('slow', function () {
                        $(selectors.MonthlyLogs.container).remove();
                    });
                    deleteLink.parent().hide();
                    $(selectors.AllLogs.downloadAll).parent().hide();
                    $(this).closest(selectors.AllLogs.container).find(selectors.AllLogs.downloadAll).hide();
                });
            });
        });

        $(selectors.AllLogs.downloadAll).each(function () {
            var portletId = $(this).data("portlet-id");
            $(this).attr("href",resourceManager.SessionLogs.getSessionLogsForChatPortletURL(portletId));
        });
        
        $(selectors.MonthlyLogs.downloadAll).each(function () {
            var portletId = $(this).data("portlet-id");
            var month = $(this).data("month");
            $(this).attr("href", resourceManager.SessionLogs.getSessionLogsForChatPortletForMonthURL(portletId,month));
        });
    };

}(jenzabar.ChatPortlet.ChatSessionLogManager = {}, window.portalSettings, jQuery, Handlebars, jenzabar.ChatPortlet.ResourceManager));

$(document).ready(function() {
    jenzabar.ChatPortlet.ChatSessionLogManager.load();
});

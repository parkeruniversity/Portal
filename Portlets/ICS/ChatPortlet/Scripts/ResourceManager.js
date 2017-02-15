window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};

(function (resourceManager, $, portalSettings, handlebars) {
    "use strict";
    /**
     * Private Class, defines all the paths to the html templates related to chat UI.
     */
    var templatePaths = (function () {
        //private
        var rootPath = "Portlets/ICS/ChatPortlet/Views/";
        //public
        return {
            
            mainViewPath: rootPath +"/ActiveSessionView.html",
            activeSessionMessageSenderPath: rootPath + "/ActiveSessionMessageSenderView.html",
            usersViewPath: rootPath + "/ActiveSessionUsersView.html",
            activeSessionActivityPath: rootPath + "/ActiveSessionActivityView.html",
            closedSessionActivityLogPath: rootPath + "/ClosedSessionActivityLogView.html",
            activityLogPath: rootPath + "/ActivityLogView.html",
            addAvailabilitySlotPath: rootPath + "/AvailabilitySlot.html",
            validationMessagePath: rootPath + "/ValidationMessage.html",
            availabilityMessagePath: rootPath + "/ChatAvailabilityMessageView.html",
            availabilityMessageEditorPath: rootPath + "/ChatAvailabilityMessageEditorView.html"
        };
    })();

    /**
     * Class, manages all the access to the chat related html templates. 
     */
    resourceManager.Templates = {
        getSessionActivityView: function() {
            var sessionActivityView = $.Deferred();
            $.get(templatePaths.activeSessionActivityPath).then(function(source) {
                sessionActivityView.resolve(source);
            });
            return sessionActivityView.promise();
        },
        /**
         * Gets the Users in Session template.
         * @promise {JSON} template 
        */
        getUsersInSessionTemplate: function() {
            var usersInSessionLoader = $.Deferred();
            $.get(templatePaths.usersViewPath).done(function(usersInSessionView) {
                var usersInSessionTemplate = handlebars.compile(usersInSessionView);
                usersInSessionLoader.resolve(usersInSessionTemplate);
            });
            return usersInSessionLoader.promise();

        },
        /**
         * Get's the Session log Template.
         * @promise {Template} The html for the session log.
         */
        getClosedSessionLogTemplate: function() {
            var closedSessionLogsTemplate = $.Deferred();
            $.get(templatePaths.closedSessionActivityLogPath).done(function(activeSessionLogTemplate) {
                $.get(templatePaths.activityLogPath).done(function(activityLogTemplate) {

                    var template = handlebars.compile(activeSessionLogTemplate);
                    handlebars.registerPartial("ActivityLogView", activityLogTemplate);

                    closedSessionLogsTemplate.resolve(template);
                });
            });
            return closedSessionLogsTemplate.promise();
        },
        /**
         * Get's the chat availability template.
         * @promise {Template} The chat availability templating.
         */
        getAvailabilityTemplate: function() {
            var addAvailabilityPromise = $.Deferred();
            $.get(templatePaths.addAvailabilitySlotPath).done(function(html) {
                var template = handlebars.compile(html);
                addAvailabilityPromise.resolve(template);
            });
            return addAvailabilityPromise.promise();
        },
        /**
         * Get's the validation message template
         * @promise {Template} the template for the validation message. 
         */
        getValidationMessageTemplate: function() {
            var validationTemplatePromise = $.Deferred();
            $.get(templatePaths.validationMessagePath).done(function(html) {
                var template = handlebars.compile(html);
                validationTemplatePromise.resolve(template);
            });
            return validationTemplatePromise.promise();
        },
        /**
         * Get's the availability message template.
         * @promise {Template} the availability message template. 
         */
        getAvailabilityMessageTemplate: function() {
            var availabilityMessagePromise = $.Deferred();
            $.get(templatePaths.availabilityMessagePath).done(function (html) {
                var template = handlebars.compile(html);
                availabilityMessagePromise.resolve(template);
            });
            return availabilityMessagePromise.promise();
        },
        /**
         * Get's the availability message editor template.
         * @promise {Template} the availability message editor template. 
         */
        getAvailabilityMessageEditorTemplate : function() {
            var availabilityMessageEditorPromise = $.Deferred();
            $.get(templatePaths.availabilityMessageEditorPath).done(function (html) {
                var template = handlebars.compile(html);
                availabilityMessageEditorPromise.resolve(template);
            });
            return availabilityMessageEditorPromise.promise();
        }

    };

    /**
     * Class, for managing the globalizations
     */
    resourceManager.Globalizer = {
        getGlobalizations: $.get(portalSettings.webApiRootUrl + "ChattingGlobalizer")
    };

    /**
     * Class, for managing the session logs operations save/update/add. 
     */
    resourceManager.SessionLogs = (function() {
        var resource = {
            ActivityLogsForSession: portalSettings.webApiRootUrl + "ActivityLogsForSession",
            SessionLogsForChatPortlet: portalSettings.webApiRootUrl + "SessionLogsForChatPortlet"
        }
        /**
         * Get the chat activities for the given session
         * @param {[Guid]} sessionId 
         * @promise {JSON[]} 
         */
        var getActivityforSession = function(sessionId) {
            var request = $.Deferred();
            $.get(resource.ActivityLogsForSession+ "/" + sessionId).done(function(activityLogs) {
                $.when(resourceManager.Templates.getClosedSessionLogTemplate()).done(function(template) {
                    var html = template({ session: activityLogs });
                    request.resolve(html);
                });
            });
            return request.promise();
        };
        /**
         * Delete all the chat activity for a session log
         * @param {Guid} sessionId 
         */
        var deleteAllSessionLogs = function(sessionId) {
            var request = $.Deferred();
            $.ajax({
                url: resource.ActivityLogsForSession + "/" + sessionId,
                type: 'DELETE',
                success: function () { request.resolve(); }
            });
            return request.promise();
        };
        /**
         * Delete all the sessions and it's activities for a given chat portlet for a given month. 
         * @param {Guid} portletId The id for the chat portlet. 
         * @param {int} month The month of the year.
         */
        var deleteLogsForMonth = function(portletId, month) {
            var request = $.Deferred();
            $.ajax({
                url: resource.SessionLogsForChatPortlet,
                data: {'portletId':portletId,'month':month},
                dataType: 'JSON',
                type: 'DELETE',
                success: function () { request.resolve(); }
            });
            return request.promise();
        };
        /**
         * Delete all the sessions and activities for a given chat portlet. 
         * @param {Guid} portletId The id for the chat portlet. 
         */
        var deleteAllLogs = function(portletId) {
            var request = $.Deferred();
            $.ajax({
                url: resource.SessionLogsForChatPortlet,
                dataType: 'JSON',
                data: { 'portletId': portletId},
                type: 'DELETE',
                success: function () { request.resolve(); }
            });
            return request.promise();
        };
        /**
         * Get the web api URI for the given portlet. 
         * @param {Guid} portletId The id for the chat portlet. 
         * @promise {string} Web api URI.
         */
        var getSessionLogsForChatPortletUrl = function (portletId) {
            return resource.SessionLogsForChatPortlet + "/" + portletId;
        }
        /**
         * Get the web api URI for the given portlet for the given mont.
         * @param {Guid} portletId The id for the chat portlet. 
         * @param {int} month The month of the year.
         * @promise {string} Web api URI.
         */
        var getSessionLogsForChatPortletForMonthUrl = function (portletId,month) {
            return resource.SessionLogsForChatPortlet + "/" + portletId + "/" + month;
        }

        return {
            getActivityforSession: getActivityforSession,
            deleteAllSessionLogs: deleteAllSessionLogs,
            deleteLogsForMonth: deleteLogsForMonth,
            deleteAllLogs: deleteAllLogs,
            getSessionLogsForChatPortletURL: getSessionLogsForChatPortletUrl,
            getSessionLogsForChatPortletForMonthURL : getSessionLogsForChatPortletForMonthUrl
        }
    })();

    /**
     * Class, supports all the operations the chat availability time slots. 
     */
    resourceManager.ChatAvailability = (function () {
        var resource = {
            ChatAvailability: portalSettings.webApiRootUrl + "ChatAvailabilityScheduler"
        }
        /**
         * Update the given chat availability time slot
         * @param {JSON} timeSlot 
         */
        var putChatAvailability = function(timeSlot) {
            var request = $.Deferred();
            $.ajax({
                url: resource.ChatAvailability,
                type: 'PUT',
                data: timeSlot,
                dataType: 'JSON',
                success: function() { request.resolve(); }
            });
            return request.promise();
        };
        /**
         * Add a new chat availability time slot
         * @param {JSON} timeSlot 
         */
        var postChatAvailability = function(timeSlot) {
            var request = $.Deferred();
            $.ajax({
                url: resource.ChatAvailability,
                type: 'POST',
                data: timeSlot,
                dataType: 'JSON',
                success: function() {
                     request.resolve();
                }
            });
            return request.promise();
        };
        /**
         * Get all the chat availabilities times for a given chat portlet
         * @param {Guid} portletId 
         * @promise {JSON[]} the availability time slots
         */
        var getChatAvailabilities = function (portletId) {
            var request = $.Deferred();
            $.get(resource.ChatAvailability + "/" + portletId).done(function (timeSlots) {
                request.resolve(timeSlots);
            });
            return request.promise();
        }
        /**
         * Deletes the time slot 
         * @param {JSON} timeSlot 
         */
        var deleteChatAvailability = function(timeSlot) {
            var request = $.Deferred();
            $.ajax({
                url: resource.ChatAvailability,
                type: 'DELETE',
                data: timeSlot,
                dataType: 'JSON',
                success: function () { request.resolve(); }
            });
            return request.promise();
        }
        return {
            addAvailabilityTimeSlot: putChatAvailability,
            getChatAvailabilities: getChatAvailabilities,
            updateAvailabilityTimeSlot: postChatAvailability,
            deleteAvailabilityTimeSlot: deleteChatAvailability
    }
    })();

    /**
     * Class, manages get/update operations for the availability message for the chat portlet. 
     */
    resourceManager.AvailabilityMessage = {
        /**
         * Get the availability message through the portlet settings
         * @param {Guid} portletId the chat portlet id
         * @promise {JSON} the availability message
         */
        getAvailabilityMessage: function(portletId) {
            var request = $.Deferred();
            $.ajax({ type: 'GET', url: portalSettings.webApiRootUrl + "ChatAvailabilityMessage" + "/" + portletId })
                .then(function(response) {
                    request.resolve(response);
                });
            return request.promise();
        },
        /**
         * Set the chat availability message
         * @param {} portletId the id of the portlet.
         * @param {} message the chat availability message
         * @promise {}
         */
        updateAvailabilityMessage: function (portletId, message) {
            var request = $.Deferred();
            $.post(portalSettings.webApiRootUrl + "ChatAvailabilityMessage",
             { portletId: portletId, 'message': message },
                function (result) {
                    request.resolve();
                });

            return request.promise();
        }
    };
}(jenzabar.ChatPortlet.ResourceManager = {}, jQuery, window.portalSettings, Handlebars));
window.jQuery = window.jQuery || window.$;
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};


(function (availabilityDialog, moment, $, resourceManager, validator) {
    "use strict";
    //private
    var selectors = {
        scheduler: {
            mainView: '#chatAvailabilityScheduler',
            dataPortletId: 'portletid'
        }
    };
    var reportErrorMessage = function(dialog, message) {
        dialog.find("#timeSlotEventError").remove();
        $(dialog).append(message);
    };
    var addTimeSlotForNotFullDay = function(dialog, timeSlot) {

        var startTime = moment(dialog.find('#startTime').val(), "h:mm a").format("hh:mm a");
        var endTime = moment(dialog.find('#endTime').val(), "h:mm a").format("hh:mm a");

        var startDateTime = moment().weekday(timeSlot.dayOfTheWeek).format("MM/DD/YYYY") + " " + startTime;
        if (endTime === "12:00 am") {
            timeSlot.end = moment().weekday(timeSlot.dayOfTheWeek).add(1,'days').format("MM/DD/YYYY") + " " + endTime;
        } else {
            timeSlot.end = moment().weekday(timeSlot.dayOfTheWeek).format("MM/DD/YYYY") + " " + endTime;
        }
        

        timeSlot.start = startDateTime;

        $.when(validator.load(timeSlot.portletId)).done(function() {
            $.when(validator.isValid(timeSlot)).done(function (result) {
                if (!result.valid) {
                    reportErrorMessage(dialog, result.messageHtml);
                    return;
                } else {

                    $.when(resourceManager.ChatAvailability.addAvailabilityTimeSlot(timeSlot)).done(function () {
                        dialog.dialog("destroy").remove();
                        $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
                    });
                }
            });
        });
        
    }
   
    var addTime = function(dialog, timeSlot) {

        if (!timeSlot.allDay) {
            $.when(validator.load(timeSlot.portletId)).done(function () {
                $.when(validator.isValidTime(dialog.find('#startTime').val(), "h:mm a")).done(function (result) {
                    if (!result.valid) {
                        reportErrorMessage(dialog, result.messageHtml);
                    } else {
                        $.when(validator.isValidTime(dialog.find('#endTime').val(), "h:mm a")).done(function (result) {
                            if (!result.valid) {
                                reportErrorMessage(dialog, result.messageHtml);
                            } else {
                                addTimeSlotForNotFullDay(dialog, timeSlot);
                            }
                        });
                    }
                });
            });

        } else {
            timeSlot.start = timeSlot.start.format("MM/DD/YYYY");
            timeSlot.end = null;
            timeSlot.allDay = true;
            $.when(resourceManager.ChatAvailability.addAvailabilityTimeSlot(timeSlot)).done(function() {
                dialog.dialog("destroy").remove();
                $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
            });
        }
    };
    var getAddButtons = function (timeSlot, globalizer) {

        return [
        {
            id: "addAvailability",
            "class": "save",
            text: globalizer.addAvailability,
            click: function () {
                var dialog = $(this);
                addTime(dialog, timeSlot);
            }
        },
        {
            id: "addAvailability", "class": "cancel", text: globalizer.cancel, click: function () { $(this).dialog("destroy").remove(); }
        }
        ];
    };
    var updateNotFullDayTimeSlot = function(dialog, timeSlot) {
        var startTime = moment(dialog.find('#startTime').val(), "h:mm a").format("hh:mm a");
        var endTime = moment(dialog.find('#endTime').val(), "h:mm a").format("hh:mm a");

        var startDateTime = moment(timeSlot.start,"MM/DD/YYYY hh:mm a").format("MM/DD/YYYY") + " " + startTime;
        var endDateTime = moment(timeSlot.end,"MM/DD/YYYY hh:mm a").format("MM/DD/YYYY") + " " + endTime;

        timeSlot.start = startDateTime;
        timeSlot.end = endDateTime;
        $.when(validator.load(timeSlot.portletId)).done(function() {
            $.when(validator.isValid(timeSlot)).done(function (result) {
                if (!result.valid) {
                    dialog.find("#timeSlotEventError").remove();
                    $(dialog).append(result.messageHtml);
                    return;
                } else {

                    $.when(resourceManager.ChatAvailability.updateAvailabilityTimeSlot(timeSlot)).done(function () {
                        dialog.dialog("destroy").remove();
                        $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
                    });
                }
            });
        });
    }
    var updateTime = function(dialog, timeSlot) {
        if (!timeSlot.allDay) {
            $.when(validator.load(timeSlot.portletId)).done(function() {
                $.when(validator.isValidTime(dialog.find('#startTime').val(), "h:mm a")).done(function (result) {
                    if (!result.valid) {
                        reportErrorMessage(dialog, result.messageHtml);
                    } else {
                        $.when(validator.isValidTime(dialog.find('#endTime').val(), "h:mm a")).done(function (result) {
                            if (!result.valid) {
                                reportErrorMessage(dialog, result.messageHtml);
                            } else {
                                updateNotFullDayTimeSlot(dialog, timeSlot);
                            }
                        });
                    }
                });
            });
        } else {
            timeSlot.start = timeSlot.start.format("MM/DD/YYYY");
            $.when(resourceManager.ChatAvailability.updateAvailabilityTimeSlot(timeSlot)).done(function() {
                dialog.dialog("destroy").remove();
                $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
            });
        }
    };

    var getEditButtons = function (timeSlot, globalizer) {

        var editButtons = [];
        if (!timeSlot.allDay) {
            editButtons.push({
                id: "editAvailability",
                "class": "save",
                text: globalizer.updateAvailability,
                click: function () {
                    var dialog = $(this);
                    updateTime(dialog, timeSlot);
                }
            });
        }
        editButtons.push({ id: "cancelAvailability", "class": "cancel", text: globalizer.cancel, click: function () { $(this).dialog("destroy").remove(); } });
        editButtons.push({
            id: "deleteAvailability",
            "class": "delete",
            text: globalizer.delete,
            click: function () {
                var dialog = $(this);
                $.when(resourceManager.ChatAvailability.deleteAvailabilityTimeSlot(timeSlot)).done(function () {
                    dialog.dialog("destroy").remove();
                    $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
                });
            }
        });
        return editButtons;
    }
    var getDialogData = function (timeSlot, isEdit) {
        var deferred = $.Deferred();
        $.when(resourceManager.Globalizer.getGlobalizations).done(function (globalizer) {
            $.when(resourceManager.Templates.getAvailabilityTemplate()).done(function (template) {
                var startTime = '', endTime = '';
                if (!timeSlot.allDay) {
                    startTime = moment(timeSlot.start, "MM/DD/YYYY hh:mm a").format("h:mm a");
                    endTime = moment(timeSlot.end, "MM/DD/YYYY hh:mm a").format("h:mm a");
                }
                var html = template({ 'timeSlot': timeSlot,'startTime':startTime,'endTime':endTime, 'globalizer': globalizer, 'mode': { 'isEdit': isEdit } });
                deferred.resolve(html, globalizer);
            });
        });
        return deferred.promise();
    }
    //public
    availabilityDialog.showAddMode = function (timeSlot) {
        $.when(getDialogData(timeSlot, false)).done(function (html, globalizer) {
            var dialogSettings = {
                height: "auto",
                width: 450,
                draggable: false,
                modal: true,
                buttons: getAddButtons(timeSlot, globalizer),
                close: function () {
                    $(this).dialog("destroy").remove();
                },
                dialogClass: 'addChatAvailability'
            };
            var dialog = $(html).dialog(dialogSettings);
            if (!timeSlot.allDay) {
                dialog.find('#startTime').timepicker({
                    'timeFormat': 'g:i a'
                });
                dialog.find('#endTime').timepicker({
                    'timeFormat': 'g:i a'
                });
            }
        });
    };
    availabilityDialog.showEditMode = function (timeSlot) {
        $.when(getDialogData(timeSlot, true)).done(function (html, globalizer) {

            var dialogSettings = {
                height: "auto",
                width: 450,
                draggable: false,
                modal: true,
                buttons: getEditButtons(timeSlot, globalizer),
                dialogClass: 'editChatAvailability',
                close: function () {
                    $(this).dialog("destroy").remove();
                }
            };
            var dialog = $(html).dialog(dialogSettings);

            if (!timeSlot.allDay) {
                dialog.find('#startTime').timepicker({
                    'timeFormat': 'g:i a'
                });
                dialog.find('#endTime').timepicker({
                    'timeFormat': 'g:i a'
                });
            }

        });
    };
})(jenzabar.ChatPortlet.AvailabilityDialog = {}, moment, jQuery, jenzabar.ChatPortlet.ResourceManager, jenzabar.ChatPortlet.Validator);
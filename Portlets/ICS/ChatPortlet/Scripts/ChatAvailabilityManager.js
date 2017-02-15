window.jQuery = window.jQuery || window.$;
window.jenzabar = window.jenzabar || {};
jenzabar.ChatPortlet = jenzabar.ChatPortlet || {};

(function (chatAvailabilityManager, $, resourceManager,availabilityDialog,validator,messageEditor) {
    "use strict";
    //private
    var selectors = {
        scheduler: {
            mainView: '#chatAvailabilityScheduler',
            chatAvailabilityMessageEditorContainer:'#chatAvailabilityMessageEditorContainer',
            availabilityMessageEditor :'#chatAvailabilityMessageEditor',
            dataPortletId: 'portletid'
        }
    };
    var buildTimeSlot = function (eventDetail) {
        var portletId = $(selectors.scheduler.mainView).data(selectors.scheduler.dataPortletId);
        var startDateTime = eventDetail.startTime.format("MM/DD/YYYY") + " " + eventDetail.startTime.format("hh:mm a");
        var endDateTime = eventDetail.endTime.format("MM/DD/YYYY") + " " + eventDetail.endTime.format("hh:mm a");
        return {
            "portletId": portletId,
            "availabilityId": eventDetail.availabilityId,
            "start": eventDetail.setYearPrefix ? startDateTime : eventDetail.startTime.format("hh:mm a"),
            "end": eventDetail.setYearPrefix ? endDateTime : eventDetail.endTime.format("hh:mm a"),
            "dayOfTheWeek": eventDetail.startTime.day(),
            "dayOfTheWeekText": eventDetail.startTime.format("dddd"),
            "allDay": eventDetail.allDay
        }
    }
    
    var availabilitySchedulerSettings = {
        header: { left: '', center: '', right: '' }, views: {agendaWeek: {columnFormat: 'ddd'}},
        selectHelper: true, editable: true, selectable: true, defaultView: 'agendaWeek',
        selectConstraint: { start: '00:01', end: '24:00' },
        events: function (start, end, timezone, callback) {
            var portletId = $(selectors.scheduler.mainView).data(selectors.scheduler.dataPortletId);
            $.when(resourceManager.ChatAvailability.getChatAvailabilities(portletId)).done(function(availabilitySlots) {
                callback(availabilitySlots);
            });
        },
        select: function (start, end, jsEvent, view) {
            var startTime = start !== null ? start: moment();
            var endTime = end !== null ? end : moment(startTime).add(15, "minutes");
            var eventDetail = {
                'startTime': startTime,
                'endTime': endTime,
                'setYearPrefix': true,
                'availabilityId': null,
                'allDay': false
            };
            var timeSlot = buildTimeSlot(eventDetail);
            availabilityDialog.showAddMode(timeSlot);
        },
        dayClick: function (date, jsEvent, view) {
            if (date.hasTime()) return;
            var portletId = $(selectors.scheduler.mainView).data(selectors.scheduler.dataPortletId);
            var timeSlot = {
                "portletId": portletId,
                "availabilityId": null,
                "start": date,
                "end": null,
                "dayOfTheWeek": date.day(),
                "dayOfTheWeekText": date.format("dddd"),
                "allDay": true
            }
            availabilityDialog.showAddMode(timeSlot);
        },
        eventClick: function (calEvent, jsEvent, view) {
            if (!calEvent.allDay) {
                var eventDetail = {
                    'startTime': calEvent.start,
                    'endTime': calEvent.end,
                    'setYearPrefix': true,
                    'availabilityId': calEvent.availabilityId,
                    'allDay': false
                };
                var timeSlot = buildTimeSlot(eventDetail);
                availabilityDialog.showEditMode(timeSlot);
            } else {

                var timeSlotAllDay = {
                    "portletId": calEvent.portletId,
                    "availabilityId": calEvent.availabilityId,
                    "start": calEvent.start.format("MM/DD/YYYY"),
                    "end": null,
                    "dayOfTheWeek": calEvent.start.day(),
                    "dayOfTheWeekText": calEvent.start.format("dddd"),
                    "allDay": true
                }
                availabilityDialog.showEditMode(timeSlotAllDay);
            }
        },
        eventDrop: function (event, delta, revertFunc) {
            if (event.start == null) { revertFunc(); return; }
            if (event.end == null) { revertFunc(); return; }


            var eventDetail = {
                'startTime': event.start,
                'endTime': event.end,
                'setYearPrefix': true,
                "availabilityId": event.availabilityId,
                'allDay': false
            };
            var timeslot = buildTimeSlot(eventDetail);
            $.when(validator.load(event.portletId)).done(function () {
                $.when(validator.isValid(timeslot)).done(function (result) {
                    if (result.valid) {
                        $.when(resourceManager.ChatAvailability.updateAvailabilityTimeSlot(timeslot)).done(function () {
                            $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
                        });
                    } else {
                        revertFunc();
                    }
                });
            });
        },
        eventResize: function (event, delta, revertFunc) {
            if (event.start == null) { revertFunc(); return; }
            if (event.end == null) { revertFunc(); return; }

            var eventDetail = {
                'startTime': event.start,
                'endTime': event.end,
                'setYearPrefix': true,
                "availabilityId": event.availabilityId,
                'allDay': false
            };
            var timeslot = buildTimeSlot(eventDetail);
            $.when(validator.load(event.portletId)).done(function () {
                $.when(validator.isValid(timeslot)).done(function (result) {
                    if (result.valid) {
                        $.when(resourceManager.ChatAvailability.updateAvailabilityTimeSlot(timeslot)).done(function () {
                            $(selectors.scheduler.mainView).fullCalendar('refetchEvents');
                        });
                    } else {
                        revertFunc();
                    }
                });
            });

        },
        viewRender: function () {
            $('.fc-axis').append('<span class="screenReaderText">' + availabilitySchedulerSettings.timeText + '</span>');
        }
    };
    var loadScheduler = function (globalizer) {
        availabilitySchedulerSettings.allDayText = globalizer.allDay;
        availabilitySchedulerSettings.timeText = globalizer.time;
        $(selectors.scheduler.mainView).fullCalendar(availabilitySchedulerSettings);
    };
    //public
    chatAvailabilityManager.load = function () {
        $.when(resourceManager.Globalizer.getGlobalizations).done(function (globalizer) {
            messageEditor.load(globalizer);
            loadScheduler(globalizer);               
        });
    };

})(jenzabar.ChatPortlet.ChatAvailabilityManager = {}, jQuery,
    jenzabar.ChatPortlet.ResourceManager, jenzabar.ChatPortlet.AvailabilityDialog,
    jenzabar.ChatPortlet.Validator,jenzabar.ChatPortlet.ChatAvailabilityMessageEditor);

$(document).ready(function () {
    "use strict";
    jenzabar.ChatPortlet.ChatAvailabilityManager.load();
});
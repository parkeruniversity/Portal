(function (cal, $) {
    'use strict';

     cal.initDefaultView = function(viewData) {
         getText(viewData);
     }

     function htmlEncode(value) {
         return $('<div/>').text(value).html();
     }

     function renderMoreDetailsQueryString(event) {
         var qs = '';

         if (event.eventSource !== 'jics') {
             qs += 'eventSource=' + event.eventSource;
         }

         if (event.eventType !== 'default') {
             if (qs.length > 0) qs += '&';
             qs += 'eventType=' + event.eventType;
         }

         if (qs.length > 0) qs = '?' + qs;

         return qs;
     };

     function getText(viewData) {
         $.ajax({ url: jenzabar.calendar.settings.globWebServiceUrl + 'default' })
             .then(function (response) {
                 viewData.text = response;
                 getEvents(viewData);
             });
     }

     function getEvents(viewData) {
         var start = moment().startOf('day');;
         var end = moment(start).add(30, 'day');

         $.ajax({
             url: jenzabar.calendar.settings.calendarEventServiceUrl,
             data: {
                 portletId: viewData.portletId,
                 settingsPortletId: viewData.settingsPortletId,
                 fullCalendar: true,
                 start: start.format('l'),
                 end: end.format('l')
             }
         })
             .then(function (response) {
                 viewData.events = response;
                 renderEvents(viewData, start, end);
             });
     }

     function renderEvents(viewData, start, end) {
         var i, maxEvents = 5, calEvent, currDate = '';

         // Full calendar link and Add an event button.
         var html = '<div class="float-right">'
             + '<a class="ember-action-link" href="' + viewData.portletUrl + '">' + viewData.text.viewFullCalendar + '</a>';

         if (viewData.permissions.canAdminEvents) {
             html += '<a class="save" href="' + viewData.portletUrl + '#/event/add">' + viewData.text.addAnEvent + '</a>';
         }

         html += '</div><div class="clearBoth"></div>';

         // Date range header.
         html += '<div class="fc-center"><h2>'
             + start.format('MMMM D') + ' — ' + end.format('MMMM D, YYYY')
             + '</h2></div>\r\n'
             + '<div class="calendar-list-view">\r\n';

         var remainingEvents = viewData.events.length - maxEvents;
         var displayEvents = [];
         var count = 0;
         currDate = moment(start);
         while (currDate <= end) {

             var endCurrDate = moment(currDate).add(1, 'days');
             for (i = 0; i < viewData.events.length; i++) {
                 calEvent = viewData.events[i];
                 calEvent.start = moment(calEvent.start);
                 calEvent.end = moment(calEvent.end);

                 if ((!calEvent.allDay
                         && calEvent.start >= currDate
                         && calEvent.start < endCurrDate)
                     || (calEvent.allDay
                         && calEvent.start < endCurrDate
                         && calEvent.end > currDate)) {

                     if (calEvent.allDay) {
                         calEvent = $.extend({}, calEvent);
                     }
                     calEvent.eventDate = currDate.format("M/D/YYYY");
                     displayEvents.push(calEvent);

                     count++;
                     if (count === maxEvents) break;
                 }
             }
             if (count === maxEvents) break;
             currDate.add(1, 'days');
         }

         // Render events.
         currDate = null;
         for (i = 0; i < displayEvents.length; i++) {
             calEvent = displayEvents[i];

             if (i === maxEvents) break;

             if (currDate !== calEvent.eventDate) {
                 if (i > 0) {
                     html += '<div class="last"></div>';
                 }
                 var displayDate = moment(new Date(calEvent.eventDate));
                 html += '<div class="date"><a class="ember-action-link" href="'
                     + viewData.portletUrl + '&calendarView=agendaDay&date=' + displayDate.format('l') + '">'
                     + displayDate.format("ddd, MMM Do")
                     + '</a></div>';
                 currDate = calEvent.eventDate;
             }

             html += '<div><span class="noBreak">';
             if (calEvent.allDay) {
                 html += viewData.text.allDay;
             } else {
                 html += calEvent.start.format("h:mm a")
                     + ' - ' + calEvent.end.format('h:mm a');
             }
             html += '</span>'
                 + '<span class="noBreak truncateMedium">'
                 + '<a class="ember-action-link" href="' + viewData.portletUrl + '#/event/' + calEvent.id
                 + renderMoreDetailsQueryString(calEvent) + '">' + htmlEncode(calEvent.title) + '</a>'
                 + '</span>'
                 + (calEvent.location
                     ? '<span class="noBreak truncateMedium location">'
                     + viewData.text.eventAt + htmlEncode(calEvent.location)
                     + '</span>'
                     : '')
                 + '</div>\r\n';
         }
         // Show message if no events or more link if more than maxEvents.
         if (i === 0) {
             html += viewData.text.noEvents + '\r\n';
         } else if (i === maxEvents && remainingEvents > 0) {
             html += '<div class="more date"><a class="ember-action-link" href="'
                 + viewData.portletUrl + '&calendarView=list&date=' + start.format('l') + '">'
                 + '+' + (remainingEvents).toString() + ' ' + viewData.text.more
                 + ' <span class="screenReaderText">' + viewData.text.calendarEvents + '</span> '
                 + '</a></div>';
         }
         // Close div and add to page.
         html += '</div>';

         $(viewData.targetDiv).html(html);
     }

 }(jenzabar.calendar, jQuery));
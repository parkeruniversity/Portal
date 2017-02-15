"use strict";

/* jshint ignore:start */



/* jshint ignore:end */

define('calendar/adapters/application', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].RESTAdapter.extend({
        namespace: jenzabar.calendar.settings.emberDataNamespace
    });
});
define("calendar/adapters/scheduled-event", ["exports", "ember-data"], function (exports, _emberData) {

    /*Custom adapter for scheduled-event model. Uses different rest endpoint to retrieve data*/
    exports["default"] = _emberData["default"].RESTAdapter.extend({

        //Makes controller name singular in URL
        //Example: /api/rest/scheduledEvent instead of api/rest/scheduledEvents
        pathForType: function pathForType(type) {
            var camelized = Ember.String.camelize(type);
            return camelized;
        },

        namespace: jenzabar.framework.urlUtil.getAppRoot() + "webserviceproxy/exi/rest"
    });
});
define('calendar/app', ['exports', 'ember', 'calendar/resolver', 'ember/load-initializers', 'calendar/config/environment'], function (exports, _ember, _calendarResolver, _emberLoadInitializers, _calendarConfigEnvironment) {

  var App = undefined;

  _ember['default'].MODEL_FACTORY_INJECTIONS = true;

  App = _ember['default'].Application.extend({
    modulePrefix: _calendarConfigEnvironment['default'].modulePrefix,
    podModulePrefix: _calendarConfigEnvironment['default'].podModulePrefix,
    Resolver: _calendarResolver['default'],
    rootElement: '#view-container'
  });

  // Add any additional attributes you would like to use in a text helper
  _ember['default'].TextSupport.reopen({
    attributeBindings: ['aria-required']
  });

  (0, _emberLoadInitializers['default'])(App, _calendarConfigEnvironment['default'].modulePrefix);

  exports['default'] = App;
});
define('calendar/components/app-version', ['exports', 'ember-cli-app-version/components/app-version', 'calendar/config/environment'], function (exports, _emberCliAppVersionComponentsAppVersion, _calendarConfigEnvironment) {

  var name = _calendarConfigEnvironment['default'].APP.name;
  var version = _calendarConfigEnvironment['default'].APP.version;

  exports['default'] = _emberCliAppVersionComponentsAppVersion['default'].extend({
    version: version,
    name: name
  });
});
define('calendar/components/date-range', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        setup: (function () {
            $('#dateRangeDatePicker').datepicker({
                onSelect: function onSelect(date) {
                    $('#calendar').fullCalendar('gotoDate', new Date(date));
                }
            });
            $('.date-range-container').on('click', function () {
                $('#dateRangeDatePicker').datepicker('show');
            });
        }).on('didInsertElement')
    });
});
define('calendar/components/delete-calendar-button', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Component.extend({
        tagName: 'span',

        actions: {
            confirmDelete: function confirmDelete() {
                this.send('toggleConfirmDeleteEventModal');
            },
            deleteCalendar: function deleteCalendar(calendar) {
                this.sendAction('deleteCalendar', calendar);
                this.send('toggleConfirmDeleteEventModal');
            },
            cancelDelete: function cancelDelete() {
                this.sendAction('cancelDelete');
                this.send('toggleConfirmDeleteEventModal');
            },
            toggleConfirmDeleteEventModal: function toggleConfirmDeleteEventModal() {
                var modal = this.get('comp-confirm-delete-calendar-modal');
                modal.send('toggleModal');
            }
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')
    });
});
define('calendar/components/delete-event-button', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Component.extend({
        tagName: 'span',

        actions: {
            confirmDelete: function confirmDelete() {
                this.send('toggleConfirmDeleteEventModal');
            },
            deleteEvent: function deleteEvent(event) {
                this.sendAction('deleteEvent', event);
                this.send('toggleConfirmDeleteEventModal');
            },
            cancelDelete: function cancelDelete() {
                this.sendAction('cancelDelete');
                this.send('toggleConfirmDeleteEventModal');
            },
            toggleConfirmDeleteEventModal: function toggleConfirmDeleteEventModal() {
                var modal = this.get('comp-confirm-delete-event-modal');
                modal.send('toggleModal');
            }
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')
    });
});
define('calendar/components/delete-recurring-event-button', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Component.extend({
        tagName: 'span',

        actions: {
            confirmDelete: function confirmDelete() {
                this.send('toggleConfirmDeleteEventModal');
            },
            deleteEvent: function deleteEvent(event) {
                this.sendAction('deleteEvent', event);
                this.send('toggleConfirmDeleteEventModal');
            },
            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                this.sendAction('deleteRecurringEvent', recurringEventId);
                this.send('toggleConfirmDeleteEventModal');
            },
            cancelDelete: function cancelDelete() {
                this.sendAction('cancelDelete');
                this.send('toggleConfirmDeleteEventModal');
            },
            hideParentModal: function hideParentModal() {
                this.sendAction('cancelDelete');
            },
            toggleConfirmDeleteEventModal: function toggleConfirmDeleteEventModal() {
                var modal = this.get('comp-confirm-delete-event-modal');
                modal.send('toggleModal');
            }
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')
    });
});
define('calendar/components/edit-recurring-event', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Component.extend({
        actions: {
            toggleEditRecurringEventModal: function toggleEditRecurringEventModal() {
                this.toggleModal();
            },

            editOccurence: function editOccurence() {
                var thisComponent = this;
                var calendarEvent = thisComponent.get('event');
                var userIsEditingTimes = thisComponent.get('userIsChangingTimes');
                if (userIsEditingTimes === true) {
                    var revertFunction = thisComponent.get('revertFunc');
                    var name = calendarEvent.title;
                    var calendarId = calendarEvent.calendarId;
                    var start = calendarEvent.start.format('MM/DD/YY hh:mm a');
                    var end = calendarEvent.end.format('MM/DD/YY hh:mm a');
                    var isAllDay = calendarEvent.allDay;
                    var eventId = calendarEvent.id;
                    var eventRepeats = false;
                    this.isNameUniqueForCalendarAndTimes(name, start, end, isAllDay, calendarId, eventId, eventRepeats).done(function (eventIsUnique) {
                        if (!eventIsUnique) {
                            if (revertFunction) {
                                revertFunction();
                            }
                            thisComponent.toggleModal();
                            return;
                        } else {
                            thisComponent.sendAction('editOccurence', calendarEvent, userIsEditingTimes);
                            thisComponent.set('revertFunc', undefined);
                            thisComponent.set('userIsChangingTimes', undefined);
                            thisComponent.toggleModal();
                        }
                    });
                } else {
                    this.sendAction('editOccurence', calendarEvent);
                }
            },

            editSeries: function editSeries() {
                var thisComponent = this;
                var calendarEvent = thisComponent.get('event');
                var userIsEditingTimes = thisComponent.get('userIsChangingTimes');

                if (userIsEditingTimes === true) {
                    var revertFunction = thisComponent.get('revertFunc');
                    var name = calendarEvent.title;
                    var calendarId = calendarEvent.calendarId;
                    var start = calendarEvent.start.format('MM/DD/YY hh:mm a');
                    var end = calendarEvent.end.format('MM/DD/YY hh:mm a');
                    var isAllDay = calendarEvent.allDay;
                    var eventId = calendarEvent.id;
                    var eventRepeats = true;

                    thisComponent.isNameUniqueForCalendarAndTimes(name, start, end, isAllDay, calendarId, eventId, eventRepeats).done(function (eventIsUnique) {
                        if (!eventIsUnique) {
                            if (revertFunction) {
                                revertFunction();
                            }
                            thisComponent.toggleModal();
                            return;
                        } else {
                            var isEventDrop = thisComponent.get('isEventDrop');
                            if (isEventDrop === true) {
                                // Check if the recurring event was droped onto a different day
                                var delta = thisComponent.get('delta');
                                var originalStart = moment(calendarEvent.start).subtract(delta);
                                if (originalStart.isSame(calendarEvent.start, 'day') === false) {
                                    thisComponent.sendAction('editSeries', calendarEvent);
                                    thisComponent.set('revertFunc', undefined);
                                    thisComponent.set('userIsChangingTimes', undefined);
                                    return;
                                }
                            }
                            thisComponent.sendAction('editSeries', calendarEvent, userIsEditingTimes);
                            thisComponent.set('revertFunc', undefined);
                            thisComponent.set('userIsChangingTimes', undefined);
                            thisComponent.toggleModal();
                        }
                    });
                } else {
                    thisComponent.sendAction('editSeries', calendarEvent);
                }
            },

            onCloseModal: function onCloseModal() {
                var revertFunction = this.get('revertFunc');
                if (revertFunction) {
                    // The user canceled out of the modal after changing a repeating events times via drag and drop.
                    // Call the revert function passed in from the full calendar event handler for the time change
                    revertFunction();
                    this.set('userIsChangingTimes', undefined);
                }
            }
        },

        toggleModal: function toggleModal() {
            var modal = this.get('comp-edit-recurring-event-modal');
            var revertFunction = this.get('revertFunc');
            if (revertFunction && modal.get('enabled') === true) {
                // The user canceled out of the modal after changing a repeating events times via drag and drop.
                // Call the revert function passed in from the full calendar event handler for the time change
                revertFunction();
                this.set('userIsChangingTimes', undefined);
            }
            modal.send('toggleModal');
        },

        isNameUniqueForCalendarAndTimes: function isNameUniqueForCalendarAndTimes(name, start, end, isAllDay, calendarId, eventId, isRecurringEvent) {
            var validationUrl = jenzabar.calendar.settings.calendarEventValidationWebServiceUrl;
            var data;
            if (eventId && isRecurringEvent) {
                data = {
                    eventName: name,
                    existingEventId: eventId,
                    calendarId: calendarId,
                    start: start,
                    end: end,
                    calendarMove: true,
                    isRecurringEvent: isRecurringEvent
                };
            } else {
                data = {
                    eventName: name,
                    calendarId: calendarId,
                    start: start,
                    end: end,
                    calendarMove: true
                };
            }
            return $.ajax({
                url: validationUrl,
                data: data
            });
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')
    });
});
define('calendar/components/event-info', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        actions: {
            bindEvent: function bindEvent(calEvent, eventElement) {
                var componentContent = $(this.element);
                var contentToShowOnTooltip = componentContent.find('#eventInfo-content');
                this.BindEventInfoOnTooltip(calEvent, eventElement, contentToShowOnTooltip);
            },

            deleteEvent: function deleteEvent(event) {
                this.sendAction('deleteEvent', event);
                this.get('currentEventApi').hide();
            },

            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                this.sendAction('deleteRecurringEvent', recurringEventId);
                this.get('currentEventApi').hide();
            },

            hideEventInfo: function hideEventInfo() {
                if (this.get('currentEventApi')) {
                    this.get('currentEventApi').hide();
                }
            },
            editEvent: function editEvent() {
                this.sendAction('editEvent', this.get('event'));
            }
        },

        /**
         * Gets the display for the event start or end date based on the option given.
         * @param calEvent {JSON} The event model that needs to be shown.
         * @param option {string} The option telling which date is needed, start/end.
         */
        getEventInfoForDisplay: function getEventInfoForDisplay(calEvent, option, hideDay) {
            if (option === 'start') {
                return !calEvent.allDay ? calEvent.start.format('ddd, MMM Do h:mm a') : calEvent.start.format('ddd, MMM Do');
            }
            if (option === 'end') {
                var date = moment(calEvent.end);
                if (calEvent.allDay) {
                    date.add(-1, 'day');
                    return date.format('ddd, MMM Do');
                }
                return hideDay ? date.format('h:mm a') : date.format('ddd, MMM Do h:mm a');
            }
        },
        /**
         * Binds the event info tool tip to the event from full calendar.
         * @param calEvent {JSON} The event model that needs to be shown.
         * @param jsEvent {Object} The event contains the DOM element to which we need to anchor the tool tip
         * @param content {jQuery} The content wrapped by JQuery which we need to show in the tool-tip.
         * @param options {JSON} This is optional. The client to this function can override the default values of the tool-tip. (qtip2)
         */
        BindEventInfoOnTooltip: function BindEventInfoOnTooltip(calEvent, eventElement, content, options) {
            var thisComponent = this;
            var placeholder = $('#eventInfo-placeholder'); // the placeholder to insert the content of the event info.

            //define the default options
            var defaults = {
                style: 'qtip-light qtip-rounded qtip-shadow',
                position: {
                    my: 'bottom center', // anchor the tool-tip to the
                    at: 'top center',
                    target: 'mouse',
                    adjust: { mouse: false },
                    viewport: $('#calendar') //TODO: this does not belong here but should be replaced by a parameter or an option.
                },
                show: { event: 'click' },
                hide: { event: 'unfocus', leave: false, fixed: true },
                events: {
                    render: function render(event, api) {
                        $(this).prependTo(placeholder);
                    },
                    show: function show(event, api) {
                        var startTimeDisplay = calEvent.start !== null ? thisComponent.getEventInfoForDisplay(calEvent, 'start', false) : '';
                        var endTimeDisplay = calEvent.end !== null ? thisComponent.getEventInfoForDisplay(calEvent, 'end', calEvent.start.isSame(calEvent.end, 'd')) : '';
                        var allDayDisplay = calEvent.allDay ? ' ' + thisComponent.get('text.allDay') : '';
                        endTimeDisplay = startTimeDisplay === endTimeDisplay || endTimeDisplay === '' ? '' : ' - ' + endTimeDisplay;
                        thisComponent.set('time', startTimeDisplay + endTimeDisplay + allDayDisplay);
                        thisComponent.set('location', calEvent.location ? thisComponent.get('text').at + ' ' + calEvent.location : '');
                        thisComponent.set('currentEventApi', api);
                        thisComponent.set('description', calEvent.description);
                        thisComponent.set('event', calEvent);
                        thisComponent.set('title', calEvent.title);
                        thisComponent.set('canAdminEvents', !calEvent.isReadOnly && thisComponent.get('settings.operations.canadminevents'));
                        api.set('content.text', $(thisComponent.element).find('.eventInfo-content'));
                    }
                }
            };

            //setup options for tool-tip.
            options = options || $.extend({}, defaults, options || {});
            //no tool-tip setup, then initialized then return the API to it.
            $(eventElement).qtip({
                //prerender: true,
                style: { classes: options.style },
                content: { text: content, button: typeof thisComponent.get('text') !== 'undefined' ? thisComponent.get('text').close : '' },
                position: options.position,
                show: options.show,
                hide: options.hide,
                events: options.events
            }).qtip('api');
        },

        /**
         * Exposes this component which can be accessed by the component, this component is bound to.
         */
        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')
    });
});
/* jshint undef: true, unused: false ,-W079*/
/* globals $*/
define('calendar/components/exi-event-info', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {
            goBack: function goBack() {
                this.sendAction('goBack');
            }
        },

        //-----------------------
        // Functions
        //-----------------------

        /**
         * Formats the 911 address into a concatenated string
         * @param {Object} Postal Address from EXi
         * @returns {String} - Concatenated address string 
         */
        formatAddress911: function formatAddress911(address911) {
            var formattedAddress = address911.address1;
            if (address911.address2) formattedAddress += ", " + address911.address2;
            if (address911.city) formattedAddress += ", " + address911.city;
            if (address911.state && address911.state.abbreviation) formattedAddress += ", " + address911.state.abbreviation;
            if (address911.zipCode) formattedAddress += " " + address911.zipCode;

            return formattedAddress;
        },

        /**
         * Gets the campus name from a facility. This information is stored only in FacilityPlace, not FacilitySpace
         * @param {Object} facility - Can be a FacilityPlace or FacilitySpace
         * @returns {string} - The campus name of the FacilityPlace
         */
        getCampusName: function getCampusName(facility) {
            var campusName = null;

            //If it is space and the parent place has campus name
            if (facility.parentPlaceRelationship != null && facility.parentPlaceRelationship.location != null && facility.parentPlaceRelationship.location.description) {
                campusName = facility.parentPlaceRelationship.location.description;
            }

            //If it is place and has campus name
            else if (facility.location != null && facility.location.description) {
                    campusName = facility.location.description;
                }

            return campusName;
        },

        /**
         * Gets the 911 address from a facility. This information is located only in FacilityPlace, not FacilitySpace
         * @param {Object} facility - Can be a FacilityPlace or FacilitySpace 
         * @returns {string} - Formatted full 911 address of the FacilityPlace
         */
        get911Address: function get911Address(facility) {
            var address911 = null;

            //If it is space and the parent place has 911 address
            if (facility.parentPlaceRelationship != null && facility.parentPlaceRelationship.address911 != null) {
                address911 = facility.parentPlaceRelationship.address911;
            }
            //If it is place and has 911 address
            else if (facility.address911 != null) {
                    address911 = facility.address911;
                }

            return address911;
        },

        //-----------------------
        // End of Functions
        //-----------------------

        //-----------------------
        // Computed Properties
        //-----------------------

        /**
         * Check whether or not to show the register button. 
         * @returns {Boolean}
         */
        showRegisterButton: _ember['default'].computed(function () {

            var registrationUrl = this.get('exiEvent.details.registrationUrl'),
                regEndDateString = this.get('exiEvent.details.registrationEndDate'),
                endDateString = this.get('exiEvent.timeslot.endDate'),
                now = moment();

            // If there is no registration url defined or the event is over
            if (registrationUrl == null) {
                return false;
            }

            //If there is an end datetime and it is after now
            if (endDateString != null && now.isAfter(moment(endDateString))) {
                return false;
            }

            //If today is after registration end date
            if (regEndDateString != null) {
                var regEndDate = moment(regEndDateString);
                if (now.startOf('day').isAfter(regEndDate, 'day')) {
                    return false;
                }
            }

            return true;
        }),

        /**
         * Checks if there are any contact fields for the event. Name, phone, email.
         * @returns {Boolean}
         */
        isContactInfo: _ember['default'].computed(function () {
            return this.get('exiEvent.details.promotionalContactPhone') || this.get('exiEvent.details.promotionalContactEmail') || this.get('exiEvent.details.promotionalContactName');
        }),

        /**
         * Format the per person fee with a dollar sign and decimal point
         */
        perPersonFeeFormatted: _ember['default'].computed(function () {
            var fee = this.get('exiEvent.details.perPersonFee');

            if (fee != null) {
                return '$' + fee.toFixed(2);
            }

            return null;
        }),

        /**
         * Formats the start and end time for the schedulevent event into a string
         */
        timeslotFormatted: _ember['default'].computed(function () {
            var startDateString = this.get('exiEvent.timeslot.startDate');
            var endDateString = this.get('exiEvent.timeslot.endDate');

            if (startDateString == null || endDateString == null) {
                return null;
            }

            var startDate = moment(startDateString);
            var endDate = moment(endDateString);

            //If the start and end date are on the same day
            //Example: Tues, Jan 1st 3:00 pm - 5:00 pm
            if (startDate.isSame(endDate, 'day')) {
                return startDate.format('ddd, MMM Do h:mm a') + ' - ' + endDate.format('h:mm a');
            }

            //Example: Tue, Jan 1st 10:00 pm - Wed, Jan 2nd 2:00 am
            return startDate.format('ddd, MMM Do h:mm a') + ' - ' + endDate.format('ddd, MMM Do h:mm a');
        }),

        /**
         * Returns a string with the name of the facility. 
         * If it is a place, it returns only the place name. 
         * If it is a space, then it returns the space name followed by a comma and the place name.
         */
        facility: _ember['default'].computed(function () {

            var relatedFacility = this.get('exiEvent.relatedFacility');

            //If there is no facility
            if (relatedFacility == null) return null;

            //If place, return place name
            if (relatedFacility.parentPlaceRelationship == null) return relatedFacility.name;

            //If space, concatenate place name
            return relatedFacility.name + ', ' + relatedFacility.parentPlaceRelationship.name;
        }),

        /**
         * Returns a string with the campus name followed by the 911 address if there is one for the associated place.
         * If it is a space it retrieves the information from its parent place.
         */
        campusAndAddress911: _ember['default'].computed('exiEvent.relatedFacility', function () {

            var relatedFacility = this.get('exiEvent.relatedFacility');

            //If there is no facility return
            if (relatedFacility == null) return null;

            var campusName = this.getCampusName(relatedFacility);
            var address911 = this.get911Address(relatedFacility);

            //Campus but no address
            if (campusName != null && address911 == null) {
                return campusName;
                //Address but no campus
            } else if (campusName == null && address911 != null) {
                    return this.formatAddress911(address911);
                    //Campus name and address
                } else if (campusName != null && address911 != null) {
                        return campusName + ' | ' + this.formatAddress911(address911);
                    }

            return null;
        }),

        /**
         * Returns the appropriate registration message based on the the registration start and end date.
         */
        registrationMessage: _ember['default'].computed(function () {
            var regStartDateString = this.get('exiEvent.details.registrationStartDate'),
                regEndDateString = this.get('exiEvent.details.registrationEndDate'),
                endDateString = this.get('exiEvent.timeslot.endDate'),
                formatString = jenzabar.framework.stringUtil.format; //String formatting function

            //If reg start and end date are null return null
            if (regStartDateString == null && regEndDateString == null) return null;

            //If there is an event end date/time
            if (endDateString != null) {
                var endDate = moment(endDateString);

                //If the event is over, show registration closed
                if (moment().isAfter(endDate)) {
                    return this.get('text.registrationClosed');
                }
            }

            var today = moment().startOf('day'); //Get the beginning of today

            //If there is a registration start date
            if (regStartDateString != null) {
                var regStartDate = moment(regStartDateString);

                if (today.isBefore(regStartDate)) {

                    //Number of days between now and reg start date
                    var daysBetween = regStartDate.diff(today, 'days');

                    //If reg start date is more than 14 days away, display reg start date
                    if (daysBetween > 14) {
                        return formatString(this.get('text.registrationStartsOnDate'), regStartDate.format('MM/DD/YYYY'));
                    }

                    //If less than or equal to 14, display days remaining until registration begins
                    return formatString(this.get('text.registrationBeginsInDays'), daysBetween);
                }
            }

            //If there is registration end date
            if (regEndDateString != null) {
                var regEndDate = moment(regEndDateString);

                //Get number of days between today and registration end
                var daysBetween = regEndDate.diff(today, 'days');

                //If registration end date is not today AND is less than two weeks away or the registration start date is not null
                if (daysBetween > 0 && (daysBetween <= 14 || regStartDateString != null)) {
                    return formatString(this.get('text.registrationEndsInDays'), daysBetween);
                }

                //If today is registration end date
                if (daysBetween === 0) {
                    return this.get('text.registrationEndsToday');
                }

                //If today is after reg end date
                if (today.isAfter(regEndDate)) {
                    return this.get('text.registrationClosed');
                }
            }

            return null;
        })

        //-----------------------
        // End of Computed Properties
        //-----------------------

    });
});
define('calendar/components/full-calendar-list-view', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        actions: {
            editEvent: function editEvent(event) {
                this.sendAction('editEvent', event);
            },
            deleteEvent: function deleteEvent(event) {
                this.sendAction('deleteEvent', event);
            },
            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                this.sendAction('deleteRecurringEvent', recurringEventId);
            },

            changeDate: function changeDate(date) {
                $('#calendar').fullCalendar('changeView', 'agendaDay');
                $('#calendar').fullCalendar('gotoDate', date);
            }
        }
    });
});
define('calendar/components/full-calendar', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {

            deleteEvent: function deleteEvent(event) {
                this.sendAction('deleteEvent', event);
            },
            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                this.sendAction('deleteRecurringEvent', recurringEventId);
            },

            moveEvent: function moveEvent(event, revertFunc, delta, isEventDrop) {
                // Close the event info popup
                var eventInfoPopup = this.get('comp-eventInfo');
                eventInfoPopup.send('hideEventInfo');

                // If the event is not recurring, then edit the event
                if (event.eventRepeats === false) {
                    this.sendAction('updateEvent', event);
                } else {
                    // Open the edit recurring event modal
                    var editRecurringEvent = this.get('comp-edit-recurring-event');
                    editRecurringEvent.set('event', event);
                    editRecurringEvent.set('userIsChangingTimes', true);
                    editRecurringEvent.set('delta', delta);
                    editRecurringEvent.set('isEventDrop', isEventDrop);
                    editRecurringEvent.set('revertFunc', revertFunc);
                    editRecurringEvent.send('toggleEditRecurringEventModal');
                }
            },
            editEvent: function editEvent(event) {
                // Close the event info popup
                var eventInfoPopup = this.get('comp-eventInfo');
                eventInfoPopup.send('hideEventInfo');
                // If the event is not recurring, then edit the event
                if (event.eventRepeats === false) {
                    this.sendAction('editEvent', event);
                } else {
                    // Open the edit recurring event modal
                    var editRecurringEvent = this.get('comp-edit-recurring-event');
                    editRecurringEvent.set('event', event);
                    editRecurringEvent.send('toggleEditRecurringEventModal');
                }
            },
            editOccurence: function editOccurence(event, userIsEditingTimes, revertFunc) {
                this.sendAction('editOccurence', event, userIsEditingTimes, revertFunc);
            },
            editSeries: function editSeries(event, userIsEditingTimes, revertFunc) {
                this.sendAction('editSeries', event, userIsEditingTimes, revertFunc);
            },

            addEvent: function addEvent(title, start, end, isMonthView) {
                this.sendAction('addEvent', title, start, end, isMonthView);
            },
            quickAddEventToAdd: function quickAddEventToAdd(title, start, end, isMonthView) {
                this.sendAction('quickAddEventToAdd', title, start, end, isMonthView);
            },
            bindEventInfo: function bindEventInfo(calEvent, jsEvent) {
                var modal = this.get('comp-eventInfo');
                modal.send('bindEvent', calEvent, jsEvent);
            }
        },

        initComponent: (function () {
            var defaultCalendar;
            $.fullCalendar.views.list = this.createListView(this);
            this.configureFullCalendar(this);
            this.get('calendars').forEach(function (item) {
                if (item.get('isDefault')) {
                    defaultCalendar = item;
                }
            });
            this.set('defaultCalendar', defaultCalendar);
        }).on('didInsertElement'),

        getIncludedCalendars: function getIncludedCalendars() {
            if (jenzabar.calendar.includedCalendars === undefined) {
                return '';
            } else {
                var list = '';
                var first = true;
                for (var key in jenzabar.calendar.includedCalendars) {
                    if (jenzabar.calendar.includedCalendars.hasOwnProperty(key) && jenzabar.calendar.includedCalendars[key] === true) {
                        if (first) {
                            first = false;
                        } else {
                            list += ',';
                        }
                        list += key;
                    }
                }
                if (list === '') {
                    return 'none';
                }
                return list;
            }
        },

        getQtip: function getQtip(eventElement) {
            var content = $('#quick-add-event-popup');
            var toolTip = $(eventElement).qtip({
                //prerender: true,
                style: { classes: 'qtip-light qtip-rounded qtip-shadow' },
                content: { text: content },
                position: {
                    my: 'bottom center',
                    at: 'top center',
                    target: 'mouse',
                    show: { solo: true },
                    adjust: {
                        mouse: false
                    },
                    viewport: $('#calendar')
                },
                hide: { event: 'click unfocus', leave: false, fixed: true, target: content.find('#quick-add-event-close') },
                events: {
                    render: function render(event, api) {
                        $(this).prependTo($('#quick-add-event-placeholder'));
                    }
                }
            }).qtip('api');
            return toolTip;
        },

        createListView: function createListView(component) {
            var calStartDate;
            return $.fullCalendar.View.extend({
                // make a subclass of View
                initialize: function initialize() {
                    this.intervalDuration = moment.duration(31, 'day');
                },

                computeRange: function computeRange(date) {
                    date = date.startOf('day');
                    calStartDate = date;

                    return $.fullCalendar.View.prototype.computeRange.call(this, date); // get value from the super-method
                },

                renderEvents: function renderEvents(events) {

                    var updatedEvents = [];

                    // Need to sync this internal full cal date to what we get from the events web service for all day.
                    // This takes into account browser variances, so be very careful with the lines of code from here...
                    var currDate = moment(new Date(calStartDate.format()));
                    if (currDate.hours() !== 0) {
                        currDate = currDate.add(-currDate.utcOffset(), 'minutes');
                    }
                    var allDayCurrDate = moment(currDate).utc().add(currDate.utcOffset(), 'minutes');
                    // to here.
                    var calEndDate = moment(currDate).add(31, 'days');

                    while (currDate < calEndDate) {
                        var dayEvents = [];

                        var endCurrDate = moment(currDate).add(1, 'days');
                        var allDayEndCurrDate = moment(allDayCurrDate).add(1, 'days');
                        for (var index = 0; index < events.length; ++index) {

                            var calEvent = events[index];

                            if (!calEvent.allDay && calEvent.start >= currDate && calEvent.start < endCurrDate || calEvent.allDay && calEvent.start < allDayEndCurrDate && calEvent.end > allDayCurrDate) {

                                var startDate = calEvent.start.format('M/D/YYYY');
                                calEvent.date = startDate;
                                calEvent.listDate = currDate;
                                calEvent.displayDate = currDate.format('ddd, MMM Do');
                                calEvent.displayHours = calEvent.start.format('h:mm a');
                                if (calEvent.end) {
                                    calEvent.displayHours += ' - ' + calEvent.end.format('h:mm a');
                                }
                                calEvent.canAdmin = !calEvent.isReadOnly && component.get('settings.operations.canadminevents');

                                dayEvents.push(calEvent.allDay ? $.extend({}, calEvent) : calEvent);
                            }
                        }

                        if (dayEvents.length > 0) {
                            dayEvents[0].isFirst = true;
                            dayEvents[dayEvents.length - 1].isLast = true;
                            $.merge(updatedEvents, dayEvents);
                        }

                        currDate = endCurrDate;
                        allDayCurrDate = allDayEndCurrDate;
                    }

                    component.set('listViewHasNoEvents', updatedEvents.length === 0);
                    component.set('listViewEvents', updatedEvents);
                },

                destroyEvents: function destroyEvents() {
                    component.set('listViewHasNoEvents', false);
                    component.set('listViewEvents', null);
                }
            });
        },

        isNameUniqueForCalendarAndTimes: function isNameUniqueForCalendarAndTimes(name, start, end, calendarId, eventId, isRecurringEvent) {
            var validationUrl = jenzabar.calendar.settings.calendarEventValidationWebServiceUrl;
            var data;
            if (eventId && isRecurringEvent) {
                data = {
                    eventName: name,
                    existingEventId: eventId,
                    calendarId: calendarId,
                    start: start,
                    end: end,
                    calendarMove: true,
                    isRecurringEvent: isRecurringEvent
                };
            } else {
                data = {
                    eventName: name,
                    calendarId: calendarId,
                    start: start,
                    end: end,
                    calendarMove: true
                };
            }
            return $.ajax({
                url: validationUrl,
                data: data
            });
        },

        configureFullCalendar: function configureFullCalendar(component) {
            var defaultView;
            if (jenzabar.calendar.settings.currentFullCalendarView !== undefined) {
                defaultView = jenzabar.calendar.settings.currentFullCalendarView;
            } else {
                var defaultViewPortletSetting = this.get('settings.portletSettings.defaultViewType');
                switch (defaultViewPortletSetting) {
                    case 'month':
                        defaultView = 'month';
                        break;
                    case 'week':
                        defaultView = 'agendaWeek';
                        break;
                    case 'day':
                        defaultView = 'agendaDay';
                        break;
                    case 'event':
                        defaultView = 'list';
                        break;
                    default:
                        defaultView = 'month';
                        break;
                }
            }
            var defaultDate = new moment();
            if (jenzabar.calendar.settings.currentFullCalendarDate !== undefined) {
                defaultDate = jenzabar.calendar.settings.currentFullCalendarDate;
            }

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,today,next',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,list'
                },
                views: {
                    list: {
                        titleFormat: 'LL'
                    }
                },
                allDayText: this.text.allDay,
                height: 800,
                eventLimit: 5,
                scrollTime: '08:00:00',
                weekends: true,
                fixedWeekCount: true,
                defaultView: defaultView,
                defaultDate: defaultDate,
                selectable: true,
                selectHelper: true,
                editable: true,
                timezone: 'local',
                events: {
                    url: jenzabar.calendar.settings.calendarEventServiceUrl,
                    data: function data() {
                        return {
                            fullCalendar: true,
                            portletId: jenzabar.calendar.portletId,
                            settingsPortletId: jenzabar.calendar.settingsPortletId,
                            includedCalendars: component.getIncludedCalendars()
                        };
                    }
                },
                loading: function loading(isLoading) {
                    var view = $('#calendar');
                    if (isLoading) {
                        view.block({
                            message: '<div class="async-loading">' + component.text.loading + '</div>',
                            css: { border: 'none', background: 'transparent' },
                            overlayCSS: { opacity: 0.0 }
                        });
                    } else {
                        view.unblock();
                    }
                },
                eventRender: function eventRender(calEvent, element) {
                    if (calEvent.calendarId) {
                        component.send('bindEventInfo', calEvent, element);
                    }
                },
                select: function select(start, end, jsEvent, view) {
                    var settings = component.get('settings');
                    var quickAddEvent, isMonthView, isAllDay;

                    if (settings.operations.canadminevents && end >= moment()) {
                        quickAddEvent = component.get('comp-quickAddEvent');
                        isMonthView = view.type === 'month';
                        isAllDay = !isMonthView && end.diff(start, 'hours') === 24;
                        quickAddEvent.send('bindToolTipToEvent', start, end, isMonthView, isAllDay, jsEvent.target);
                        quickAddEvent.send('showQuickAddEvent', jsEvent);
                        $('#calendar').fullCalendar('unselect');
                    } else {
                        $('#calendar').fullCalendar('unselect');
                    }
                },
                eventDrop: function eventDrop(event, delta, revertFunc) {
                    var settings = component.get('settings');
                    if (settings.operations.canadminevents !== true || event.isReadOnly) {
                        revertFunc();
                        return;
                    }
                    var eventDate = moment(event.start).startOf('day');
                    var todaysDate = moment().startOf('day');
                    var isBeforeToday = eventDate.isBefore(todaysDate, 'day');
                    if (event.allDay === true && isBeforeToday === true) {
                        revertFunc();
                        return;
                    }
                    if (event.end !== null && event.end <= moment()) {
                        revertFunc();
                        return;
                    }
                    var name = event.title;
                    var start = event.start.format('MM/DD/YY hh:mm a');
                    // event.end is null when event is all day
                    if (event.end === null) {
                        event.end = event.allDay ? event.start.clone().add(1, 'days') : event.start.clone().add(1, 'hours');
                    }

                    if (event.end.isBefore(moment())) {
                        revertFunc();
                        return;
                    }

                    var end = event.end.format('MM/DD/YY hh:mm a');
                    var calendarId = event.calendarId;
                    var eventRepeats = event.eventRepeats === true;

                    if (eventRepeats) {
                        var isEventDrop = true;
                        component.send('moveEvent', event, revertFunc, delta, isEventDrop);
                    } else {
                        component.isNameUniqueForCalendarAndTimes(name, start, end, calendarId).done(function (eventIsUnique) {
                            if (!eventIsUnique) {
                                revertFunc();
                                return;
                            } else {
                                component.send('moveEvent', event);
                            }
                        });
                    }
                },

                eventResize: function eventResize(event, delta, revertFunc) {
                    var settings = component.get('settings');
                    if (settings.operations.canadminevents !== true || event.end <= moment() || event.isReadOnly) {
                        revertFunc();
                        return;
                    }
                    var name = event.title;
                    var start = event.start.format('MM/DD/YY hh:mm a');
                    var end = event.end.format('MM/DD/YY hh:mm a');
                    var isAllDay = event.allDay;
                    var calendarId = event.calendarId;

                    component.isNameUniqueForCalendarAndTimes(name, start, end, calendarId).done(function (eventIsUnique) {
                        if (!eventIsUnique) {
                            revertFunc();
                            return;
                        } else {
                            if (event.eventRepeats === true) {
                                component.send('moveEvent', event, revertFunc, delta);
                            } else {
                                component.send('moveEvent', event);
                            }
                        }
                    });
                },

                dayRender: function dayRender(date, cell) {
                    $(cell).attr('id', date.format('MM-DD-YYYY'));
                },

                viewRender: function viewRender(view, element) {
                    if (view.name === 'month') {
                        $('.date-range-container').hide();
                    } else {
                        $('.date-range-container').show();

                        if (view.name !== 'list') {
                            $('.fc-axis').append('<span class="screenReaderText">' + component.text.time + '</span>');
                        }
                    }

                    var date = view.calendar.getDate();
                    // Update the date in the "Date range" date picker
                    $('#dateRangeDatePicker').datepicker('setDate', date.format('MM/DD/YYYY'));
                    // Update the settings to persist the selected view and date
                    jenzabar.calendar.settings.currentFullCalendarView = view.name;
                    jenzabar.calendar.settings.currentFullCalendarDate = date;
                }
            });

            $('.fc-prev-button').append('<span class="screenReaderText">' + this.text.prevCalendarDateRange + '</span>');
            $('.fc-next-button').append('<span class="screenReaderText">' + this.text.nextCalendarDateRange + '</span>');
        }
    });
});
/*jshint undef: true, unused: false, -W079*/
/* globals $*/
define('calendar/components/import-calendar-button', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {

            setImportUrl: function setImportUrl() {
                var thisComponent = this;
                var url = this.get('importCalendarUrl');

                var regex = new RegExp('^webcal', "i");
                if (regex.test(url)) {
                    thisComponent.showError(thisComponent.get('text.webcalNotSupported'));
                    return;
                }

                regex = new RegExp(this.get('text.urlRegEx'), "i");
                if (!regex.test(url)) {
                    thisComponent.showError(thisComponent.get('text.notValidUrl'));
                    return;
                }

                var validationUrl = jenzabar.calendar.settings.calendarValidationWebServiceUrl;

                var data = { url: url };
                $.ajax({
                    url: validationUrl,
                    data: data
                }).done(function (isInternal) {
                    if (isInternal) {
                        thisComponent.sendAction('createSubscription', url);
                    } else {
                        data = { feedUrl: url };
                        $.ajax({
                            url: validationUrl,
                            data: data
                        }).done(function (isFeed) {
                            if (isFeed) {
                                thisComponent.sendAction('setImportUrl', url);
                                thisComponent.send('toggleModal');
                            } else {
                                thisComponent.showError(thisComponent.get('text.notValidFeedUrl'));
                            }
                        });
                    }
                });
            },

            onCloseModal: function onCloseModal() {
                this.set('importCalendarUrl', '');
            },

            cancel: function cancel() {
                this.set('importCalendarUrl', '');
                this.send('toggleModal');
            },

            toggleModal: function toggleModal() {
                var modal = this.get('comp-import-calendar-modal');
                modal.send('toggleModal');
            }
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init'),

        showError: function showError(text) {
            $('span', '#urlError').text(text);
            $('#urlError').show();
            $('#importUrl').attr('aria-invalid', 'true');
            $('#importUrl').attr('aria-describedby', 'urlError');
        }

    });
});
define('calendar/components/included-calendars', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {
            subscribe: function subscribe(calendar) {
                this.sendAction('subscribe', calendar);
            },

            removeCalendar: function removeCalendar(calendar) {
                this.sendAction('removeCalendar', calendar);
            }
        },

        setup: (function () {
            this.syncCalendarStates();
            this.setToggleClick();
            this.setupQtip();
        }).on('didInsertElement'),

        setupQtip: function setupQtip() {
            var comp = this;
            $('#included-calendars-link').qtip({
                style: { classes: 'qtip-light qtip-rounded qtip-shadow' },
                show: {
                    event: 'click',
                    effect: function effect(offset) {
                        $(this).slideDown(200); // "this" refers to the tooltip
                    },
                    solo: true
                },
                hide: {
                    event: 'click unfocus',
                    target: $('#included-calendars-close-link, #included-calendars-link'),
                    effect: function effect(offset) {
                        $(this).slideUp(200); // "this" refers to the tooltip
                    }
                },
                content: { text: $('#included-calendars-content') },
                events: {
                    render: function render(event, api) {
                        $(this).prependTo($('#included-calendars-placeholder'));
                    }
                },
                position: {
                    my: 'top right',
                    at: 'bottom left',
                    target: $('#included-calendars-open-icon')
                }
            });

            $('[data-calendar-desc]').qtip({
                show: {
                    event: 'mouseenter',
                    effect: function effect(offset) {
                        $(this).slideDown(200); // "this" refers to the tooltip
                    }
                },
                hide: {
                    event: 'mouseleave',
                    effect: function effect(offset) {
                        $(this).slideUp(200); // "this" refers to the tooltip
                    }
                },
                style: { classes: 'qtip-light qtip-rounded qtip-shadow' },
                content: {
                    text: function text(event, api) {
                        return '<div class="eventInfo-content truncateLarge description wysiwygtext">' + $(this).data('calendar-desc') + '</div>';
                    }
                },
                events: {
                    render: function render(event, api) {
                        $(this).prependTo($('#included-calendars-description-placeholder'));
                    }
                },
                position: {
                    my: 'top center',
                    at: 'bottom center'
                }
            });
        },

        getContent: function getContent(el) {
            return $(el).data('calendar-desc');
        },

        syncCalendarStates: function syncCalendarStates() {
            var calendars = this.get('calendars');
            if (jenzabar.calendar.includedCalendars === undefined) {
                // The includedCalendars has not been initialized yet, so include all existing calendars
                jenzabar.calendar.includedCalendars = {};
                var myCalendarId = '00000000-0000-0000-0000-000000000000';
                var showMyCalendarByDefault = this.get('settings.portletSettings.showMyCalendar');
                calendars.forEach(function (value) {
                    if (value.id === myCalendarId) {
                        if (showMyCalendarByDefault) {
                            jenzabar.calendar.includedCalendars[value.id] = true;
                        } else {
                            // Disable the My Calendar row if the portlet setting "Show My Calendar" is set to false
                            var myCalendar = $('[data-calendarid=00000000-0000-0000-0000-000000000000]');
                            myCalendar.removeClass('enabled-calendar');
                            myCalendar.addClass('disabled-calendar');
                            myCalendar.attr('data-calendarenabled', false);
                            jenzabar.calendar.includedCalendars[value.id] = false;
                        }
                    } else {
                        jenzabar.calendar.includedCalendars[value.id] = true;
                    }
                });
            } else {
                // Look for newly added calendars
                calendars.forEach(function (value) {
                    if (jenzabar.calendar.includedCalendars[value.id] === undefined) {
                        // The calendar has been added after the initialization of jenzabar.calendar.includedCalendars
                        // So addd it to the collection
                        jenzabar.calendar.includedCalendars[value.id] = true;
                    }
                });
                // Look for newly removed calendars
                for (var key in jenzabar.calendar.includedCalendars) {
                    if (jenzabar.calendar.includedCalendars.hasOwnProperty(key)) {
                        var calendarObject;
                        calendars.forEach(function (value) {
                            if (value.id === key) {
                                calendarObject = value;
                            }
                        });
                        if (calendarObject === undefined) {
                            delete jenzabar.calendar.includedCalendars[key];
                        }
                    }
                }
                // Sync existing calendars with their state stored in jenzabar.calendar.includedCalendars
                var allRows = $('i[data-calendarenabled=true]');
                allRows.each(function (index, element) {
                    var calId = $(element).attr('data-calendarid');
                    if (jenzabar.calendar.includedCalendars[calId] === false) {
                        var elements = $('[data-calendarid=' + calId + ']');
                        elements.removeClass('enabled-calendar');
                        elements.addClass('disabled-calendar');
                        elements.attr('data-calendarenabled', false);
                    }
                });
            }
        },

        setToggleClick: function setToggleClick() {
            var thisComponent = this;
            // Handle the click to toggle state of calendar
            $('.included-calendars').on('click', function () {
                var calendarId = $(this).data('calendarid');
                var elements = $('[data-calendarid=' + calendarId + ']');
                // If it was enabled, then disable it
                if (elements.filter('[data-calendarenabled=true]').length === elements.length) {
                    elements.removeClass('enabled-calendar');
                    elements.addClass('disabled-calendar');
                    elements.attr('data-calendarenabled', false);
                    jenzabar.calendar.includedCalendars[calendarId] = false;
                } else {
                    // If it was disabled, enable it
                    elements.addClass('enabled-calendar');
                    elements.removeClass('disabled-calendar');
                    elements.attr('data-calendarenabled', true);
                    jenzabar.calendar.includedCalendars[calendarId] = true;
                }
                // Call the updateFullCalendar action on the index controller
                thisComponent.sendAction('updateFullCalendar');
            });
        },

        classNames: 'included-calendars-container',

        webApiRootUrl: jenzabar.framework.portalSettings.webApiRootUrl
    });
});
/* jshint undef: true, unused: false, -W079 */
define('calendar/components/manage-calendar', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {

            saveClick: function saveClick() {
                this.set('description', $('#description').val());

                var thisComponent = this;
                this.isValid().done(function (response) {
                    if (response === true) {
                        thisComponent.sendAction('saveCalendar', thisComponent);
                    }
                });
            },

            updateClick: function updateClick() {
                this.set('description', $('#description').val());

                var thisComponent = this;
                this.isValid().done(function (response) {
                    if (response === true) {
                        thisComponent.sendAction('updateCalendar', thisComponent);
                    }
                });
            },

            createSubscription: function createSubscription(url) {
                this.sendAction('createSubscription', url);
            },

            setImportUrl: function setImportUrl(url) {
                this.set('importCalendarUrl', url);
            },

            retrieveFeed: function retrieveFeed() {
                this.sendAction('retrieveLatestFeed', this);
            },

            goBack: function goBack() {
                this.setFieldsWithExistingValues();
                this.sendAction('cancel');
            },
            deleteCalendar: function deleteCalendar(calendar) {
                this.sendAction('deleteCalendar', calendar);
            }
        },

        isValid: function isValid() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var name = thisComponent.get('name');
            // Name Required
            if (thisComponent.get('name') === undefined || thisComponent.get('name').trim() === '') {
                $('span', '#nameError').text(thisComponent.get('text.calendarNameRequired'));
                $('#nameError').show();
                // For screen readers
                $('#name').attr('aria-invalid', 'true');
                $('#name').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            } else {
                $('span', '#nameError').text('');
                $('#nameError').hide();
            }
            // Unique Name for Portlet
            if (thisComponent.get('isEdit') === true && name.toLowerCase() === thisComponent.originalValues.name.toLowerCase()) {
                // we do not need to test for a unique name if it hasn't changed

                // EXi Event Calendar
                if (thisComponent.get('isExiEventsCalendar') === true) {
                    // Required EX Calendar Name
                    var externalCalendarName = thisComponent.get('externalCalendarName');
                    if (externalCalendarName === undefined || externalCalendarName.trim() === '') {
                        $('span', '#externalCalendarNameError').text(thisComponent.get('text.exiCalendarNameRequired'));
                        $('#externalCalendarNameError').show();
                        // For screen readers
                        $('#externalCalendarName').attr('aria-invalid', 'true');
                        $('#externalCalendarName').attr('aria-describedby', 'externalCalendarNameError');
                        deferred.resolve(false);
                        return deferred;
                    } else {
                        $('span', '#externalCalendarNameError').text('');
                        $('#externalCalendarNameError').hide();
                    }
                    var existingCalendarId = null;
                    if (thisComponent.get('isEdit') === true) {
                        existingCalendarId = thisComponent.get('calendar.id');
                    }
                    thisComponent.isExternalCalendarNameUnique(externalCalendarName, existingCalendarId).done(function (response) {
                        if (response === false) {
                            $('span', '#externalCalendarNameError').text(thisComponent.get('text.exiCalendarNameMustBeUnique'));
                            $('#externalCalendarNameError').show();
                            // For screen readers
                            $('#externalCalendarName').attr('aria-invalid', 'true');
                            $('#externalCalendarName').attr('aria-describedby', 'externalCalendarNameError');
                            deferred.resolve(false);
                            return deferred;
                        } else {
                            $('span', '#externalCalendarNameError').text('');
                            $('#externalCalendarNameError').hide();
                            deferred.resolve(true);
                            return deferred;
                        }
                    }).error(function (errorResponse) {
                        // an error occured.  Show the general error message
                        $('#addCalendarGeneralError').show();
                        deferred.resolve(false);
                        return deferred;
                    });
                } else {
                    deferred.resolve(true);
                    return deferred;
                }
            } else {
                thisComponent.isNameUnique(name).done(function (response) {
                    if (response === false) {
                        $('span', '#nameError').text(thisComponent.get('text.duplicateCalendarName'));
                        $('#nameError').show();
                        // For screen readers
                        $('#name').attr('aria-invalid', 'true');
                        $('#name').attr('aria-describedby', 'nameError');
                        deferred.resolve(false);
                        return deferred;
                    } else if (response === true) {
                        $('span', '#nameError').text('');
                        $('#nameError').hide();

                        // EXi Event Calendar
                        if (thisComponent.get('isExiEventsCalendar') === true) {
                            // Required EX Calendar Name
                            var externalCalendarName = thisComponent.get('externalCalendarName');
                            if (externalCalendarName === undefined || externalCalendarName.trim() === '') {
                                $('span', '#externalCalendarNameError').text(thisComponent.get('text.exiCalendarNameRequired'));
                                $('#externalCalendarNameError').show();
                                // For screen readers
                                $('#externalCalendarName').attr('aria-invalid', 'true');
                                $('#externalCalendarName').attr('aria-describedby', 'externalCalendarNameError');
                                deferred.resolve(false);
                                return deferred;
                            } else {
                                $('span', '#externalCalendarNameError').text('');
                                $('#externalCalendarNameError').hide();
                            }
                            var existingCalendarId = null;
                            if (thisComponent.get('isEdit') === true) {
                                existingCalendarId = thisComponent.get('calendar.id');
                            }
                            thisComponent.isExternalCalendarNameUnique(externalCalendarName, existingCalendarId).done(function (response) {
                                if (response === false) {
                                    $('span', '#externalCalendarNameError').text(thisComponent.get('text.exiCalendarNameMustBeUnique'));
                                    $('#externalCalendarNameError').show();
                                    // For screen readers
                                    $('#externalCalendarName').attr('aria-invalid', 'true');
                                    $('#externalCalendarName').attr('aria-describedby', 'externalCalendarNameError');
                                    deferred.resolve(false);
                                    return deferred;
                                } else {
                                    $('span', '#externalCalendarNameError').text('');
                                    $('#externalCalendarNameError').hide();
                                    deferred.resolve(true);
                                    return deferred;
                                }
                            }).error(function (errorResponse) {
                                // an error occured.  Show the general error message
                                $('#addCalendarGeneralError').show();
                                deferred.resolve(false);
                                return deferred;
                            });
                        } else {
                            deferred.resolve(true);
                            return deferred;
                        }
                    }
                }).error(function (errorResponse) {
                    // an error occured.  Show the general error message
                    $('#addCalendarGeneralError').show();
                    deferred.resolve(false);
                    return deferred;
                });
            }
            return deferred;
        },

        isNameUnique: function isNameUnique(name) {
            var portletId = jenzabar.calendar.portletId;
            var validationUrl = jenzabar.calendar.settings.calendarValidationWebServiceUrl;
            var data = { calendarName: name, portletId: portletId };
            return $.ajax({
                url: validationUrl,
                data: data
            });
        },

        isExternalCalendarNameUnique: function isExternalCalendarNameUnique(name, calendarId) {
            var validationUrl = jenzabar.calendar.settings.calendarValidationWebServiceUrl;
            var data = { externalCalendarName: name };

            if (calendarId !== null) {
                data.calendarId = calendarId;
            }
            return $.ajax({
                url: validationUrl,
                data: data
            });
        },

        clearFields: function clearFields() {
            this.set('name', undefined);
            this.set('description', undefined);
            this.set('isDefault', false);
            this.set('availableAsICalendarFeed', false);
            this.set('isiCalendarFeed', false);
            this.set('importCalendarUrl', undefined);
            this.set('externalCalendarName', undefined);
        },

        setupFields: (function () {

            textEditor.create($('#description'), { layout: 'simple' });

            this.originalValues = {};
            this.originalValues.name = this.get('name');
            this.originalValues.description = this.get('description');
            this.originalValues.isDefault = this.get('isDefault');
            this.originalValues.availableAsICalendarFeed = this.get('availableAsICalendarFeed');
            this.originalValues.isiCalendarFeed = this.get('isiCalendarFeed');
            this.originalValues.importCalendarUrl = this.get('importCalendarUrl');
            this.originalValues.externalCalendarName = this.get('externalCalendarName');

            var isEdit = this.get('isEdit');
            if (!isEdit) {
                this.clearFields();
            } else {
                if (this.get('isDefault') === true) {
                    $('#isDefault').attr('disabled', true);
                }
            }
        }).on('didInsertElement'),

        setFieldsWithExistingValues: function setFieldsWithExistingValues() {
            if (this.originalValues) {
                this.set('name', this.originalValues.name);
                this.set('description', this.originalValues.description);
                this.set('isDefault', this.originalValues.isDefault);
                this.set('availableAsICalendarFeed', this.originalValues.availableAsICalendarFeed);
                this.set('importCalendarUrl', this.originalValues.importCalendarUrl);
                this.set('isiCalendarFeed', this.originalValues.isiCalendarFeed);
                this.set('externalCalendarName', this.originalValues.externalCalendarName);
            }
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
/* globals textEditor*/
define('calendar/components/manage-event-recurrence', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init'),

        setExistingRecurrenceValues: function setExistingRecurrenceValues() {
            var thisComponent = this;
            var existingEvent = this.get('event');
            if (existingEvent.get('eventRepeats') !== true) {
                return;
            }
            // If editing a single occurence of a series, hide the recurrence fields
            if (thisComponent.get('isEditSeries') !== true) {
                $('#eventRecurrence').hide();
                return;
            }
            thisComponent.set('eventRepeats', true);
            $('#repeatsSpan').text(thisComponent.get('text.repeats'));

            thisComponent.configureDateAndTimePickers(existingEvent).then(function () {
                // Interval
                $('#intervalSelectContainer').removeClass('hidden');
                thisComponent.setupIntervalSelect().then(function () {
                    var interval = existingEvent.get('recurrenceInterval');
                    if (interval === 1) {
                        $('#intervalSelect').val('1').trigger('change');
                    } else if (interval === 2) {
                        $('#intervalSelect').val('2').trigger('change');
                    } else if (interval > 2) {
                        $('#intervalSelect').val('3').trigger('change');
                        $('#everyNumberInput').removeClass('hidden');
                        $('#everyNumberInput').val(interval);
                    }
                });
                // Frequency
                $('#frequencySelectContainer').removeClass('hidden');
                thisComponent.setupFrequencySelect().then(function () {
                    var existingFrequency = existingEvent.get('recurrenceFrequency');
                    //var frequencyWeekdays = existingEvent.get('recurrenceFrequencyWeekdays');
                    //var offset = existingEvent.get('recurrenceOffset');

                    switch (existingFrequency) {
                        case 'D':
                            thisComponent.setExistingValuesForDailyFrequency(existingEvent);
                            break;
                        case 'W':
                            thisComponent.setExistingValuesForWeeklyFrequency(existingEvent);
                            break;
                        case 'M':
                            thisComponent.setExistingValuesForMonthlyFrequency(existingEvent);
                            break;
                        case 'Y':
                            thisComponent.setExistingValuesForYearlyFrequency(existingEvent);
                            break;
                    }
                    thisComponent.setRecurrenceEndsOnWithExistingValue(existingEvent);
                });
            });
        },

        configureDateAndTimePickers: function configureDateAndTimePickers(existingEvent) {
            var deferred = $.Deferred();
            var thisComponent = this;
            var recurringEventId = existingEvent.get('parentRecurringEventId');
            var url = jenzabar.calendar.settings.calendarSeriesNextOccurenceWebServiceUrl;
            var data = { recurringEventId: recurringEventId };
            var startMoment;
            var endMoment;
            $.ajax({
                url: url,
                data: data
            }).then(function (response) {
                startMoment = moment(response.startTime);
                if (existingEvent.get('allDay')) {
                    endMoment = moment(response.endTime).add(-1, 'days');
                } else {
                    endMoment = moment(response.endTime);
                }

                var startDateString = startMoment.format('M/D/YYYY');
                var endDateString = endMoment.format('M/D/YYYY');

                $('#startDate').datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }).datepicker('setDate', startDateString);

                $('#startTime').timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                }).timepicker('setTime', startMoment.toDate());

                $('#endDate').datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }).datepicker('setDate', endDateString);

                $('#endTime').timepicker({
                    'defaultTime': 'now',
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                }).timepicker('setTime', endMoment.toDate());

                var differenceInDays = endMoment.diff(startMoment, 'days');
                thisComponent.set('endAndStartDateDelta', differenceInDays);
                deferred.resolve();
            });
            return deferred;
        },

        setExistingValuesForDailyFrequency: function setExistingValuesForDailyFrequency(existingEvent) {
            var frequencyWeekdays = existingEvent.get('recurrenceFrequencyWeekdays');
            if (frequencyWeekdays === 'MO,TU,WE,TH,FR') {
                $('#frequencySelect').val('2').trigger('change');
            } else {
                $('#frequencySelect').val('1').trigger('change');
            }
        },

        setExistingValuesForWeeklyFrequency: function setExistingValuesForWeeklyFrequency(existingEvent) {
            var thisComponent = this;
            var frequencyWeekdays = existingEvent.get('recurrenceFrequencyWeekdays');
            // Weekdays
            if (frequencyWeekdays === 'MO,TU,WE,TH,FR') {
                $('#frequencySelect').val('2').trigger('change');
                //thisComponent.handleFrequencySelectChange();
            } else {
                    // One or more days of week selected
                    $('#frequencySelect').val('3').trigger('change');
                    //thisComponent.handleFrequencySelectChange();
                    thisComponent.showDaysOfWeekForWeekFrequencyContainer();
                    var multipleDaysSelected = false;
                    if (frequencyWeekdays.indexOf(',') > 0) {
                        // Handle multiple days of the week by setting weekFrequencySelectedDays on this component,
                        // and then set up the 'days of week' drop down which will do rest of the work for handeling multiple days
                        multipleDaysSelected = true;
                        var recurrenceFrequencyWeekdaysArray = frequencyWeekdays.split(',');
                        var newArray = [];
                        for (var i = 0; i < recurrenceFrequencyWeekdaysArray.length; i++) {
                            var newValue = thisComponent.getDisplayOfDay(recurrenceFrequencyWeekdaysArray[i]);
                            newArray.push(newValue);
                        }
                        thisComponent.set('weekFrequencySelectedDays', newArray);
                    }
                    thisComponent.setupDaysOfWeekForWeekFrequencySelect().then(function () {
                        // If only a single days is selected, then set that value in the days of week drop down.
                        if (multipleDaysSelected === false) {
                            var numericDayValue = thisComponent.getNumericValueOfDay(frequencyWeekdays);
                            $('#daysOfWeekForWeekFrequencySelect').val(numericDayValue).trigger('change');
                        }
                    });
                }
        },

        setExistingValuesForMonthlyFrequency: function setExistingValuesForMonthlyFrequency(existingEvent) {
            var thisComponent = this;
            var frequencyWeekdays = existingEvent.get('recurrenceFrequencyWeekdays');
            var offset = existingEvent.get('recurrenceOffset');
            // Every month on the nth day of week in month
            if (frequencyWeekdays) {
                thisComponent.showOnTheContainer();
                thisComponent.showDayOfWeekOccurenceForMonthContainer();
                thisComponent.showDaysOfWeekForMonthFrequencyContainer();

                $('#frequencySelect').val('5').trigger('change');
                // "Nth" day of week occurence

                thisComponent.setupDayOfWeekOccurenceForMonthSelect().then(function () {
                    // Days of Week for Month
                    thisComponent.setupDaysOfWeekForMonthFrequencySelect().then(function () {
                        var dayOfWeekValue = thisComponent.getNumericValueOfDay(frequencyWeekdays);
                        $('#daysOfWeekForMonthFrequencySelect').val(dayOfWeekValue).trigger('change');
                        if (offset === '-1') {
                            // "Last" option
                            $('#dayOfWeekOccurenceForMonthSelect').val('5').trigger('change');
                        } else {
                            $('#dayOfWeekOccurenceForMonthSelect').val(offset).trigger('change');
                        }
                    });
                });
            } else {
                // Every Month on a given day
                $('#frequencySelect').val('4').trigger('change');
                thisComponent.setupDayOfMonthSelect().then(function () {
                    $('#dayOfMonthSelect').val(offset).trigger('change');
                });
                //thisComponent.handleFrequencySelectChange().then(function() {
                //});
                thisComponent.showOnTheContainer();
                thisComponent.showDayOfMonthContainer();
            }
        },

        setExistingValuesForYearlyFrequency: function setExistingValuesForYearlyFrequency(existingEvent) {
            var thisComponent = this;
            var frequencyWeekdays = existingEvent.get('recurrenceFrequencyWeekdays');
            var offset = existingEvent.get('recurrenceOffset');
            if (frequencyWeekdays) {
                $('#frequencySelect').val('7').trigger('change');
                thisComponent.showOnTheContainer();
                thisComponent.showDayOfWeekOccurenceForMonthContainer();

                // "Nth" day of week occurence
                thisComponent.setupDayOfWeekOccurenceForMonthSelect().then(function () {
                    // Days of Week for Month
                    thisComponent.setupDaysOfWeekForMonthFrequencySelect().then(function () {
                        // Month
                        thisComponent.setupMonthSelect().then(function () {
                            var selectedMonth = existingEvent.get('recurrenceMonths');
                            $('#monthSelect').val(selectedMonth).trigger('change');
                        });
                        var dayValue = thisComponent.getNumericValueOfDay(frequencyWeekdays);
                        $('#daysOfWeekForMonthFrequencySelect').val(dayValue).trigger('change');

                        if (offset === '-1') {
                            // "Last" option
                            $('#dayOfWeekOccurenceForMonthSelect').val('5').trigger('change');
                        } else {
                            $('#dayOfWeekOccurenceForMonthSelect').val(offset).trigger('change');
                        }
                    });
                });
                thisComponent.showDaysOfWeekForMonthFrequencyContainer();
                thisComponent.showInContainer();
                thisComponent.showMonthSelectContainer();
            } else {
                $('#frequencySelect').val('6').trigger('change');
                var yearlyEventStartDate = moment(existingEvent.get('start'));
                var selectedMonth = yearlyEventStartDate.month() + 1; // Moment .month() is zero based, so add 1
                $('#monthSelect').val(selectedMonth).trigger('change');
                var selectedDayOfMonth = yearlyEventStartDate.date();
                $('#dayOfMonthForYearSelect').val(selectedDayOfMonth).trigger('change');
                $('#onContainer').removeClass('hidden');
                $('#monthSelectContainer').removeClass('hidden');
                $('#dayOfMonthForYearContainer').removeClass('hidden');
            }
        },

        setupRepeatsCheckBox: function setupRepeatsCheckBox() {
            var thisComponent = this;
            $('#repeatsCheckbox').change(function () {
                thisComponent.handleRepeatsCheckBoxChange(this);
            });
        },

        handleRepeatsCheckBoxChange: function handleRepeatsCheckBoxChange(checkbox) {
            var thisComponent = this;
            if (checkbox.checked) {
                $('#repeatsSpan').text(thisComponent.get('text.repeats'));
                $('#intervalSelectContainer').removeClass('hidden');
                $('#frequencySelectContainer').removeClass('hidden');
                thisComponent.setupIntervalSelect();
                thisComponent.setupFrequencySelect();
                $('#endsOnContainer').removeClass('hidden');
                //  Set the "Ends On" to six months after the start date
                var startDateMoment = moment($('#startDate').val());
                var sixMonthsInFuture = startDateMoment.add(6, 'M');
                $('#recurrenceEndsOn').val(sixMonthsInFuture.format('M/D/YYYY'));
            } else {
                $('#repeatsSpan').text(thisComponent.get('text.repeatsWithExample'));
                // Removed stored state selected weekdays for Week
                thisComponent.set('weekFrequencySelectedDays', undefined);
                // Remove stored state of the selected frequency drop down value
                thisComponent.set('selectedFrequency', undefined);
                // Hide any recurrence error messages
                $('#recurrenceError').hide();

                $('#intervalSelectContainer').addClass('hidden');
                $('#frequencySelectContainer').addClass('hidden');
                $('#endsOnContainer').addClass('hidden');
                $('#everyNumberInput').val('');

                // If the following elements are not hidden, then hide them
                if ($('#everyNumberInput').hasClass('hidden') === false) {
                    $('#everyNumberInput').addClass('hidden');
                }
                if ($('#onContainer').hasClass('hidden') === false) {
                    $('#onContainer').addClass('hidden');
                }
                if ($('#daysOfWeekForWeekFrequencyContainer').hasClass('hidden') === false) {
                    $('#daysOfWeekForWeekFrequencyContainer').addClass('hidden');
                }
                if ($('#onTheContainer').hasClass('hidden') === false) {
                    $('#onTheContainer').addClass('hidden');
                }
                if ($('#dayOfMonthContainer').hasClass('hidden') === false) {
                    $('#dayOfMonthContainer').addClass('hidden');
                }
                if ($('#dayOfWeekOccurenceForMonthContainer').hasClass('hidden') === false) {
                    $('#dayOfWeekOccurenceForMonthContainer').addClass('hidden');
                }
                if ($('#daysOfWeekForMonthFrequencyContainer').hasClass('hidden') === false) {
                    $('#daysOfWeekForMonthFrequencyContainer').addClass('hidden');
                }
                if ($('#monthSelectContainer').hasClass('hidden') === false) {
                    $('#monthSelectContainer').addClass('hidden');
                }
                if ($('#dayOfMonthForYearContainer').hasClass('hidden') === false) {
                    $('#dayOfMonthForYearContainer').addClass('hidden');
                }
                if ($('#inContainer').hasClass('hidden') === false) {
                    $('#inContainer').addClass('hidden');
                }
            }
        },

        setupIntervalSelect: function setupIntervalSelect() {
            var thisComponent = this;
            var deferred = $.Deferred();
            var select = $('#intervalSelect');
            // Get the data for this dropdown
            $.ajax({
                url: jenzabar.calendar.settings.calendarRecurrenceOptionsServiceUrl + '?setName=interval'
            }).then(function (result) {
                //Remove options if this is being called more than once
                select.find('option').remove();
                // Create options based of the data for this dropdown
                $.each(result.results, function (key, value) {
                    select.append($('<option></option>').attr('value', value.id).text(value.text));
                });
                // Setup select2 for this dropdown
                select.select2({
                    dropdownAutoWidth: 'true',
                    minimumResultsForSearch: -1, // hide the search bar inside the select
                    templateResult: function templateResult(item) {
                        if (item.id === '3') {
                            var newMarkUp = '<div>' + thisComponent.get('text.every');
                            newMarkUp += '<span class="calendar-portlet select-descriptive-text">';
                            newMarkUp += thisComponent.get('text.numberElipsis');
                            newMarkUp += '</span></div>';
                            return $(newMarkUp);
                        }
                        return item.text;
                    }
                });
                // intervalSelect on change event handler
                select.change(function () {
                    if (this.value === '3') {
                        var everyNumberInput = $('#everyNumberInput');
                        everyNumberInput.removeClass('hidden');
                        // Use a delay to let the input be shown after being hidden
                        setTimeout(function () {
                            everyNumberInput.focus();
                        }, 1);
                        // Remove any previous event handlers for on blur.
                        everyNumberInput.off('blur');

                        everyNumberInput.blur(function () {
                            var everyNumberValue = everyNumberInput.val().trim();
                            if (everyNumberValue === '1') {
                                $('#intervalSelect').val('1').trigger('change');
                                everyNumberInput.addClass('hidden');
                                $('#recurrenceError').hide();
                            } else if (everyNumberValue === '2') {
                                $('#intervalSelect').val('2').trigger('change');
                                everyNumberInput.addClass('hidden');
                                $('#recurrenceError').hide();
                            }
                        });
                    } else {
                        $('#recurrenceError').hide();
                        $('#everyNumberInput').val('');
                        $('#everyNumberInput').addClass('hidden');
                    }
                });
                deferred.resolve();
            });
            return deferred;
        },

        getTemplateResult: function getTemplateResult(itemText, textInParentheses) {
            var newMarkup = '<div>' + itemText;
            // Get start date currently selected
            newMarkup += '<span class="calendar-portlet select-descriptive-text">';
            newMarkup += '(';
            newMarkup += textInParentheses;
            newMarkup += ')</span>';
            newMarkup += '</div>';
            return $(newMarkup);
        },

        setupFrequencySelect: function setupFrequencySelect() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var select = $('#frequencySelect');
            // Get the data for this dropdown
            $.ajax({
                url: jenzabar.calendar.settings.calendarRecurrenceOptionsServiceUrl + '?setName=frequency'
            }).then(function (result) {
                //Remove options if this is being called more than once
                select.find('option').remove();
                // Create options based of the data for this dropdown
                $.each(result.results, function (key, value) {
                    select.append($('<option></option>').attr('value', value.id).text(value.text));
                });
                //var startDate = $('#startDate').val();
                //var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                var dayOfWeekOccurenceForMonth;
                var month;
                var nthOfMonth;
                var dayOfWeek;
                // In case this function has been called twice, remove any existing change event handlers
                select.off('change');
                // Setup Select 2
                select.select2({
                    dropdownAutoWidth: 'true',
                    minimumResultsForSearch: -1, // hide the search bar inside the select
                    templateResult: function templateResult(item) {
                        var startDate = $('#startDate').val();
                        var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                        var textInParentheses;
                        switch (item.id) {
                            case '3':
                                textInParentheses = thisComponent.get('text.on');
                                textInParentheses += ' ' + startDateMoment.format('dddd');
                                return thisComponent.getTemplateResult(item.text, textInParentheses);
                            case '4':
                                textInParentheses = thisComponent.get('text.onThe');
                                textInParentheses += ' ' + startDateMoment.format('Do');
                                return thisComponent.getTemplateResult(item.text, textInParentheses);
                            case '5':
                                dayOfWeekOccurenceForMonth = thisComponent.getNthDayOfMonth(startDateMoment);
                                dayOfWeek = startDateMoment.format('dddd');
                                textInParentheses = thisComponent.get('text.onThe') + ' ';
                                if (dayOfWeekOccurenceForMonth === 5) {
                                    textInParentheses += thisComponent.get('text.last') + ' ' + dayOfWeek;
                                } else {
                                    nthOfMonth = thisComponent.addSuffixToNumber(dayOfWeekOccurenceForMonth);
                                    textInParentheses += nthOfMonth + ' ' + dayOfWeek;
                                }
                                return thisComponent.getTemplateResult(item.text, textInParentheses);
                            case '6':
                                textInParentheses = thisComponent.get('text.on') + ' ';
                                textInParentheses += startDateMoment.format('MMMM');
                                textInParentheses += ' ' + startDateMoment.format('Do');
                                return thisComponent.getTemplateResult(item.text, textInParentheses);
                            case '7':
                                dayOfWeekOccurenceForMonth = thisComponent.getNthDayOfMonth(startDateMoment);
                                dayOfWeek = startDateMoment.format('dddd');
                                month = startDateMoment.format('MMMM');
                                textInParentheses = thisComponent.get('text.onThe') + ' ';
                                if (dayOfWeekOccurenceForMonth === 5) {
                                    textInParentheses += thisComponent.get('text.last') + ' ' + dayOfWeek + ' ' + thisComponent.get('text.in') + ' ' + month;
                                } else {
                                    nthOfMonth = thisComponent.addSuffixToNumber(dayOfWeekOccurenceForMonth);
                                    textInParentheses += nthOfMonth + ' ' + dayOfWeek + ' ' + thisComponent.get('text.in') + ' ' + month;
                                }
                                return thisComponent.getTemplateResult(item.text, textInParentheses);
                            default:
                                return item.text;
                        }
                    }
                });
                // frequencySelect on change event handler
                select.change(function () {
                    thisComponent.handleFrequencySelectChange();
                });
                // Set selection based off saved state, if it exists
                var selectedFrequency = thisComponent.get('selectedFrequency');
                if (selectedFrequency) {
                    select.val(selectedFrequency).trigger('change');
                }
                deferred.resolve();
            });
            return deferred;
        },

        setupDayOfMonthSelect: function setupDayOfMonthSelect() {
            var thisComponent = this;
            var deferred = $.Deferred();
            var select = $('#dayOfMonthSelect'); //Remove options if this is being called more than once
            select.find('option').remove();
            // Get the number of days in the Start Date month
            var startDate = $('#startDate').val();
            var startDateMoment = moment(startDate, 'MM/DD/YYYY');
            var daysInSelectedMonth = moment(startDate, 'MM/DD/YYYY').endOf('month').date();
            // For now, use 1-based index instead of zero to match day of month
            for (var i = 1; i < daysInSelectedMonth + 1; i++) {
                select.append($('<option></option>').attr('value', i).text(thisComponent.addSuffixToNumber(i)));
            }
            // In case this function has been called twice, remove any existing change event handlers
            select.off('change');
            // Setup select2 for this dropdown
            select.select2({
                dropdownAutoWidth: 'true',
                minimumResultsForSearch: -1 // hide the search bar inside the select
            });
            // Set selection based off start date
            select.val(startDateMoment.date()).trigger('change');
            // Set on change event handler
            select.on('change', function () {
                startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
                var todayMoment = moment().startOf('day');
                if (todayMoment > startDateMoment) {
                    startDateMoment = todayMoment;
                }
                var selectedDayOfMonth = Number(this.value);
                var newStartDate = startDateMoment.date(selectedDayOfMonth);
                if (todayMoment > newStartDate) {
                    // Update the start date to the next month on the selected day of month
                    newStartDate = newStartDate.add(1, 'M');
                }
                thisComponent.syncNewStartDateAndEndDate(newStartDate);
            });
            deferred.resolve();
            return deferred;
        },

        setupDayOfMonthForYearSelect: function setupDayOfMonthForYearSelect(numberOfDays) {
            var thisComponent = this;
            var deferred = $.Deferred();
            var select = $('#dayOfMonthForYearSelect');
            var daysInSelectedMonth;
            var startDate = $('#startDate').val();
            //Remove options if this is being called more than once
            select.find('option').remove();
            if (numberOfDays) {
                daysInSelectedMonth = numberOfDays;
            } else {
                // Get the number of days in the Start Date month
                daysInSelectedMonth = moment(startDate, 'MM/DD/YYYY').endOf('month').date(); // .endOf causes changes to the object it is called on
            }
            // For now, use 1-based index instead of zero to match day of month
            for (var i = 1; i < daysInSelectedMonth + 1; i++) {
                select.append($('<option></option>').attr('value', i).text(thisComponent.addSuffixToNumber(i)));
            }
            // In case this function has been called twice, remove any existing change event handlers
            select.off('change');
            // Setup select2 for this dropdown
            select.select2({
                dropdownAutoWidth: 'true',
                minimumResultsForSearch: -1 // hide the search bar inside the select
            });
            // Set the selection based off the date
            var startDateMoment = moment(startDate, 'MM/DD/YYYY');
            select.val(startDateMoment.date().toString()).trigger('change');

            // dayOfMonthForYearSelect change event handler
            select.on('change', function () {
                thisComponent.handleDayOfMonthForYearSelectChange();
            });
            deferred.resolve();
            return deferred;
        },

        handleDayOfMonthForYearSelectChange: function handleDayOfMonthForYearSelectChange() {
            var thisComponent = this;
            var startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
            var monthSelected = $('#monthSelect').val();
            var selectedDayOfMonth = $('#dayOfMonthForYearSelect').val();
            var newStartDate = thisComponent.getDayOfMonthInYearAsMoment(startDateMoment, monthSelected, selectedDayOfMonth);
            thisComponent.syncNewStartDateAndEndDate(newStartDate);
        },

        getDayOfMonthInYearAsMoment: function getDayOfMonthInYearAsMoment(startDateMoment, month, day) {
            //startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
            var todayMoment = moment().startOf('day');
            if (todayMoment > startDateMoment) {
                startDateMoment = todayMoment;
            }
            var year = startDateMoment.get('year');
            var newStartDateString = month + '/' + day + '/' + year;
            var newStartDate = moment(newStartDateString, 'MM/DD/YYYY');
            if (todayMoment > newStartDate) {
                newStartDate = newStartDate.add(1, 'Y');
            }
            return newStartDate;
        },

        setupDaysOfWeekForWeekFrequencySelect: function setupDaysOfWeekForWeekFrequencySelect() {
            var thisComponent = this;
            var deferred = $.Deferred();
            var select = $('#daysOfWeekForWeekFrequencySelect');
            // Get the data for this dropdown
            $.ajax({
                url: jenzabar.calendar.settings.calendarRecurrenceOptionsServiceUrl + '?setName=daysOfWeekForWeek'
            }).then(function (result) {
                //Remove options if this is being called more than once
                select.find('option').remove();
                // Add a new option for selected days, if present
                if (thisComponent.get('weekFrequencySelectedDays')) {
                    var daysSelection = '(';
                    $.each(thisComponent.get('weekFrequencySelectedDays'), function (index, value) {
                        if (index === 0) {
                            daysSelection += value;
                        } else {
                            daysSelection += '/' + value;
                        }
                    });
                    daysSelection += ')';
                    select.append($('<option></option>').attr('value', '0').text(daysSelection));
                }
                // Create options based of the data for this dropdown
                $.each(result.results, function (key, value) {
                    select.append($('<option></option>').attr('value', value.id).text(value.text));
                });
                // In case this function has been called twice, remove any existing change event handlers
                select.off('change');
                // Setup select2 for this dropdown
                select.select2({
                    dropdownAutoWidth: 'true',
                    minimumResultsForSearch: -1
                });
                // Set the selection based off the start date
                var startDate = $('#startDate').val();
                var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                if (thisComponent.get('weekFrequencySelectedDays')) {
                    select.val('0').trigger('change');
                } else {
                    var startDateDayOfWeek = startDateMoment.isoWeekday();
                    select.val(startDateDayOfWeek.toString()).trigger('change');
                }
                // Setup change event handler
                select.on('change', function () {
                    if (this.value === '8') {
                        var selectDaysOfWeek = thisComponent.get('comp-selectDaysOfWeek');
                        selectDaysOfWeek.send('openModal');
                    } else {
                        thisComponent.set('weekFrequencySelectedDays', undefined);
                        // Remove the dynamically added option which shows the value of selected multiple days
                        var multipleDaysSelectedOption = $('#daysOfWeekForWeekFrequencySelect option[value=\'0\']');
                        if (multipleDaysSelectedOption) {
                            multipleDaysSelectedOption.remove();
                        }
                        startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
                        var todayMoment = moment().startOf('day');
                        if (todayMoment > startDateMoment) {
                            startDateMoment = todayMoment;
                        }
                        // Change the Start Date to match the day of the week selected
                        var dayOfWeekSelected = Number(this.value);
                        var newStartDate = startDateMoment.isoWeekday(dayOfWeekSelected);
                        if (todayMoment > newStartDate) {
                            // If the new start date is in the past, add a week to it.
                            newStartDate = newStartDate.add(7, 'd');
                        }
                        thisComponent.syncNewStartDateAndEndDate(newStartDate);
                    }
                });
                deferred.resolve();
            });
            return deferred;
        },

        setupDaysOfWeekForMonthFrequencySelect: function setupDaysOfWeekForMonthFrequencySelect() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var select = $('#daysOfWeekForMonthFrequencySelect');
            // Get the data for this dropdown
            $.ajax({
                url: jenzabar.calendar.settings.calendarRecurrenceOptionsServiceUrl + '?setName=daysOfWeekForMonth'
            }).then(function (result) {
                //Remove options if this is being called more than once
                select.find('option').remove();
                // Create options based of the data for this dropdown
                $.each(result.results, function (key, value) {
                    select.append($('<option></option>').attr('value', value.id).text(value.text));
                });
                // In case this function has been called twice, remove any existing change event handlers
                select.off('change');
                // Setup select2 for this dropdown
                select.select2({
                    dropdownAutoWidth: 'true',
                    minimumResultsForSearch: -1 // hide the search bar inside the select
                });
                // Set the selection based off the start date
                var startDate = $('#startDate').val();
                var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                var dayOfWeekValue = startDateMoment.isoWeekday();
                select.val(dayOfWeekValue.toString()).trigger('change');
                // Setup change event handler
                select.on('change', function () {
                    startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
                    var selectedDayOfWeek = Number(this.value);
                    var selectedOccurenceOfDayOfWeek = Number($('#dayOfWeekOccurenceForMonthSelect').val());
                    var frequencySelectValue = $('#frequencySelect').val();
                    var newStartDate = null;
                    if (frequencySelectValue === '5') {
                        newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(startDateMoment, selectedOccurenceOfDayOfWeek, selectedDayOfWeek);
                    } else if (frequencySelectValue === '7') {
                        newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(startDateMoment, selectedOccurenceOfDayOfWeek, selectedDayOfWeek, true);
                        var todayMoment = moment().startOf('day');
                        if (todayMoment > newStartDate) {
                            // If the new start date is in the past, add a year to it
                            newStartDate = newStartDate.add(1, 'y');
                            newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(newStartDate, selectedOccurenceOfDayOfWeek, selectedDayOfWeek, true);
                        }
                    }
                    thisComponent.syncNewStartDateAndEndDate(newStartDate);
                });
                deferred.resolve();
            });
            return deferred;
        },

        setOptionsForDayOfWeekOccurenceForMonthSelect: function setOptionsForDayOfWeekOccurenceForMonthSelect() {
            var thisComponent = this;
            var select = $('#dayOfWeekOccurenceForMonthSelect');
            //Remove options if this is being called more than once
            select.find('option').remove();
            select.append($('<option></option>').attr('value', 1).text('1st'));
            select.append($('<option></option>').attr('value', 2).text('2nd'));
            select.append($('<option></option>').attr('value', 3).text('3rd'));
            select.append($('<option></option>').attr('value', 4).text('4th'));
            select.append($('<option></option>').attr('value', 5).text(thisComponent.get('text.last')));
        },

        setupDayOfWeekOccurenceForMonthSelect: function setupDayOfWeekOccurenceForMonthSelect() {
            var thisComponent = this;
            var deferred = $.Deferred();
            var select = $('#dayOfWeekOccurenceForMonthSelect');
            //Remove options if this is being called more than once
            select.find('option').remove();
            thisComponent.setOptionsForDayOfWeekOccurenceForMonthSelect();
            // In case this function has been called twice, remove any existing change event handlers
            select.off('change');
            // Setup Select2
            select.select2({
                dropdownAutoWidth: 'true',
                minimumResultsForSearch: -1 // hide the search bar inside the select
            });
            // Set the selection based off the start date
            var startDate = $('#startDate').val();
            var startDateMoment = moment(startDate, 'MM/DD/YYYY');
            var dayOfWeekOccurenceForMonth = thisComponent.getNthDayOfMonth(startDateMoment);
            select.val(dayOfWeekOccurenceForMonth.toString()).trigger('change');
            // Setup change event handler
            select.on('change', function () {
                startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
                var n = Number(this.value);
                var selectedDayOfWeek = Number($('#daysOfWeekForMonthFrequencySelect').val());
                if (selectedDayOfWeek === 0) {
                    alert('bug is here');
                    return;
                }
                var frequencySelectValue = $('#frequencySelect').val();
                var newStartDate = null;
                // Every month on the nth day of week in a month
                if (frequencySelectValue === '5') {
                    newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(startDateMoment, n, selectedDayOfWeek);
                } else if (frequencySelectValue === '7') {
                    // Every year on the nth day of week in the given month
                    newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(startDateMoment, n, selectedDayOfWeek, true);
                    var todayMomement = moment().startOf('day');
                    if (todayMomement > newStartDate) {
                        // If the new start date is in the past, add a year to it
                        newStartDate = newStartDate.add(1, 'y');
                        newStartDate = thisComponent.getNthOccurenceOfWeekdayInMonthAsMoment(newStartDate, n, selectedDayOfWeek, true);
                    }
                }
                thisComponent.syncNewStartDateAndEndDate(newStartDate);
            });
            deferred.resolve();
            return deferred;
        },

        getNthOccurenceOfWeekdayInMonthAsMoment: function getNthOccurenceOfWeekdayInMonthAsMoment(startDateMoment, n, isoWeekday, forYearlyFrequency) {
            var todayMoment = moment().startOf('day');
            // If the start date is in the past, then make it today
            if (todayMoment > startDateMoment) {
                startDateMoment = todayMoment;
            }
            var newStartDate;
            if (n === 5) {
                // The last occurence of a day of week in the month
                newStartDate = startDateMoment.endOf('month');
                while (newStartDate.isoWeekday() !== isoWeekday) {
                    newStartDate.subtract(1, 'day');
                }
                if (forYearlyFrequency !== true) {
                    if (todayMoment > newStartDate) {
                        // If the new start day is in the past, the skip to the next month's occurence
                        newStartDate = todayMoment.startOf('month').add(1, 'M').endOf('month');
                        while (newStartDate.isoWeekday() !== isoWeekday) {
                            newStartDate.subtract(1, 'day');
                        }
                    }
                }
            } else {
                newStartDate = startDateMoment.startOf('month');
                var daysToAdd;
                while (newStartDate.isoWeekday() !== isoWeekday) {
                    newStartDate.add(1, 'day');
                }
                if (n > 1) {
                    daysToAdd = (n - 1) * 7;
                    newStartDate.add(daysToAdd, 'days');
                }
                if (forYearlyFrequency !== true) {
                    // If the new start date is in the past, skip to the next months occurence
                    todayMoment = moment().startOf('day');
                    if (todayMoment > newStartDate) {
                        newStartDate = newStartDate.startOf('month').add(1, 'M');
                        while (newStartDate.isoWeekday() !== isoWeekday) {
                            newStartDate.add(1, 'day');
                        }
                        if (n > 1) {
                            daysToAdd = (n - 1) * 7;
                            newStartDate.add(daysToAdd, 'days');
                        }
                    }
                }
            }
            return newStartDate;
        },

        setupMonthSelect: function setupMonthSelect() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var select = $('#monthSelect');
            // Get the data for this dropdown
            $.ajax({
                url: jenzabar.calendar.settings.calendarRecurrenceOptionsServiceUrl + '?setName=months'
            }).then(function (result) {
                //Remove options if this is being called more than once
                select.find('option').remove();
                // Create options based of the data for this dropdown
                $.each(result.results, function (key, value) {
                    select.append($('<option></option>').attr('value', value.id).text(value.text));
                });
                // In case this function has been called twice, remove any existing change event handlers
                select.off('change');
                select.select2({
                    dropdownAutoWidth: 'true',
                    minimumResultsForSearch: -1 // hide the search bar inside the select
                });
                // Set the selection based off the start date
                var startDate = $('#startDate').val();
                var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                select.val((startDateMoment.month() + 1).toString()).trigger('change');
                // monthSelect change event handler
                select.on('change', function () {
                    return thisComponent.handleMonthSelectChange();
                });
                deferred.resolve();
            });
            return deferred;
        },

        handleMonthSelectChange: function handleMonthSelectChange() {
            var thisComponent = this;
            var startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
            var todayMoment = moment().startOf('day');
            if (todayMoment > startDateMoment) {
                startDateMoment = todayMoment;
            }
            // Find out how many days are in the newly selected month
            var monthSelected = $('#monthSelect').val();
            var year = startDateMoment.get('year');
            var firstDayOfMonthSelected = monthSelected + '/1/' + year;
            var daysInSelectedMonth = moment(firstDayOfMonthSelected, 'MM/DD/YYYY').endOf('month').date();
            var selectedDayOfMonth = $('#dayOfMonthForYearSelect').val();
            if (selectedDayOfMonth > daysInSelectedMonth) {
                selectedDayOfMonth = daysInSelectedMonth;
            }
            var newStartDate = moment(monthSelected + '/' + selectedDayOfMonth + '/' + year, 'MM/DD/YYYY');
            // If the month and day selected in the current year are in the past, then add a year to the start date.
            if (todayMoment > newStartDate) {
                year += 1;
                newStartDate = newStartDate.add(1, 'y');
                daysInSelectedMonth = moment(newStartDate).endOf('month').date();
            }
            thisComponent.setupDayOfMonthForYearSelect(daysInSelectedMonth).then(function () {
                var frequencyValue = $('#frequencySelect').val();
                // Every Year on [Month] [Day of Month]
                if (frequencyValue === '6') {
                    // Update the start date to the new month
                    var selectedDayOfMonth = $('#dayOfMonthForYearSelect').val();
                    // If the previously selected day is no longer valid in the new month (31st is not in all months for example)
                    if (selectedDayOfMonth === null) {
                        // If so, then use the end of the newly selected month
                        selectedDayOfMonth = daysInSelectedMonth;
                        $('#dayOfMonthForYearSelect').val(daysInSelectedMonth).trigger('change');
                    }
                    var newStartDateString = monthSelected + '/' + selectedDayOfMonth + '/' + year;
                    newStartDate = moment(newStartDateString, 'MM/DD/YYYY');
                }
                // Every Year On the [Nth] [Day of Week] in [Month]
                else if (frequencyValue === '7') {
                        var selectedOccurrenceOfDayOfWeek = Number($('#dayOfWeekOccurenceForMonthSelect').val());
                        var selectedDayOfWeek = Number($('#daysOfWeekForMonthFrequencySelect').val());
                        if (selectedOccurrenceOfDayOfWeek === 5) {
                            // the last occurrence of a day of week in the month
                            var endOfSelectedMonthMoment = moment(firstDayOfMonthSelected, 'MM/DD/YYYY').endOf('month');
                            newStartDate = endOfSelectedMonthMoment;
                            while (newStartDate.isoWeekday() !== selectedDayOfWeek) {
                                newStartDate.subtract(1, 'day');
                            }
                        } else {
                            newStartDate = moment(startDateMoment).startOf('month');
                            // Get the first occurence of the selected day of week in the month
                            while (newStartDate.isoWeekday() !== selectedDayOfWeek) {
                                newStartDate.add(1, 'day');
                            }
                            // If the selected occurence of the day of week is not the first, then we need to add days to the constructed new start date
                            if (selectedOccurrenceOfDayOfWeek > 1) {
                                var daysToAdd = (selectedOccurrenceOfDayOfWeek - 1) * 7;
                                newStartDate.add(daysToAdd, 'days');
                            }
                        }
                    }
                thisComponent.syncNewStartDateAndEndDate(newStartDate);
            });
        },

        syncNewStartDateAndEndDate: function syncNewStartDateAndEndDate(newStartDateMoment) {
            // Set the start date field to the new start date
            $('#startDate').val(newStartDateMoment.format('M/D/YYYY'));
            // Set the end date using the existing delta
            var endAndStartDateDelta = this.get('endAndStartDateDelta');
            var newEndDate = moment(newStartDateMoment).add(endAndStartDateDelta, 'd');
            $('#endDate').val(newEndDate.format('M/D/YYYY'));
            // Recurrence "ends on" date
            var today = moment().startOf('day');
            var existingEndsOnValue = $('#recurrenceEndsOn').val();
            if (existingEndsOnValue) {
                var existingEndsOnMoment = moment(existingEndsOnValue, 'MM/DD/YYYY');
                if (existingEndsOnMoment > today || existingEndsOnMoment > newStartDateMoment) {
                    return;
                }
            }
            var seriesEndsOnMoment = moment(newStartDateMoment).add(6, 'M');
            $('#recurrenceEndsOn').val(seriesEndsOnMoment.format('M/D/YYYY'));
        },

        setupEndsOnDatePicker: function setupEndsOnDatePicker() {
            var startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
            // Add a year to the start date for the default "ends on" date
            var endDateMoment = startDateMoment.add(6, 'M').toDate();
            $('#recurrenceEndsOn').datepicker({
                dateFormat: jenzabar.userSettings.dateFormat
            }).datepicker('setDate', endDateMoment);
        },

        setRecurrenceEndsOnWithExistingValue: function setRecurrenceEndsOnWithExistingValue(existingEvent) {
            // Set up "Ends On" date
            $('#endsOnContainer').removeClass('hidden');
            var endsOnDate = existingEvent.get('recurrenceEndDate');
            var endsOnMoment = moment(endsOnDate, 'MM/DD/YYYY');
            $('#recurrenceEndsOn').val(endsOnMoment.format('M/D/YYYY'));
        },

        handleFrequencySelectChange: function handleFrequencySelectChange() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var selectedFrequencyValue = $('#frequencySelect').val();
            // In case the Repeats drop downs get refreshed, persist the state
            thisComponent.set('selectedFrequency', selectedFrequencyValue);
            switch (selectedFrequencyValue) {
                case '1':
                    thisComponent.handleFrequencyOptionOne().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '2':
                    thisComponent.handleFrequencyOptionTwo().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '3':
                    thisComponent.handleFrequencyOptionThree().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '4':
                    thisComponent.handleFrequencyOptionFour().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '5':
                    thisComponent.handleFrequencyOptionFive().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '6':
                    thisComponent.handleFrequencyOptionSix().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
                case '7':
                    thisComponent.handleFrequencyOptionSeven().then(function () {
                        deferred.resolve();
                    });
                    return deferred;
            }
            return deferred;
        },

        handleFrequencyOptionOne: function handleFrequencyOptionOne() {
            var deferred = $.Deferred();
            var thisComponent = this;
            // When freq != 3
            thisComponent.set('weekFrequencySelectedDays', undefined);
            thisComponent.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 3 or 6
            thisComponent.hideOnContainer();
            // When freq != 4 or 5 or 7
            thisComponent.hideOnTheContainer();
            // When freq != 4
            thisComponent.hideDayOfMonthContainer();
            // When freq != 5 or 7
            thisComponent.hideDayOfWeekOccurenceForMonthContainer();
            thisComponent.hideDaysOfWeekForMonthFrequencyContainer();
            // When freq != 6 or 7
            thisComponent.hideMonthSelectContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            // When freq != 7
            thisComponent.hideInContainer();
            deferred.resolve();
            return deferred;
        },

        handleFrequencyOptionTwo: function handleFrequencyOptionTwo() {
            var deferred = $.Deferred();
            var thisComponent = this;
            var startDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
            var startDateDayOfWeek = startDateMoment.isoWeekday();
            // If the start date is a weekend, set it to the nearest Monday
            if (startDateDayOfWeek === 6 || startDateDayOfWeek === 7) {
                // 8 comes from 1 for Monday + 7 for a week in the future. 
                // Setting it to 1 would have set it to the Monday before the start date, which is likely in the past.
                var newStartDateMoment = startDateMoment.isoWeekday(8);
                thisComponent.syncNewStartDateAndEndDate(newStartDateMoment);
            }
            // When freq != 3
            thisComponent.set('weekFrequencySelectedDays', undefined);
            thisComponent.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 3 or 6
            thisComponent.hideOnContainer();
            // When freq != 4 or 5 or 7
            thisComponent.hideOnTheContainer();
            // When freq != 4
            thisComponent.hideDayOfMonthContainer();
            // When freq != 5 or 7
            thisComponent.hideDayOfWeekOccurenceForMonthContainer();
            thisComponent.hideDaysOfWeekForMonthFrequencyContainer();
            // When freq != 6 or 7
            thisComponent.hideMonthSelectContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            // When freq != 7
            thisComponent.hideInContainer();
            deferred.resolve();
            return deferred;
        },

        handleFrequencyOptionThree: function handleFrequencyOptionThree() {
            var deferred = $.Deferred();
            var thisComponent = this;
            thisComponent.showOnContainer();
            thisComponent.showDaysOfWeekForWeekFrequencyContainer();
            // Show the days of week select
            thisComponent.setupDaysOfWeekForWeekFrequencySelect().then(function () {
                deferred.resolve();
            });
            // When freq != 4 or 5 or 7
            thisComponent.hideOnTheContainer();
            // When freq != 4
            thisComponent.hideDayOfMonthContainer();
            // When freq != 5 or 7
            thisComponent.hideDayOfWeekOccurenceForMonthContainer();
            thisComponent.hideDaysOfWeekForMonthFrequencyContainer();
            // When freq != 6 or 7
            thisComponent.hideMonthSelectContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            // When freq != 7
            thisComponent.hideInContainer();
            return deferred;
        },

        handleFrequencyOptionFour: function handleFrequencyOptionFour() {
            var deferred = $.Deferred();
            var thisComponent = this;
            thisComponent.showOnTheContainer();
            thisComponent.showDayOfMonthContainer();
            // Show the days of month select
            thisComponent.setupDayOfMonthSelect().then(function () {
                var startDate = $('#startDate').val();
                var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                $('#dayOfMonthSelect').val(startDateMoment.date()).trigger('change');
                deferred.resolve();
            });
            // When freq != 3
            thisComponent.set('weekFrequencySelectedDays', undefined);
            thisComponent.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 3 or 6
            thisComponent.hideOnContainer();
            // When freq != 5 or 7
            thisComponent.hideDayOfWeekOccurenceForMonthContainer();
            thisComponent.hideDaysOfWeekForMonthFrequencyContainer();
            // When freq != 6 or 7
            thisComponent.hideMonthSelectContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            // When freq != 7
            thisComponent.hideInContainer();
            return deferred;
        },

        handleFrequencyOptionFive: function handleFrequencyOptionFive() {
            var deferred = $.Deferred();
            var thisComponent = this;
            thisComponent.showOnTheContainer();
            thisComponent.showDayOfWeekOccurenceForMonthContainer();
            thisComponent.showDaysOfWeekForMonthFrequencyContainer();
            // Show the day of week occurence for month select
            thisComponent.setupDayOfWeekOccurenceForMonthSelect().then(function () {
                // Show the days of week for month frequency select
                thisComponent.setupDaysOfWeekForMonthFrequencySelect().then(function () {
                    deferred.resolve();
                });
            });
            // When freq != 3
            thisComponent.set('weekFrequencySelectedDays', undefined);
            thisComponent.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 3 or 6
            thisComponent.hideOnContainer();
            // When freq != 4
            thisComponent.hideDayOfMonthContainer();
            // When freq != 6 or 7
            thisComponent.hideMonthSelectContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            // When freq != 7
            thisComponent.hideInContainer();
            return deferred;
        },

        handleFrequencyOptionSix: function handleFrequencyOptionSix() {
            var thisComponent = this;
            var deferred = $.Deferred();
            this.showOnContainer();
            this.showMonthSelectContainer();
            this.showDayOfMonthForYearContainer();
            this.setupMonthSelect().then(function () {
                thisComponent.setupDayOfMonthForYearSelect().then(function () {
                    deferred.resolve();
                });
            });
            // When freq != 3
            this.set('weekFrequencySelectedDays', undefined);
            this.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 4 or 5 or 7
            this.hideOnTheContainer();
            // When freq != 4
            this.hideDayOfMonthContainer();
            // When freq != 5 or 7
            this.hideDayOfWeekOccurenceForMonthContainer();
            this.hideDaysOfWeekForMonthFrequencyContainer();
            // When freq != 7
            this.hideInContainer();
            return deferred;
        },

        handleFrequencyOptionSeven: function handleFrequencyOptionSeven() {
            var deferred = $.Deferred();
            var thisComponent = this;
            thisComponent.showOnTheContainer();
            thisComponent.showDayOfWeekOccurenceForMonthContainer();
            thisComponent.showDaysOfWeekForMonthFrequencyContainer();
            thisComponent.showInContainer();
            thisComponent.showMonthSelectContainer();

            // Show month select
            thisComponent.setupMonthSelect().then(function () {
                // Show the days of week select
                thisComponent.setupDayOfWeekOccurenceForMonthSelect().then(function () {
                    // Show the days of week for month frequency select
                    thisComponent.setupDaysOfWeekForMonthFrequencySelect().then(function () {
                        deferred.resolve();
                    });
                });
            });
            // When freq != 3
            thisComponent.set('weekFrequencySelectedDays', undefined);
            thisComponent.hideDaysOfWeekForWeekFrequencyContainer();
            // When freq != 3 or 6
            thisComponent.hideOnContainer();
            // When freq != 4
            thisComponent.hideDayOfMonthContainer();
            // When freq != 6
            thisComponent.hideDayOfMonthForYearContainer();
            return deferred;
        },

        showDaysOfWeekForWeekFrequencyContainer: function showDaysOfWeekForWeekFrequencyContainer() {
            $('#daysOfWeekForWeekFrequencyContainer').removeClass('hidden');
        },

        hideDaysOfWeekForWeekFrequencyContainer: function hideDaysOfWeekForWeekFrequencyContainer() {
            if ($('#daysOfWeekForWeekFrequencyContainer').hasClass('hidden') === false) {
                $('#daysOfWeekForWeekFrequencyContainer').addClass('hidden');
            }
        },

        showOnTheContainer: function showOnTheContainer() {
            $('#onTheContainer').removeClass('hidden');
        },

        hideOnTheContainer: function hideOnTheContainer() {
            if ($('#onTheContainer').hasClass('hidden') === false) {
                $('#onTheContainer').addClass('hidden');
            }
        },

        showOnContainer: function showOnContainer() {
            $('#onContainer').removeClass('hidden');
        },

        hideOnContainer: function hideOnContainer() {
            if ($('#onContainer').hasClass('hidden') === false) {
                $('#onContainer').addClass('hidden');
            }
        },

        hideMonthSelectContainer: function hideMonthSelectContainer() {
            if ($('#monthSelectContainer').hasClass('hidden') === false) {
                $('#monthSelectContainer').addClass('hidden');
            }
        },

        showDayOfMonthContainer: function showDayOfMonthContainer() {
            $('#dayOfMonthContainer').removeClass('hidden');
        },

        hideDayOfMonthContainer: function hideDayOfMonthContainer() {
            if ($('#dayOfMonthContainer').hasClass('hidden') === false) {
                $('#dayOfMonthContainer').addClass('hidden');
            }
        },

        showDayOfMonthForYearContainer: function showDayOfMonthForYearContainer() {
            $('#dayOfMonthForYearContainer').removeClass('hidden');
        },

        hideDayOfMonthForYearContainer: function hideDayOfMonthForYearContainer() {
            if ($('#dayOfMonthForYearContainer').hasClass('hidden') === false) {
                $('#dayOfMonthForYearContainer').addClass('hidden');
            }
        },

        showDayOfWeekOccurenceForMonthContainer: function showDayOfWeekOccurenceForMonthContainer() {
            $('#dayOfWeekOccurenceForMonthContainer').removeClass('hidden');
        },

        hideDayOfWeekOccurenceForMonthContainer: function hideDayOfWeekOccurenceForMonthContainer() {
            if ($('#dayOfWeekOccurenceForMonthContainer').hasClass('hidden') === false) {
                $('#dayOfWeekOccurenceForMonthContainer').addClass('hidden');
            }
        },

        showDaysOfWeekForMonthFrequencyContainer: function showDaysOfWeekForMonthFrequencyContainer() {
            $('#daysOfWeekForMonthFrequencyContainer').removeClass('hidden');
        },

        hideDaysOfWeekForMonthFrequencyContainer: function hideDaysOfWeekForMonthFrequencyContainer() {
            if ($('#daysOfWeekForMonthFrequencyContainer').hasClass('hidden') === false) {
                $('#daysOfWeekForMonthFrequencyContainer').addClass('hidden');
            }
        },

        showInContainer: function showInContainer() {
            $('#inContainer').removeClass('hidden');
        },

        hideInContainer: function hideInContainer() {
            if ($('#inContainer').hasClass('hidden') === false) {
                $('#inContainer').addClass('hidden');
            }
        },

        showMonthSelectContainer: function showMonthSelectContainer() {
            $('#monthSelectContainer').removeClass('hidden');
        },

        getDisplayOfDay: function getDisplayOfDay(dayString) {
            switch (dayString) {
                case 'MO':
                    return 'M';
                case 'TU':
                    return 'Tu';
                case 'WE':
                    return 'W';
                case 'TH':
                    return 'Th';
                case 'FR':
                    return 'F';
                case 'SA':
                    return 'Sa';
                case 'SU':
                    return 'Su';
                default:
                    return null;
            }
        },

        getNumericValueOfDay: function getNumericValueOfDay(dayString) {
            switch (dayString) {
                case 'MO':
                    return '1';
                case 'TU':
                    return '2';
                case 'WE':
                    return '3';
                case 'TH':
                    return '4';
                case 'FR':
                    return '5';
                case 'SA':
                    return '6';
                case 'SU':
                    return '7';
                default:
                    return null;
            }
        },

        getNthDayOfMonth: function getNthDayOfMonth(date) {
            return Math.ceil(date.date() / 7);
        },

        addSuffixToNumber: function addSuffixToNumber(number) {
            number = number.toString(); // number may be the integer type - we need a string version of it
            if (number.endsWith('1') && number.endsWith('11') === false) {
                return number + 'st';
            } else if (number.endsWith('2') && number.endsWith('12') === false) {
                return number + 'nd';
            } else if (number.endsWith('3') && number.endsWith('13') === false) {
                return number + 'rd';
            } else {
                return number + 'th';
            }
        },

        setup: (function () {
            this.setupRepeatsCheckBox();
            this.setupEndsOnDatePicker();
            if (this.get('isEdit')) {
                this.setExistingRecurrenceValues();
            }
        }).on('didInsertElement'),

        actions: {
            refreshWeekdaysSelect: function refreshWeekdaysSelect() {
                this.setupDaysOfWeekForWeekFrequencySelect();
            },

            confirmSelectDays: function confirmSelectDays(results) {
                this.set('weekFrequencySelectedDays', results);
                this.setupDaysOfWeekForWeekFrequencySelect();
            },
            onStartDateChange: function onStartDateChange() {
                if (this.get('eventRepeats')) {
                    // Refresh all the drop downs (except interval).  Those which are hidden will stay hidden and those showing will get new data.
                    this.setupFrequencySelect();
                    this.setupDayOfMonthSelect();
                    this.setupDayOfMonthForYearSelect();
                    this.setupDaysOfWeekForWeekFrequencySelect();
                    this.setupDaysOfWeekForMonthFrequencySelect();
                    this.setupDayOfWeekOccurenceForMonthSelect();
                    this.setupMonthSelect();
                }
            }
        }
    });
});
define('calendar/components/manage-event', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        clearErrorMessages: function clearErrorMessages() {
            $('#nameError').hide();
            $('span', '#nameError').text('');

            $('span', '#startDateTimeError').text('');
            $('#startDateTimeError').hide();

            $('span', '#endDateTimeError').text('');
            $('#endDateTimeError').hide();
        },

        allDayChange: function allDayChange() {
            var isAllday = $('#allDayCheckbox').is(':checked');
            if (isAllday) {
                this.set('origStartTime', $('#startTime').val());
                this.set('origEndTime', $('#endTime').val());

                $('#startTime').val('12:00 AM');
                $('#endTime').val('12:00 AM');

                $('#startTime').hide();
                $('#endTime').hide();
                $('#endTimeTitle').hide();
                $('#startTimeTitle').hide();
            } else {
                var origStartTime = this.get('origStartTime');
                if (origStartTime) {
                    $('#startTime').val(origStartTime);
                }

                var origEndTime = this.get('origEndTime');
                if (origEndTime) {
                    $('#endTime').val(origEndTime);
                } else {
                    $('#endTime').val('11:59 PM');
                }

                $('#startTime').show();
                $('#endTime').show();
                $('#endTimeTitle').show();
                $('#startTimeTitle').show();
            }
        },

        getICalDay: function getICalDay(original) {
            switch (original) {
                case '1':
                    return 'MO';
                case '2':
                    return 'TU';
                case '3':
                    return 'WE';
                case '4':
                    return 'TH';
                case '5':
                    return 'FR';
                case '6':
                    return 'SA';
                case '7':
                    return 'SU';
                case 'M':
                    return 'MO';
                case 'Tu':
                    return 'TU';
                case 'W':
                    return 'WE';
                case 'Th':
                    return 'TH';
                case 'F':
                    return 'FR';
                case 'Sa':
                    return 'SA';
                case 'Su':
                    return 'SU';
                default:
                    return null;
            }
        },

        setRecurrenceInterval: function setRecurrenceInterval() {
            var thisComponent = this;
            var selectedIntervalValue = $('#intervalSelect').val();
            if (selectedIntervalValue === '1') {
                thisComponent.set('recurrenceInterval', 1);
            } else if (selectedIntervalValue === '2') {
                thisComponent.set('recurrenceInterval', 2);
            } else if (selectedIntervalValue === '3') {
                var everyNumberValue = Number($('#everyNumberInput').val());
                thisComponent.set('recurrenceInterval', everyNumberValue);
            }
        },

        setRecurrenceFrequency: function setRecurrenceFrequency() {
            var thisComponent = this;
            var nthDayOfWeekInMonthValue;
            var dayOfWeekValue;
            var selectedFrequencyValue = $('#frequencySelect').val();
            // Day
            if (selectedFrequencyValue === '1') {
                thisComponent.set('recurrenceFrequency', 'D');
                thisComponent.set('recurrenceOffset', undefined);
                thisComponent.set('recurrenceFrequencyWeekdays', undefined);
                thisComponent.set('recurrenceMonths', undefined);
            }
            // Weekday
            else if (selectedFrequencyValue === '2') {
                    thisComponent.set('recurrenceOffset', undefined);
                    thisComponent.set('recurrenceMonths', undefined);
                    // Every other day will be a special case
                    var selectedInterval = thisComponent.get('recurrenceInterval');
                    if (selectedInterval === 2) {
                        // This is somewhat of a hack to work around default iCal behavior.
                        // If the user chooses "Every other Weekday", we will really make it "every week on either M/W/F or T/TH" depending on the start date
                        thisComponent.set('recurrenceInterval', 1);
                        thisComponent.set('recurrenceFrequency', 'W');
                        var startDate = $('#startDate').val();
                        var startDateMoment = moment(startDate, 'MM/DD/YYYY');
                        var startDateDayOfWeek = startDateMoment.isoWeekday();
                        if (startDateDayOfWeek === 2 || startDateDayOfWeek === 4) {
                            thisComponent.set('recurrenceFrequencyWeekdays', 'TU,TH');
                        } else {
                            thisComponent.set('recurrenceFrequencyWeekdays', 'MO,WE,FR');
                        }
                    } else {
                        thisComponent.set('recurrenceFrequency', 'D');
                        thisComponent.set('recurrenceFrequencyWeekdays', 'MO,TU,WE,TH,FR');
                    }
                }
                // Day(s) of week
                else if (selectedFrequencyValue === '3') {
                        thisComponent.set('recurrenceFrequency', 'W');
                        thisComponent.set('recurrenceOffset', undefined);
                        thisComponent.set('recurrenceMonths', undefined);
                        // Get day(s) of the week the event repeats
                        var selectedDaysOfWeekValue = $('#daysOfWeekForWeekFrequencySelect').val();
                        if (selectedDaysOfWeekValue === '0') {
                            // Multiple days of the week
                            var selectedDaysOfWeek = thisComponent.get('weekFrequencySelectedDays');
                            var expectedFormat = '';
                            for (var i = 0; i < selectedDaysOfWeek.length; i++) {
                                var val = thisComponent.getICalDay(selectedDaysOfWeek[i]);
                                if (i === 0) {
                                    expectedFormat += val;
                                } else {
                                    expectedFormat += ',' + val;
                                }
                            }
                            thisComponent.set('recurrenceFrequencyWeekdays', expectedFormat);
                        } else {
                            thisComponent.set('recurrenceFrequencyWeekdays', thisComponent.getICalDay(selectedDaysOfWeekValue));
                        }
                    }
                    // Month
                    else if (selectedFrequencyValue === '4') {
                            thisComponent.set('recurrenceFrequency', 'M');
                            thisComponent.set('recurrenceOffset', $('#dayOfMonthSelect').val());
                            thisComponent.set('recurrenceFrequencyWeekdays', undefined);
                            thisComponent.set('recurrenceMonths', undefined);
                        } else if (selectedFrequencyValue === '5') {
                            thisComponent.set('recurrenceFrequency', 'M');
                            nthDayOfWeekInMonthValue = $('#dayOfWeekOccurenceForMonthSelect').val();
                            if (nthDayOfWeekInMonthValue === '5') {
                                thisComponent.set('recurrenceOffset', '-1');
                            } else {
                                thisComponent.set('recurrenceOffset', Number(nthDayOfWeekInMonthValue));
                            }
                            dayOfWeekValue = $('#daysOfWeekForMonthFrequencySelect').val();
                            thisComponent.set('recurrenceFrequencyWeekdays', thisComponent.getICalDay(dayOfWeekValue));
                            thisComponent.set('recurrenceMonths', undefined);
                        }
                        // Year
                        else if (selectedFrequencyValue === '6') {
                                thisComponent.set('recurrenceFrequency', 'Y');
                                thisComponent.set('recurrenceOffset', undefined);
                                thisComponent.set('recurrenceFrequencyWeekdays', undefined);
                                thisComponent.set('recurrenceMonths', undefined);
                            } else if (selectedFrequencyValue === '7') {
                                thisComponent.set('recurrenceFrequency', 'Y');
                                thisComponent.set('recurrenceMonths', $('#monthSelect').val());

                                nthDayOfWeekInMonthValue = $('#dayOfWeekOccurenceForMonthSelect').val();
                                if (nthDayOfWeekInMonthValue === '5') {
                                    thisComponent.set('recurrenceOffset', '-1');
                                } else {
                                    thisComponent.set('recurrenceOffset', nthDayOfWeekInMonthValue);
                                }
                                dayOfWeekValue = $('#daysOfWeekForMonthFrequencySelect').val();
                                thisComponent.set('recurrenceFrequencyWeekdays', thisComponent.getICalDay(dayOfWeekValue));
                            }
        },

        isValid: function isValid() {
            var deferred = $.Deferred();
            this.clearErrorMessages();
            var thisComponent = this;

            // Recurrence validation
            if (thisComponent.get('eventRepeats')) {
                // "Every (number...)" in recurrence options
                if ($('#intervalSelect').val() === '3') {
                    // The user has to input a whole, positive number
                    var everyNumberStringValue = $('#everyNumberInput').val().trim();
                    var everyNumberAsNumber = Number(everyNumberStringValue);
                    if (everyNumberStringValue === '' || everyNumberStringValue.indexOf('.') > 0 || everyNumberAsNumber < 1) {
                        $('span', '#recurrenceError').text(thisComponent.get('text.validWholeNumber'));
                        $('#recurrenceError').show();
                        deferred.resolve(false);
                        return deferred;
                    } else {
                        $('#recurrenceError').hide();
                    }
                }
                var recurrenceEndsOnValue = $('#recurrenceEndsOn').val();
                if (recurrenceEndsOnValue.trim() === '') {
                    $('span', '#recurrenceError').html(thisComponent.get('text.endsOnDateRequired'));
                    $('#recurrenceError').show();
                    deferred.resolve(false);
                    return deferred;
                } else {
                    $('#recurrenceError').hide();
                }
                var recurrenceEndsOnMoment = moment(recurrenceEndsOnValue, 'MM/DD/YYYY');
                if (recurrenceEndsOnMoment.isValid() === false) {
                    $('span', '#recurrenceError').html(thisComponent.get('text.endDateInvalid'));
                    $('#recurrenceError').show();
                    deferred.resolve(false);
                    return deferred;
                } else {
                    $('#recurrenceError').hide();
                }
                // Validate that the recurrence 'ends on' date is after the event start date and end date
                var eventStartDateMoment = moment($('#startDate').val(), 'MM/DD/YYYY');
                var eventEndDateMoment = moment($('#endDate').val(), 'MM/DD/YYYY');
                if (eventStartDateMoment.isAfter(recurrenceEndsOnMoment) || eventEndDateMoment.isAfter(recurrenceEndsOnMoment)) {
                    $('span', '#recurrenceError').html(thisComponent.get('text.endsOnDateMustBeAfterEventDates'));
                    $('#recurrenceError').show();
                    deferred.resolve(false);
                    return deferred;
                } else {
                    $('#recurrenceError').hide();
                }
            }

            var title = this.get('title');
            // Name Required
            if (title === undefined || title.trim() === '') {
                $('span', '#nameError').text(thisComponent.get('text.eventNameRequired'));
                $('#nameError').show();
                // For screen readers
                $('#title').attr('aria-invalid', 'true');
                $('#title').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            // Date and Time Validation
            var startDate = $('#startDate');
            var startTime = $('#startTime');
            var endDate = $('#endDate');
            var endTime = $('#endTime');
            var startDateTimeError = $('#startDateTimeError');
            var endDateTimeError = $('#endDateTimeError');

            // Start Date Required
            if (startDate.val() === '') {
                $('span', '#startDateTimeError').text(thisComponent.get('text.startDateRequired'));
                startDateTimeError.show();
                // For screen readers
                startDate.attr('aria-invalid', 'true');
                startDate.attr('aria-describedby', 'startDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // Start Time Required
            if (startTime.val() === '') {
                $('span', '#startDateTimeError').text(thisComponent.get('text.startDateRequired'));
                startDateTimeError.show();
                // For screen readers
                startTime.attr('aria-invalid', 'true');
                startTime.attr('aria-describedby', 'startDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Date Required
            if (endDate.val() === '') {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endDateRequired'));
                endDateTimeError.show();
                // For screen readers
                endDate.attr('aria-invalid', 'true');
                endDate.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Time Required
            if (endTime.val() === '') {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endDateRequired'));
                endDateTimeError.show();
                // For screen readers
                endTime.attr('aria-invalid', 'true');
                endTime.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // Expected formats to be considered valid by Moment
            var dateFormatString = 'M/D/YYYY'; // Interestingly, if the user inputs MM/DD/YYYY, it seems to be valid as well, which is actually nice.
            var dateAndTimeFormatString = 'M/D/YYYY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'

            // Start Date valid input
            var startDateValue = startDate.val();
            if (moment(startDateValue, dateFormatString, true).isValid() === false) {
                $('span', '#startDateTimeError').text(thisComponent.get('text.startDateInvalid'));
                startDateTimeError.show();
                // For screen readers
                startDate.attr('aria-invalid', 'true');
                startDate.attr('aria-describedby', 'startDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // Start Time valid input
            var startTimeValue = startTime.val();
            var startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
            var startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, true);
            if (startMoment.isValid() === false) {
                $('span', '#startDateTimeError').text(thisComponent.get('text.startTimeInvalid'));
                startDateTimeError.show();
                // For screen readers
                startDate.attr('aria-invalid', 'true');
                startDate.attr('aria-describedby', 'startDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Date valid input
            var endDateValue = endDate.val();
            if (moment(endDateValue, dateFormatString, true).isValid() === false) {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endDateInvalid'));
                endDateTimeError.show();
                // For screen readers
                endDate.attr('aria-invalid', 'true');
                endDate.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Time valid input
            var endTimeValue = endTime.val();
            var endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
            var endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, true);
            if (endMoment.isValid() === false) {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endTimeInvalid'));
                endDateTimeError.show();
                // For screen readers
                endTime.attr('aria-invalid', 'true');
                endTime.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Time is after Start Time
            var endIsAfterStart = !endMoment.isBefore(startMoment);
            if (endIsAfterStart === false) {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endTimeAfterStart'));
                endDateTimeError.show();
                // For screen readers
                endTime.attr('aria-invalid', 'true');
                endTime.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }
            // End Time is not in the past
            var nowMoment = moment();
            var isAllDay = $('#allDayCheckbox').is(':checked');
            if (isAllDay && nowMoment.isAfter(moment(endMoment).add(1, 'days')) || !isAllDay && nowMoment.isAfter(endMoment)) {
                $('span', '#endDateTimeError').text(thisComponent.get('text.endTimeCanNotBeInPast'));
                endDateTimeError.show();
                // For screen readers
                endTime.attr('aria-invalid', 'true');
                endTime.attr('aria-describedby', 'endDateTimeError');
                deferred.resolve(false);
                return deferred;
            }

            var end = endMoment;
            if (isAllDay) {
                end = endMoment.add(1, 'days');
            }
            this.isNameUniqueForCalendarAndTimes(title, startMoment.format(), end.format()).done(function (response) {
                if (response === false) {
                    $('span', '#nameError').text(thisComponent.get('text.nameAndTimesAlreadyExistForCalendar'));
                    $('#nameError').show();
                    // For screen readers
                    $('#name').attr('aria-invalid', 'true');
                    $('#name').attr('aria-describedby', 'nameError');
                    deferred.resolve(false);
                } else {
                    deferred.resolve(true);
                }
            }).error(function (errorResponse) {
                // An error has occured.  Show the general error message.
                $('#manageEventGeneralError').show();
                deferred.resolve(false);
            });

            // Values should be valid at this point
            //deferred.resolve(true);
            return deferred;
        },

        isNameUniqueForCalendarAndTimes: function isNameUniqueForCalendarAndTimes(name, start, end) {
            var thisComponent = this;
            var isEditing = thisComponent.get('isEdit');
            var isEditingRecurringSeries = thisComponent.get('isEditSeries');

            var calendarId;
            var existingEventId;
            var data;
            // If there is only one calendar, then selectedCalendarId has already been set on the component.
            if (thisComponent.get('onlyOneCalendar') !== true) {
                // Otherwise, get the needed value from the available-calendars-select
                calendarId = $('#available-calendars-select').val();
            } else {
                calendarId = thisComponent.get('selectedCalendarId');
            }
            var validationUrl = jenzabar.calendar.settings.calendarEventValidationWebServiceUrl;
            if (isEditingRecurringSeries === true) {
                // Editing the series of a recurring event
                thisComponent.addRecurrenceValuesToComponent();
                data = {
                    isEditingRecurringSeries: true,
                    eventName: name,
                    existingEventId: thisComponent.get('event.id'),
                    calendarId: calendarId,
                    start: start,
                    end: end,
                    calendarMove: false,
                    recurrenceEndDate: thisComponent.get('recurrenceEndDate'),
                    recurrenceInterval: thisComponent.get('recurrenceInterval'),
                    recurrenceFrequency: thisComponent.get('recurrenceFrequency'),
                    recurrenceOffset: thisComponent.get('recurrenceOffset'),
                    recurrenceFrequencyWeekdays: thisComponent.get('recurrenceFrequencyWeekdays'),
                    recurrenceMonths: thisComponent.get('recurrenceMonths')
                };
                // Make the web serice call and return the response
                return $.ajax({
                    url: validationUrl,
                    data: data
                });
            } else if (isEditing === true) {
                // Editing a calendar event or an individual event in a recurring series
                existingEventId = thisComponent.get('event.id');
                if (thisComponent.get('eventRepeats')) {
                    // Editing what is now a recurring event
                    thisComponent.addRecurrenceValuesToComponent();
                    data = {
                        eventName: name,
                        existingEventId: existingEventId,
                        calendarId: calendarId,
                        start: start,
                        end: end,
                        calendarMove: false,
                        recurrenceEndDate: thisComponent.get('recurrenceEndDate'),
                        recurrenceInterval: thisComponent.get('recurrenceInterval'),
                        recurrenceFrequency: thisComponent.get('recurrenceFrequency'),
                        recurrenceOffset: thisComponent.get('recurrenceOffset'),
                        recurrenceFrequencyWeekdays: thisComponent.get('recurrenceFrequencyWeekdays'),
                        recurrenceMonths: thisComponent.get('recurrenceMonths')
                    };
                } else {
                    data = {
                        eventName: name,
                        existingEventId: existingEventId,
                        calendarId: calendarId,
                        start: start,
                        end: end,
                        calendarMove: false
                    };
                }
                // Make the web serice call and return the response
                return $.ajax({
                    url: validationUrl,
                    data: data
                });
            } else {
                // Add an Event
                if (thisComponent.get('eventRepeats')) {
                    // Adding a recurring event
                    thisComponent.addRecurrenceValuesToComponent();
                    data = {
                        eventName: name,
                        calendarId: calendarId,
                        start: start,
                        end: end,
                        calendarMove: false,
                        recurrenceEndDate: thisComponent.get('recurrenceEndDate'),
                        recurrenceInterval: thisComponent.get('recurrenceInterval'),
                        recurrenceFrequency: thisComponent.get('recurrenceFrequency'),
                        recurrenceOffset: thisComponent.get('recurrenceOffset'),
                        recurrenceFrequencyWeekdays: thisComponent.get('recurrenceFrequencyWeekdays'),
                        recurrenceMonths: thisComponent.get('recurrenceMonths')
                    };
                } else {
                    // Adding a new individual event
                    data = {
                        eventName: name,
                        calendarId: calendarId,
                        start: start,
                        end: end,
                        calendarMove: false
                    };
                }
                // Make the web serice call and return the response
                return $.ajax({
                    url: validationUrl,
                    data: data
                });
            }
        },

        setupCalendarsSelect: function setupCalendarsSelect(existingEvent) {
            var thisComponent = this;
            var select = $('#available-calendars-select');
            var portletId = jenzabar.calendar.portletId;
            var url = jenzabar.calendar.settings.calendarServiceUrl + '?portletId=' + portletId + '&assignable=true';
            var calendarFound = false;
            $.ajax({ url: url }).then(function (result) {
                // If there is only one calendar for this portlet, then hide the select and just show a span with then name of the one calendar.
                if (result.calendars.length === 1) {
                    if (existingEvent && existingEvent.get('calendarId') !== result.calendars[0].id) {
                        thisComponent.goToMainScreen();
                        return;
                    }
                    thisComponent.set('onlyOneCalendar', true); // Used later when event is saved
                    $('#selectedCalendarName').show();
                    $('#selectedCalendarName').text(result.calendars[0].name);
                    // Set the component property for selected calendar ID to the ID of the one calendar.
                    thisComponent.set('selectedCalendarId', result.calendars[0].id);
                    select.hide();
                } else {
                    $.each(result.calendars, function (index, value) {
                        var option = $('<option></option>').attr('value', value.id).text(value.name);
                        if (existingEvent) {
                            var existingEventCalendarId = existingEvent.get('calendarId');
                            if (value.id === existingEventCalendarId) {
                                calendarFound = true;
                                option.attr('selected', 'selected');
                            }
                        } else {
                            if (value.isDefault) {
                                calendarFound = true;
                                option.attr('selected', 'selected');
                            }
                        }
                        select.append(option);
                    });
                    if (!calendarFound) {
                        thisComponent.goToMainScreen();
                        return;
                    }
                }
            });
        },

        setupFields: (function () {
            this.get('event.edit');

            var thisComponent = this;

            textEditor.create($('#eventDescription'), { layout: 'simple' });

            // TODO: consider changing to use ember way - thisComponent.set()
            this.originalValues = {};
            this.originalValues.title = thisComponent.get('title');
            this.originalValues.description = thisComponent.get('description');
            this.originalValues.location = thisComponent.get('location');
            this.originalValues.eventRepeats = thisComponent.get('eventRepeats');

            if (thisComponent.get('isEditSeries')) {
                var eventBeingEdited = thisComponent.get('event');
                var startMoment = moment(eventBeingEdited.get('start'));
                var endMoment = moment(eventBeingEdited.get('end'));

                thisComponent.set('originalStartDate', startMoment);
                thisComponent.set('originalEndDate', endMoment);
            }

            var isEdit = this.get('isEdit');
            var existingEvent;
            if (!isEdit) {
                this.set('weekIntervalSelectedDays', undefined);
                // there could be an add request coming from quick add.
                // In this case we got information from a temp event model.
                // that's why we are checking so that we can handle it.
                if (this.get('event') === undefined) {
                    this.clearFields();
                    this.configureDateAndTimePickers();
                } else {
                    existingEvent = this.get('event');
                    this.allDayChange();
                    this.configureDateAndTimePickers(existingEvent);
                }
                this.setupCalendarsSelect();
            } else {
                existingEvent = this.get('event');
                this.allDayChange();
                this.configureDateAndTimePickers(existingEvent);
                this.setupCalendarsSelect(existingEvent);
            }
        }).on('didInsertElement'),

        clearFields: function clearFields() {
            this.set('event', undefined);
            this.set('eventRepeats', undefined);
            this.set('isEditSeries', undefined);
            this.set('recurrenceEndDate', undefined);
            this.set('title', undefined);
            this.set('description', undefined);
            this.set('location', undefined);
            $('#startDate').val('');
            $('#startTime').val('');
            $('#endDate').val('');
            $('#endTime').val('');
        },

        setFieldsWithExistingValues: function setFieldsWithExistingValues() {
            if (this.originalValues) {
                this.set('title', this.originalValues.title);
                this.set('description', this.originalValues.description);
                this.set('location', this.originalValues.location);
                this.set('eventRepeats', this.originalValues.eventRepeats);
            }
        },

        setStartAndEndTime: function setStartAndEndTime(startDateElement, startTimeElement, endDateElement, endTimeElement) {
            var roundedUp = false;
            var startTime = new Date();
            if (startTime.getMinutes() < 30) {
                startTime.setMinutes(30, 0, 0);
            } else {
                startTime.setHours(startTime.getHours() + 1);
                startTime.setMinutes(0, 0, 0);
                roundedUp = true;
            }
            // If rounded up to midnight from after 11:30 PM, then increase the date in DatePicker to the next day
            if (roundedUp && startTime.getHours() === 0) {
                var nextDay = new Date(new Date().setDate(startTime.getDate()));
                startDateElement.datepicker('setDate', nextDay);
                endDateElement.datepicker('setDate', nextDay);
            }
            startTimeElement.timepicker('setTime', startTime);
            this.startTimeChanged(startDateElement, startTimeElement, endDateElement, endTimeElement);
        },

        startTimeChanged: function startTimeChanged(startDateElement, startTimeElement, endDateElement, endTimeElement) {
            var thisComponent = this;
            var minTime;
            var endTime;
            if (startDateElement.val() === endDateElement.val()) {
                minTime = new Date(startTimeElement.timepicker('getTime'));
                endTime = new Date(minTime);
                if (minTime.getMinutes() === 0) {
                    minTime.setMinutes(minTime.getMinutes() + 30);
                } else {
                    minTime.setHours(minTime.getHours() + 1);
                    minTime.setMinutes(0);
                    endTime.setMinutes(30, 0, 0);
                }
                endTime.setHours(endTime.getHours() + 1);
                if (endTime.getHours() === 0) {
                    var nextDay = new Date(new Date().setDate(endTime.getDate()));
                    endDateElement.datepicker('setDate', nextDay);
                    thisComponent.set('endAndStartDateDelta', 1);
                }
                endTimeElement.timepicker('setTime', endTime);
            } else {
                minTime = new Date(startTimeElement.timepicker('getTime'));
                endTime = new Date(minTime);
                endTime.setHours(endTime.getHours() + 1);

                endTimeElement.timepicker('setTime', endTime);
            }
        },

        configureDateAndTimePickers: function configureDateAndTimePickers(calendarEvent) {
            var thisComponent = this;
            var startDate = $('#startDate');
            var startTime = $('#startTime');
            var endDate = $('#endDate');
            var endTime = $('#endTime');
            var isEditSeries = thisComponent.get('isEditSeries');
            var startMoment;
            var endMoment;
            var startDateString;
            var endDateString;
            var differenceInDays;

            // Event handler for date picker selection change
            $('#startDate').datepicker('option', 'onSelect', function (date) {
                thisComponent.startDateOnChange(date);
            });
            $('#endDate').datepicker('option', 'onSelect', function (date) {
                thisComponent.endDateOnChange(date);
            });
            // For when the user edits the text input directly and does not use the date picker
            $('#startDate').on('change', function () {
                thisComponent.startDateOnChange($('#startDate').val());
            });
            $('#endDate').on('change', function () {
                thisComponent.endDateOnChange($('#endDate').val());
            });

            if (isEditSeries === true && calendarEvent !== undefined && calendarEvent !== null) {
                // manage-event-recurrence has taken care of this special situation
                return;
            } else if (calendarEvent) {
                startMoment = moment(calendarEvent.get('start'));
                endMoment = moment(calendarEvent.get('end'));
                startDateString = startMoment.format('M/D/YYYY');
                endDateString = endMoment.format('M/D/YYYY');

                startDate.datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }).datepicker('setDate', startDateString);

                startTime.timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                }).timepicker('setTime', startMoment.toDate());

                endDate.datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }).datepicker('setDate', endDateString);

                endTime.timepicker({
                    'defaultTime': 'now',
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                }).timepicker('setTime', endMoment.toDate());

                differenceInDays = endMoment.diff(startMoment, 'days');
                thisComponent.set('endAndStartDateDelta', differenceInDays);
            } else {
                var startDateDefault;
                if (jenzabar.calendar.settings.currentFullCalendarDate !== undefined) {
                    startDateDefault = jenzabar.calendar.settings.currentFullCalendarDate.format('MM/DD/YYYY');
                } else {
                    startDateDefault = new Date();
                }
                startDate.datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }).datepicker('setDate', startDateDefault);

                startTime.timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                });

                //var dateToday = new Date();
                endDate.datepicker({
                    dateFormat: jenzabar.userSettings.dateFormat
                }). //minDate: dateToday
                datepicker('setDate', startDateDefault);

                endTime.timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i A'
                });
                thisComponent.set('endAndStartDateDelta', 0);
                this.setStartAndEndTime(startDate, startTime, endDate, endTime);
            }
        },

        endDateOnChange: function endDateOnChange(date) {
            this.set('userChangedStartOrEndDate', true);
            var endDateMoment = moment(date, 'MM/DD/YYYY');

            var startDateValue = $('#startDate').val();
            var startDateMoment = moment(startDateValue, 'MM/DD/YYYY');

            var differenceInDays = endDateMoment.diff(startDateMoment, 'days');
            if (differenceInDays >= 0) {
                this.set('endAndStartDateDelta', differenceInDays);
            }
        },

        startDateOnChange: function startDateOnChange(date) {
            this.set('userChangedStartOrEndDate', true);
            var startDateMoment = moment(date, 'MM/DD/YYYY');
            var endDateValue = $('#endDate').val();
            var endDateMoment = moment(endDateValue, 'MM/DD/YYYY');
            // If the start date is changed to be after the end date, then update the end date to the start date
            if (startDateMoment.isAfter(endDateMoment)) {
                $('#endDate').val(date);
                this.set('endAndStartDateDelta', 0);
            } else {
                var differenceInDays = endDateMoment.diff(startDateMoment, 'days');
                if (differenceInDays >= 0) {
                    this.set('endAndStartDateDelta', differenceInDays);
                }
            }
            // Call onStartDateChange on the recurrence component
            var recurrenceComponent = this.get('comp-eventRecurrence');
            recurrenceComponent.send('onStartDateChange');
        },

        addRecurrenceValuesToComponent: function addRecurrenceValuesToComponent() {
            var thisComponent = this;
            // Interval
            thisComponent.setRecurrenceInterval();
            // Frequency
            thisComponent.setRecurrenceFrequency();
            var recurrenceEndDate = $('#recurrenceEndsOn').val() + ' 11:59 PM';
            thisComponent.set('recurrenceEndDate', recurrenceEndDate);
        },

        addSelectedCalendarToComponent: function addSelectedCalendarToComponent() {
            // If there is only one calendar, then selectedCalendarId has already been set on the component.
            if (this.get('onlyOneCalendar') !== true) {
                var selectedCalendarId = $('#available-calendars-select').val();
                this.set('selectedCalendarId', selectedCalendarId);
            }
        },

        goToMainScreen: function goToMainScreen() {
            // If we can't find existing event's calendar in the calendar list,
            // go to main screen.  Don't leave # on or we'll be stuck with bad state.
            var url = window.location.href;
            url = url.substring(0, url.lastIndexOf('#'));
            location.href = url;
        },

        actions: {
            saveClick: function saveClick() {
                var thisComponent = this;
                thisComponent.set('description', $('#eventDescription').val());
                this.isValid().done(function (response) {
                    if (response === true) {
                        if (thisComponent.get('eventRepeats')) {
                            thisComponent.addRecurrenceValuesToComponent();
                        }
                        thisComponent.addSelectedCalendarToComponent();
                        thisComponent.sendAction('saveEvent', thisComponent);

                        thisComponent.clearFields();
                    }
                });
            },

            updateClick: function updateClick() {
                this.set('description', $('#eventDescription').val());

                var thisComponent = this;
                this.isValid().done(function (response) {
                    if (response === true) {
                        thisComponent.addSelectedCalendarToComponent();
                        if (thisComponent.get('eventRepeats')) {
                            thisComponent.addRecurrenceValuesToComponent();
                        }
                        if (thisComponent.get('isEditSeries')) {
                            // If we are editing the series from the start date and forward
                            thisComponent.sendAction('updateSeries', thisComponent);
                        } else {
                            thisComponent.sendAction('updateEvent', thisComponent);
                        }
                        thisComponent.clearFields();
                    }
                });
            },

            goBack: function goBack() {
                this.setFieldsWithExistingValues();
                this.sendAction('cancel');
            },

            deleteEvent: function deleteEvent() {
                this.sendAction('deleteEvent', this.get('event'));
            },
            deleteRecurringEvent: function deleteRecurringEvent() {
                var recurringEventId = this.get('event.parentRecurringEventId');
                this.sendAction('deleteRecurringEvent', recurringEventId);
            },

            selectCalendar: function selectCalendar(value, component) {
                this.set('selectedCalendarId', value);
            }
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
/* globals textEditor*/
define('calendar/components/my-calendar-feed-url', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        initComponent: (function () {
            $('#calendarFeedUrl').select();
        }).on('didInsertElement')
    });
});
define('calendar/components/quick-add-event', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    /**
     * @class Quick add event component.
     * @extends Ember.Component
     */
    exports['default'] = _ember['default'].Component.extend({

        actions: {
            /**
             * Saves the event.
             */
            saveEvent: function saveEvent() {
                var component = this;

                component.isValid().done(function (valid) {
                    if (valid) {
                        var dateAndTimeFormatString = 'MM/DD/YY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'
                        var isAllDay = component.get('isAllDay');
                        var startTimeValue, startDateValue, startDateAndTimeValue, startMoment, endTimeValue, endDateValue, endDateAndTimeValue, endMoment;

                        // end Time valid input
                        startTimeValue = component.get('startTime');
                        startDateValue = component.get('startDate').format("MM/DD/YY");

                        endTimeValue = component.get('endTime');
                        endDateValue = component.get('endDate').format("MM/DD/YY");

                        startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
                        startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, false);

                        endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
                        endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, false);

                        component.sendAction('addEvent', component.get('eventTitle'), startMoment, endMoment, isAllDay);
                        component.send('hideQuickAddEvent');
                    }
                });
            },
            /**
            * Redirect the user to add event screen
            */
            goToAddEvent: function goToAddEvent() {
                var component = this;
                var dateAndTimeFormatString = 'MM/DD/YY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'
                var isAllDay = component.get('isAllDay');
                var startTimeValue, startDateValue, startDateAndTimeValue, startMoment, endTimeValue, endDateValue, endDateAndTimeValue, endMoment;

                // end Time valid input
                startTimeValue = component.get('startTime');
                startDateValue = component.get('startDate').format("MM/DD/YY");

                endTimeValue = component.get('endTime');
                endDateValue = isAllDay ? component.get('startDate').format("MM/DD/YY") : component.get('endDate').format("MM/DD/YY");

                startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
                startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, true);

                endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
                endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, true);

                component.sendAction('quickAddEventToAdd', component.get('eventTitle'), startMoment, endMoment, isAllDay);
                component.send('hideQuickAddEvent');
            },

            /**
             * Action to bind the tool tip to the selected event.
             * @param start {JSON} The selected start date.
             * @param end {JSON} The selected end date.
             * @param isMonthView {JSON} Flag indicating whether we are on the monthly view or not.
             * @param eventElement {Object} The HTML element anchor to attach the tool tip.
             * @param options {JSON} (optional). Options for the tool tip for the quick add event.
             */
            bindToolTipToEvent: function bindToolTipToEvent(start, end, isMonthView, isAllDay, eventElement, options) {

                var component = this;
                component.ClearValidation();
                component.updateEventInfo(start, end, isMonthView, isAllDay);

                $('#startTime').timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i a',
                    'className': 'quick-add-timepicker'
                });
                $('#endTime').timepicker({
                    'scrollDefault': 'now',
                    'timeFormat': 'g:i a',
                    'className': 'quick-add-timepicker'
                });

                var content = $('#quick-add-event-popup');

                var defaults = {
                    prerender: true,
                    style: { classes: 'qtip-light qtip-rounded qtip-shadow' },
                    position: {
                        my: 'bottom center',
                        at: 'top center',
                        target: 'mouse',
                        show: { solo: true },
                        adjust: {
                            mouse: false
                        },
                        viewport: $('.fc-view-container')
                    },
                    hide: { event: 'unfocus', leave: false, fixed: true },
                    events: {
                        render: function render(event, api) {
                            component.set('hideTooltipFromCloseButton', false);
                            $(this).prependTo($('#quick-add-event-placeholder'));
                            $(content.find('#quick-add-event-close')).click(function () {
                                component.send('hideQuickAddEvent');
                            });
                        },
                        hide: function hide(event, api) {

                            // Check if we moused onto the select 2 dropdown, and stop hiding if so
                            if (component.get('hideTooltipFromCloseButton') === false && $(event.originalEvent.target).closest('.quick-add-timepicker').length) {
                                event.preventDefault();
                            } else {
                                component.set('hideTooltipFromCloseButton', false);
                                $(content.find('#quick-add-event-close')).unbind();
                                content.removeAttr("style");
                                content.prependTo($('#quick-add-event-placeholder'));
                                component.ClearValidation();
                                api.destroy();
                            }
                        }
                    }
                };
                //setup options for tool-tip.
                options = options || $.extend({}, defaults, options || {});

                var toolTip = $(eventElement).qtip({
                    //prerender: true,
                    style: options.style,
                    content: { text: content, button: component.get('text').close },
                    position: options.position,
                    hide: options.hide,
                    events: options.events
                }).qtip('api');

                component.set('quickAddEventTooltipApi', toolTip);
            },
            /**
             * Action to show the quick add event tool tip.
             * @param jsEvent {JSON} The event to be added.
             */
            showQuickAddEvent: function showQuickAddEvent(jsEvent) {
                var toolTip = this.get('quickAddEventTooltipApi');
                toolTip.reposition(jsEvent).show(jsEvent);
            },
            /**
             * Action to hide the quick add event tool-tip.
             */
            hideQuickAddEvent: function hideQuickAddEvent() {
                this.set('hideTooltipFromCloseButton', true);
                var toolTip = this.get('quickAddEventTooltipApi');
                toolTip.hide();
                this.ClearValidation();
            }
        }, // End of actions
        /**
        * Gets the user selected start moment for the event.
        * @return {moment}
        */
        getStartMoment: function getStartMoment(startTime) {
            var component = this;
            startTime = startTime || component.get('startTime');

            var dateAndTimeFormatString = 'MM/DD/YY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'
            var startTimeValue, startDateValue, startDateAndTimeValue, startMoment;

            startTimeValue = startTime;
            startDateValue = component.get('startDate').format("MM/DD/YY");

            startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
            startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, true);
            return startMoment;
        },
        /**
        * Finds the end moment user selection for the event.
        * @return {moment}
        */
        getEndMomenet: function getEndMomenet(endTime) {

            var component = this;
            endTime = endTime || component.get('endTime');
            var dateAndTimeFormatString = 'MM/DD/YY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'
            var endTimeValue, endDateValue, endDateAndTimeValue, endMoment;

            endTimeValue = endTime;
            endDateValue = component.get('endDate').format("MM/DD/YY");
            endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
            endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, true);
            return endMoment;
        },
        /**
         * Method which validates the current user's input
         */
        isValid: function isValid() {
            var deferred = $.Deferred();
            var component = this;
            component.ClearValidation();
            var dateAndTimeFormatString = 'MM/DD/YY LT'; // LT is short hand for 'hh:mm a', or '3:00 PM'
            var startTimeValue, startDateValue, startDateAndTimeValue, startMoment, endTimeValue, endDateValue, endDateAndTimeValue, endMoment;

            if ($('.eventTitleInput>#eventTitleText').val() === '') {
                $('span', '#nameEventError').text(this.get('text.eventNameRequired'));
                $('#nameEventError').show();
                // For screen readers
                $('.eventTitleInput>#name').attr('aria-invalid', 'true');
                $('.eventTitleInput>#name').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            if ($('#startTime', '.eventSchedulingInfo').val() === '') {

                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.startDateRequired'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#startTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#startTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            if ($('.eventSchedulingInfo').find('#endTime').val() === '') {

                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.endDateInvalid'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            // Start Time valid input
            startTimeValue = this.get('startTime');
            startDateValue = this.get('startDate').format("MM/DD/YY");
            startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
            startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, true);

            if (startMoment.isValid() === false) {

                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.startTimeInvalid'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#startTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#startTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            // end Time valid input
            endTimeValue = this.get('endTime');
            endDateValue = this.get('endDate').format("MM/DD/YY");

            endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
            endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, true);

            if (endMoment.isValid() === false) {
                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.endTimeInvalid'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            // Start Time valid input
            startTimeValue = this.get('startTime');
            startDateValue = this.get('startDate').format("MM/DD/YY");

            startDateAndTimeValue = startDateValue + ' ' + startTimeValue;
            startMoment = moment(startDateAndTimeValue, dateAndTimeFormatString, true);

            endTimeValue = this.get('endTime');
            endDateValue = this.get('endDate').format("MM/DD/YY");

            endDateAndTimeValue = endDateValue + ' ' + endTimeValue;
            endMoment = moment(endDateAndTimeValue, dateAndTimeFormatString, true);

            if (endMoment.diff(startMoment) === 0) {
                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.invalidEventTimeSelection'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            if (!endMoment.isAfter(moment())) {
                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.endTimeCanNotBeInPast'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }
            if (startMoment.isAfter(endMoment)) {
                $('span', $('#timeEventError', '.eventSchedulingInfo')).text(this.get('text.startTimeInvalid'));
                $('#timeEventError', '.eventSchedulingInfo').show();

                $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                deferred.resolve(false);
                return deferred;
            }

            this.isNameUniqueForCalendarAndTimes(this.get('eventTitle'), startMoment._i, endMoment._i).done(function (response) {
                if (response === false) {
                    $('span', $('#timeEventError', '.eventSchedulingInfo')).text(component.get('text.nameAndTimesAlreadyExistForCalendar'));
                    $('#timeEventError', '.eventSchedulingInfo').show();

                    $('#endTime', '.eventSchedulingInfo').attr('aria-invalid', 'true');
                    $('#endTime', '.eventSchedulingInfo').attr('aria-describedby', 'nameError');
                    deferred.resolve(false);
                    return deferred;
                } else {
                    deferred.resolve(true);
                }
            }).error(function () {
                // An error has occured.  Show the general error message.
                $('#manageEventGeneralError').show();
                deferred.resolve(false);
            });

            return deferred;
        },

        ClearValidation: function ClearValidation() {
            $('#nameEventError').hide();
            $('#timeEventError', '.eventSchedulingInfo').hide();
        },

        isNameUniqueForCalendarAndTimes: function isNameUniqueForCalendarAndTimes(name, start, end) {
            var calendarId = this.get('defaultCalendar').id;

            var validationUrl = jenzabar.calendar.settings.calendarEventValidationWebServiceUrl;
            var data = { eventName: name, calendarId: calendarId, start: start, end: end, calendarMove: false };
            return $.ajax({
                url: validationUrl,
                data: data
            });
        },
        /**
        * Action which updates the event info with the given event info.
        * @param start {JSON} The selected start date.
        * @param end {JSON} The selected end date.
        * @param isMonthView {JSON} Flag indicating whether we are on the monthly view or not.
        */
        updateEventInfo: function updateEventInfo(start, end, isMonthView, isAllDay) {

            this.set("eventTitle", '');

            this.set("isAllDay", isAllDay);

            if (isMonthView) {
                end = moment(start);
                var startTime = moment();
                var roundUp = (60 - startTime.minutes()) % 30;
                startTime.add(roundUp, "minutes");

                // If midnight and clicked on today, add day to start and end
                if (roundUp > 0 && startTime.minutes() === 0 && startTime.hour() === 0 && startTime.dayOfYear() === start.dayOfYear() && startTime.year() === start.year()) {
                    start.add(1, 'days');
                    end = start;
                    // Else if end would be on next day, add day
                } else if (roundUp > 0 && startTime.hour() === 23) {
                        end.add(1, 'days');
                    }

                this.set("startDate", start);
                this.set("endDate", end);

                this.set("startDay", start.format("dddd, MMMM Do"));
                this.set("startTime", startTime.format("h:mm a"));

                this.set("endDay", end.format("dddd, MMMM Do"));
                this.set("endTime", startTime.add(60, 'minutes').format("h:mm a"));
            } else {
                this.set("startDate", start);
                this.set("endDate", end);

                this.set("startDay", start.format("dddd, MMMM Do"));
                this.set("startTime", start.format("h:mm a").toLowerCase());

                this.set("endDay", end.format("dddd, MMMM Do"));
                this.set("endTime", end.format("h:mm a").toLowerCase());
            }
        },
        /**
         * Exposes this component to be accessed by the component which this instance is bound to.
         */
        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init'),
        /**
        * Method that get's called after the component is loaded into the doam.
        */
        didInsertElement: function didInsertElement() {
            //Doing this on the js side because calendar is rendered within aspn.net form
            //we cannot have nested forms in asp.net where the parent form has runat server tag.
            var component = this;
            $('#eventTitleText').keypress(function (e) {
                var key = e.which;
                if (key === 13) // the enter key code
                    {
                        component.send('goToAddEvent');
                        return false;
                    }
            });
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
/* globals $*/
define('calendar/components/select-days-of-week', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init'),

        actions: {
            onAfterRender: function onAfterRender() {
                var thisComponent = this;
                // Hook up click events for each Day span
                $('span.select-days-of-week').on('click', function () {
                    if ($(this).hasClass('selected') === true) {
                        $(this).removeClass('selected');
                        $(this).addClass('not-selected');
                    } else {
                        $(this).removeClass('not-selected');
                        $(this).addClass('selected');
                    }
                });
                // If multiple days have already been selected, show the selection
                var selectedDays = thisComponent.get('weekFrequencySelectedDays');
                if (selectedDays) {
                    $.each(selectedDays, function (index, item) {
                        var match = $('span.select-days-of-week:contains(' + item + ')');
                        match.removeClass('not-selected');
                        match.addClass('selected');
                    });
                }
            },

            openModal: function openModal() {
                var modal = this.get('comp-selectDaysOfWeekModal');
                modal.send('toggleModal');
            },

            toggleModal: function toggleModal() {
                var modal = this.get('comp-selectDaysOfWeekModal');
                modal.send('toggleModal');
            },
            onClose: function onClose() {
                this.sendAction('refreshWeekdaysSelect');
            },
            cancelClick: function cancelClick() {
                this.send('toggleModal');
                this.send('onClose');
            },

            confirm: function confirm() {
                var results = [];
                $('span.select-days-of-week.selected').each(function (index, element) {
                    results.push($(element).html());
                });

                this.sendAction('confirmSelectDays', results);
                this.send('toggleModal');
            }
        }
    });
});
define('calendar/components/share-url-button', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({

        actions: {

            toggleModal: function toggleModal() {
                var modal = this.get('comp-share-url-modal');
                modal.send('toggleModal');
            },

            onAfterRender: function onAfterRender() {
                $('.shareUrl').select();
            }
        },

        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init')

    });
});
define('calendar/components/simple-modal', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Component.extend({
        expose: (function () {
            var app_controller = this.get('targetObject');
            var exposedName = 'comp-' + this.get('id');
            app_controller.set(exposedName, this);
        }).on('init'),

        afterRenderHandler: (function () {
            _ember['default'].run.scheduleOnce('afterRender', this, function () {
                var thisComponent = this;
                if (this.get('enabled') === true) {

                    $(document).keydown(function (e) {
                        if (e.keyCode === 27) {
                            // escape
                            thisComponent.sendAction('onCloseModal');
                            thisComponent.send('toggleModal');
                        } else if (e.keyCode === 13) {
                            // enter
                            e.preventDefault();
                            thisComponent.sendAction('enterClicked');
                        }
                    });
                    this.sendAction('onAfterRender');
                } else {
                    $(document).unbind('keydown');
                }
            });
        }).observes('enabled'), // fires whenever enabled is changed.

        actions: {
            closeModal: function closeModal() {
                this.send('toggleModal');
                this.sendAction('onCloseModal');
            },

            toggleModal: function toggleModal(title) {
                if (typeof title !== 'undefined') {
                    this.set('title', title);
                }
                this.toggleProperty('enabled');
            }
        }
    });
});
define('calendar/components/validation-error', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Component.extend({});
});
define('calendar/components/view-event', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Component.extend({
        actions: {
            goBack: function goBack() {
                this.sendAction('goBack');
            }
        }
    });
});
define('calendar/controllers/calendar/add', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        actions: {
            saveCalendar: function saveCalendar(addCalendarComponent) {

                var calendar = this.store.createRecord('calendar');
                calendar.set('portletId', jenzabar.calendar.portletId);
                calendar.set('name', addCalendarComponent.get('name'));
                calendar.set('description', addCalendarComponent.get('description'));
                calendar.set('isDefault', addCalendarComponent.get('isDefault'));
                calendar.set('availableAsICalendarFeed', addCalendarComponent.get('availableAsICalendarFeed'));
                calendar.set('importCalendarUrl', addCalendarComponent.get('importCalendarUrl'));

                if (addCalendarComponent.get('isExiEventsCalendar') === true) {
                    calendar.set('isExiEventsCalendar', true);
                    calendar.set('externalCalendarName', addCalendarComponent.get('externalCalendarName'));
                    calendar.set('externalCalendarType', 1);
                }

                // Save the calendar
                var thisController = this;
                calendar.save().then(function (response) {
                    if (jenzabar.calendar.includedCalendars !== undefined) {
                        jenzabar.calendar.includedCalendars[response.get('id')] = true;
                    }
                    thisController.transitionToRoute('index');
                }, function (response) {
                    // an error occured.  Show the general error message
                    $('#addCalendarGeneralError').show();
                    textEditor.create($('#description'), { layout: 'simple' });
                });
            },

            cancel: function cancel() {
                this.transitionToRoute('index');
            },

            createSubscription: function createSubscription(url) {
                var thisController = this;

                var sub = this.store.createRecord('calendarSubscription');
                sub.set('source', 'feature');
                sub.set('portletId', jenzabar.calendar.portletId);
                sub.set('calendarId', this.getCalendarIdFromFeedUrl(url));
                sub.save().then(function () {
                    thisController.transitionToRoute('index');
                });
            }
        },

        getCalendarIdFromFeedUrl: function getCalendarIdFromFeedUrl(url) {
            return url.substring(url.lastIndexOf('/') + 1);
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
define('calendar/controllers/calendar/edit', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        actions: {
            deleteCalendar: function deleteCalendar(calendar) {
                var thisController = this;
                calendar.destroyRecord().then(function () {
                    thisController.transitionToRoute('index');
                });
            },

            cancel: function cancel() {
                this.transitionToRoute('index');
            },

            updateCalendar: function updateCalendar(editCalendarComponent) {

                var existingCalendar = editCalendarComponent.get('calendar');
                existingCalendar.set('name', editCalendarComponent.get('name'));
                existingCalendar.set('description', editCalendarComponent.get('description'));
                existingCalendar.set('isDefault', editCalendarComponent.get('isDefault'));
                existingCalendar.set('availableAsICalendarFeed', editCalendarComponent.get('availableAsICalendarFeed'));
                existingCalendar.set('importCalendarUrl', editCalendarComponent.get('importCalendarUrl'));

                if (editCalendarComponent.get('isExiEventsCalendar') === true) {
                    editCalendarComponent.set('isExiEventsCalendar', true);
                    editCalendarComponent.set('externalCalendarName', editCalendarComponent.get('externalCalendarName'));
                    editCalendarComponent.set('externalCalendarType', 1);
                }

                var thisController = this;
                existingCalendar.save().then(function () {
                    // On Success
                    thisController.store.unloadAll('calendar');
                    thisController.transitionToRoute('index');
                }, function () {
                    // an error occured.  Show the general error message
                    $('#manageCalendarGeneralError').show();
                });
            },

            retrieveLatestFeed: function retrieveLatestFeed(editCalendarComponent) {
                var existingCalendar = editCalendarComponent.get('calendar');

                existingCalendar.set('lastFeedRetrieval', 'Retrieving...');
                existingCalendar.save().then(function () {
                    existingCalendar.set('lastFeedRetrieval', moment().format('M/D/YY h:mm a'));
                }, function () {
                    existingCalendar.set('Retrieve failed');
                    $('#manageCalendarGeneralError').show();
                });
            }
        }
    });
});
define('calendar/controllers/event/add', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        actions: {
            saveEvent: function saveEvent(addEventComponent) {
                // create a new event and set it's properties from the proper fields, and then save the event.
                var event = this.store.createRecord('calendarEvent'),
                    start = new Date(),
                    end = new Date();

                end.setHours(end.getHours() + 1);

                event.set('calendarId', addEventComponent.get('selectedCalendarId'));
                event.set('title', addEventComponent.get('title'));
                event.set('description', addEventComponent.get('description'));
                event.set('location', addEventComponent.get('location'));

                if ($('#allDayCheckbox')) {
                    event.set('allDay', $('#allDayCheckbox').is(':checked'));
                }
                // Because dates and times can be changed by datepair, I needed to use
                // jQuery to get the values instead of this.get('')
                if ($('#startDate').val() !== '') {
                    event.set('start', $('#startDate').val());
                } else {
                    event.set('start', start.toLocaleDateString('en-us'));
                }

                if ($('#endDate').val() !== '') {
                    event.set('end', $('#endDate').val());
                } else {
                    event.set('end', end.toLocaleDateString('en-us'));
                }

                if (!event.get('allDay')) {
                    if ($('#startTime').val() !== '') {
                        event.set('start', event.get('start') + ' ' + $('#startTime').val());
                    }
                    if ($('#endTime').val() !== '') {
                        event.set('end', event.get('end') + ' ' + $('#endTime').val());
                    }
                } else {
                    event.set('start', event.get('start') + ' 12:00 am');
                    event.set('end', moment(new Date(event.get('end') + ' 12:00 am')).add(1, 'days').format());
                }

                // Recurrence
                var repeats = addEventComponent.get('eventRepeats');
                event.set('eventRepeats', repeats);
                if (repeats) {
                    event.set('recurrenceEndDate', addEventComponent.get('recurrenceEndDate'));
                    event.set('recurrenceInterval', addEventComponent.get('recurrenceInterval'));
                    event.set('recurrenceFrequency', addEventComponent.get('recurrenceFrequency'));
                    event.set('recurrenceOffset', addEventComponent.get('recurrenceOffset'));
                    event.set('recurrenceFrequencyWeekdays', addEventComponent.get('recurrenceFrequencyWeekdays'));
                    event.set('recurrenceMonths', addEventComponent.get('recurrenceMonths'));
                }
                var thisController = this;
                event.save().then(function () {
                    // On Success
                    thisController.transitionToRoute('index');
                }, function (response) {
                    // an error occured.  Show the general error message
                    $('#manageEventGeneralError').show();
                });
            },

            cancel: function cancel() {
                this.transitionToRoute('index');
            }
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
define('calendar/controllers/event/edit', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        queryParams: ['isEditSeries'],
        isEditSeries: null,

        actions: {
            deleteEvent: function deleteEvent(event) {
                var thisController = this;
                event.destroyRecord().then(function () {
                    thisController.transitionToRoute('index');
                });
            },

            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                var thisController = this;
                var data = { recurringEventId: recurringEventId };

                // This will be a RPC style call, so the URL is different then our API URLs.
                var url = jenzabar.framework.portalSettings.rpcRootUrl + 'RecurringEvents/RemoveFrom';
                // Make a POST call
                $.ajax({
                    url: url,
                    data: data,
                    type: 'POST',
                    success: function success(response) {
                        thisController.transitionToRoute('index');
                    },
                    error: function error(_error) {}
                });
            },

            updateEvent: function updateEvent(editEventComponent) {
                var existingEvent = this.getEventWithValuesPopulatedByComponent(editEventComponent);
                var thisController = this;
                existingEvent.save().then(function () {
                    // On Success
                    thisController.store.unloadAll('calendarEvent');
                    thisController.transitionToRoute('index');
                }, function (response) {
                    // an error occured.  Show the general error message
                    $('#manageEventGeneralError').show();
                });
            },

            cancel: function cancel() {
                this.store.unloadAll('calendarEvent');
                this.transitionToRoute('index');
            },

            updateSeries: function updateSeries(editEventComponent) {
                var thisController = this;
                var updatedEvent = this.getDtoWithValuesPopulatedByComponent(editEventComponent);
                var userChangedStartOrEndDate = editEventComponent.get('userChangedStartOrEndDate');

                var data = {
                    userChangedStartOrEndDate: userChangedStartOrEndDate,
                    updatedEvent: updatedEvent
                };
                // This will be a RPC style call, so the URL is different then our API URLs.
                var url = jenzabar.framework.portalSettings.rpcRootUrl + 'RecurringEvents/UpdateSeries';
                // Make a POST call
                $.ajax({
                    url: url,
                    data: data,
                    type: 'POST',
                    success: function success(response) {
                        thisController.store.unloadAll('calendarEvent');
                        thisController.transitionToRoute('index');
                    },
                    error: function error(_error2) {
                        alert(_error2);
                    }
                });
            }
        },

        getDtoWithValuesPopulatedByComponent: function getDtoWithValuesPopulatedByComponent(editEventComponent) {
            var recurringEvent = {};
            recurringEvent.Id = editEventComponent.get('event.id');
            recurringEvent.calendarId = editEventComponent.get('selectedCalendarId');
            recurringEvent.title = editEventComponent.get('title');
            recurringEvent.description = editEventComponent.get('description');
            recurringEvent.Location = editEventComponent.get('location');

            if ($('#allDayCheckbox')) {
                recurringEvent.allDay = $('#allDayCheckbox').is(':checked');
            }
            // Dates and times
            if (recurringEvent.allDay) {
                recurringEvent.start = $('#startDate').val() + ' 12:00 am';
                recurringEvent.end = moment(new Date($('#endDate').val() + ' 12:00 am')).add(1, 'days').format();
            } else {
                recurringEvent.start = $('#startDate').val() + ' ' + $('#startTime').val();
                recurringEvent.end = $('#endDate').val() + ' ' + $('#endTime').val();
            }
            // Recurrence
            var repeats = editEventComponent.get('eventRepeats');
            recurringEvent.eventRepeats = repeats;
            if (repeats) {
                recurringEvent.recurrenceEndDate = editEventComponent.get('recurrenceEndDate');
                recurringEvent.recurrenceInterval = editEventComponent.get('recurrenceInterval');
                recurringEvent.recurrenceFrequency = editEventComponent.get('recurrenceFrequency');
                recurringEvent.recurrenceOffset = editEventComponent.get('recurrenceOffset');
                recurringEvent.recurrenceFrequencyWeekdays = editEventComponent.get('recurrenceFrequencyWeekdays');
                recurringEvent.recurrenceMonths = editEventComponent.get('recurrenceMonths');
            }
            return recurringEvent;
        },

        getEventWithValuesPopulatedByComponent: function getEventWithValuesPopulatedByComponent(editEventComponent) {
            var existingEvent = editEventComponent.get('event');
            var start = new Date();
            var end = new Date();

            existingEvent.set('calendarId', editEventComponent.get('selectedCalendarId'));
            existingEvent.set('title', editEventComponent.get('title'));
            existingEvent.set('description', editEventComponent.get('description'));

            if ($('#allDayCheckbox')) {
                existingEvent.set('allDay', $('#allDayCheckbox').is(':checked'));
            }

            // Because dates and times can be changed by datepair, I needed to use
            // jQuery to get the values instead of this.get('')
            if ($('#startDate').val() !== '') {
                existingEvent.set('start', $('#startDate').val());
            } else {
                existingEvent.set('start', start.toLocaleDateString('en-us'));
            }

            if ($('#startTime').val() !== '') {
                existingEvent.set('start', existingEvent.get('start') + ' ' + $('#startTime').val());
            }

            if ($('#endDate').val() !== '') {
                existingEvent.set('end', $('#endDate').val());
            } else {
                existingEvent.set('end', end.toLocaleDateString('en-us'));
            }

            if ($('#endTime').val() !== '') {
                existingEvent.set('end', existingEvent.get('end') + ' ' + $('#endTime').val());
            }

            if (existingEvent.get('allDay')) {
                existingEvent.set('end', moment(new Date(existingEvent.get('end'))).add(1, 'days').format());
            }

            existingEvent.set('location', editEventComponent.get('location'));
            // Recurrence
            var repeats = editEventComponent.get('eventRepeats');
            existingEvent.set('eventRepeats', repeats);
            if (repeats) {
                existingEvent.set('recurrenceEndDate', editEventComponent.get('recurrenceEndDate'));
                existingEvent.set('recurrenceInterval', editEventComponent.get('recurrenceInterval'));
                existingEvent.set('recurrenceFrequency', editEventComponent.get('recurrenceFrequency'));
                existingEvent.set('recurrenceOffset', editEventComponent.get('recurrenceOffset'));
                existingEvent.set('recurrenceFrequencyWeekdays', editEventComponent.get('recurrenceFrequencyWeekdays'));
                existingEvent.set('recurrenceMonths', editEventComponent.get('recurrenceMonths'));
            }
            return existingEvent;
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
define('calendar/controllers/event/view', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Controller.extend({

        queryParams: ['eventSource', 'eventType'],
        eventSource: 'jics',
        eventType: 'default',

        actions: {
            goBack: function goBack() {
                this.transitionToRoute('index');
            }
        }

    });
});
define('calendar/controllers/exi-event/view', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Controller.extend({

        actions: {
            //Re-routes to calendar index
            goBack: function goBack() {
                this.transitionToRoute('index');
            }
        }
    });
});
define('calendar/controllers/index', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        actions: {
            goToAddEvent: function goToAddEvent() {
                this.transitionToRoute('event.add');
            },

            updateEvent: function updateEvent(event) {
                this.store.findRecord('calendarEvent', event.id).then(function (calEvent) {
                    calEvent.set('start', event.start.format('MM/DD/YYYY hh:mm a'));
                    calEvent.set('end', event.end.format('MM/DD/YYYY hh:mm a'));
                    calEvent.set('allDay', event.allDay);
                    calEvent.save();
                });
            },

            updateEventInSeries: function updateEventInSeries(event) {},

            updateRecurringEventSeries: function updateRecurringEventSeries(event) {},

            quickAddEventToAdd: function quickAddEventToAdd(title, start, end, isFullDay) {
                var defaultCalendar;
                this.get('model.calendars').forEach(function (item) {
                    if (item.get('isDefault') && !item.get('isSubscription')) {
                        defaultCalendar = item;
                    }
                });
                if (defaultCalendar === undefined) {
                    defaultCalendar = this.get('model.calendars').get('firstObject');
                }

                this.transitionToRoute('event.add', { queryParams: { title: title, start: start, end: end, isFullDay: isFullDay, calendarId: defaultCalendar.id } });
            },

            goToAddCalendar: function goToAddCalendar() {
                this.transitionToRoute('calendar.add');
            },

            deleteEvent: function deleteEvent(fullCalEvent) {
                this.store.findRecord('calendarEvent', fullCalEvent.id).then(function (calEvent) {
                    calEvent.destroyRecord().then(function () {
                        $('#calendar').fullCalendar('refetchEvents');
                    });
                });
            },

            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                var data = { recurringEventId: recurringEventId };
                // This will be a RPC style call, so the URL is different then our API URLs.
                var url = jenzabar.framework.portalSettings.rpcRootUrl + 'RecurringEvents/RemoveFrom';
                // Make a POST call
                $.ajax({
                    url: url,
                    data: data,
                    type: 'POST',
                    success: function success(response) {
                        $('#calendar').fullCalendar('refetchEvents');
                    },
                    error: function error(_error) {
                        console.log(_error);
                    }
                });
            },

            editEvent: function editEvent(fullCalEvent) {
                this.transitionToRoute('event.edit', fullCalEvent.id, { queryParams: { isEditSeries: null } });
            },

            editOccurence: function editOccurence(fullCalEvent, userIsEditingTimes, revertFunc) {
                var thisController = this;
                if (userIsEditingTimes === true) {
                    var data = {
                        calendarEventId: fullCalEvent.id,
                        isAllDay: fullCalEvent.allDay,
                        newStartTime: fullCalEvent.start.format('MM/DD/YY h:mm a'),
                        newEndTime: fullCalEvent.end.format('MM/DD/YY h:mm a')
                    };
                    // This will be a RPC style call, so the URL is different then our API URLs.
                    var url = jenzabar.framework.portalSettings.rpcRootUrl + 'RecurringEvents/UpdateOccurenceTimes';
                    // Make a POST call
                    $.ajax({
                        url: url,
                        data: data,
                        type: 'POST',
                        success: function success(response) {
                            thisController.store.unloadAll('calendarEvent');
                            $('#calendar').fullCalendar('refetchEvents');
                        },
                        error: function error(_error2) {
                            console.log(_error2);
                            if (revertFunc) {
                                revertFunc();
                            }
                        }
                    });
                } else {
                    thisController.transitionToRoute('event.edit', fullCalEvent.id, { queryParams: { isEditSeries: false } });
                }
            },

            editSeries: function editSeries(fullCalEvent, userIsEditingTimes, revertFunc) {
                var thisController = this;
                if (userIsEditingTimes === true) {
                    var data = {
                        calendarEventId: fullCalEvent.id,
                        isAllDay: fullCalEvent.allDay,
                        newStartTime: fullCalEvent.start.format('MM/DD/YY h:mm a'),
                        newEndTime: fullCalEvent.end.format('MM/DD/YY h:mm a')
                    };
                    // This will be a RPC style call, so the URL is different then our API URLs.
                    var url = jenzabar.framework.portalSettings.rpcRootUrl + 'RecurringEvents/UpdateSeriesTimes';
                    // Make a POST call
                    $.ajax({
                        url: url,
                        data: data,
                        type: 'POST',
                        success: function success(response) {
                            thisController.store.unloadAll('calendarEvent');
                            $('#calendar').fullCalendar('refetchEvents');
                        },
                        error: function error(_error3) {
                            console.log(_error3);
                            if (revertFunc) {
                                revertFunc();
                            }
                        }
                    });
                } else {
                    this.transitionToRoute('event.edit', fullCalEvent.id, { queryParams: { isEditSeries: true } });
                }
            },

            addEvent: function addEvent(title, start, end, isFullDay) {
                // create a new event and set it's properties from the proper fields, and then save the event.
                var selectedCalendar;
                this.get('model.calendars').forEach(function (item) {
                    if (item.get('isDefault') && !item.get('isSubscription')) {
                        selectedCalendar = item;
                    }
                });

                if (selectedCalendar !== 'undefined') {

                    this.createEventModel(title, start, end, isFullDay).save().then(function () {
                        // On Success
                        $('#calendar').fullCalendar('refetchEvents');
                    }, function () {
                        // an error occured.  Show the general error message
                        $('#manageEventGeneralError').show();
                    });
                }
            },

            updateFullCalendar: function updateFullCalendar() {
                $('#calendar').fullCalendar('refetchEvents');
            },

            subscribe: function subscribe(calendar) {
                var i,
                    thisController = this,
                    sub = this.store.createRecord('calendarSubscription');

                sub.set('calendarId', calendar.id);
                sub.set('calendarName', calendar.name);
                sub.save().then(function () {
                    var calendars = thisController.get('model.calendars');
                    calendars.forEach(function (value) {
                        if (value.id === calendar.id) {
                            _ember['default'].set(value, 'isSubscribed', true);
                        }
                    });
                });
            },

            removeCalendar: function removeCalendar(calendar) {
                var thisController = this;

                this.store.findRecord('calendarSubscription', calendar.get('subscriptionId')).then(function (sub) {
                    sub.destroyRecord().then(function () {
                        thisController.store.query('calendar', { portletId: jenzabar.calendar.portletId }).then(function (calendars) {
                            thisController.set('model.calendars', calendars);
                        });
                        $('#calendar').fullCalendar('refetchEvents');
                    });
                });
            }
        },

        createEventModel: function createEventModel(title, start, end, isFullDay) {
            // create a new event and set it's properties from the proper fields, and then save the event.
            var event = this.store.createRecord('calendarEvent'),
                newEventend = new Date();
            var selectedCalendar;
            this.get('model.calendars').forEach(function (item) {
                if (item.get('isDefault') && !item.get('isSubscription')) {
                    selectedCalendar = item;
                }
            });
            if (typeof selectedCalendar !== 'undefined') {

                newEventend.setHours(newEventend.getHours() + 1);
                event.set('title', title);
                event.set('calendarId', selectedCalendar.id);

                // Need to format the time so that the web services can parse this to a date time.
                event.set('start', start.format("MM/DD/YY h:mm a"));
                event.set('end', end.format("MM/DD/YY h:mm a"));

                event.set('allDay', isFullDay);
                event.set('state', 'quickAdd');
            }
            return event;
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
/* globals $*/
define('calendar/controllers/manage-my-calendar', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Controller.extend({
        actions: {
            goBack: function goBack() {
                this.store.unloadAll('calendar');
                this.transitionToRoute('index');
            },

            toggleVisible: function toggleVisible(sub) {
                sub.set('isVisible', !sub.get('isVisible'));
                sub.save();
            },

            unsubscribe: function unsubscribe(sub) {
                sub.destroyRecord();
            },

            toggleFeed: function toggleFeed() {
                this.set('model.set.availableAsICalendarFeed', !this.get('model.set.availableAsICalendarFeed'));
                this.model.set.save();
            }
        }

    });
});
define('calendar/controllers/recurring-event/edit', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Controller.extend({
        actions: {

            deleteEvent: function deleteEvent(event) {
                var thisController = this;
                event.destroyRecord().then(function () {
                    thisController.transitionToRoute('index');
                });
            },

            deleteRecurringEvent: function deleteRecurringEvent(recurringEventId) {
                this.store.findRecord('recurringEvent', recurringEventId).then(function (recurringEvent) {
                    recurringEvent.destroyRecord().then(function () {
                        $('#calendar').fullCalendar('refetchEvents');
                    });
                });
            },

            updateEvent: function updateEvent(editEventComponent) {
                var existingEvent = editEventComponent.get('event');
                var start = new Date();
                var end = new Date();

                existingEvent.set('calendarId', editEventComponent.get('selectedCalendarId'));
                existingEvent.set('title', editEventComponent.get('title'));
                existingEvent.set('description', editEventComponent.get('description'));

                // Because dates and times can be changed by datepair, I needed to use
                // jQuery to get the values instead of this.get('')
                if ($('#startDate').val() !== '') {
                    existingEvent.set('start', $('#startDate').val());
                } else {
                    existingEvent.set('start', start.toLocaleDateString('en-us'));
                }

                if ($('#startTime').val() !== '') {
                    existingEvent.set('start', existingEvent.get('start') + ' ' + $('#startTime').val());
                }

                if ($('#endDate').val() !== '') {
                    existingEvent.set('end', $('#endDate').val());
                } else {
                    existingEvent.set('end', end.toLocaleDateString('en-us'));
                }

                if ($('#endTime').val() !== '') {
                    existingEvent.set('end', existingEvent.get('end') + ' ' + $('#endTime').val());
                }
                existingEvent.set('location', editEventComponent.get('location'));
                // Recurrence
                var repeats = editEventComponent.get('eventRepeats');
                existingEvent.set('eventRepeats', repeats);
                if (repeats) {
                    existingEvent.set('recurrenceEndDate', editEventComponent.get('recurrenceEndDate'));
                    existingEvent.set('recurrenceInterval', editEventComponent.get('recurrenceInterval'));
                    existingEvent.set('recurrenceFrequency', editEventComponent.get('recurrenceFrequency'));
                    existingEvent.set('recurrenceOffset', editEventComponent.get('recurrenceOffset'));
                    existingEvent.set('recurrenceFrequencyWeekdays', editEventComponent.get('recurrenceFrequencyWeekdays'));
                    existingEvent.set('recurrenceMonths', editEventComponent.get('recurrenceMonths'));
                }

                var thisController = this;
                existingEvent.save().then(function () {
                    // On Success
                    thisController.transitionToRoute('index');
                }, function (response) {
                    // an error occured.  Show the general error message
                    $('#manageEventGeneralError').show();
                });
            }
        }
    });
});
/* jshint undef: true, unused: false, -W079 */
define('calendar/helpers/pluralize', ['exports', 'ember-inflector/lib/helpers/pluralize'], function (exports, _emberInflectorLibHelpersPluralize) {
  exports['default'] = _emberInflectorLibHelpersPluralize['default'];
});
define('calendar/helpers/singularize', ['exports', 'ember-inflector/lib/helpers/singularize'], function (exports, _emberInflectorLibHelpersSingularize) {
  exports['default'] = _emberInflectorLibHelpersSingularize['default'];
});
define('calendar/initializers/app-version', ['exports', 'ember-cli-app-version/initializer-factory', 'calendar/config/environment'], function (exports, _emberCliAppVersionInitializerFactory, _calendarConfigEnvironment) {
  exports['default'] = {
    name: 'App Version',
    initialize: (0, _emberCliAppVersionInitializerFactory['default'])(_calendarConfigEnvironment['default'].APP.name, _calendarConfigEnvironment['default'].APP.version)
  };
});
define('calendar/initializers/container-debug-adapter', ['exports', 'ember-resolver/container-debug-adapter'], function (exports, _emberResolverContainerDebugAdapter) {
  exports['default'] = {
    name: 'container-debug-adapter',

    initialize: function initialize() {
      var app = arguments[1] || arguments[0];

      app.register('container-debug-adapter:main', _emberResolverContainerDebugAdapter['default']);
      app.inject('container-debug-adapter:main', 'namespace', 'application:main');
    }
  };
});
define('calendar/initializers/data-adapter', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `data-adapter` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'data-adapter',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define('calendar/initializers/ember-data', ['exports', 'ember-data/setup-container', 'ember-data/-private/core'], function (exports, _emberDataSetupContainer, _emberDataPrivateCore) {

  /*
  
    This code initializes Ember-Data onto an Ember application.
  
    If an Ember.js developer defines a subclass of DS.Store on their application,
    as `App.StoreService` (or via a module system that resolves to `service:store`)
    this code will automatically instantiate it and make it available on the
    router.
  
    Additionally, after an application's controllers have been injected, they will
    each have the store made available to them.
  
    For example, imagine an Ember.js application with the following classes:
  
    App.StoreService = DS.Store.extend({
      adapter: 'custom'
    });
  
    App.PostsController = Ember.ArrayController.extend({
      // ...
    });
  
    When the application is initialized, `App.ApplicationStore` will automatically be
    instantiated, and the instance of `App.PostsController` will have its `store`
    property set to that instance.
  
    Note that this code will only be run if the `ember-application` package is
    loaded. If Ember Data is being used in an environment other than a
    typical application (e.g., node.js where only `ember-runtime` is available),
    this code will be ignored.
  */

  exports['default'] = {
    name: 'ember-data',
    initialize: _emberDataSetupContainer['default']
  };
});
define('calendar/initializers/export-application-global', ['exports', 'ember', 'calendar/config/environment'], function (exports, _ember, _calendarConfigEnvironment) {
  exports.initialize = initialize;

  function initialize() {
    var application = arguments[1] || arguments[0];
    if (_calendarConfigEnvironment['default'].exportApplicationGlobal !== false) {
      var value = _calendarConfigEnvironment['default'].exportApplicationGlobal;
      var globalName;

      if (typeof value === 'string') {
        globalName = value;
      } else {
        globalName = _ember['default'].String.classify(_calendarConfigEnvironment['default'].modulePrefix);
      }

      if (!window[globalName]) {
        window[globalName] = application;

        application.reopen({
          willDestroy: function willDestroy() {
            this._super.apply(this, arguments);
            delete window[globalName];
          }
        });
      }
    }
  }

  exports['default'] = {
    name: 'export-application-global',

    initialize: initialize
  };
});
define('calendar/initializers/injectStore', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `injectStore` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'injectStore',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define('calendar/initializers/store', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `store` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'store',
    after: 'ember-data',
    initialize: _ember['default'].K
  };
});
define('calendar/initializers/transforms', ['exports', 'ember'], function (exports, _ember) {

  /*
    This initializer is here to keep backwards compatibility with code depending
    on the `transforms` initializer (before Ember Data was an addon).
  
    Should be removed for Ember Data 3.x
  */

  exports['default'] = {
    name: 'transforms',
    before: 'store',
    initialize: _ember['default'].K
  };
});
define("calendar/instance-initializers/ember-data", ["exports", "ember-data/-private/instance-initializers/initialize-store-service"], function (exports, _emberDataPrivateInstanceInitializersInitializeStoreService) {
  exports["default"] = {
    name: "ember-data",
    initialize: _emberDataPrivateInstanceInitializersInitializeStoreService["default"]
  };
});
define('calendar/mixins/data-loader', ['exports', 'ember'], function (exports, _ember) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Mixin.create({

        loadGlobalizationText: function loadGlobalizationText(controller, viewName) {
            var deferred = $.Deferred();
            $.ajax({ type: 'GET', url: jenzabar.calendar.settings.globWebServiceUrl + viewName }).then(function (response) {
                controller.set('text', response);
                deferred.resolve();
            });
            return deferred;
        },

        loadPortletSettings: function loadPortletSettings(controller) {
            $.ajax({ type: 'GET', url: jenzabar.framework.portalSettings.portletSettingsWebServiceUrl + jenzabar.calendar.portletId }).then(function (response) {
                controller.set('settings', response);
            });
        },

        getSettings: function getSettings() {
            var portletId = jenzabar.calendar.settingsPortletId;
            var settingsWebServiceUrl = jenzabar.framework.portalSettings.portletSettingsWebServiceUrl + portletId;
            return $.ajax({ type: 'GET', url: settingsWebServiceUrl });
        },

        getGlobalizationText: function getGlobalizationText(viewName) {
            return $.ajax({ type: 'GET', url: jenzabar.calendar.settings.globWebServiceUrl + viewName });
        }

    });
});
define('calendar/mixins/reset-scroll', ['exports', 'ember'], function (exports, _ember) {
    exports['default'] = _ember['default'].Mixin.create({
        activate: function activate() {
            this._super();
            window.scrollTo(0, 0);
        }
    });
});
define('calendar/models/calendar-event', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        calendarId: _emberData['default'].attr('string'),
        calendarName: _emberData['default'].attr('string'),
        title: _emberData['default'].attr('string'),
        description: _emberData['default'].attr('string'),
        start: _emberData['default'].attr('string'),
        end: _emberData['default'].attr('string'),
        allDay: _emberData['default'].attr('boolean'),
        location: _emberData['default'].attr('string'),
        isReadOnly: _emberData['default'].attr('boolean'),
        color: _emberData['default'].attr('string'),
        eventRepeats: _emberData['default'].attr('boolean'),
        parentRecurringEventId: _emberData['default'].attr('string'),
        recurrenceEndDate: _emberData['default'].attr('string'),
        recurrenceInterval: _emberData['default'].attr('number'),
        recurrenceFrequency: _emberData['default'].attr('string'),
        recurrenceOffset: _emberData['default'].attr('string'),
        recurrenceFrequencyWeekdays: _emberData['default'].attr('string'),
        recurrenceMonths: _emberData['default'].attr('string'),
        eventSource: _emberData['default'].attr('string'),
        eventType: _emberData['default'].attr('string')
    });
});
define('calendar/models/calendar-set', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        availableAsICalendarFeed: _emberData['default'].attr('boolean'),
        feedUrl: _emberData['default'].attr('string')
    });
});
define('calendar/models/calendar-subscription', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        calendarId: _emberData['default'].attr('string'),
        calendarName: _emberData['default'].attr('string'),
        isVisible: _emberData['default'].attr('boolean'),
        portletId: _emberData['default'].attr('string'),
        portletUrl: _emberData['default'].attr('string'),
        isCurrentPortlet: _emberData['default'].attr('boolean'),
        source: _emberData['default'].attr('string')
    });
});
define('calendar/models/calendar', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        portletId: _emberData['default'].attr('string'),
        name: _emberData['default'].attr('string'),
        description: _emberData['default'].attr('string'),
        isDefault: _emberData['default'].attr('boolean'),
        isiCalendarFeed: _emberData['default'].attr('boolean'),
        availableAsICalendarFeed: _emberData['default'].attr('boolean'),
        importCalendarUrl: _emberData['default'].attr('string'),
        isSubscribed: _emberData['default'].attr('boolean'),
        shareUrl: _emberData['default'].attr('string'),
        lastFeedRetrieval: _emberData['default'].attr('string'),
        isSubscription: _emberData['default'].attr('boolean'),
        isMyCalendar: _emberData['default'].attr('boolean'),
        subscriptionId: _emberData['default'].attr('string'),
        isExiEventsCalendar: _emberData['default'].attr('boolean'),
        externalCalendarName: _emberData['default'].attr('string'),
        externalCalendarType: _emberData['default'].attr('number')
    });
});
define('calendar/models/recurring-event', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        calendarId: _emberData['default'].attr('string'),
        calendarName: _emberData['default'].attr('string'),
        title: _emberData['default'].attr('string'),
        description: _emberData['default'].attr('string'),
        start: _emberData['default'].attr('string'),
        end: _emberData['default'].attr('string'),
        allDay: _emberData['default'].attr('boolean'),
        location: _emberData['default'].attr('string'),
        isReadOnly: _emberData['default'].attr('boolean'),
        eventRepeats: _emberData['default'].attr('boolean'),
        color: _emberData['default'].attr('string'),
        recurrenceEndDate: _emberData['default'].attr('string'),
        recurrenceInterval: _emberData['default'].attr('number'),
        recurrenceFrequency: _emberData['default'].attr('string'),
        recurrenceOffset: _emberData['default'].attr('string'),
        recurrenceFrequencyWeekdays: _emberData['default'].attr('string'),
        recurrenceMonths: _emberData['default'].attr('string')
    });
});
define('calendar/models/scheduled-event', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].Model.extend({
        title: _emberData['default'].attr('string'),
        details: _emberData['default'].attr(),
        relatedFacility: _emberData['default'].attr(),
        timeslot: _emberData['default'].attr()

    });
});
define('calendar/resolver', ['exports', 'ember-resolver'], function (exports, _emberResolver) {
  exports['default'] = _emberResolver['default'];
});
define('calendar/router', ['exports', 'ember', 'calendar/config/environment'], function (exports, _ember, _calendarConfigEnvironment) {

  var Router = _ember['default'].Router.extend({
    location: _calendarConfigEnvironment['default'].locationType
  });

  Router.map(function () {
    this.route('event', function () {
      this.route('add');
      this.route('view', { path: ':calendar_event_id' });
      this.route('edit', { path: ':calendar_event_id/edit' });
    });

    this.route('recurring-event', function () {
      this.route('edit', { path: ':recurring_event_id/edit' });
    });

    this.route('calendar', function () {
      this.route('add');
      this.route('edit', { path: ':calendar_id/edit' });
    });

    this.route('manage-my-calendar');

    this.route('exi-event', function () {
      this.route('view', { path: ':calendar_exiEvent_id' });
    });
  });

  exports['default'] = Router;
});
define('calendar/routes/calendar/add', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {

        model: function model() {
            return _ember['default'].RSVP.hash({
                text: this.getGlobalizationText('addCalendar'),
                settings: this.getSettings(),
                isMyPages: jenzabar.calendar.settings.isMyPages,
                canManageExCalendars: jenzabar.calendar.settings.canManageExCalendars
            });
        },

        afterModel: function afterModel(model) {
            if (model.settings.operations.canadmincalendars !== true) {
                this.transitionTo('index');
            }
        },

        deactivate: function deactivate() {
            window.textEditor.destroy($('#description'));
        }
    });
});
define('calendar/routes/calendar/edit', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {

        model: function model(params) {
            return _ember['default'].RSVP.hash({
                text: this.getGlobalizationText('editCalendar'),
                calendar: this.store.find('calendar', params.calendar_id),
                settings: this.getSettings(),
                isMyPages: jenzabar.calendar.settings.isMyPages,
                canManageExCalendars: jenzabar.calendar.settings.canManageExCalendars
            });
        },

        afterModel: function afterModel(model) {
            if (model.settings.operations.canadmincalendars !== true) {
                this.transitionTo('index');
            }
        },

        deactivate: function deactivate() {
            window.textEditor.destroy($('#description'));
        }
    });
});
define('calendar/routes/event/add', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {
        serialize: function serialize(model) {
            return { calendar_event_id: model.get('state') };
        },
        beforeModel: function beforeModel(transition) {

            this.set('title', transition.queryParams.title);
            this.set('isFullDay', transition.queryParams.isFullDay);
            this.set('start', transition.queryParams.start);
            this.set('end', transition.queryParams.end);
            this.set('calendarId', transition.queryParams.calendarId);
        },
        model: function model() {
            var end = this.get('end'),
                start = this.get('start'),
                title = this.get('title'),
                isFullDay = this.get('isFullDay'),
                calendarId = this.get('calendarId'),
                event,
                newEventend;

            if (calendarId !== undefined) {
                // create a new event and set it's properties from the proper fields, and then save the event.
                event = this.store.createRecord('calendarEvent');
                newEventend = new Date();

                newEventend.setHours(newEventend.getHours() + 1);
                event.set('title', title);
                event.set('calendarId', calendarId);

                // Need to format the time so that the web services can parse this to a date time.
                event.set('start', start); //.format("MM/DD/YYYY h:mm a"));
                event.set('end', end); //.format("MM/DD/YYYY h:mm a"));

                event.set('allDay', isFullDay);
                event.set('state', 'quickAdd');
            }

            return _ember['default'].RSVP.hash({
                event: event,
                text: this.getGlobalizationText('addEvent'),
                settings: this.getSettings()
            });
        },

        afterModel: function afterModel(model) {
            if (model.settings.operations.canadminevents !== true) {
                this.transitionTo('index');
                return;
            }
        },

        deactivate: function deactivate() {
            window.textEditor.destroy($('#eventDescription'));
        }
    });
});
/* jshint undef: true,-W079 */
/* globals $*/
define('calendar/routes/event/edit', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {
        model: function model(params) {
            var isEditSeries = undefined;
            if (params.isEditSeries === 'true') {
                isEditSeries = true;
            } else if ('isEditSeries' === 'false') {
                isEditSeries = false;
            }
            return _ember['default'].RSVP.hash({
                event: this.store.find('calendar-event', params.calendar_event_id),
                text: this.getGlobalizationText('editEvent'),
                settings: this.getSettings(),
                isEditSeries: isEditSeries
            });
        },

        afterModel: function afterModel(model) {
            if (model.settings.operations.canadminevents !== true) {
                this.transitionTo('event.view', model.event.id, { queryParams: { eventSource: model.event.get('eventSource'), eventType: model.event.get('eventType') } });
            }
            if (model.event.get('isReadOnly')) {
                this.transitionTo('event.view', model.event.id, { queryParams: { eventSource: model.event.get('eventSource'), eventType: model.event.get('eventType') } });
            }
            if (model.event.get('allDay')) {
                var end = moment(new Date(model.event.get('end')));
                if (end.hour() !== 0) {
                    end.add(-end.utcOffset(), 'minutes');
                }
                end.add(-1, 'days');
                model.event.set('end', end.toDate());
            }
        },

        deactivate: function deactivate() {
            window.textEditor.destroy($('#eventDescription'));
        }
    });
});
define('calendar/routes/event/view', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {
        model: function model(params) {
            return this.store.queryRecord('calendar-event', {
                id: params.calendar_event_id,
                eventSource: params.eventSource,
                eventType: params.eventType
            });
        },

        afterModel: function afterModel(model) {
            if (_ember['default'].get(model, 'title') === '_null_event_') {
                this.transitionTo('index');
            }

            model.startDisplay = moment(_ember['default'].get(model, 'start')).format('dddd, MMMM Do, h:mm a');
            model.endDisplay = moment(_ember['default'].get(model, 'end')).format('dddd, MMMM Do, h:mm a');
            if (model.endDisplay === 'Invalid date') model.endDisplay = model.startDisplay;
            this.getGlobalizationText('viewEvent').then(function (response) {
                _ember['default'].set(model, 'text', response);
            });
        }
    });
});
define('calendar/routes/exi-event/view', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {

        model: function model(params) {
            return _ember['default'].RSVP.hash({
                exiEvent: this.store.queryRecord('scheduled-event', { id: params.calendar_exiEvent_id }),
                text: this.getGlobalizationText('viewExiEvent')
            });
        }
    });
});
define('calendar/routes/index', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {
        model: function model() {
            return _ember['default'].RSVP.hash({
                text: this.getGlobalizationText('index'),
                calendars: this.store.query('calendar', { portletId: jenzabar.calendar.portletId }),
                settings: this.getSettings(),
                isGuest: jenzabar.calendar.settings.isGuest,
                isMyPages: jenzabar.calendar.settings.isMyPages
            });
        }
    });
});
define('calendar/routes/manage-my-calendar', ['exports', 'ember', 'calendar/mixins/data-loader', 'calendar/mixins/reset-scroll'], function (exports, _ember, _calendarMixinsDataLoader, _calendarMixinsResetScroll) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], _calendarMixinsResetScroll['default'], {

        model: function model() {
            // Remove newly added subs to not break ordering.
            this.store.unloadAll('calendar-subscription');
            return _ember['default'].RSVP.hash({
                set: this.store.findRecord('calendar-set', 'myCalendarSet'),
                autoSubs: this.store.query('calendar-subscription', { source: 'allAuto' }),
                subs: this.store.query('calendar-subscription', { portletId: jenzabar.calendar.portletId }),
                text: this.getGlobalizationText('manageMyCalendar')
            });
        }
    });
});
define('calendar/routes/recurring-event/edit', ['exports', 'ember', 'calendar/mixins/data-loader'], function (exports, _ember, _calendarMixinsDataLoader) {
    var $ = _ember['default'].$;

    exports['default'] = _ember['default'].Route.extend(_calendarMixinsDataLoader['default'], {
        model: function model(params) {
            var portletId = jenzabar.calendar.portletId;
            var settingsWebServiceUrl = jenzabar.framework.portalSettings.portletSettingsWebServiceUrl + portletId;

            return _ember['default'].RSVP.hash({
                event: this.store.find('recurring-event', params.recurring_event_id),
                text: this.getGlobalizationText('editEvent'),
                settings: $.ajax({ type: 'GET', url: settingsWebServiceUrl })
            });
        },

        afterModel: function afterModel(model) {
            if (model.event.get('isReadOnly')) {
                this.transitionTo('event.view', model.event, { queryParams: { eventSource: model.event.get('eventSource'), eventType: model.event.get('eventType') } });
                return;
            }
            if (model.settings.operations.canadminevents !== true) {
                this.transitionTo('event.view', model.event, { queryParams: { eventSource: model.event.get('eventSource'), eventType: model.event.get('eventType') } });
                return;
            }
        }
    });
});
define('calendar/serializers/application', ['exports', 'ember-data'], function (exports, _emberData) {
    exports['default'] = _emberData['default'].RESTSerializer.extend({
        serialize: function serialize(record, options) {
            options = options ? options : {}; // handle the case where options is undefined
            // Setting this option will ensure that a record's ID will be passed in
            // the PUT method for an update to the record
            options.includeId = true;
            return this._super.apply(this, [record, options]); // Call the parent serializer
        }
    });
});
define('calendar/services/ajax', ['exports', 'ember-ajax/services/ajax'], function (exports, _emberAjaxServicesAjax) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberAjaxServicesAjax['default'];
    }
  });
});
define("calendar/templates/application", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 1,
            "column": 10
          }
        },
        "moduleName": "calendar/templates/application.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["content", "outlet", ["loc", [null, [1, 0], [1, 10]]]]],
      locals: [],
      templates: []
    };
  })());
});
define("calendar/templates/calendar/add", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 8,
              "column": 4
            },
            "end": {
              "line": 15,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/calendar/add.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 17,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/calendar/add.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "add-calendar-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("h4");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1, 1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.addACalendar", ["loc", [null, [4, 12], [4, 39]]]], ["block", "manage-calendar", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [9, 13], [9, 23]]]]], [], []], "saveCalendar", "saveCalendar", "cancel", "cancel", "createSubscription", "createSubscription", "model", ["subexpr", "@mut", [["get", "model", ["loc", [null, [13, 14], [13, 19]]]]], [], []], "canManageExCalendars", ["subexpr", "@mut", [["get", "model.canManageExCalendars", ["loc", [null, [14, 31], [14, 57]]]]], [], []]], 0, null, ["loc", [null, [8, 4], [15, 24]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/calendar/edit", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 8
            },
            "end": {
              "line": 24,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/calendar/edit.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 26,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/calendar/edit.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "edit-calendar-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.editCalendar", ["loc", [null, [3, 8], [3, 35]]]], ["block", "manage-calendar", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [6, 17], [6, 27]]]]], [], []], "updateCalendar", "updateCalendar", "cancel", "cancel", "retrieveLatestFeed", "retrieveLatestFeed", "calendar", ["subexpr", "@mut", [["get", "model.calendar", ["loc", [null, [10, 21], [10, 35]]]]], [], []], "deleteCalendar", "deleteCalendar", "name", ["subexpr", "@mut", [["get", "model.calendar.name", ["loc", [null, [12, 17], [12, 36]]]]], [], []], "description", ["subexpr", "@mut", [["get", "model.calendar.description", ["loc", [null, [13, 24], [13, 50]]]]], [], []], "isDefault", ["subexpr", "@mut", [["get", "model.calendar.isDefault", ["loc", [null, [14, 22], [14, 46]]]]], [], []], "availableAsICalendarFeed", ["subexpr", "@mut", [["get", "model.calendar.availableAsICalendarFeed", ["loc", [null, [15, 37], [15, 76]]]]], [], []], "isiCalendarFeed", ["subexpr", "@mut", [["get", "model.calendar.isiCalendarFeed", ["loc", [null, [16, 28], [16, 58]]]]], [], []], "importCalendarUrl", ["subexpr", "@mut", [["get", "model.calendar.importCalendarUrl", ["loc", [null, [17, 30], [17, 62]]]]], [], []], "lastFeedRetrieval", ["subexpr", "@mut", [["get", "model.calendar.lastFeedRetrieval", ["loc", [null, [18, 30], [18, 62]]]]], [], []], "isEdit", true, "model", ["subexpr", "@mut", [["get", "model", ["loc", [null, [20, 18], [20, 23]]]]], [], []], "canManageExCalendars", ["subexpr", "@mut", [["get", "model.canManageExCalendars", ["loc", [null, [21, 35], [21, 61]]]]], [], []], "isExiEventsCalendar", ["subexpr", "@mut", [["get", "model.calendar.isExiEventsCalendar", ["loc", [null, [22, 34], [22, 68]]]]], [], []], "externalCalendarName", ["subexpr", "@mut", [["get", "model.calendar.externalCalendarName", ["loc", [null, [23, 35], [23, 70]]]]], [], []]], 0, null, ["loc", [null, [5, 8], [24, 28]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/date-range", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 8,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/date-range.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "date-range-container");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("i");
        dom.setAttribute(el2, "class", "glyphicon glyphicon-calendar date-range");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("button");
        dom.setAttribute(el2, "type", "button");
        dom.setAttribute(el2, "class", "ember-action-link");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("span");
        dom.setAttribute(el3, "class", "screenReaderText");
        var el4 = dom.createTextNode("date picker activation button");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("label");
        dom.setAttribute(el3, "class", "screenReaderText");
        dom.setAttribute(el3, "for", "dateRangeDatePicker");
        var el4 = dom.createTextNode("date range date picker");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("input");
        dom.setAttribute(el3, "type", "text");
        dom.setAttribute(el3, "disabled", "disabled");
        dom.setAttribute(el3, "style", "height: 0px; width:0px; border: 0px;");
        dom.setAttribute(el3, "id", "dateRangeDatePicker");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    \n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(dom.childAt(fragment, [0, 3]), 0, 0);
        return morphs;
      },
      statements: [["content", "text.dateRange", ["loc", [null, [3, 52], [3, 70]]]]],
      locals: [],
      templates: []
    };
  })());
});
define("calendar/templates/components/delete-calendar-button", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 0
            },
            "end": {
              "line": 12,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/delete-calendar-button.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "delete");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "float-right");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [0]);
          var element1 = dom.childAt(element0, [3, 1]);
          var element2 = dom.childAt(fragment, [2, 1]);
          var morphs = new Array(5);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createElementMorph(element1);
          morphs[2] = dom.createMorphAt(element1, 0, 0);
          morphs[3] = dom.createElementMorph(element2);
          morphs[4] = dom.createMorphAt(element2, 0, 0);
          return morphs;
        },
        statements: [["content", "text.deletecalendarConfirmation", ["loc", [null, [4, 7], [4, 42]]]], ["element", "action", ["deleteCalendar", ["get", "calendar", ["loc", [null, [6, 42], [6, 50]]]]], [], ["loc", [null, [6, 16], [6, 52]]]], ["content", "text.confirmDelete", ["loc", [null, [6, 68], [6, 90]]]], ["element", "action", ["cancelDelete"], [], ["loc", [null, [10, 12], [10, 38]]]], ["content", "text.cancel", ["loc", [null, [10, 65], [10, 80]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 12,
            "column": 17
          }
        },
        "moduleName": "calendar/templates/components/delete-calendar-button.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("button");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element3 = dom.childAt(fragment, [0]);
        var morphs = new Array(4);
        morphs[0] = dom.createAttrMorph(element3, 'class');
        morphs[1] = dom.createElementMorph(element3);
        morphs[2] = dom.createMorphAt(element3, 0, 0);
        morphs[3] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["attribute", "class", ["subexpr", "if", [["get", "link", ["loc", [null, [1, 46], [1, 50]]]], "ember-action-link", "delete float-right"], [], ["loc", [null, [1, 41], [1, 93]]]]], ["element", "action", ["confirmDelete"], [], ["loc", [null, [1, 8], [1, 34]]]], ["inline", "if", [["get", "buttonText", ["loc", [null, [1, 99], [1, 109]]]], ["get", "buttonText", ["loc", [null, [1, 110], [1, 120]]]], ["get", "text.delete", ["loc", [null, [1, 121], [1, 132]]]]], [], ["loc", [null, [1, 94], [1, 134]]]], ["block", "simple-modal", [], ["enabled", false, "id", "confirm-delete-calendar-modal", "title", ["subexpr", "@mut", [["get", "titleText", ["loc", [null, [2, 71], [2, 80]]]]], [], []]], 0, null, ["loc", [null, [2, 0], [12, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/delete-event-button", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 3,
              "column": 0
            },
            "end": {
              "line": 13,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/delete-event-button.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n                ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "delete");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "float-right");
          var el2 = dom.createTextNode("        \n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var element1 = dom.childAt(element0, [3, 1]);
          var element2 = dom.childAt(fragment, [3, 1]);
          var morphs = new Array(5);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createElementMorph(element1);
          morphs[2] = dom.createMorphAt(element1, 0, 0);
          morphs[3] = dom.createElementMorph(element2);
          morphs[4] = dom.createMorphAt(element2, 0, 0);
          return morphs;
        },
        statements: [["content", "deleteConfirmText", ["loc", [null, [5, 11], [5, 32]]]], ["element", "action", ["deleteEvent", ["get", "event", ["loc", [null, [7, 47], [7, 52]]]]], [], ["loc", [null, [7, 24], [7, 54]]]], ["content", "text.confirmDelete", ["loc", [null, [7, 70], [7, 92]]]], ["element", "action", ["cancelDelete"], [], ["loc", [null, [11, 16], [11, 42]]]], ["content", "text.cancel", ["loc", [null, [11, 69], [11, 84]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 13,
            "column": 17
          }
        },
        "moduleName": "calendar/templates/components/delete-event-button.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("button");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element3 = dom.childAt(fragment, [0]);
        var morphs = new Array(4);
        morphs[0] = dom.createAttrMorph(element3, 'class');
        morphs[1] = dom.createElementMorph(element3);
        morphs[2] = dom.createMorphAt(element3, 0, 0);
        morphs[3] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["attribute", "class", ["subexpr", "if", [["get", "link", ["loc", [null, [1, 46], [1, 50]]]], "ember-action-link", "delete float-right"], [], ["loc", [null, [1, 41], [1, 93]]]]], ["element", "action", ["confirmDelete"], [], ["loc", [null, [1, 8], [1, 34]]]], ["inline", "if", [["get", "buttonText", ["loc", [null, [1, 99], [1, 109]]]], ["get", "buttonText", ["loc", [null, [1, 110], [1, 120]]]], ["get", "text.delete", ["loc", [null, [1, 121], [1, 132]]]]], [], ["loc", [null, [1, 94], [1, 134]]]], ["block", "simple-modal", [], ["enabled", false, "id", "confirm-delete-event-modal", "title", ["subexpr", "@mut", [["get", "titleText", ["loc", [null, [3, 68], [3, 77]]]]], [], []]], 0, null, ["loc", [null, [3, 0], [13, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/delete-recurring-event-button", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 0
            },
            "end": {
              "line": 19,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/delete-recurring-event-button.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "delete");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "delete");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "float-right");
          var el2 = dom.createTextNode("    \n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var element1 = dom.childAt(element0, [3, 1]);
          var element2 = dom.childAt(fragment, [3]);
          var element3 = dom.childAt(element2, [3, 1]);
          var element4 = dom.childAt(fragment, [5, 1]);
          var morphs = new Array(8);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createElementMorph(element1);
          morphs[2] = dom.createMorphAt(element1, 0, 0);
          morphs[3] = dom.createMorphAt(dom.childAt(element2, [1]), 0, 0);
          morphs[4] = dom.createElementMorph(element3);
          morphs[5] = dom.createMorphAt(element3, 0, 0);
          morphs[6] = dom.createElementMorph(element4);
          morphs[7] = dom.createMorphAt(element4, 0, 0);
          return morphs;
        },
        statements: [["content", "text.onlyDeleteEventMessage", ["loc", [null, [5, 7], [5, 38]]]], ["element", "action", ["deleteEvent", ["get", "event", ["loc", [null, [7, 39], [7, 44]]]]], [], ["loc", [null, [7, 16], [7, 46]]]], ["content", "text.deleteEvent", ["loc", [null, [7, 62], [7, 82]]]], ["content", "text.deleteSeriesMessage", ["loc", [null, [11, 7], [11, 35]]]], ["element", "action", ["deleteRecurringEvent", ["get", "event.parentRecurringEventId", ["loc", [null, [13, 48], [13, 76]]]]], [], ["loc", [null, [13, 16], [13, 78]]]], ["content", "text.deleteSeries", ["loc", [null, [13, 94], [13, 115]]]], ["element", "action", ["cancelDelete"], [], ["loc", [null, [17, 12], [17, 38]]]], ["content", "text.cancel", ["loc", [null, [17, 65], [17, 80]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 19,
            "column": 17
          }
        },
        "moduleName": "calendar/templates/components/delete-recurring-event-button.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("button");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element5 = dom.childAt(fragment, [0]);
        var morphs = new Array(4);
        morphs[0] = dom.createAttrMorph(element5, 'class');
        morphs[1] = dom.createElementMorph(element5);
        morphs[2] = dom.createMorphAt(element5, 0, 0);
        morphs[3] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["attribute", "class", ["subexpr", "if", [["get", "link", ["loc", [null, [1, 46], [1, 50]]]], "ember-action-link", "delete float-right"], [], ["loc", [null, [1, 41], [1, 93]]]]], ["element", "action", ["confirmDelete"], [], ["loc", [null, [1, 8], [1, 34]]]], ["inline", "if", [["get", "buttonText", ["loc", [null, [1, 99], [1, 109]]]], ["get", "buttonText", ["loc", [null, [1, 110], [1, 120]]]], ["get", "text.delete", ["loc", [null, [1, 121], [1, 132]]]]], [], ["loc", [null, [1, 94], [1, 134]]]], ["block", "simple-modal", [], ["enabled", false, "id", "confirm-delete-event-modal", "title", ["subexpr", "@mut", [["get", "titleText", ["loc", [null, [2, 68], [2, 77]]]]], [], []], "onCloseModal", "hideParentModal"], 0, null, ["loc", [null, [2, 0], [19, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/edit-recurring-event", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "missing-wrapper",
            "problems": ["multiple-nodes"]
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 23,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/edit-recurring-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "save");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "simple-modal-section");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "centered simple-modal-button");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "class", "save");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "float-right");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var element1 = dom.childAt(element0, [3, 1]);
          var element2 = dom.childAt(fragment, [3]);
          var element3 = dom.childAt(element2, [3, 1]);
          var element4 = dom.childAt(fragment, [5, 1]);
          var morphs = new Array(8);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createElementMorph(element1);
          morphs[2] = dom.createMorphAt(element1, 1, 1);
          morphs[3] = dom.createMorphAt(dom.childAt(element2, [1]), 0, 0);
          morphs[4] = dom.createElementMorph(element3);
          morphs[5] = dom.createMorphAt(element3, 1, 1);
          morphs[6] = dom.createElementMorph(element4);
          morphs[7] = dom.createMorphAt(element4, 1, 1);
          return morphs;
        },
        statements: [["content", "text.allOtherEventsRemainUnchanged", ["loc", [null, [3, 11], [3, 49]]]], ["element", "action", ["editOccurence"], [], ["loc", [null, [5, 33], [5, 59]]]], ["content", "text.thisEventOnly", ["loc", [null, [6, 16], [6, 38]]]], ["content", "text.futureEventsWillBeChanged", ["loc", [null, [11, 11], [11, 45]]]], ["element", "action", ["editSeries"], [], ["loc", [null, [13, 33], [13, 56]]]], ["content", "text.futureEvents", ["loc", [null, [14, 16], [14, 37]]]], ["element", "action", ["toggleEditRecurringEventModal"], [], ["loc", [null, [19, 42], [19, 84]]]], ["content", "text.cancel", ["loc", [null, [20, 12], [20, 27]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 23,
            "column": 17
          }
        },
        "moduleName": "calendar/templates/components/edit-recurring-event.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["block", "simple-modal", [], ["enabled", false, "id", "edit-recurring-event-modal", "title", ["subexpr", "@mut", [["get", "text.eventPartOfSeries", ["loc", [null, [1, 68], [1, 90]]]]], [], []], "onCloseModal", "onCloseModal"], 0, null, ["loc", [null, [1, 0], [23, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/event-info", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 7,
              "column": 33
            },
            "end": {
              "line": 7,
              "column": 63
            }
          },
          "moduleName": "calendar/templates/components/event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createUnsafeMorphAt(fragment, 0, 0, contextualElement);
          dom.insertBoundary(fragment, 0);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["content", "location", ["loc", [null, [7, 49], [7, 63]]]]],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      var child0 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 13,
                  "column": 16
                },
                "end": {
                  "line": 22,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/event-info.hbs"
            },
            isEmpty: true,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              return el0;
            },
            buildRenderNodes: function buildRenderNodes() {
              return [];
            },
            statements: [],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 12,
                "column": 12
              },
              "end": {
                "line": 23,
                "column": 12
              }
            },
            "moduleName": "calendar/templates/components/event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "delete-recurring-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [14, 25], [14, 29]]]]], [], []], "startDate", ["subexpr", "@mut", [["get", "startDate", ["loc", [null, [15, 30], [15, 39]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.thisEventIsRecurring", ["loc", [null, [16, 30], [16, 55]]]]], [], []], "event", ["subexpr", "@mut", [["get", "event", ["loc", [null, [17, 26], [17, 31]]]]], [], []], "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "cancelDelete", "hideEventInfo"], 0, null, ["loc", [null, [13, 16], [22, 50]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      var child1 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 24,
                  "column": 16
                },
                "end": {
                  "line": 32,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/event-info.hbs"
            },
            isEmpty: true,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              return el0;
            },
            buildRenderNodes: function buildRenderNodes() {
              return [];
            },
            statements: [],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 23,
                "column": 12
              },
              "end": {
                "line": 33,
                "column": 12
              }
            },
            "moduleName": "calendar/templates/components/event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "delete-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [25, 25], [25, 29]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.deleteThisEvent", ["loc", [null, [26, 30], [26, 50]]]]], [], []], "deleteConfirmText", ["subexpr", "@mut", [["get", "text.sureYouWantToDelete", ["loc", [null, [27, 38], [27, 62]]]]], [], []], "event", ["subexpr", "@mut", [["get", "event", ["loc", [null, [28, 26], [28, 31]]]]], [], []], "deleteEvent", "deleteEvent", "cancelDelete", "hideEventInfo"], 0, null, ["loc", [null, [24, 16], [32, 40]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 11,
              "column": 8
            },
            "end": {
              "line": 37,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/components/event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "class", "ember-action-link");
          dom.setAttribute(el1, "id", "editEventButton");
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [2]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
          morphs[1] = dom.createElementMorph(element1);
          morphs[2] = dom.createMorphAt(element1, 1, 1);
          dom.insertBoundary(fragment, 0);
          return morphs;
        },
        statements: [["block", "if", [["get", "event.eventRepeats", ["loc", [null, [12, 18], [12, 36]]]]], [], 0, 1, ["loc", [null, [12, 12], [33, 19]]]], ["element", "action", ["editEvent"], [], ["loc", [null, [34, 20], [34, 43]]]], ["content", "text.editEvent", ["loc", [null, [35, 16], [35, 34]]]]],
        locals: [],
        templates: [child0, child1]
      };
    })();
    var child2 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 41,
                "column": 16
              },
              "end": {
                "line": 43,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            return morphs;
          },
          statements: [["content", "text.moreDetails", ["loc", [null, [42, 20], [42, 40]]]]],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 37,
              "column": 8
            },
            "end": {
              "line": 44,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/components/event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "class", "ember-action-link close-info float-right");
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var morphs = new Array(3);
          morphs[0] = dom.createElementMorph(element0);
          morphs[1] = dom.createMorphAt(element0, 1, 1);
          morphs[2] = dom.createMorphAt(fragment, 3, 3, contextualElement);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["element", "action", ["hideEventInfo"], [], ["loc", [null, [38, 20], [38, 46]]]], ["content", "text.close", ["loc", [null, [39, 16], [39, 30]]]], ["block", "link-to", [["get", "event.viewRoute", ["loc", [null, [41, 27], [41, 42]]]], ["get", "event.id", ["loc", [null, [41, 43], [41, 51]]]], ["subexpr", "query-params", [], ["eventSource", ["get", "event.eventSource", ["loc", [null, [41, 78], [41, 95]]]], "eventType", ["get", "event.eventType", ["loc", [null, [41, 106], [41, 121]]]]], ["loc", [null, [41, 52], [41, 122]]]]], [], 0, null, ["loc", [null, [41, 16], [43, 29]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 50,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/event-info.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "eventInfo-content");
        dom.setAttribute(el1, "class", "hiddenPopup eventInfo-content");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("span");
        dom.setAttribute(el2, "class", "title truncateLarge");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "content");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("p");
        dom.setAttribute(el3, "class", "truncateLarge");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("p");
        dom.setAttribute(el3, "class", "truncateLarge");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("p");
        dom.setAttribute(el3, "class", "truncateLarge description wysiwygtext");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "footer");
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "eventInfo-placeholder");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element2 = dom.childAt(fragment, [0]);
        var element3 = dom.childAt(element2, [3]);
        var morphs = new Array(5);
        morphs[0] = dom.createMorphAt(dom.childAt(element2, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(dom.childAt(element3, [1]), 0, 0);
        morphs[2] = dom.createMorphAt(dom.childAt(element3, [3]), 0, 0);
        morphs[3] = dom.createUnsafeMorphAt(dom.childAt(element3, [5]), 0, 0);
        morphs[4] = dom.createMorphAt(dom.childAt(element2, [5]), 1, 1);
        return morphs;
      },
      statements: [["content", "title", ["loc", [null, [3, 8], [3, 17]]]], ["content", "time", ["loc", [null, [6, 33], [6, 41]]]], ["block", "if", [["get", "location", ["loc", [null, [7, 39], [7, 47]]]]], [], 0, null, ["loc", [null, [7, 33], [7, 70]]]], ["content", "description", ["loc", [null, [8, 57], [8, 74]]]], ["block", "if", [["get", "canAdminEvents", ["loc", [null, [11, 14], [11, 28]]]]], [], 1, 2, ["loc", [null, [11, 8], [44, 15]]]]],
      locals: [],
      templates: [child0, child1, child2]
    };
  })());
});
define("calendar/templates/components/exi-event-info", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 6
            },
            "end": {
              "line": 7,
              "column": 6
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("      ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "exiEvent.details.promotionalName", ["loc", [null, [6, 6], [6, 42]]]]],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 7,
              "column": 6
            },
            "end": {
              "line": 9,
              "column": 6
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("      ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "exiEvent.title", ["loc", [null, [8, 6], [8, 24]]]]],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 13,
              "column": 4
            },
            "end": {
              "line": 15,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("a");
          dom.setAttribute(el1, "id", "Register");
          dom.setAttribute(el1, "target", "_blank");
          dom.setAttribute(el1, "class", "register");
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element13 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createAttrMorph(element13, 'href');
          morphs[1] = dom.createMorphAt(element13, 0, 0);
          return morphs;
        },
        statements: [["attribute", "href", ["concat", [["get", "exiEvent.details.registrationUrl", ["loc", [null, [14, 63], [14, 95]]]]]]], ["content", "text.register", ["loc", [null, [14, 99], [14, 116]]]]],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 24,
              "column": 2
            },
            "end": {
              "line": 29,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "PromotionalSummary");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element12 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element12, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element12, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.summary", ["loc", [null, [26, 27], [26, 43]]]], ["content", "exiEvent.details.promotionalSummary", ["loc", [null, [27, 9], [27, 48]]]]],
        locals: [],
        templates: []
      };
    })();
    var child4 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 32,
              "column": 2
            },
            "end": {
              "line": 37,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "PromotionalDescription");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element11 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element11, [1]), 0, 0);
          morphs[1] = dom.createUnsafeMorphAt(dom.childAt(element11, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.description", ["loc", [null, [34, 27], [34, 47]]]], ["content", "exiEvent.details.promotionalDescription", ["loc", [null, [35, 9], [35, 54]]]]],
        locals: [],
        templates: []
      };
    })();
    var child5 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 40,
              "column": 2
            },
            "end": {
              "line": 45,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "WhoCanAttend");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element10 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element10, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element10, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.whoCanAttend", ["loc", [null, [42, 27], [42, 48]]]], ["content", "exiEvent.details.eventVisibilityDisplayName", ["loc", [null, [43, 9], [43, 56]]]]],
        locals: [],
        templates: []
      };
    })();
    var child6 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 48,
              "column": 2
            },
            "end": {
              "line": 53,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "When");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element9 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element9, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element9, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.when", ["loc", [null, [50, 27], [50, 40]]]], ["content", "timeslotFormatted", ["loc", [null, [51, 9], [51, 30]]]]],
        locals: [],
        templates: []
      };
    })();
    var child7 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 60,
                "column": 4
              },
              "end": {
                "line": 62,
                "column": 4
              }
            },
            "moduleName": "calendar/templates/components/exi-event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
            return morphs;
          },
          statements: [["content", "facility", ["loc", [null, [61, 9], [61, 21]]]]],
          locals: [],
          templates: []
        };
      })();
      var child1 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 64,
                "column": 4
              },
              "end": {
                "line": 66,
                "column": 4
              }
            },
            "moduleName": "calendar/templates/components/exi-event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            dom.setAttribute(el1, "class", "exi-campus-address");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
            return morphs;
          },
          statements: [["content", "campusAndAddress911", ["loc", [null, [65, 36], [65, 59]]]]],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 56,
              "column": 2
            },
            "end": {
              "line": 68,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "Where");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("Facility");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("Campus and Address");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element8 = dom.childAt(fragment, [1]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(dom.childAt(element8, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(element8, 5, 5);
          morphs[2] = dom.createMorphAt(element8, 9, 9);
          return morphs;
        },
        statements: [["content", "text.where", ["loc", [null, [58, 27], [58, 41]]]], ["block", "if", [["get", "facility", ["loc", [null, [60, 10], [60, 18]]]]], [], 0, null, ["loc", [null, [60, 4], [62, 11]]]], ["block", "if", [["get", "campusAndAddress911", ["loc", [null, [64, 10], [64, 29]]]]], [], 1, null, ["loc", [null, [64, 4], [66, 11]]]]],
        locals: [],
        templates: [child0, child1]
      };
    })();
    var child8 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 71,
              "column": 2
            },
            "end": {
              "line": 77,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "PerPersonFee");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element7 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element7, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element7, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.cost", ["loc", [null, [73, 27], [73, 40]]]], ["content", "perPersonFeeFormatted", ["loc", [null, [74, 9], [74, 34]]]]],
        locals: [],
        templates: []
      };
    })();
    var child9 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 80,
              "column": 2
            },
            "end": {
              "line": 85,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "RegistrationRequirements");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element6 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element6, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element6, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.registrationRequirements", ["loc", [null, [82, 27], [82, 60]]]], ["content", "exiEvent.details.eventRegisterStatusDisplayName", ["loc", [null, [83, 9], [83, 60]]]]],
        locals: [],
        templates: []
      };
    })();
    var child10 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 96,
                "column": 6
              },
              "end": {
                "line": 98,
                "column": 6
              }
            },
            "moduleName": "calendar/templates/components/exi-event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("      ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
            return morphs;
          },
          statements: [["content", "exiEvent.details.promotionalContactName", ["loc", [null, [97, 11], [97, 54]]]]],
          locals: [],
          templates: []
        };
      })();
      var child1 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 100,
                "column": 6
              },
              "end": {
                "line": 103,
                "column": 6
              }
            },
            "moduleName": "calendar/templates/components/exi-event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("      ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            var el2 = dom.createTextNode("\n        ");
            dom.appendChild(el1, el2);
            var el2 = dom.createElement("a");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element2 = dom.childAt(fragment, [1]);
            var element3 = dom.childAt(element2, [1]);
            var morphs = new Array(2);
            morphs[0] = dom.createAttrMorph(element3, 'href');
            morphs[1] = dom.createMorphAt(element2, 2, 2);
            return morphs;
          },
          statements: [["attribute", "href", ["concat", ["tel:", ["get", "exiEvent.details.promotionalContactPhone", ["loc", [null, [102, 23], [102, 63]]]]]]], ["content", "exiEvent.details.promotionalContactPhone", ["loc", [null, [102, 71], [102, 115]]]]],
          locals: [],
          templates: []
        };
      })();
      var child2 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 105,
                "column": 6
              },
              "end": {
                "line": 107,
                "column": 6
              }
            },
            "moduleName": "calendar/templates/components/exi-event-info.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("      ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            var el2 = dom.createElement("a");
            var el3 = dom.createComment("");
            dom.appendChild(el2, el3);
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element1 = dom.childAt(fragment, [1, 0]);
            var morphs = new Array(2);
            morphs[0] = dom.createAttrMorph(element1, 'href');
            morphs[1] = dom.createMorphAt(element1, 0, 0);
            return morphs;
          },
          statements: [["attribute", "href", ["concat", ["mailto:", ["get", "exiEvent.details.promotionalContactEmail", ["loc", [null, [106, 29], [106, 69]]]]]]], ["content", "exiEvent.details.promotionalContactEmail", ["loc", [null, [106, 73], [106, 117]]]]],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 88,
              "column": 2
            },
            "end": {
              "line": 110,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "Questions");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createTextNode("\n\n      ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("Implement contact dropdown button in JICS 9");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n\n      ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("Name");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("      ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("Phone");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("      ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("Email");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element4 = dom.childAt(fragment, [1]);
          var element5 = dom.childAt(element4, [3]);
          var morphs = new Array(4);
          morphs[0] = dom.createMorphAt(dom.childAt(element4, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(element5, 5, 5);
          morphs[2] = dom.createMorphAt(element5, 9, 9);
          morphs[3] = dom.createMorphAt(element5, 13, 13);
          return morphs;
        },
        statements: [["content", "text.questions?", ["loc", [null, [90, 27], [90, 46]]]], ["block", "if", [["get", "exiEvent.details.promotionalContactName", ["loc", [null, [96, 12], [96, 51]]]]], [], 0, null, ["loc", [null, [96, 6], [98, 13]]]], ["block", "if", [["get", "exiEvent.details.promotionalContactPhone", ["loc", [null, [100, 12], [100, 52]]]]], [], 1, null, ["loc", [null, [100, 6], [103, 13]]]], ["block", "if", [["get", "exiEvent.details.promotionalContactEmail", ["loc", [null, [105, 12], [105, 52]]]]], [], 2, null, ["loc", [null, [105, 6], [107, 13]]]]],
        locals: [],
        templates: [child0, child1, child2]
      };
    })();
    var child11 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 113,
              "column": 2
            },
            "end": {
              "line": 118,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/components/exi-event-info.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("  ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "id", "WeatherContingency");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "text-bold");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n  ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element0, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.weatherContingency", ["loc", [null, [115, 27], [115, 54]]]], ["content", "exiEvent.details.contingencyDetails", ["loc", [null, [116, 9], [116, 48]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 120,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/exi-event-info.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "exi-events-Details-container");
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Title");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "id", "TitleBar");
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("span");
        dom.setAttribute(el3, "id", "PromotionalTitle");
        dom.setAttribute(el3, "class", "exi-event-title");
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("    ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n\n    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("Register button");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("Back to Calendar button");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("a");
        dom.setAttribute(el3, "id", "BackToCalendar");
        dom.setAttribute(el3, "href", "#");
        dom.setAttribute(el3, "class", "back-to-calendar");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("Registration Message");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "id", "RegistrationMessage");
        dom.setAttribute(el3, "class", "text-danger");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n  ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n   ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("br");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Promotional Summary");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Promotional Description");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Audience");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("When");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Where");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Cost");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Registration requirements");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Questions");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n  ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("Weather Contingency");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element14 = dom.childAt(fragment, [0]);
        var element15 = dom.childAt(element14, [3]);
        var element16 = dom.childAt(element15, [9]);
        var morphs = new Array(14);
        morphs[0] = dom.createMorphAt(dom.childAt(element15, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element15, 5, 5);
        morphs[2] = dom.createElementMorph(element16);
        morphs[3] = dom.createMorphAt(element16, 0, 0);
        morphs[4] = dom.createMorphAt(dom.childAt(element15, [13]), 0, 0);
        morphs[5] = dom.createMorphAt(element14, 9, 9);
        morphs[6] = dom.createMorphAt(element14, 13, 13);
        morphs[7] = dom.createMorphAt(element14, 17, 17);
        morphs[8] = dom.createMorphAt(element14, 21, 21);
        morphs[9] = dom.createMorphAt(element14, 25, 25);
        morphs[10] = dom.createMorphAt(element14, 29, 29);
        morphs[11] = dom.createMorphAt(element14, 33, 33);
        morphs[12] = dom.createMorphAt(element14, 37, 37);
        morphs[13] = dom.createMorphAt(element14, 41, 41);
        return morphs;
      },
      statements: [["block", "if", [["get", "exiEvent.details.promotionalName", ["loc", [null, [5, 12], [5, 44]]]]], [], 0, 1, ["loc", [null, [5, 6], [9, 13]]]], ["block", "if", [["get", "showRegisterButton", ["loc", [null, [13, 10], [13, 28]]]]], [], 2, null, ["loc", [null, [13, 4], [15, 11]]]], ["element", "action", ["goBack"], [], ["loc", [null, [17, 61], [17, 81]]]], ["content", "text.backToCalendar", ["loc", [null, [17, 82], [17, 105]]]], ["content", "registrationMessage", ["loc", [null, [19, 54], [19, 77]]]], ["block", "if", [["get", "exiEvent.details.promotionalSummary", ["loc", [null, [24, 8], [24, 43]]]]], [], 3, null, ["loc", [null, [24, 2], [29, 9]]]], ["block", "if", [["get", "exiEvent.details.promotionalDescription", ["loc", [null, [32, 8], [32, 47]]]]], [], 4, null, ["loc", [null, [32, 2], [37, 9]]]], ["block", "if", [["get", "exiEvent.details.eventVisibilityDisplayName", ["loc", [null, [40, 8], [40, 51]]]]], [], 5, null, ["loc", [null, [40, 2], [45, 9]]]], ["block", "if", [["get", "exiEvent.timeslot", ["loc", [null, [48, 8], [48, 25]]]]], [], 6, null, ["loc", [null, [48, 2], [53, 9]]]], ["block", "if", [["get", "exiEvent.relatedFacility", ["loc", [null, [56, 8], [56, 32]]]]], [], 7, null, ["loc", [null, [56, 2], [68, 9]]]], ["block", "if", [["get", "exiEvent.details.perPersonFee", ["loc", [null, [71, 8], [71, 37]]]]], [], 8, null, ["loc", [null, [71, 2], [77, 9]]]], ["block", "if", [["get", "exiEvent.details.eventRegisterStatusDisplayName", ["loc", [null, [80, 8], [80, 55]]]]], [], 9, null, ["loc", [null, [80, 2], [85, 9]]]], ["block", "if", [["get", "isContactInfo", ["loc", [null, [88, 8], [88, 21]]]]], [], 10, null, ["loc", [null, [88, 2], [110, 9]]]], ["block", "if", [["get", "exiEvent.details.contingencyDetails", ["loc", [null, [113, 8], [113, 43]]]]], [], 11, null, ["loc", [null, [113, 2], [118, 9]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4, child5, child6, child7, child8, child9, child10, child11]
    };
  })());
});
define("calendar/templates/components/full-calendar-list-view", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 5,
                "column": 16
              },
              "end": {
                "line": 7,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("button");
            dom.setAttribute(el1, "class", "ember-action-link");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element2 = dom.childAt(fragment, [1]);
            var morphs = new Array(2);
            morphs[0] = dom.createElementMorph(element2);
            morphs[1] = dom.createMorphAt(element2, 0, 0);
            return morphs;
          },
          statements: [["element", "action", ["changeDate", ["get", "event.listDate", ["loc", [null, [6, 50], [6, 64]]]]], [], ["loc", [null, [6, 28], [6, 66]]]], ["content", "event.displayDate", ["loc", [null, [6, 93], [6, 114]]]]],
          locals: [],
          templates: []
        };
      })();
      var child1 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 10,
                "column": 16
              },
              "end": {
                "line": 12,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            return morphs;
          },
          statements: [["content", "text.allDay", ["loc", [null, [11, 20], [11, 35]]]]],
          locals: [],
          templates: []
        };
      })();
      var child2 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 12,
                "column": 16
              },
              "end": {
                "line": 14,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            return morphs;
          },
          statements: [["content", "event.displayHours", ["loc", [null, [13, 20], [13, 42]]]]],
          locals: [],
          templates: []
        };
      })();
      var child3 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 17,
                "column": 16
              },
              "end": {
                "line": 23,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("span");
            dom.setAttribute(el1, "class", "truncateSmall");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n                ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("span");
            dom.setAttribute(el1, "class", "truncateSmall");
            var el2 = dom.createTextNode("    \n                    ");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                    ");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                ");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element1 = dom.childAt(fragment, [3]);
            var morphs = new Array(3);
            morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
            morphs[1] = dom.createMorphAt(element1, 1, 1);
            morphs[2] = dom.createMorphAt(element1, 3, 3);
            return morphs;
          },
          statements: [["content", "event.title", ["loc", [null, [18, 44], [18, 59]]]], ["content", "text.eventAt", ["loc", [null, [20, 20], [20, 36]]]], ["content", "event.location", ["loc", [null, [21, 20], [21, 38]]]]],
          locals: [],
          templates: []
        };
      })();
      var child4 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 23,
                "column": 16
              },
              "end": {
                "line": 25,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("span");
            dom.setAttribute(el1, "class", "truncateMedium");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
            return morphs;
          },
          statements: [["content", "event.title", ["loc", [null, [24, 45], [24, 60]]]]],
          locals: [],
          templates: []
        };
      })();
      var child5 = (function () {
        var child0 = (function () {
          var child0 = (function () {
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 30,
                    "column": 20
                  },
                  "end": {
                    "line": 39,
                    "column": 20
                  }
                },
                "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
              },
              isEmpty: true,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                return el0;
              },
              buildRenderNodes: function buildRenderNodes() {
                return [];
              },
              statements: [],
              locals: [],
              templates: []
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 29,
                  "column": 16
                },
                "end": {
                  "line": 40,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
              dom.insertBoundary(fragment, 0);
              dom.insertBoundary(fragment, null);
              return morphs;
            },
            statements: [["block", "delete-recurring-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [31, 29], [31, 33]]]]], [], []], "buttonText", ["subexpr", "@mut", [["get", "text.deleteEvent", ["loc", [null, [32, 35], [32, 51]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.thisEventIsRecurring", ["loc", [null, [33, 34], [33, 59]]]]], [], []], "event", ["subexpr", "@mut", [["get", "event", ["loc", [null, [34, 30], [34, 35]]]]], [], []], "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "link", true], 0, null, ["loc", [null, [30, 20], [39, 54]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        var child1 = (function () {
          var child0 = (function () {
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 41,
                    "column": 20
                  },
                  "end": {
                    "line": 50,
                    "column": 20
                  }
                },
                "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
              },
              isEmpty: true,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                return el0;
              },
              buildRenderNodes: function buildRenderNodes() {
                return [];
              },
              statements: [],
              locals: [],
              templates: []
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 40,
                  "column": 16
                },
                "end": {
                  "line": 51,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
              dom.insertBoundary(fragment, 0);
              dom.insertBoundary(fragment, null);
              return morphs;
            },
            statements: [["block", "delete-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [42, 29], [42, 33]]]]], [], []], "buttonText", ["subexpr", "@mut", [["get", "text.deleteEvent", ["loc", [null, [43, 35], [43, 51]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.deleteThisEvent", ["loc", [null, [44, 34], [44, 54]]]]], [], []], "deleteConfirmText", ["subexpr", "@mut", [["get", "text.sureYouWantToDelete", ["loc", [null, [45, 42], [45, 66]]]]], [], []], "event", ["subexpr", "@mut", [["get", "event", ["loc", [null, [46, 30], [46, 35]]]]], [], []], "deleteEvent", "deleteEvent", "link", true], 0, null, ["loc", [null, [41, 20], [50, 44]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 26,
                "column": 16
              },
              "end": {
                "line": 53,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("button");
            dom.setAttribute(el1, "class", "ember-action-link");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n                |\n");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("                \n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element0 = dom.childAt(fragment, [1]);
            var morphs = new Array(3);
            morphs[0] = dom.createElementMorph(element0);
            morphs[1] = dom.createMorphAt(element0, 0, 0);
            morphs[2] = dom.createMorphAt(fragment, 3, 3, contextualElement);
            return morphs;
          },
          statements: [["element", "action", ["editEvent", ["get", "event", ["loc", [null, [27, 45], [27, 50]]]]], [], ["loc", [null, [27, 24], [27, 52]]]], ["content", "text.editEvent", ["loc", [null, [27, 79], [27, 97]]]], ["block", "if", [["get", "event.eventRepeats", ["loc", [null, [29, 22], [29, 40]]]]], [], 0, 1, ["loc", [null, [29, 16], [51, 23]]]]],
          locals: [],
          templates: [child0, child1]
        };
      })();
      var child6 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 54,
                  "column": 16
                },
                "end": {
                  "line": 56,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createTextNode("                    ");
              dom.appendChild(el0, el1);
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              var el1 = dom.createTextNode("\n");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
              return morphs;
            },
            statements: [["content", "text.moreDetails", ["loc", [null, [55, 20], [55, 40]]]]],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 53,
                "column": 16
              },
              "end": {
                "line": 57,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "link-to", [["get", "event.viewRoute", ["loc", [null, [54, 27], [54, 42]]]], ["get", "event.id", ["loc", [null, [54, 43], [54, 51]]]], ["subexpr", "query-params", [], ["eventSource", ["get", "event.eventSource", ["loc", [null, [54, 78], [54, 95]]]], "eventType", ["get", "event.eventType", ["loc", [null, [54, 106], [54, 121]]]]], ["loc", [null, [54, 52], [54, 122]]]]], [], 0, null, ["loc", [null, [54, 16], [56, 29]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 4
            },
            "end": {
              "line": 60,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
        },
        isEmpty: false,
        arity: 1,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("        ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "date");
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("            ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "hours");
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("            ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "info");
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("            ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element3 = dom.childAt(fragment, [1]);
          var element4 = dom.childAt(element3, [5]);
          var morphs = new Array(5);
          morphs[0] = dom.createAttrMorph(element3, 'class');
          morphs[1] = dom.createMorphAt(dom.childAt(element3, [1]), 1, 1);
          morphs[2] = dom.createMorphAt(dom.childAt(element3, [3]), 1, 1);
          morphs[3] = dom.createMorphAt(element4, 1, 1);
          morphs[4] = dom.createMorphAt(element4, 2, 2);
          return morphs;
        },
        statements: [["attribute", "class", ["subexpr", "if", [["get", "event.isLast", ["loc", [null, [3, 24], [3, 36]]]], "last"], [], ["loc", [null, [3, 19], [3, 45]]]]], ["block", "if", [["get", "event.isFirst", ["loc", [null, [5, 22], [5, 35]]]]], [], 0, null, ["loc", [null, [5, 16], [7, 23]]]], ["block", "if", [["get", "event.allDay", ["loc", [null, [10, 22], [10, 34]]]]], [], 1, 2, ["loc", [null, [10, 16], [14, 23]]]], ["block", "if", [["get", "event.location", ["loc", [null, [17, 22], [17, 36]]]]], [], 3, 4, ["loc", [null, [17, 16], [25, 23]]]], ["block", "if", [["get", "event.canAdmin", ["loc", [null, [26, 22], [26, 36]]]]], [], 5, 6, ["loc", [null, [26, 16], [57, 23]]]]],
        locals: ["event"],
        templates: [child0, child1, child2, child3, child4, child5, child6]
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 61,
              "column": 4
            },
            "end": {
              "line": 63,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("        ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "text.noEvents", ["loc", [null, [62, 8], [62, 25]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 64,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/full-calendar-list-view.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "calendar-list-view");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element5 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(element5, 1, 1);
        morphs[1] = dom.createMorphAt(element5, 2, 2);
        return morphs;
      },
      statements: [["block", "each", [["get", "events", ["loc", [null, [2, 12], [2, 18]]]]], [], 0, null, ["loc", [null, [2, 4], [60, 13]]]], ["block", "if", [["get", "noEvents", ["loc", [null, [61, 10], [61, 18]]]]], [], 1, null, ["loc", [null, [61, 4], [63, 11]]]]],
      locals: [],
      templates: [child0, child1]
    };
  })());
});
define("calendar/templates/components/full-calendar", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "missing-wrapper",
            "problems": ["empty-body"]
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 9,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/full-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 11,
              "column": 0
            },
            "end": {
              "line": 20,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/full-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 21,
              "column": 0
            },
            "end": {
              "line": 29,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/full-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 31,
              "column": 0
            },
            "end": {
              "line": 37,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/full-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type", "multiple-nodes"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 37,
            "column": 25
          }
        },
        "moduleName": "calendar/templates/components/full-calendar.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "calendar");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(4);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        morphs[1] = dom.createMorphAt(fragment, 3, 3, contextualElement);
        morphs[2] = dom.createMorphAt(fragment, 4, 4, contextualElement);
        morphs[3] = dom.createMorphAt(fragment, 6, 6, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["block", "quick-add-event", [], ["id", "quickAddEvent", "addEvent", "addEvent", "defaultCalendar", ["subexpr", "@mut", [["get", "defaultCalendar", ["loc", [null, [4, 20], [4, 35]]]]], [], []], "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [5, 9], [5, 13]]]]], [], []], "settings", ["subexpr", "@mut", [["get", "settings", ["loc", [null, [6, 13], [6, 21]]]]], [], []], "quickAddEventToAdd", "quickAddEventToAdd"], 0, null, ["loc", [null, [1, 0], [9, 20]]]], ["block", "full-calendar-list-view", [], ["events", ["subexpr", "@mut", [["get", "listViewEvents", ["loc", [null, [12, 11], [12, 25]]]]], [], []], "noEvents", ["subexpr", "@mut", [["get", "listViewHasNoEvents", ["loc", [null, [13, 13], [13, 32]]]]], [], []], "deleteEvent", "deleteEvent", "deleteRecurringEvent", ["subexpr", "@mut", [["get", "deleteRecurringEvent", ["loc", [null, [15, 25], [15, 45]]]]], [], []], "editEvent", "editEvent", "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [17, 9], [17, 13]]]]], [], []], "settings", ["subexpr", "@mut", [["get", "settings", ["loc", [null, [18, 13], [18, 21]]]]], [], []]], 1, null, ["loc", [null, [11, 0], [20, 28]]]], ["block", "event-info", [], ["id", "eventInfo", "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "editEvent", "editEvent", "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [26, 9], [26, 13]]]]], [], []], "settings", ["subexpr", "@mut", [["get", "settings", ["loc", [null, [27, 13], [27, 21]]]]], [], []]], 2, null, ["loc", [null, [21, 0], [29, 15]]]], ["block", "edit-recurring-event", [], ["id", "edit-recurring-event", "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [33, 9], [33, 13]]]]], [], []], "editOccurence", "editOccurence", "editSeries", "editSeries"], 3, null, ["loc", [null, [31, 0], [37, 25]]]]],
      locals: [],
      templates: [child0, child1, child2, child3]
    };
  })());
});
define("calendar/templates/components/import-calendar-button", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 10,
                "column": 12
              },
              "end": {
                "line": 11,
                "column": 12
              }
            },
            "moduleName": "calendar/templates/components/import-calendar-button.hbs"
          },
          isEmpty: true,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            return el0;
          },
          buildRenderNodes: function buildRenderNodes() {
            return [];
          },
          statements: [],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 3,
              "column": 0
            },
            "end": {
              "line": 19,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/import-calendar-button.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "content");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("p");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "footer centered");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "delete");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var element1 = dom.childAt(fragment, [3]);
          var element2 = dom.childAt(element1, [1]);
          var element3 = dom.childAt(element1, [3]);
          var morphs = new Array(8);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element0, [3]), 1, 1);
          morphs[2] = dom.createMorphAt(dom.childAt(element0, [5]), 1, 1);
          morphs[3] = dom.createMorphAt(dom.childAt(element0, [7]), 0, 0);
          morphs[4] = dom.createElementMorph(element2);
          morphs[5] = dom.createMorphAt(element2, 0, 0);
          morphs[6] = dom.createElementMorph(element3);
          morphs[7] = dom.createMorphAt(element3, 0, 0);
          return morphs;
        },
        statements: [["content", "text.importCalendarDirections", ["loc", [null, [5, 11], [5, 44]]]], ["inline", "input", [], ["type", "text", "id", "importUrl", "value", ["subexpr", "@mut", [["get", "importCalendarUrl", ["loc", [null, [7, 53], [7, 70]]]]], [], []], "aria-required", "true", "size", "40"], ["loc", [null, [7, 12], [7, 103]]]], ["block", "validation-error", [], ["containerId", "urlError"], 0, null, ["loc", [null, [10, 12], [11, 33]]]], ["content", "text.importCalendarDesc", ["loc", [null, [13, 11], [13, 38]]]], ["element", "action", ["setImportUrl"], [], ["loc", [null, [16, 16], [16, 41]]]], ["content", "text.import", ["loc", [null, [16, 57], [16, 72]]]], ["element", "action", ["cancel"], [], ["loc", [null, [17, 16], [17, 36]]]], ["content", "text.cancel", ["loc", [null, [17, 63], [17, 78]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 20,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/import-calendar-button.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("button");
        dom.setAttribute(el1, "class", "ember-action-link");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element4 = dom.childAt(fragment, [0]);
        var morphs = new Array(3);
        morphs[0] = dom.createElementMorph(element4);
        morphs[1] = dom.createMorphAt(element4, 0, 0);
        morphs[2] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["element", "action", ["toggleModal"], [], ["loc", [null, [1, 34], [1, 58]]]], ["content", "text.importCalendar", ["loc", [null, [1, 59], [1, 82]]]], ["block", "simple-modal", [], ["enabled", false, "id", "import-calendar-modal", "enterClicked", "setImportUrl", "onCloseModal", "onCloseModal", "title", ["subexpr", "@mut", [["get", "text.importCalendar", ["loc", [null, [3, 119], [3, 138]]]]], [], []]], 0, null, ["loc", [null, [3, 0], [19, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/included-calendars", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 20,
                "column": 24
              },
              "end": {
                "line": 22,
                "column": 24
              }
            },
            "moduleName": "calendar/templates/components/included-calendars.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                            ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("span");
            dom.setAttribute(el1, "class", "enabled-calendar glyphicon glyphicon-info-sign");
            dom.setAttribute(el1, "data-calendarenabled", "true");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element2 = dom.childAt(fragment, [1]);
            var morphs = new Array(2);
            morphs[0] = dom.createAttrMorph(element2, 'data-calendarid');
            morphs[1] = dom.createAttrMorph(element2, 'data-calendar-desc');
            return morphs;
          },
          statements: [["attribute", "data-calendarid", ["concat", [["get", "calendar.id", ["loc", [null, [21, 108], [21, 119]]]]]]], ["attribute", "data-calendar-desc", ["concat", [["get", "calendar.description", ["loc", [null, [21, 173], [21, 193]]]]]]]],
          locals: [],
          templates: []
        };
      })();
      var child1 = (function () {
        var child0 = (function () {
          var child0 = (function () {
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 26,
                    "column": 28
                  },
                  "end": {
                    "line": 32,
                    "column": 28
                  }
                },
                "moduleName": "calendar/templates/components/included-calendars.hbs"
              },
              isEmpty: false,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                var el1 = dom.createTextNode("                                ");
                dom.appendChild(el0, el1);
                var el1 = dom.createElement("td");
                dom.setAttribute(el1, "class", "included-calendars-column");
                var el2 = dom.createTextNode("\n                                    ");
                dom.appendChild(el1, el2);
                var el2 = dom.createElement("button");
                dom.setAttribute(el2, "class", "ember-action-link");
                dom.setAttribute(el2, "href", "#");
                var el3 = dom.createTextNode("\n                                        ");
                dom.appendChild(el2, el3);
                var el3 = dom.createComment("");
                dom.appendChild(el2, el3);
                var el3 = dom.createTextNode("\n                                    ");
                dom.appendChild(el2, el3);
                dom.appendChild(el1, el2);
                var el2 = dom.createTextNode("\n                                ");
                dom.appendChild(el1, el2);
                dom.appendChild(el0, el1);
                var el1 = dom.createTextNode("\n");
                dom.appendChild(el0, el1);
                return el0;
              },
              buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                var element1 = dom.childAt(fragment, [1, 1]);
                var morphs = new Array(2);
                morphs[0] = dom.createElementMorph(element1);
                morphs[1] = dom.createMorphAt(element1, 1, 1);
                return morphs;
              },
              statements: [["element", "action", ["removeCalendar", ["get", "calendar", ["loc", [null, [28, 105], [28, 113]]]]], [], ["loc", [null, [28, 79], [28, 116]]]], ["content", "text.removeCalendar", ["loc", [null, [29, 40], [29, 63]]]]],
              locals: [],
              templates: []
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 25,
                  "column": 24
                },
                "end": {
                  "line": 33,
                  "column": 24
                }
              },
              "moduleName": "calendar/templates/components/included-calendars.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
              dom.insertBoundary(fragment, 0);
              dom.insertBoundary(fragment, null);
              return morphs;
            },
            statements: [["block", "if", [["get", "settings.operations.canadmincalendars", ["loc", [null, [26, 34], [26, 71]]]]], [], 0, null, ["loc", [null, [26, 28], [32, 35]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 24,
                "column": 20
              },
              "end": {
                "line": 34,
                "column": 20
              }
            },
            "moduleName": "calendar/templates/components/included-calendars.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "unless", [["get", "isGuest", ["loc", [null, [25, 34], [25, 41]]]]], [], 0, null, ["loc", [null, [25, 24], [33, 35]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      var child2 = (function () {
        var child0 = (function () {
          var child0 = (function () {
            var child0 = (function () {
              return {
                meta: {
                  "fragmentReason": false,
                  "revision": "Ember@2.6.2",
                  "loc": {
                    "source": null,
                    "start": {
                      "line": 38,
                      "column": 36
                    },
                    "end": {
                      "line": 38,
                      "column": 90
                    }
                  },
                  "moduleName": "calendar/templates/components/included-calendars.hbs"
                },
                isEmpty: false,
                arity: 0,
                cachedFragment: null,
                hasRendered: false,
                buildFragment: function buildFragment(dom) {
                  var el0 = dom.createDocumentFragment();
                  var el1 = dom.createComment("");
                  dom.appendChild(el0, el1);
                  return el0;
                },
                buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                  var morphs = new Array(1);
                  morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
                  dom.insertBoundary(fragment, 0);
                  dom.insertBoundary(fragment, null);
                  return morphs;
                },
                statements: [["content", "text.editCalendar", ["loc", [null, [38, 69], [38, 90]]]]],
                locals: [],
                templates: []
              };
            })();
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 36,
                    "column": 28
                  },
                  "end": {
                    "line": 40,
                    "column": 28
                  }
                },
                "moduleName": "calendar/templates/components/included-calendars.hbs"
              },
              isEmpty: false,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                var el1 = dom.createTextNode("                                ");
                dom.appendChild(el0, el1);
                var el1 = dom.createElement("td");
                dom.setAttribute(el1, "class", "included-calendars-column");
                var el2 = dom.createTextNode("                           \n                                    ");
                dom.appendChild(el1, el2);
                var el2 = dom.createComment("");
                dom.appendChild(el1, el2);
                var el2 = dom.createTextNode("                            \n                                ");
                dom.appendChild(el1, el2);
                dom.appendChild(el0, el1);
                var el1 = dom.createTextNode("\n");
                dom.appendChild(el0, el1);
                return el0;
              },
              buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                var morphs = new Array(1);
                morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
                return morphs;
              },
              statements: [["block", "link-to", ["manage-my-calendar"], [], 0, null, ["loc", [null, [38, 36], [38, 103]]]]],
              locals: [],
              templates: [child0]
            };
          })();
          var child1 = (function () {
            var child0 = (function () {
              var child0 = (function () {
                return {
                  meta: {
                    "fragmentReason": false,
                    "revision": "Ember@2.6.2",
                    "loc": {
                      "source": null,
                      "start": {
                        "line": 43,
                        "column": 40
                      },
                      "end": {
                        "line": 43,
                        "column": 101
                      }
                    },
                    "moduleName": "calendar/templates/components/included-calendars.hbs"
                  },
                  isEmpty: false,
                  arity: 0,
                  cachedFragment: null,
                  hasRendered: false,
                  buildFragment: function buildFragment(dom) {
                    var el0 = dom.createDocumentFragment();
                    var el1 = dom.createComment("");
                    dom.appendChild(el0, el1);
                    return el0;
                  },
                  buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                    var morphs = new Array(1);
                    morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
                    dom.insertBoundary(fragment, 0);
                    dom.insertBoundary(fragment, null);
                    return morphs;
                  },
                  statements: [["content", "text.editCalendar", ["loc", [null, [43, 80], [43, 101]]]]],
                  locals: [],
                  templates: []
                };
              })();
              return {
                meta: {
                  "fragmentReason": false,
                  "revision": "Ember@2.6.2",
                  "loc": {
                    "source": null,
                    "start": {
                      "line": 41,
                      "column": 32
                    },
                    "end": {
                      "line": 45,
                      "column": 32
                    }
                  },
                  "moduleName": "calendar/templates/components/included-calendars.hbs"
                },
                isEmpty: false,
                arity: 0,
                cachedFragment: null,
                hasRendered: false,
                buildFragment: function buildFragment(dom) {
                  var el0 = dom.createDocumentFragment();
                  var el1 = dom.createTextNode("                                    ");
                  dom.appendChild(el0, el1);
                  var el1 = dom.createElement("td");
                  dom.setAttribute(el1, "class", "included-calendars-column");
                  var el2 = dom.createTextNode("                                \n                                        ");
                  dom.appendChild(el1, el2);
                  var el2 = dom.createComment("");
                  dom.appendChild(el1, el2);
                  var el2 = dom.createTextNode("                               \n                                    ");
                  dom.appendChild(el1, el2);
                  dom.appendChild(el0, el1);
                  var el1 = dom.createTextNode("\n");
                  dom.appendChild(el0, el1);
                  return el0;
                },
                buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                  var morphs = new Array(1);
                  morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
                  return morphs;
                },
                statements: [["block", "link-to", ["calendar.edit", ["get", "calendar.id", ["loc", [null, [43, 67], [43, 78]]]]], [], 0, null, ["loc", [null, [43, 40], [43, 114]]]]],
                locals: [],
                templates: [child0]
              };
            })();
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 40,
                    "column": 28
                  },
                  "end": {
                    "line": 46,
                    "column": 28
                  }
                },
                "moduleName": "calendar/templates/components/included-calendars.hbs"
              },
              isEmpty: false,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                var el1 = dom.createComment("");
                dom.appendChild(el0, el1);
                return el0;
              },
              buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                var morphs = new Array(1);
                morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
                dom.insertBoundary(fragment, 0);
                dom.insertBoundary(fragment, null);
                return morphs;
              },
              statements: [["block", "if", [["get", "settings.operations.canadmincalendars", ["loc", [null, [41, 38], [41, 75]]]]], [], 0, null, ["loc", [null, [41, 32], [45, 39]]]]],
              locals: [],
              templates: [child0]
            };
          })();
          var child2 = (function () {
            var child0 = (function () {
              return {
                meta: {
                  "fragmentReason": false,
                  "revision": "Ember@2.6.2",
                  "loc": {
                    "source": null,
                    "start": {
                      "line": 48,
                      "column": 32
                    },
                    "end": {
                      "line": 54,
                      "column": 32
                    }
                  },
                  "moduleName": "calendar/templates/components/included-calendars.hbs"
                },
                isEmpty: false,
                arity: 0,
                cachedFragment: null,
                hasRendered: false,
                buildFragment: function buildFragment(dom) {
                  var el0 = dom.createDocumentFragment();
                  var el1 = dom.createTextNode("                                    ");
                  dom.appendChild(el0, el1);
                  var el1 = dom.createElement("td");
                  dom.setAttribute(el1, "class", "included-calendars-column");
                  var el2 = dom.createTextNode("\n                                        ");
                  dom.appendChild(el1, el2);
                  var el2 = dom.createElement("button");
                  dom.setAttribute(el2, "class", "ember-action-link");
                  dom.setAttribute(el2, "href", "#");
                  var el3 = dom.createTextNode("\n                                            ");
                  dom.appendChild(el2, el3);
                  var el3 = dom.createComment("");
                  dom.appendChild(el2, el3);
                  var el3 = dom.createTextNode("\n                                        ");
                  dom.appendChild(el2, el3);
                  dom.appendChild(el1, el2);
                  var el2 = dom.createTextNode("\n                                    ");
                  dom.appendChild(el1, el2);
                  dom.appendChild(el0, el1);
                  var el1 = dom.createTextNode("\n");
                  dom.appendChild(el0, el1);
                  return el0;
                },
                buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                  var element0 = dom.childAt(fragment, [1, 1]);
                  var morphs = new Array(2);
                  morphs[0] = dom.createElementMorph(element0);
                  morphs[1] = dom.createMorphAt(element0, 1, 1);
                  return morphs;
                },
                statements: [["element", "action", ["subscribe", ["get", "calendar", ["loc", [null, [50, 104], [50, 112]]]]], [], ["loc", [null, [50, 83], [50, 115]]]], ["content", "text.subscribe", ["loc", [null, [51, 44], [51, 62]]]]],
                locals: [],
                templates: []
              };
            })();
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 47,
                    "column": 28
                  },
                  "end": {
                    "line": 55,
                    "column": 28
                  }
                },
                "moduleName": "calendar/templates/components/included-calendars.hbs"
              },
              isEmpty: false,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                var el1 = dom.createComment("");
                dom.appendChild(el0, el1);
                return el0;
              },
              buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                var morphs = new Array(1);
                morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
                dom.insertBoundary(fragment, 0);
                dom.insertBoundary(fragment, null);
                return morphs;
              },
              statements: [["block", "unless", [["get", "isMyPages", ["loc", [null, [48, 42], [48, 51]]]]], [], 0, null, ["loc", [null, [48, 32], [54, 43]]]]],
              locals: [],
              templates: [child0]
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 35,
                  "column": 24
                },
                "end": {
                  "line": 56,
                  "column": 24
                }
              },
              "moduleName": "calendar/templates/components/included-calendars.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(2);
              morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
              morphs[1] = dom.createMorphAt(fragment, 1, 1, contextualElement);
              dom.insertBoundary(fragment, 0);
              dom.insertBoundary(fragment, null);
              return morphs;
            },
            statements: [["block", "if", [["get", "calendar.isMyCalendar", ["loc", [null, [36, 34], [36, 55]]]]], [], 0, 1, ["loc", [null, [36, 28], [46, 35]]]], ["block", "unless", [["get", "calendar.isSubscribed", ["loc", [null, [47, 38], [47, 59]]]]], [], 2, null, ["loc", [null, [47, 28], [55, 39]]]]],
            locals: [],
            templates: [child0, child1, child2]
          };
        })();
        var child1 = (function () {
          var child0 = (function () {
            var child0 = (function () {
              return {
                meta: {
                  "fragmentReason": false,
                  "revision": "Ember@2.6.2",
                  "loc": {
                    "source": null,
                    "start": {
                      "line": 60,
                      "column": 36
                    },
                    "end": {
                      "line": 64,
                      "column": 36
                    }
                  },
                  "moduleName": "calendar/templates/components/included-calendars.hbs"
                },
                isEmpty: true,
                arity: 0,
                cachedFragment: null,
                hasRendered: false,
                buildFragment: function buildFragment(dom) {
                  var el0 = dom.createDocumentFragment();
                  return el0;
                },
                buildRenderNodes: function buildRenderNodes() {
                  return [];
                },
                statements: [],
                locals: [],
                templates: []
              };
            })();
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 58,
                    "column": 28
                  },
                  "end": {
                    "line": 66,
                    "column": 28
                  }
                },
                "moduleName": "calendar/templates/components/included-calendars.hbs"
              },
              isEmpty: false,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                var el1 = dom.createTextNode("                                ");
                dom.appendChild(el0, el1);
                var el1 = dom.createElement("td");
                dom.setAttribute(el1, "class", "included-calendars-column");
                var el2 = dom.createTextNode("\n");
                dom.appendChild(el1, el2);
                var el2 = dom.createComment("");
                dom.appendChild(el1, el2);
                var el2 = dom.createTextNode("                                ");
                dom.appendChild(el1, el2);
                dom.appendChild(el0, el1);
                var el1 = dom.createTextNode("\n");
                dom.appendChild(el0, el1);
                return el0;
              },
              buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
                var morphs = new Array(1);
                morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
                return morphs;
              },
              statements: [["block", "share-url-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [61, 45], [61, 49]]]]], [], []], "shareUrl", ["subexpr", "@mut", [["get", "calendar.shareUrl", ["loc", [null, [62, 49], [62, 66]]]]], [], []]], 0, null, ["loc", [null, [60, 36], [64, 57]]]]],
              locals: [],
              templates: [child0]
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 57,
                  "column": 24
                },
                "end": {
                  "line": 67,
                  "column": 24
                }
              },
              "moduleName": "calendar/templates/components/included-calendars.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createComment("");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
              dom.insertBoundary(fragment, 0);
              dom.insertBoundary(fragment, null);
              return morphs;
            },
            statements: [["block", "unless", [["get", "isMyPages", ["loc", [null, [58, 38], [58, 47]]]]], [], 0, null, ["loc", [null, [58, 28], [66, 39]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 34,
                "column": 20
              },
              "end": {
                "line": 68,
                "column": 20
              }
            },
            "moduleName": "calendar/templates/components/included-calendars.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(2);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            morphs[1] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "unless", [["get", "isGuest", ["loc", [null, [35, 34], [35, 41]]]]], [], 0, null, ["loc", [null, [35, 24], [56, 35]]]], ["block", "if", [["get", "calendar.availableAsICalendarFeed", ["loc", [null, [57, 30], [57, 63]]]]], [], 1, null, ["loc", [null, [57, 24], [67, 31]]]]],
          locals: [],
          templates: [child0, child1]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 11,
              "column": 12
            },
            "end": {
              "line": 70,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/components/included-calendars.hbs"
        },
        isEmpty: false,
        arity: 1,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("tr");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("td");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("i");
          dom.setAttribute(el3, "data-calendarenabled", "true");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("td");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "data-calendarenabled", "true");
          var el4 = dom.createTextNode("\n                            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n                        ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element3 = dom.childAt(fragment, [1]);
          var element4 = dom.childAt(element3, [1, 1]);
          var element5 = dom.childAt(element3, [3]);
          var element6 = dom.childAt(element5, [1]);
          var morphs = new Array(7);
          morphs[0] = dom.createAttrMorph(element4, 'data-calendarid');
          morphs[1] = dom.createAttrMorph(element4, 'class');
          morphs[2] = dom.createAttrMorph(element6, 'class');
          morphs[3] = dom.createAttrMorph(element6, 'data-calendarid');
          morphs[4] = dom.createMorphAt(element6, 1, 1);
          morphs[5] = dom.createMorphAt(element5, 3, 3);
          morphs[6] = dom.createMorphAt(element3, 5, 5);
          return morphs;
        },
        statements: [["attribute", "data-calendarid", ["concat", [["get", "calendar.id", ["loc", [null, [14, 46], [14, 57]]]]]]], ["attribute", "class", ["concat", ["glyphicon glyphicon-eye-open included-calendars enabled-calendar ", ["subexpr", "if", [["get", "calendar.isMyCalendar", ["loc", [null, [14, 166], [14, 187]]]], "my-calendar"], [], ["loc", [null, [14, 161], [14, 203]]]]]]], ["attribute", "class", ["concat", ["enabled-calendar included-calendars ", ["subexpr", "if", [["get", "calendar.isMyCalendar", ["loc", [null, [17, 78], [17, 99]]]], "my-calendar"], [], ["loc", [null, [17, 73], [17, 115]]]]]]], ["attribute", "data-calendarid", ["concat", [["get", "calendar.id", ["loc", [null, [17, 164], [17, 175]]]]]]], ["content", "calendar.name", ["loc", [null, [18, 28], [18, 45]]]], ["block", "if", [["get", "calendar.description", ["loc", [null, [20, 30], [20, 50]]]]], [], 0, null, ["loc", [null, [20, 24], [22, 31]]]], ["block", "if", [["get", "calendar.isSubscription", ["loc", [null, [24, 26], [24, 49]]]]], [], 1, 2, ["loc", [null, [24, 20], [68, 27]]]]],
        locals: ["calendar"],
        templates: [child0, child1, child2]
      };
    })();
    var child1 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 74,
                "column": 12
              },
              "end": {
                "line": 74,
                "column": 68
              }
            },
            "moduleName": "calendar/templates/components/included-calendars.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("Manage My Calendar feed");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes() {
            return [];
          },
          statements: [],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 73,
              "column": 8
            },
            "end": {
              "line": 75,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/components/included-calendars.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("    \n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["block", "link-to", ["manage-my-calendar"], [], 0, null, ["loc", [null, [74, 12], [74, 81]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 79,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/included-calendars.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createTextNode("\n        ");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("span");
        dom.setAttribute(el1, "id", "included-calendars-link");
        dom.setAttribute(el1, "class", "ember-action-link");
        var el2 = dom.createTextNode("\n            ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n            ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("i");
        dom.setAttribute(el2, "id", "included-calendars-open-icon");
        dom.setAttribute(el2, "class", "glyphicon glyphicon-chevron-down included-calendars-open-icon");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n        ");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("        \n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "included-calendars-placeholder");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "included-calendars-description-placeholder");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "included-calendars-content");
        dom.setAttribute(el1, "class", "hiddenPopup");
        var el2 = dom.createTextNode("\n        ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("table");
        dom.setAttribute(el2, "class", "included-calendars-table");
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("        ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n        ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("hr");
        dom.setAttribute(el2, "class", "horizontal-rule");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("        ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "included-calendars-close");
        var el3 = dom.createTextNode("\n            ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("span");
        dom.setAttribute(el3, "id", "included-calendars-close-link");
        dom.setAttribute(el3, "class", "ember-action-link");
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element7 = dom.childAt(fragment, [7]);
        var morphs = new Array(4);
        morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(dom.childAt(element7, [1]), 1, 1);
        morphs[2] = dom.createMorphAt(element7, 5, 5);
        morphs[3] = dom.createMorphAt(dom.childAt(element7, [7, 1]), 0, 0);
        return morphs;
      },
      statements: [["content", "text.includedCalendars", ["loc", [null, [3, 12], [3, 38]]]], ["block", "each", [["get", "calendars", ["loc", [null, [11, 20], [11, 29]]]]], [], 0, null, ["loc", [null, [11, 12], [70, 21]]]], ["block", "unless", [["get", "isGuest", ["loc", [null, [73, 18], [73, 25]]]]], [], 1, null, ["loc", [null, [73, 8], [75, 19]]]], ["content", "text.close", ["loc", [null, [77, 79], [77, 93]]]]],
      locals: [],
      templates: [child0, child1]
    };
  })());
});
define("calendar/templates/components/manage-calendar", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 4
            },
            "end": {
              "line": 3,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      var child0 = (function () {
        var child0 = (function () {
          var child0 = (function () {
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 15,
                    "column": 16
                  },
                  "end": {
                    "line": 21,
                    "column": 16
                  }
                },
                "moduleName": "calendar/templates/components/manage-calendar.hbs"
              },
              isEmpty: true,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                return el0;
              },
              buildRenderNodes: function buildRenderNodes() {
                return [];
              },
              statements: [],
              locals: [],
              templates: []
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 13,
                  "column": 12
                },
                "end": {
                  "line": 23,
                  "column": 12
                }
              },
              "moduleName": "calendar/templates/components/manage-calendar.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createTextNode("            ");
              dom.appendChild(el0, el1);
              var el1 = dom.createElement("div");
              dom.setAttribute(el1, "class", "float-right");
              var el2 = dom.createTextNode("\n");
              dom.appendChild(el1, el2);
              var el2 = dom.createComment("");
              dom.appendChild(el1, el2);
              var el2 = dom.createTextNode("            ");
              dom.appendChild(el1, el2);
              dom.appendChild(el0, el1);
              var el1 = dom.createTextNode("\n");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var morphs = new Array(1);
              morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
              return morphs;
            },
            statements: [["block", "import-calendar-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [16, 25], [16, 29]]]]], [], []], "setImportUrl", "setImportUrl", "createSubscription", "createSubscription", "importCalendarUrl", ["subexpr", "@mut", [["get", "importCalendarUrl", ["loc", [null, [19, 38], [19, 55]]]]], [], []]], 0, null, ["loc", [null, [15, 16], [21, 43]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 12,
                "column": 12
              },
              "end": {
                "line": 24,
                "column": 12
              }
            },
            "moduleName": "calendar/templates/components/manage-calendar.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "unless", [["get", "isExiEventsCalendar", ["loc", [null, [13, 22], [13, 41]]]]], [], 0, null, ["loc", [null, [13, 12], [23, 23]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 11,
              "column": 12
            },
            "end": {
              "line": 25,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
          dom.insertBoundary(fragment, 0);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["block", "unless", [["get", "isDefault", ["loc", [null, [12, 22], [12, 31]]]]], [], 0, null, ["loc", [null, [12, 12], [24, 23]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 35,
              "column": 24
            },
            "end": {
              "line": 36,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 45,
              "column": 16
            },
            "end": {
              "line": 54,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("label");
          dom.setAttribute(el3, "for", "feed-url");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "id", "feed-url");
          dom.setAttribute(el3, "class", "disabled-text");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element9 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element9, [1, 1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element9, [3, 1]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.feedUrl", ["loc", [null, [48, 46], [48, 62]]]], ["content", "importCalendarUrl", ["loc", [null, [51, 66], [51, 87]]]]],
        locals: [],
        templates: []
      };
    })();
    var child4 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 55,
              "column": 16
            },
            "end": {
              "line": 67,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("label");
          dom.setAttribute(el3, "for", "last-retrieval");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "id", "last-retrieval");
          dom.setAttribute(el3, "class", "disabled-text");
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "id", "retreive-feed");
          dom.setAttribute(el3, "class", "save retrieve");
          var el4 = dom.createTextNode("\n                                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n                            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element6 = dom.childAt(fragment, [1]);
          var element7 = dom.childAt(element6, [3]);
          var element8 = dom.childAt(element7, [3]);
          var morphs = new Array(4);
          morphs[0] = dom.createMorphAt(dom.childAt(element6, [1, 1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element7, [1]), 0, 0);
          morphs[2] = dom.createElementMorph(element8);
          morphs[3] = dom.createMorphAt(element8, 1, 1);
          return morphs;
        },
        statements: [["content", "text.lastFeedRetrieval", ["loc", [null, [58, 52], [58, 78]]]], ["content", "lastFeedRetrieval", ["loc", [null, [61, 72], [61, 93]]]], ["element", "action", ["retrieveFeed"], [], ["loc", [null, [62, 77], [62, 103]]]], ["content", "text.retrieve", ["loc", [null, [63, 32], [63, 49]]]]],
        locals: [],
        templates: []
      };
    })();
    var child5 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 68,
              "column": 16
            },
            "end": {
              "line": 73,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("label");
          dom.setAttribute(el2, "for", "isDefault");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element5 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(element5, 1, 1);
          morphs[1] = dom.createMorphAt(dom.childAt(element5, [3]), 0, 0);
          return morphs;
        },
        statements: [["inline", "input", [], ["type", "checkbox", "id", "isDefault", "checked", ["subexpr", "@mut", [["get", "isDefault", ["loc", [null, [70, 67], [70, 76]]]]], [], []]], ["loc", [null, [70, 20], [70, 78]]]], ["content", "text.makeDefaultCalendar", ["loc", [null, [71, 57], [71, 85]]]]],
        locals: [],
        templates: []
      };
    })();
    var child6 = (function () {
      var child0 = (function () {
        var child0 = (function () {
          var child0 = (function () {
            return {
              meta: {
                "fragmentReason": false,
                "revision": "Ember@2.6.2",
                "loc": {
                  "source": null,
                  "start": {
                    "line": 93,
                    "column": 32
                  },
                  "end": {
                    "line": 94,
                    "column": 32
                  }
                },
                "moduleName": "calendar/templates/components/manage-calendar.hbs"
              },
              isEmpty: true,
              arity: 0,
              cachedFragment: null,
              hasRendered: false,
              buildFragment: function buildFragment(dom) {
                var el0 = dom.createDocumentFragment();
                return el0;
              },
              buildRenderNodes: function buildRenderNodes() {
                return [];
              },
              statements: [],
              locals: [],
              templates: []
            };
          })();
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 83,
                  "column": 28
                },
                "end": {
                  "line": 96,
                  "column": 28
                }
              },
              "moduleName": "calendar/templates/components/manage-calendar.hbs"
            },
            isEmpty: false,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              var el1 = dom.createTextNode("                            ");
              dom.appendChild(el0, el1);
              var el1 = dom.createElement("div");
              dom.setAttribute(el1, "class", "externalCalendarName");
              var el2 = dom.createTextNode("\n                                ");
              dom.appendChild(el1, el2);
              var el2 = dom.createElement("label");
              dom.setAttribute(el2, "for", "externalCalendarName");
              dom.setAttribute(el2, "class", "screenReaderText");
              var el3 = dom.createComment("");
              dom.appendChild(el2, el3);
              dom.appendChild(el1, el2);
              var el2 = dom.createTextNode("\n                                ");
              dom.appendChild(el1, el2);
              var el2 = dom.createComment("");
              dom.appendChild(el1, el2);
              var el2 = dom.createTextNode("\n");
              dom.appendChild(el1, el2);
              var el2 = dom.createComment("");
              dom.appendChild(el1, el2);
              var el2 = dom.createTextNode("                            ");
              dom.appendChild(el1, el2);
              dom.appendChild(el0, el1);
              var el1 = dom.createTextNode("\n");
              dom.appendChild(el0, el1);
              return el0;
            },
            buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
              var element2 = dom.childAt(fragment, [1]);
              var morphs = new Array(3);
              morphs[0] = dom.createMorphAt(dom.childAt(element2, [1]), 0, 0);
              morphs[1] = dom.createMorphAt(element2, 3, 3);
              morphs[2] = dom.createMorphAt(element2, 5, 5);
              return morphs;
            },
            statements: [["content", "text.exiEventCalendarName", ["loc", [null, [85, 91], [85, 120]]]], ["inline", "input", [], ["type", "text", "class", "externalCalendarNameTextBox", "aria-required", "true", "id", "externalCalendarName", "value", ["subexpr", "@mut", [["get", "externalCalendarName", ["loc", [null, [90, 42], [90, 62]]]]], [], []], "size", "30", "maxlength", "60", "placeholder", ["subexpr", "@mut", [["get", "text.exiEventCalendarName", ["loc", [null, [92, 48], [92, 73]]]]], [], []]], ["loc", [null, [86, 32], [92, 75]]]], ["block", "validation-error", [], ["containerId", "externalCalendarNameError"], 0, null, ["loc", [null, [93, 32], [94, 53]]]]],
            locals: [],
            templates: [child0]
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 79,
                "column": 20
              },
              "end": {
                "line": 98,
                "column": 20
              }
            },
            "moduleName": "calendar/templates/components/manage-calendar.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                        ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            var el2 = dom.createTextNode("                    \n                            ");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                            ");
            dom.appendChild(el1, el2);
            var el2 = dom.createElement("label");
            dom.setAttribute(el2, "for", "isExiEventsCalendar");
            dom.setAttribute(el2, "class", "label");
            var el3 = dom.createComment("");
            dom.appendChild(el2, el3);
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("                        ");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element3 = dom.childAt(fragment, [1]);
            var morphs = new Array(3);
            morphs[0] = dom.createMorphAt(element3, 1, 1);
            morphs[1] = dom.createMorphAt(dom.childAt(element3, [3]), 0, 0);
            morphs[2] = dom.createMorphAt(element3, 5, 5);
            return morphs;
          },
          statements: [["inline", "input", [], ["type", "checkbox", "id", "isExiEventsCalendar", "checked", ["subexpr", "@mut", [["get", "isExiEventsCalendar", ["loc", [null, [81, 85], [81, 104]]]]], [], []], "disabled", ["subexpr", "@mut", [["get", "isEdit", ["loc", [null, [81, 114], [81, 120]]]]], [], []]], ["loc", [null, [81, 28], [81, 122]]]], ["content", "text.makeThisEXiEventsCalendar", ["loc", [null, [82, 75], [82, 109]]]], ["block", "if", [["get", "isExiEventsCalendar", ["loc", [null, [83, 34], [83, 53]]]]], [], 0, null, ["loc", [null, [83, 28], [96, 35]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 74,
              "column": 16
            },
            "end": {
              "line": 99,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          var el2 = dom.createTextNode("\n                        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("label");
          dom.setAttribute(el2, "for", "feedEnabled");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element4 = dom.childAt(fragment, [1]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(element4, 1, 1);
          morphs[1] = dom.createMorphAt(dom.childAt(element4, [3]), 0, 0);
          morphs[2] = dom.createMorphAt(fragment, 3, 3, contextualElement);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["inline", "input", [], ["type", "checkbox", "id", "feedEnabled", "checked", ["subexpr", "@mut", [["get", "availableAsICalendarFeed", ["loc", [null, [76, 73], [76, 97]]]]], [], []]], ["loc", [null, [76, 24], [76, 99]]]], ["content", "text.publishShareFeed", ["loc", [null, [77, 63], [77, 88]]]], ["block", "if", [["get", "canManageExCalendars", ["loc", [null, [79, 26], [79, 46]]]]], [], 0, null, ["loc", [null, [79, 20], [98, 27]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    var child7 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 110,
              "column": 16
            },
            "end": {
              "line": 114,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "id", "submitEvent");
          dom.setAttribute(el1, "class", "save");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element1);
          morphs[1] = dom.createMorphAt(element1, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["updateClick"], [], ["loc", [null, [111, 54], [111, 79]]]], ["content", "text.update", ["loc", [null, [112, 20], [112, 35]]]]],
        locals: [],
        templates: []
      };
    })();
    var child8 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 114,
              "column": 16
            },
            "end": {
              "line": 118,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "id", "submitEvent");
          dom.setAttribute(el1, "class", "save");
          var el2 = dom.createTextNode("\n                        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element0);
          morphs[1] = dom.createMorphAt(element0, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["saveClick"], [], ["loc", [null, [115, 58], [115, 81]]]], ["content", "text.addCalendar", ["loc", [null, [116, 24], [116, 44]]]]],
        locals: [],
        templates: []
      };
    })();
    var child9 = (function () {
      var child0 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 125,
                  "column": 16
                },
                "end": {
                  "line": 131,
                  "column": 16
                }
              },
              "moduleName": "calendar/templates/components/manage-calendar.hbs"
            },
            isEmpty: true,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              return el0;
            },
            buildRenderNodes: function buildRenderNodes() {
              return [];
            },
            statements: [],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 124,
                "column": 16
              },
              "end": {
                "line": 132,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/manage-calendar.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "delete-calendar-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [126, 25], [126, 29]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.deleteThisCalendar", ["loc", [null, [127, 30], [127, 53]]]]], [], []], "deleteCalendar", "deleteCalendar", "calendar", ["subexpr", "@mut", [["get", "calendar", ["loc", [null, [129, 29], [129, 37]]]]], [], []]], 0, null, ["loc", [null, [125, 16], [131, 43]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 123,
              "column": 12
            },
            "end": {
              "line": 133,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/components/manage-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
          dom.insertBoundary(fragment, 0);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["block", "unless", [["get", "calendar.isDefault", ["loc", [null, [124, 26], [124, 44]]]]], [], 0, null, ["loc", [null, [124, 16], [132, 27]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 137,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/manage-calendar.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "manage-calendar form-container");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "add-calendar-what-label-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("span");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createComment("");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "name");
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "description");
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n             \n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container save-button");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "add-event-save-button-container");
        var el5 = dom.createTextNode("\n");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("a");
        dom.setAttribute(el4, "href", "#");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element10 = dom.childAt(fragment, [0]);
        var element11 = dom.childAt(element10, [3]);
        var element12 = dom.childAt(element11, [3]);
        var element13 = dom.childAt(element12, [3]);
        var element14 = dom.childAt(element13, [1]);
        var element15 = dom.childAt(element13, [3]);
        var element16 = dom.childAt(element10, [7, 3]);
        var element17 = dom.childAt(element16, [3]);
        var morphs = new Array(16);
        morphs[0] = dom.createMorphAt(element10, 1, 1);
        morphs[1] = dom.createMorphAt(dom.childAt(element11, [1, 1, 1]), 0, 0);
        morphs[2] = dom.createMorphAt(element12, 1, 1);
        morphs[3] = dom.createMorphAt(dom.childAt(element14, [1, 1]), 0, 0);
        morphs[4] = dom.createMorphAt(dom.childAt(element14, [3]), 1, 1);
        morphs[5] = dom.createMorphAt(dom.childAt(element14, [5]), 1, 1);
        morphs[6] = dom.createMorphAt(dom.childAt(element15, [1, 1]), 0, 0);
        morphs[7] = dom.createMorphAt(dom.childAt(element15, [3]), 0, 0);
        morphs[8] = dom.createMorphAt(element13, 5, 5);
        morphs[9] = dom.createMorphAt(element13, 6, 6);
        morphs[10] = dom.createMorphAt(element13, 7, 7);
        morphs[11] = dom.createMorphAt(element13, 8, 8);
        morphs[12] = dom.createMorphAt(dom.childAt(element16, [1]), 1, 1);
        morphs[13] = dom.createElementMorph(element17);
        morphs[14] = dom.createMorphAt(element17, 1, 1);
        morphs[15] = dom.createMorphAt(element16, 5, 5);
        return morphs;
      },
      statements: [["block", "validation-error", [], ["containerId", "addCalendarGeneralError", "errorMessage", ["subexpr", "@mut", [["get", "text.generalError", ["loc", [null, [2, 75], [2, 92]]]]], [], []]], 0, null, ["loc", [null, [2, 4], [3, 25]]]], ["content", "text.what", ["loc", [null, [7, 48], [7, 61]]]], ["block", "unless", [["get", "isiCalendarFeed", ["loc", [null, [11, 22], [11, 37]]]]], [], 1, null, ["loc", [null, [11, 12], [25, 23]]]], ["content", "text.calendarNameDescription", ["loc", [null, [29, 42], [29, 74]]]], ["inline", "input", [], ["type", "text", "aria-required", "true", "id", "name", "value", ["subexpr", "@mut", [["get", "name", ["loc", [null, [32, 81], [32, 85]]]]], [], []], "size", "30", "maxlength", "250"], ["loc", [null, [32, 24], [32, 113]]]], ["block", "validation-error", [], ["containerId", "nameError"], 2, null, ["loc", [null, [35, 24], [36, 45]]]], ["content", "text.description", ["loc", [null, [41, 49], [41, 69]]]], ["inline", "textarea", [], ["id", "description", "value", ["subexpr", "@mut", [["get", "description", ["loc", [null, [43, 59], [43, 70]]]]], [], []], "cols", "45", "rows", "3"], ["loc", [null, [43, 25], [43, 91]]]], ["block", "if", [["get", "importCalendarUrl", ["loc", [null, [45, 22], [45, 39]]]]], [], 3, null, ["loc", [null, [45, 16], [54, 23]]]], ["block", "if", [["get", "isiCalendarFeed", ["loc", [null, [55, 22], [55, 37]]]]], [], 4, null, ["loc", [null, [55, 16], [67, 23]]]], ["block", "unless", [["get", "importCalendarUrl", ["loc", [null, [68, 26], [68, 43]]]]], [], 5, null, ["loc", [null, [68, 16], [73, 27]]]], ["block", "unless", [["get", "model.isMyPages", ["loc", [null, [74, 26], [74, 41]]]]], [], 6, null, ["loc", [null, [74, 16], [99, 27]]]], ["block", "if", [["get", "isEdit", ["loc", [null, [110, 22], [110, 28]]]]], [], 7, 8, ["loc", [null, [110, 16], [118, 23]]]], ["element", "action", ["goBack"], [], ["loc", [null, [120, 24], [120, 44]]]], ["content", "text.cancel", ["loc", [null, [121, 16], [121, 31]]]], ["block", "if", [["get", "isEdit", ["loc", [null, [123, 18], [123, 24]]]]], [], 9, null, ["loc", [null, [123, 12], [133, 19]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4, child5, child6, child7, child8, child9]
    };
  })());
});
define("calendar/templates/components/manage-event-recurrence", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "missing-wrapper",
            "problems": ["empty-body"]
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 8,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/manage-event-recurrence.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 64,
              "column": 4
            },
            "end": {
              "line": 65,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/manage-event-recurrence.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type", "multiple-nodes"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 66,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/manage-event-recurrence.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("label");
        dom.setAttribute(el1, "id", "repeatsSpan");
        dom.setAttribute(el1, "for", "repeatsCheckbox");
        dom.setAttribute(el1, "class", "label");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "intervalSelectContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "intervalSelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "intervalSelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("label");
        dom.setAttribute(el1, "for", "everyNumberInput");
        dom.setAttribute(el1, "class", "screenReaderText");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "frequencySelectContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "frequencySelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "frequencySelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "onContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("span");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "daysOfWeekForWeekFrequencyContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "daysOfWeekForWeekFrequencySelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "daysOfWeekForWeekFrequencySelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode(" \n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "onTheContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("span");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "dayOfMonthContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "dayOfMonthSelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "dayOfMonthSelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "dayOfWeekOccurenceForMonthContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("    \n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "dayOfWeekOccurenceForMonthSelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "dayOfWeekOccurenceForMonthSelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode(" \n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "daysOfWeekForMonthFrequencyContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "daysOfWeekForMonthFrequencySelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "daysOfWeekForMonthFrequencySelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode(" \n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "inContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("span");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "monthSelectContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "monthSelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "monthSelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "dayOfMonthForYearContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "for", "dayOfMonthForYearSelect");
        dom.setAttribute(el2, "class", "screenReaderText");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n	");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("select");
        dom.setAttribute(el2, "id", "dayOfMonthForYearSelect");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "endsOnContainer");
        dom.setAttribute(el1, "class", "recurrence-container hidden");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("label");
        dom.setAttribute(el2, "class", "label");
        dom.setAttribute(el2, "for", "recurrenceEndsOn");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "clearBoth");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [32]);
        var morphs = new Array(19);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        morphs[1] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        morphs[2] = dom.createMorphAt(dom.childAt(fragment, [4]), 1, 1);
        morphs[3] = dom.createMorphAt(dom.childAt(fragment, [6, 1]), 0, 0);
        morphs[4] = dom.createMorphAt(dom.childAt(fragment, [8]), 0, 0);
        morphs[5] = dom.createMorphAt(fragment, 10, 10, contextualElement);
        morphs[6] = dom.createMorphAt(dom.childAt(fragment, [12, 1]), 0, 0);
        morphs[7] = dom.createMorphAt(dom.childAt(fragment, [14, 1]), 0, 0);
        morphs[8] = dom.createMorphAt(dom.childAt(fragment, [16, 1]), 0, 0);
        morphs[9] = dom.createMorphAt(dom.childAt(fragment, [18, 1]), 0, 0);
        morphs[10] = dom.createMorphAt(dom.childAt(fragment, [20, 1]), 0, 0);
        morphs[11] = dom.createMorphAt(dom.childAt(fragment, [22, 1]), 0, 0);
        morphs[12] = dom.createMorphAt(dom.childAt(fragment, [24, 1]), 0, 0);
        morphs[13] = dom.createMorphAt(dom.childAt(fragment, [26, 1]), 0, 0);
        morphs[14] = dom.createMorphAt(dom.childAt(fragment, [28, 1]), 0, 0);
        morphs[15] = dom.createMorphAt(dom.childAt(fragment, [30, 1]), 0, 0);
        morphs[16] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
        morphs[17] = dom.createMorphAt(element0, 3, 3);
        morphs[18] = dom.createMorphAt(dom.childAt(fragment, [34]), 1, 1);
        dom.insertBoundary(fragment, 0);
        return morphs;
      },
      statements: [["block", "select-days-of-week", [], ["id", "selectDaysOfWeek", "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [3, 9], [3, 13]]]]], [], []], "refreshWeekdaysSelect", "refreshWeekdaysSelect", "confirmSelectDays", "confirmSelectDays", "weekFrequencySelectedDays", ["subexpr", "@mut", [["get", "weekFrequencySelectedDays", ["loc", [null, [6, 30], [6, 55]]]]], [], []]], 0, null, ["loc", [null, [1, 0], [8, 24]]]], ["inline", "input", [], ["type", "checkbox", "id", "repeatsCheckbox", "checked", ["subexpr", "@mut", [["get", "eventRepeats", ["loc", [null, [10, 53], [10, 65]]]]], [], []]], ["loc", [null, [10, 0], [10, 67]]]], ["content", "text.repeatsWithExample", ["loc", [null, [12, 4], [12, 31]]]], ["content", "text.screenReaderInterval", ["loc", [null, [16, 57], [16, 86]]]], ["content", "text.screenReaderIntervalLength", ["loc", [null, [19, 55], [19, 90]]]], ["inline", "input", [], ["type", "number", "id", "everyNumberInput", "class", "recurrence-container hidden", "min", "0", "step", "1"], ["loc", [null, [20, 0], [20, 99]]]], ["content", "text.screenReaderFrequency", ["loc", [null, [22, 58], [22, 88]]]], ["content", "text.on", ["loc", [null, [26, 10], [26, 21]]]], ["content", "text.screenReaderDaysOfWeek", ["loc", [null, [29, 75], [29, 106]]]], ["content", "text.onThe", ["loc", [null, [33, 10], [33, 24]]]], ["content", "text.screenReaderDaysOfMonth", ["loc", [null, [36, 59], [36, 91]]]], ["content", "text.screenReaderDayOfWeekOccurrence", ["loc", [null, [40, 75], [40, 115]]]], ["content", "text.screenReaderDaysOfWeek", ["loc", [null, [44, 76], [44, 107]]]], ["content", "text.in", ["loc", [null, [48, 10], [48, 21]]]], ["content", "text.screenReaderMonths", ["loc", [null, [51, 54], [51, 81]]]], ["content", "text.screenReaderDaysOfMonth", ["loc", [null, [55, 66], [55, 98]]]], ["content", "text.endsOn", ["loc", [null, [59, 48], [59, 63]]]], ["inline", "input", [], ["type", "text", "id", "recurrenceEndsOn", "size", 10], ["loc", [null, [60, 4], [60, 55]]]], ["block", "validation-error", [], ["containerId", "recurrenceError"], 1, null, ["loc", [null, [64, 4], [65, 25]]]]],
      locals: [],
      templates: [child0, child1]
    };
  })());
});
define("calendar/templates/components/manage-event", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 4
            },
            "end": {
              "line": 3,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 22,
              "column": 24
            },
            "end": {
              "line": 23,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 88,
              "column": 24
            },
            "end": {
              "line": 89,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 110,
              "column": 24
            },
            "end": {
              "line": 111,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child4 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 117,
              "column": 20
            },
            "end": {
              "line": 129,
              "column": 20
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child5 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 159,
              "column": 16
            },
            "end": {
              "line": 163,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "id", "submitEvent");
          dom.setAttribute(el1, "class", "save");
          var el2 = dom.createTextNode("\n                        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element1);
          morphs[1] = dom.createMorphAt(element1, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["updateClick"], [], ["loc", [null, [160, 58], [160, 82]]]], ["content", "text.update", ["loc", [null, [161, 24], [161, 39]]]]],
        locals: [],
        templates: []
      };
    })();
    var child6 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 163,
              "column": 16
            },
            "end": {
              "line": 167,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("button");
          dom.setAttribute(el1, "id", "submitEvent");
          dom.setAttribute(el1, "class", "save");
          var el2 = dom.createTextNode("\n                        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element0);
          morphs[1] = dom.createMorphAt(element0, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["saveClick"], [], ["loc", [null, [164, 58], [164, 81]]]], ["content", "text.addEvent", ["loc", [null, [165, 24], [165, 41]]]]],
        locals: [],
        templates: []
      };
    })();
    var child7 = (function () {
      var child0 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 174,
                  "column": 20
                },
                "end": {
                  "line": 180,
                  "column": 20
                }
              },
              "moduleName": "calendar/templates/components/manage-event.hbs"
            },
            isEmpty: true,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              return el0;
            },
            buildRenderNodes: function buildRenderNodes() {
              return [];
            },
            statements: [],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 173,
                "column": 16
              },
              "end": {
                "line": 181,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/manage-event.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "delete-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [175, 29], [175, 33]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.deleteThisEvent", ["loc", [null, [176, 34], [176, 54]]]]], [], []], "deleteConfirmText", ["subexpr", "@mut", [["get", "text.deleteSeriesMessage", ["loc", [null, [177, 42], [177, 66]]]]], [], []], "deleteEvent", "deleteRecurringEvent"], 0, null, ["loc", [null, [174, 20], [180, 44]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      var child1 = (function () {
        var child0 = (function () {
          return {
            meta: {
              "fragmentReason": false,
              "revision": "Ember@2.6.2",
              "loc": {
                "source": null,
                "start": {
                  "line": 182,
                  "column": 20
                },
                "end": {
                  "line": 188,
                  "column": 20
                }
              },
              "moduleName": "calendar/templates/components/manage-event.hbs"
            },
            isEmpty: true,
            arity: 0,
            cachedFragment: null,
            hasRendered: false,
            buildFragment: function buildFragment(dom) {
              var el0 = dom.createDocumentFragment();
              return el0;
            },
            buildRenderNodes: function buildRenderNodes() {
              return [];
            },
            statements: [],
            locals: [],
            templates: []
          };
        })();
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 181,
                "column": 16
              },
              "end": {
                "line": 189,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/manage-event.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
            dom.insertBoundary(fragment, 0);
            dom.insertBoundary(fragment, null);
            return morphs;
          },
          statements: [["block", "delete-event-button", [], ["text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [183, 29], [183, 33]]]]], [], []], "titleText", ["subexpr", "@mut", [["get", "text.deleteThisEvent", ["loc", [null, [184, 34], [184, 54]]]]], [], []], "deleteConfirmText", ["subexpr", "@mut", [["get", "text.sureYouWantToDelete", ["loc", [null, [185, 42], [185, 66]]]]], [], []], "deleteEvent", "deleteEvent"], 0, null, ["loc", [null, [182, 20], [188, 44]]]]],
          locals: [],
          templates: [child0]
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 172,
              "column": 12
            },
            "end": {
              "line": 190,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/components/manage-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
          dom.insertBoundary(fragment, 0);
          dom.insertBoundary(fragment, null);
          return morphs;
        },
        statements: [["block", "if", [["get", "isEditSeries", ["loc", [null, [173, 22], [173, 34]]]]], [], 0, 1, ["loc", [null, [173, 16], [189, 23]]]]],
        locals: [],
        templates: [child0, child1]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 194,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/components/manage-event.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "form-container");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "section");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("span");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createComment("");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "title");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "eventCalendar");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createElement("label");
        dom.setAttribute(el8, "for", "available-calendars-select");
        var el9 = dom.createTextNode("\n                                ");
        dom.appendChild(el8, el9);
        var el9 = dom.createComment("");
        dom.appendChild(el8, el9);
        var el9 = dom.createTextNode("\n                            ");
        dom.appendChild(el8, el9);
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("                        \n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("span");
        dom.setAttribute(el7, "id", "selectedCalendarName");
        dom.setAttribute(el7, "style", "display: none;");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("select");
        dom.setAttribute(el7, "id", "available-calendars-select");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                                                   \n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "eventDescription");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "section");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("span");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("            \n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "id", "datePairContainer");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "startDate");
        dom.setAttribute(el7, "class", "label");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("div");
        dom.setAttribute(el7, "class", "inner-addon right-addon");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createElement("i");
        dom.setAttribute(el8, "class", "glyphicon glyphicon-calendar calendar-icon");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "id", "startTimeTitle");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "startTime");
        dom.setAttribute(el7, "class", "screenReaderText");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "id", "allDayTitle");
        dom.setAttribute(el7, "for", "allDayCheckbox");
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "endDate");
        dom.setAttribute(el7, "class", "label");
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("div");
        dom.setAttribute(el7, "class", "inner-addon right-addon");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createElement("i");
        dom.setAttribute(el8, "class", "glyphicon glyphicon-calendar calendar-icon");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "id", "endTimeTitle");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "endTime");
        dom.setAttribute(el7, "class", "screenReaderText");
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createTextNode("\n");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("                \n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n");
        dom.appendChild(el5, el6);
        var el6 = dom.createComment("");
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "section");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("span");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createComment("");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "location");
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n             \n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container save-button");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "add-event-save-button-container");
        var el5 = dom.createTextNode("\n");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("a");
        dom.setAttribute(el4, "href", "#");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element2 = dom.childAt(fragment, [0]);
        var element3 = dom.childAt(element2, [3]);
        var element4 = dom.childAt(element3, [3, 1]);
        var element5 = dom.childAt(element4, [1]);
        var element6 = dom.childAt(element4, [5]);
        var element7 = dom.childAt(element2, [7]);
        var element8 = dom.childAt(element7, [3]);
        var element9 = dom.childAt(element8, [1]);
        var element10 = dom.childAt(element9, [1]);
        var element11 = dom.childAt(element10, [3]);
        var element12 = dom.childAt(element9, [3]);
        var element13 = dom.childAt(element12, [3]);
        var element14 = dom.childAt(element2, [11]);
        var element15 = dom.childAt(element14, [3, 1, 1]);
        var element16 = dom.childAt(element2, [15, 3]);
        var element17 = dom.childAt(element16, [3]);
        var morphs = new Array(31);
        morphs[0] = dom.createMorphAt(element2, 1, 1);
        morphs[1] = dom.createMorphAt(dom.childAt(element3, [1, 1, 1]), 0, 0);
        morphs[2] = dom.createMorphAt(dom.childAt(element5, [1, 1]), 1, 1);
        morphs[3] = dom.createMorphAt(dom.childAt(element5, [3]), 1, 1);
        morphs[4] = dom.createMorphAt(dom.childAt(element5, [5]), 1, 1);
        morphs[5] = dom.createMorphAt(dom.childAt(element4, [3, 1, 1, 1]), 1, 1);
        morphs[6] = dom.createMorphAt(dom.childAt(element6, [1, 1]), 1, 1);
        morphs[7] = dom.createMorphAt(dom.childAt(element6, [3]), 1, 1);
        morphs[8] = dom.createMorphAt(dom.childAt(element7, [1, 1, 1, 1]), 1, 1);
        morphs[9] = dom.createMorphAt(dom.childAt(element10, [1, 1]), 1, 1);
        morphs[10] = dom.createMorphAt(dom.childAt(element11, [1]), 3, 3);
        morphs[11] = dom.createMorphAt(dom.childAt(element11, [3]), 1, 1);
        morphs[12] = dom.createMorphAt(element11, 5, 5);
        morphs[13] = dom.createMorphAt(dom.childAt(element11, [7]), 1, 1);
        morphs[14] = dom.createMorphAt(element11, 9, 9);
        morphs[15] = dom.createMorphAt(dom.childAt(element11, [11]), 0, 0);
        morphs[16] = dom.createMorphAt(dom.childAt(element10, [5]), 1, 1);
        morphs[17] = dom.createMorphAt(dom.childAt(element12, [1, 1]), 0, 0);
        morphs[18] = dom.createMorphAt(dom.childAt(element13, [1]), 3, 3);
        morphs[19] = dom.createMorphAt(dom.childAt(element13, [3]), 1, 1);
        morphs[20] = dom.createMorphAt(element13, 5, 5);
        morphs[21] = dom.createMorphAt(dom.childAt(element13, [7]), 1, 1);
        morphs[22] = dom.createMorphAt(dom.childAt(element12, [5]), 1, 1);
        morphs[23] = dom.createMorphAt(dom.childAt(element8, [3, 1]), 1, 1);
        morphs[24] = dom.createMorphAt(dom.childAt(element14, [1, 1, 1]), 0, 0);
        morphs[25] = dom.createMorphAt(dom.childAt(element15, [1, 1]), 0, 0);
        morphs[26] = dom.createMorphAt(dom.childAt(element15, [3]), 0, 0);
        morphs[27] = dom.createMorphAt(dom.childAt(element16, [1]), 1, 1);
        morphs[28] = dom.createElementMorph(element17);
        morphs[29] = dom.createMorphAt(element17, 1, 1);
        morphs[30] = dom.createMorphAt(element16, 5, 5);
        return morphs;
      },
      statements: [["block", "validation-error", [], ["containerId", "manageEventGeneralError", "errorMessage", ["subexpr", "@mut", [["get", "text.generalError", ["loc", [null, [2, 75], [2, 92]]]]], [], []]], 0, null, ["loc", [null, [2, 4], [3, 25]]]], ["content", "text.what", ["loc", [null, [7, 48], [7, 61]]]], ["content", "text.eventNameDescription", ["loc", [null, [15, 28], [15, 57]]]], ["inline", "input", [], ["type", "text", "id", "title", "value", ["subexpr", "@mut", [["get", "title", ["loc", [null, [19, 61], [19, 66]]]]], [], []], "aria-required", "true", "size", "30", "maxlength", "250"], ["loc", [null, [19, 24], [19, 115]]]], ["block", "validation-error", [], ["containerId", "nameError"], 1, null, ["loc", [null, [22, 24], [23, 45]]]], ["content", "text.whichCalendar", ["loc", [null, [30, 32], [30, 54]]]], ["content", "text.description", ["loc", [null, [42, 28], [42, 48]]]], ["inline", "textarea", [], ["id", "eventDescription", "value", ["subexpr", "@mut", [["get", "description", ["loc", [null, [46, 63], [46, 74]]]]], [], []], "cols", "45", "rows", "3"], ["loc", [null, [46, 24], [46, 95]]]], ["content", "text.when", ["loc", [null, [58, 24], [58, 37]]]], ["content", "text.startDate", ["loc", [null, [68, 28], [68, 46]]]], ["inline", "input", [], ["type", "text", "id", "startDate", "value", ["subexpr", "@mut", [["get", "startDate", ["loc", [null, [74, 69], [74, 78]]]]], [], []], "class", "date start", "size", 10], ["loc", [null, [74, 28], [74, 107]]]], ["content", "text.at", ["loc", [null, [78, 28], [78, 39]]]], ["inline", "input", [], ["type", "text", "id", "startTime", "value", ["subexpr", "@mut", [["get", "startTime", ["loc", [null, [80, 65], [80, 74]]]]], [], []], "class", "time start", "size", 12], ["loc", [null, [80, 24], [80, 103]]]], ["content", "text.startTime", ["loc", [null, [82, 28], [82, 46]]]], ["inline", "input", [], ["type", "checkbox", "id", "allDayCheckbox", "change", ["subexpr", "@mut", [["get", "allDayChange", ["loc", [null, [84, 75], [84, 87]]]]], [], []], "checked", ["subexpr", "@mut", [["get", "event.allDay", ["loc", [null, [84, 96], [84, 108]]]]], [], []]], ["loc", [null, [84, 24], [84, 111]]]], ["content", "text.allDay", ["loc", [null, [85, 69], [85, 84]]]], ["block", "validation-error", [], ["containerId", "startDateTimeError"], 2, null, ["loc", [null, [88, 24], [89, 45]]]], ["content", "text.endDate", ["loc", [null, [94, 59], [94, 75]]]], ["inline", "input", [], ["type", "text", "id", "endDate", "value", ["subexpr", "@mut", [["get", "endDate", ["loc", [null, [99, 67], [99, 74]]]]], [], []], "class", "date end", "size", 10], ["loc", [null, [99, 28], [99, 101]]]], ["content", "text.at", ["loc", [null, [102, 28], [102, 39]]]], ["inline", "input", [], ["type", "text", "id", "endTime", "value", ["subexpr", "@mut", [["get", "endTime", ["loc", [null, [104, 63], [104, 70]]]]], [], []], "class", "time end", "size", 12], ["loc", [null, [104, 24], [104, 97]]]], ["content", "text.endTime", ["loc", [null, [106, 24], [106, 40]]]], ["block", "validation-error", [], ["containerId", "endDateTimeError"], 3, null, ["loc", [null, [110, 24], [111, 45]]]], ["block", "manage-event-recurrence", [], ["id", "eventRecurrence", "availableIntervalOptions", ["subexpr", "@mut", [["get", "availableIntervalOptions", ["loc", [null, [119, 49], [119, 73]]]]], [], []], "availableFrequencyOptions", ["subexpr", "@mut", [["get", "availableFrequencyOptions", ["loc", [null, [120, 50], [120, 75]]]]], [], []], "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [121, 29], [121, 33]]]]], [], []], "event", ["subexpr", "@mut", [["get", "event", ["loc", [null, [122, 30], [122, 35]]]]], [], []], "eventRepeats", ["subexpr", "@mut", [["get", "eventRepeats", ["loc", [null, [123, 39], [123, 51]]]]], [], []], "weekFrequencySelectedDays", ["subexpr", "@mut", [["get", "weekFrequencySelectedDays", ["loc", [null, [124, 50], [124, 75]]]]], [], []], "isEdit", ["subexpr", "@mut", [["get", "isEdit", ["loc", [null, [125, 31], [125, 37]]]]], [], []], "isEditSeries", ["subexpr", "@mut", [["get", "isEditSeries", ["loc", [null, [126, 37], [126, 49]]]]], [], []], "endAndStartDateDelta", ["subexpr", "@mut", [["get", "endAndStartDateDelta", ["loc", [null, [127, 45], [127, 65]]]]], [], []]], 4, null, ["loc", [null, [117, 20], [129, 48]]]], ["content", "text.where", ["loc", [null, [138, 48], [138, 62]]]], ["content", "text.whereWillEventTakePlace", ["loc", [null, [145, 46], [145, 78]]]], ["inline", "input", [], ["type", "text", "id", "location", "value", ["subexpr", "@mut", [["get", "location", ["loc", [null, [147, 65], [147, 73]]]]], [], []], "size", "30", "maxlength", "250"], ["loc", [null, [147, 25], [147, 101]]]], ["block", "if", [["get", "isEdit", ["loc", [null, [159, 22], [159, 28]]]]], [], 5, 6, ["loc", [null, [159, 16], [167, 23]]]], ["element", "action", ["goBack"], [], ["loc", [null, [169, 24], [169, 44]]]], ["content", "text.cancel", ["loc", [null, [170, 16], [170, 31]]]], ["block", "if", [["get", "isEdit", ["loc", [null, [172, 18], [172, 24]]]]], [], 7, null, ["loc", [null, [172, 12], [190, 19]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4, child5, child6, child7]
    };
  })());
});
define("calendar/templates/components/my-calendar-feed-url", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "triple-curlies"
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 8,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/my-calendar-feed-url.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "disabled-text");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("label");
          dom.setAttribute(el2, "for", "calendarFeedUrl");
          dom.setAttribute(el2, "class", "screenReaderText");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [0]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
          morphs[1] = dom.createMorphAt(element0, 3, 3);
          return morphs;
        },
        statements: [["content", "model.text.myFeedUrl", ["loc", [null, [4, 8], [4, 32]]]], ["inline", "input", [], ["type", "text", "id", "calendarFeedUrl", "value", ["subexpr", "@mut", [["get", "model.set.feedUrl", ["loc", [null, [6, 51], [6, 68]]]]], [], []], "size", "80", "readonly", "readonly"], ["loc", [null, [6, 4], [6, 100]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 9,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/my-calendar-feed-url.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["block", "if", [["get", "model.set.availableAsICalendarFeed", ["loc", [null, [1, 6], [1, 40]]]]], [], 0, null, ["loc", [null, [1, 0], [8, 7]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/quick-add-event", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 17,
                "column": 20
              },
              "end": {
                "line": 18,
                "column": 20
              }
            },
            "moduleName": "calendar/templates/components/quick-add-event.hbs"
          },
          isEmpty: true,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            return el0;
          },
          buildRenderNodes: function buildRenderNodes() {
            return [];
          },
          statements: [],
          locals: [],
          templates: []
        };
      })();
      var child1 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 29,
                "column": 16
              },
              "end": {
                "line": 31,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/quick-add-event.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var morphs = new Array(1);
            morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            return morphs;
          },
          statements: [["content", "text.allDay", ["loc", [null, [30, 20], [30, 35]]]]],
          locals: [],
          templates: []
        };
      })();
      var child2 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 31,
                "column": 16
              },
              "end": {
                "line": 40,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/quick-add-event.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createComment("");
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("label");
            dom.setAttribute(el1, "for", "startTime");
            dom.setAttribute(el1, "class", "screenReaderText");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("span");
            dom.setAttribute(el1, "class", "dataPrefix");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n                    ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("div");
            dom.setAttribute(el1, "class", "endTime");
            var el2 = dom.createTextNode("\n                        ");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                        ");
            dom.appendChild(el1, el2);
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                        ");
            dom.appendChild(el1, el2);
            var el2 = dom.createElement("label");
            dom.setAttribute(el2, "for", "endTime");
            dom.setAttribute(el2, "class", "screenReaderText");
            var el3 = dom.createTextNode("  ");
            dom.appendChild(el2, el3);
            var el3 = dom.createComment("");
            dom.appendChild(el2, el3);
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n                    ");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element0 = dom.childAt(fragment, [7]);
            var morphs = new Array(6);
            morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
            morphs[1] = dom.createMorphAt(dom.childAt(fragment, [3]), 0, 0);
            morphs[2] = dom.createMorphAt(dom.childAt(fragment, [5]), 0, 0);
            morphs[3] = dom.createMorphAt(element0, 1, 1);
            morphs[4] = dom.createMorphAt(element0, 3, 3);
            morphs[5] = dom.createMorphAt(dom.childAt(element0, [5]), 1, 1);
            return morphs;
          },
          statements: [["inline", "input", [], ["type", "text", "aria-required", "true", "id", "startTime", "value", ["subexpr", "@mut", [["get", "startTime", ["loc", [null, [32, 82], [32, 91]]]]], [], []], "size", "8", "maxlength", "8"], ["loc", [null, [32, 20], [32, 116]]]], ["content", "text.startTime", ["loc", [null, [33, 68], [33, 86]]]], ["content", "text.until", ["loc", [null, [34, 45], [34, 59]]]], ["content", "endDay", ["loc", [null, [36, 24], [36, 34]]]], ["inline", "input", [], ["type", "text", "aria-required", "true", "id", "endTime", "value", ["subexpr", "@mut", [["get", "endTime", ["loc", [null, [37, 84], [37, 91]]]]], [], []], "size", "8", "maxlength", "8"], ["loc", [null, [37, 24], [37, 116]]]], ["content", "text.endTime", ["loc", [null, [38, 72], [38, 88]]]]],
          locals: [],
          templates: []
        };
      })();
      var child3 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 41,
                "column": 16
              },
              "end": {
                "line": 42,
                "column": 16
              }
            },
            "moduleName": "calendar/templates/components/quick-add-event.hbs"
          },
          isEmpty: true,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            return el0;
          },
          buildRenderNodes: function buildRenderNodes() {
            return [];
          },
          statements: [],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 3,
              "column": 4
            },
            "end": {
              "line": 59,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/quick-add-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("span");
          dom.setAttribute(el1, "class", "title");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "eventInfo");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "eventTitle");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "class", "dataPrefix");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode(":\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n\n                ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "class", "eventTitleInput");
          var el4 = dom.createTextNode("\n                    ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n                    ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("label");
          dom.setAttribute(el4, "for", "eventTitleText");
          dom.setAttribute(el4, "class", "screenReaderText");
          var el5 = dom.createComment("");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("                ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "clearfix");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n\n     ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "eventSchedulingInfo dayView");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("div");
          dom.setAttribute(el3, "class", "whenPrefix dataPrefix child");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode(":\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("div");
          var el4 = dom.createTextNode("\n               ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("span");
          var el5 = dom.createComment("");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "clearfix");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "eventRelatedActions");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "id", "quick-add-event-close");
          dom.setAttribute(el2, "class", "ember-action-link close-info");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "id", "addEvent");
          dom.setAttribute(el2, "class", "save");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("a");
          dom.setAttribute(el2, "class", "ember-view");
          dom.setAttribute(el2, "href", "#");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [3]);
          var element2 = dom.childAt(element1, [1]);
          var element3 = dom.childAt(element2, [3]);
          var element4 = dom.childAt(element1, [5]);
          var element5 = dom.childAt(element4, [3]);
          var element6 = dom.childAt(fragment, [5]);
          var element7 = dom.childAt(element6, [3]);
          var element8 = dom.childAt(element6, [5]);
          var morphs = new Array(15);
          morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
          morphs[1] = dom.createMorphAt(dom.childAt(element2, [1]), 1, 1);
          morphs[2] = dom.createMorphAt(element3, 1, 1);
          morphs[3] = dom.createMorphAt(dom.childAt(element3, [3]), 0, 0);
          morphs[4] = dom.createMorphAt(element3, 5, 5);
          morphs[5] = dom.createMorphAt(dom.childAt(element4, [1]), 1, 1);
          morphs[6] = dom.createAttrMorph(element5, 'class');
          morphs[7] = dom.createMorphAt(dom.childAt(element5, [1]), 0, 0);
          morphs[8] = dom.createMorphAt(element5, 3, 3);
          morphs[9] = dom.createMorphAt(element5, 4, 4);
          morphs[10] = dom.createMorphAt(dom.childAt(element6, [1]), 1, 1);
          morphs[11] = dom.createElementMorph(element7);
          morphs[12] = dom.createMorphAt(element7, 1, 1);
          morphs[13] = dom.createElementMorph(element8);
          morphs[14] = dom.createMorphAt(element8, 1, 1);
          return morphs;
        },
        statements: [["content", "text.addAnEvent", ["loc", [null, [6, 8], [6, 27]]]], ["content", "text.what", ["loc", [null, [11, 16], [11, 29]]]], ["inline", "input", [], ["id", "eventTitleText", "type", "text", "aria-required", "true", "enter", "goToAddEvent", "value", ["subexpr", "@mut", [["get", "eventTitle", ["loc", [null, [15, 108], [15, 118]]]]], [], []], "size", "30", "maxlength", "250"], ["loc", [null, [15, 20], [15, 146]]]], ["content", "text.eventNameDescription", ["loc", [null, [16, 73], [16, 102]]]], ["block", "validation-error", [], ["containerId", "nameEventError"], 0, null, ["loc", [null, [17, 20], [18, 41]]]], ["content", "text.when", ["loc", [null, [25, 16], [25, 29]]]], ["attribute", "class", ["concat", ["child ", ["subexpr", "if", [["get", "isAllDay", ["loc", [null, [27, 35], [27, 43]]]], "whenPrefix"], [], ["loc", [null, [27, 30], [27, 58]]]]]]], ["content", "startDay", ["loc", [null, [28, 21], [28, 33]]]], ["block", "if", [["get", "isAllDay", ["loc", [null, [29, 22], [29, 30]]]]], [], 1, 2, ["loc", [null, [29, 16], [40, 23]]]], ["block", "validation-error", [], ["containerId", "timeEventError"], 3, null, ["loc", [null, [41, 16], [42, 37]]]], ["content", "text.cancel", ["loc", [null, [50, 12], [50, 27]]]], ["element", "action", ["saveEvent"], [], ["loc", [null, [52, 43], [52, 66]]]], ["content", "text.addEvent", ["loc", [null, [53, 12], [53, 29]]]], ["element", "action", ["goToAddEvent"], [], ["loc", [null, [55, 39], [55, 64]]]], ["content", "text.advancedOptions", ["loc", [null, [56, 12], [56, 36]]]]],
        locals: [],
        templates: [child0, child1, child2, child3]
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 62,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/quick-add-event.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "hiddenPopup");
        dom.setAttribute(el1, "id", "quick-add-event-popup");
        var el2 = dom.createTextNode("\n\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "quick-add-event-placeholder");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(dom.childAt(fragment, [0]), 1, 1);
        return morphs;
      },
      statements: [["block", "if", [["get", "settings.operations.canadminevents", ["loc", [null, [3, 10], [3, 44]]]]], [], 0, null, ["loc", [null, [3, 4], [59, 11]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/select-days-of-week", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "missing-wrapper",
            "problems": ["multiple-nodes"]
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 15,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/select-days-of-week.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "select-days-of-week-days-container");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("span");
          dom.setAttribute(el2, "class", "select-days-of-week not-selected");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "select-days-of-week-buttons-container");
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "id", "confirmSelectDays");
          dom.setAttribute(el2, "class", "save button");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "id", "cancelSelectDay");
          dom.setAttribute(el2, "class", "ember-action-link link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [0]);
          var element1 = dom.childAt(fragment, [2]);
          var element2 = dom.childAt(element1, [1]);
          var element3 = dom.childAt(element1, [3]);
          var morphs = new Array(11);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element0, [3]), 0, 0);
          morphs[2] = dom.createMorphAt(dom.childAt(element0, [5]), 0, 0);
          morphs[3] = dom.createMorphAt(dom.childAt(element0, [7]), 0, 0);
          morphs[4] = dom.createMorphAt(dom.childAt(element0, [9]), 0, 0);
          morphs[5] = dom.createMorphAt(dom.childAt(element0, [11]), 0, 0);
          morphs[6] = dom.createMorphAt(dom.childAt(element0, [13]), 0, 0);
          morphs[7] = dom.createElementMorph(element2);
          morphs[8] = dom.createMorphAt(element2, 0, 0);
          morphs[9] = dom.createElementMorph(element3);
          morphs[10] = dom.createMorphAt(element3, 0, 0);
          return morphs;
        },
        statements: [["content", "text.su", ["loc", [null, [3, 51], [3, 62]]]], ["content", "text.m", ["loc", [null, [4, 51], [4, 61]]]], ["content", "text.tu", ["loc", [null, [5, 51], [5, 62]]]], ["content", "text.w", ["loc", [null, [6, 51], [6, 61]]]], ["content", "text.th", ["loc", [null, [7, 51], [7, 62]]]], ["content", "text.f", ["loc", [null, [8, 51], [8, 61]]]], ["content", "text.sa", ["loc", [null, [9, 51], [9, 62]]]], ["element", "action", ["confirm"], [], ["loc", [null, [12, 12], [12, 32]]]], ["content", "text.confirm", ["loc", [null, [12, 76], [12, 92]]]], ["element", "action", ["cancelClick"], [], ["loc", [null, [13, 12], [13, 36]]]], ["content", "text.cancel", ["loc", [null, [13, 89], [13, 104]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 15,
            "column": 17
          }
        },
        "moduleName": "calendar/templates/components/select-days-of-week.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["block", "simple-modal", [], ["enabled", false, "text", ["subexpr", "@mut", [["get", "text", ["loc", [null, [1, 35], [1, 39]]]]], [], []], "title", ["subexpr", "@mut", [["get", "text.selectDaysOfWeek", ["loc", [null, [1, 46], [1, 67]]]]], [], []], "onAfterRender", "onAfterRender", "id", "selectDaysOfWeekModal", "onCloseModal", "onClose"], 0, null, ["loc", [null, [1, 0], [15, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/share-url-button", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 3,
              "column": 0
            },
            "end": {
              "line": 10,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/share-url-button.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "content");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "footer centered");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [3, 1]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 1, 1);
          morphs[1] = dom.createElementMorph(element0);
          morphs[2] = dom.createMorphAt(element0, 0, 0);
          return morphs;
        },
        statements: [["inline", "input", [], ["type", "text", "class", "shareUrl", "value", ["subexpr", "@mut", [["get", "shareUrl", ["loc", [null, [5, 51], [5, 59]]]]], [], []], "size", "40", "readonly", "readonly"], ["loc", [null, [5, 8], [5, 91]]]], ["element", "action", ["toggleModal"], [], ["loc", [null, [8, 16], [8, 41]]]], ["content", "text.close", ["loc", [null, [8, 68], [8, 82]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["multiple-nodes", "wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 11,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/share-url-button.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("button");
        dom.setAttribute(el1, "class", "ember-action-link");
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element1 = dom.childAt(fragment, [0]);
        var morphs = new Array(3);
        morphs[0] = dom.createElementMorph(element1);
        morphs[1] = dom.createMorphAt(element1, 0, 0);
        morphs[2] = dom.createMorphAt(fragment, 2, 2, contextualElement);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["element", "action", ["toggleModal"], [], ["loc", [null, [1, 34], [1, 58]]]], ["content", "text.iCalFeed", ["loc", [null, [1, 59], [1, 76]]]], ["block", "simple-modal", [], ["enabled", false, "id", "share-url-modal", "title", ["subexpr", "@mut", [["get", "text.iCalFeed", ["loc", [null, [3, 57], [3, 70]]]]], [], []], "onAfterRender", "onAfterRender"], 0, null, ["loc", [null, [3, 0], [10, 17]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/simple-modal", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": {
            "name": "missing-wrapper",
            "problems": ["multiple-nodes"]
          },
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 1,
              "column": 0
            },
            "end": {
              "line": 29,
              "column": 0
            }
          },
          "moduleName": "calendar/templates/components/simple-modal.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-resizable center simple-modal");
          dom.setAttribute(el1, "style", "z-index: 101");
          dom.setAttribute(el1, "tabindex", "-1");
          dom.setAttribute(el1, "role", "dialog");
          dom.setAttribute(el1, "aria-describedby", "twModal");
          dom.setAttribute(el1, "aria-labelledby", "ui-id-2");
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ui-draggable-handle");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("span");
          dom.setAttribute(el3, "id", "ui-id-2");
          dom.setAttribute(el3, "class", "ui-dialog-title");
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n        ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("button");
          dom.setAttribute(el3, "type", "button");
          dom.setAttribute(el3, "class", "ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close");
          dom.setAttribute(el3, "role", "button");
          dom.setAttribute(el3, "title", "Close");
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("span");
          dom.setAttribute(el4, "class", "ui-button-icon-primary ui-icon ui-icon-closethick");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("span");
          dom.setAttribute(el4, "class", "ui-button-text");
          var el5 = dom.createTextNode("Close");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n        ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "ui-dialog-content ui-widget-content");
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "ui-widget-overlay ui-front");
          dom.setAttribute(el1, "style", "z-index: 100;");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [0]);
          var element1 = dom.childAt(element0, [2]);
          var element2 = dom.childAt(element1, [3]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(dom.childAt(element1, [1]), 1, 1);
          morphs[1] = dom.createElementMorph(element2);
          morphs[2] = dom.createMorphAt(dom.childAt(element0, [5]), 1, 1);
          return morphs;
        },
        statements: [["content", "title", ["loc", [null, [11, 12], [11, 21]]]], ["element", "action", ["closeModal"], [], ["loc", [null, [17, 16], [17, 40]]]], ["content", "yield", ["loc", [null, [24, 8], [24, 17]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "missing-wrapper",
          "problems": ["wrong-type"]
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 30,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/simple-modal.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment, 0, 0, contextualElement);
        dom.insertBoundary(fragment, 0);
        dom.insertBoundary(fragment, null);
        return morphs;
      },
      statements: [["block", "if", [["get", "enabled", ["loc", [null, [1, 6], [1, 13]]]]], [], 0, null, ["loc", [null, [1, 0], [29, 7]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/components/validation-error", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 10,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/components/validation-error.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "validation-error-container");
        dom.setAttribute(el1, "role", "alert");
        dom.setAttribute(el1, "style", "display:none;");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("i");
        dom.setAttribute(el2, "class", "glyphicon glyphicon-exclamation-sign error-icon");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("span");
        dom.setAttribute(el2, "id", "validation-error-text");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    \n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createAttrMorph(element0, 'id');
        morphs[1] = dom.createMorphAt(dom.childAt(element0, [3]), 0, 0);
        return morphs;
      },
      statements: [["attribute", "id", ["concat", [["get", "containerId", ["loc", [null, [2, 11], [2, 22]]]]]]], ["content", "errorMessage", ["loc", [null, [6, 37], [6, 53]]]]],
      locals: [],
      templates: []
    };
  })());
});
define("calendar/templates/components/view-event", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 21,
              "column": 16
            },
            "end": {
              "line": 34,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/view-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("label");
          dom.setAttribute(el3, "for", "eventCalendar");
          var el4 = dom.createTextNode("\n                            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("label");
          dom.setAttribute(el4, "for", "available-calendars-select");
          var el5 = dom.createTextNode("\n                                ");
          dom.appendChild(el4, el5);
          var el5 = dom.createComment("");
          dom.appendChild(el4, el5);
          var el5 = dom.createTextNode("\n                            ");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n                        ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "eventInfo");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element3 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element3, [1, 1, 1]), 1, 1);
          morphs[1] = dom.createMorphAt(dom.childAt(element3, [3]), 1, 1);
          return morphs;
        },
        statements: [["content", "text.whichCalendar", ["loc", [null, [26, 32], [26, 54]]]], ["content", "event.calendarName", ["loc", [null, [31, 24], [31, 46]]]]],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 35,
              "column": 16
            },
            "end": {
              "line": 46,
              "column": 16
            }
          },
          "moduleName": "calendar/templates/components/view-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "section");
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "label");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("label");
          dom.setAttribute(el3, "for", "eventDescription");
          var el4 = dom.createTextNode("\n                            ");
          dom.appendChild(el3, el4);
          var el4 = dom.createComment("");
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n                        ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                    ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "eventInfo wysiwygtext");
          var el3 = dom.createTextNode("\n                        ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element2 = dom.childAt(fragment, [1]);
          var morphs = new Array(2);
          morphs[0] = dom.createMorphAt(dom.childAt(element2, [1, 1]), 1, 1);
          morphs[1] = dom.createUnsafeMorphAt(dom.childAt(element2, [3]), 1, 1);
          return morphs;
        },
        statements: [["content", "text.description", ["loc", [null, [39, 28], [39, 48]]]], ["content", "event.description", ["loc", [null, [43, 24], [43, 47]]]]],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 80,
              "column": 24
            },
            "end": {
              "line": 82,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/view-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "event.endDisplay", ["loc", [null, [81, 28], [81, 48]]]]],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 82,
              "column": 24
            },
            "end": {
              "line": 84,
              "column": 24
            }
          },
          "moduleName": "calendar/templates/components/view-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("                            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "event.startDisplay", ["loc", [null, [83, 28], [83, 50]]]]],
        locals: [],
        templates: []
      };
    })();
    var child4 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 91,
              "column": 4
            },
            "end": {
              "line": 110,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/components/view-event.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "form-row");
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "form-label-container");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("div");
          dom.setAttribute(el3, "class", "section");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("span");
          dom.setAttribute(el4, "class", "label large-label");
          var el5 = dom.createComment("");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("div");
          dom.setAttribute(el2, "class", "form-field-container");
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("div");
          dom.setAttribute(el3, "class", "form-fields-container");
          var el4 = dom.createTextNode("\n                ");
          dom.appendChild(el3, el4);
          var el4 = dom.createElement("div");
          dom.setAttribute(el4, "class", "section");
          var el5 = dom.createTextNode("\n                    ");
          dom.appendChild(el4, el5);
          var el5 = dom.createElement("div");
          dom.setAttribute(el5, "class", "label");
          var el6 = dom.createTextNode("\n                        ");
          dom.appendChild(el5, el6);
          var el6 = dom.createElement("label");
          dom.setAttribute(el6, "for", "location");
          var el7 = dom.createComment("");
          dom.appendChild(el6, el7);
          dom.appendChild(el5, el6);
          var el6 = dom.createTextNode("\n                    ");
          dom.appendChild(el5, el6);
          dom.appendChild(el4, el5);
          var el5 = dom.createTextNode("\n                    ");
          dom.appendChild(el4, el5);
          var el5 = dom.createElement("div");
          dom.setAttribute(el5, "class", "eventInfo");
          var el6 = dom.createComment("");
          dom.appendChild(el5, el6);
          dom.appendChild(el4, el5);
          var el5 = dom.createTextNode("\n                ");
          dom.appendChild(el4, el5);
          dom.appendChild(el3, el4);
          var el4 = dom.createTextNode("\n            ");
          dom.appendChild(el3, el4);
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n        ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "clearBoth");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var element1 = dom.childAt(element0, [3, 1, 1]);
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(dom.childAt(element0, [1, 1, 1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(element1, [1, 1]), 0, 0);
          morphs[2] = dom.createMorphAt(dom.childAt(element1, [3]), 0, 0);
          return morphs;
        },
        statements: [["content", "text.where", ["loc", [null, [95, 48], [95, 62]]]], ["content", "text.whereWillEventTakePlace", ["loc", [null, [102, 46], [102, 78]]]], ["content", "event.location", ["loc", [null, [104, 43], [104, 61]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 123,
            "column": 28
          }
        },
        "moduleName": "calendar/templates/components/view-event.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "form-container");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "add-event-what-label-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("span");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createComment("");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "title");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "eventInfo");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "class", "section");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "label large-label");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("span");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("div");
        dom.setAttribute(el4, "id", "datePairContainer");
        dom.setAttribute(el4, "class", "form-fields-container");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "startDate");
        dom.setAttribute(el7, "class", "label");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "eventInfo");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createElement("div");
        dom.setAttribute(el5, "class", "section");
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "label");
        var el7 = dom.createTextNode("\n                        ");
        dom.appendChild(el6, el7);
        var el7 = dom.createElement("label");
        dom.setAttribute(el7, "for", "endDate");
        dom.setAttribute(el7, "class", "label");
        var el8 = dom.createTextNode("\n                            ");
        dom.appendChild(el7, el8);
        var el8 = dom.createComment("");
        dom.appendChild(el7, el8);
        var el8 = dom.createTextNode("\n                        ");
        dom.appendChild(el7, el8);
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("\n                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                    ");
        dom.appendChild(el5, el6);
        var el6 = dom.createElement("div");
        dom.setAttribute(el6, "class", "eventInfo");
        var el7 = dom.createTextNode("\n");
        dom.appendChild(el6, el7);
        var el7 = dom.createComment("");
        dom.appendChild(el6, el7);
        var el7 = dom.createTextNode("                    ");
        dom.appendChild(el6, el7);
        dom.appendChild(el5, el6);
        var el6 = dom.createTextNode("\n                ");
        dom.appendChild(el5, el6);
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "form-row");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-label-container");
        var el4 = dom.createTextNode("\n             \n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "form-field-container save-button");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createElement("a");
        dom.setAttribute(el4, "href", "#");
        var el5 = dom.createTextNode("\n                ");
        dom.appendChild(el4, el5);
        var el5 = dom.createComment("");
        dom.appendChild(el4, el5);
        var el5 = dom.createTextNode("\n            ");
        dom.appendChild(el4, el5);
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n                            ");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element4 = dom.childAt(fragment, [1]);
        var element5 = dom.childAt(element4, [1]);
        var element6 = dom.childAt(element5, [3, 1]);
        var element7 = dom.childAt(element6, [1]);
        var element8 = dom.childAt(element4, [5]);
        var element9 = dom.childAt(element8, [3, 1]);
        var element10 = dom.childAt(element9, [1]);
        var element11 = dom.childAt(element9, [3]);
        var element12 = dom.childAt(element4, [11, 3, 1]);
        var morphs = new Array(13);
        morphs[0] = dom.createMorphAt(dom.childAt(element5, [1, 1, 1]), 0, 0);
        morphs[1] = dom.createMorphAt(dom.childAt(element7, [1, 1]), 1, 1);
        morphs[2] = dom.createMorphAt(dom.childAt(element7, [3]), 1, 1);
        morphs[3] = dom.createMorphAt(element6, 3, 3);
        morphs[4] = dom.createMorphAt(element6, 4, 4);
        morphs[5] = dom.createMorphAt(dom.childAt(element8, [1, 1, 1, 1]), 1, 1);
        morphs[6] = dom.createMorphAt(dom.childAt(element10, [1, 1]), 1, 1);
        morphs[7] = dom.createMorphAt(dom.childAt(element10, [3]), 1, 1);
        morphs[8] = dom.createMorphAt(dom.childAt(element11, [1, 1]), 1, 1);
        morphs[9] = dom.createMorphAt(dom.childAt(element11, [3]), 1, 1);
        morphs[10] = dom.createMorphAt(element4, 9, 9);
        morphs[11] = dom.createElementMorph(element12);
        morphs[12] = dom.createMorphAt(element12, 1, 1);
        return morphs;
      },
      statements: [["content", "text.what", ["loc", [null, [6, 48], [6, 61]]]], ["content", "text.eventNameDescription", ["loc", [null, [14, 28], [14, 57]]]], ["content", "event.title", ["loc", [null, [18, 24], [18, 39]]]], ["block", "if", [["get", "event.calendarName", ["loc", [null, [21, 22], [21, 40]]]]], [], 0, null, ["loc", [null, [21, 16], [34, 23]]]], ["block", "if", [["get", "event.description", ["loc", [null, [35, 22], [35, 39]]]]], [], 1, null, ["loc", [null, [35, 16], [46, 23]]]], ["content", "text.when", ["loc", [null, [56, 24], [56, 37]]]], ["content", "text.startDate", ["loc", [null, [66, 28], [66, 46]]]], ["content", "event.startDisplay", ["loc", [null, [70, 24], [70, 46]]]], ["content", "text.endDate", ["loc", [null, [76, 28], [76, 44]]]], ["block", "if", [["get", "event.endDisplay", ["loc", [null, [80, 30], [80, 46]]]]], [], 2, 3, ["loc", [null, [80, 24], [84, 31]]]], ["block", "if", [["get", "event.location", ["loc", [null, [91, 10], [91, 24]]]]], [], 4, null, ["loc", [null, [91, 4], [110, 11]]]], ["element", "action", ["goBack"], [], ["loc", [null, [116, 24], [116, 44]]]], ["content", "text.goBack", ["loc", [null, [117, 16], [117, 31]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4]
    };
  })());
});
define("calendar/templates/event/add", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 4
            },
            "end": {
              "line": 19,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/event/add.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 20,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/event/add.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "add-event-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.addAnEvent", ["loc", [null, [3, 8], [3, 33]]]], ["block", "manage-event", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [6, 13], [6, 23]]]]], [], []], "selectedCalendarId", ["subexpr", "@mut", [["get", "selectedCalendarId", ["loc", [null, [7, 27], [7, 45]]]]], [], []], "availableIntervalOptions", ["subexpr", "@mut", [["get", "availableIntervalOptions", ["loc", [null, [8, 33], [8, 57]]]]], [], []], "availableFrequencyOptions", ["subexpr", "@mut", [["get", "availableFrequencyOptions", ["loc", [null, [9, 34], [9, 59]]]]], [], []], "saveEvent", "saveEvent", "cancel", "cancel", "selectedCalendarName", ["subexpr", "@mut", [["get", "selectedCalendarName", ["loc", [null, [12, 29], [12, 49]]]]], [], []], "onlyOneCalendar", ["subexpr", "@mut", [["get", "onlyOneCalendar", ["loc", [null, [13, 24], [13, 39]]]]], [], []], "event", ["subexpr", "@mut", [["get", "model.event", ["loc", [null, [14, 14], [14, 25]]]]], [], []], "title", ["subexpr", "@mut", [["get", "model.event.title", ["loc", [null, [15, 14], [15, 31]]]]], [], []], "description", ["subexpr", "@mut", [["get", "model.event.description", ["loc", [null, [16, 20], [16, 43]]]]], [], []], "location", ["subexpr", "@mut", [["get", "model.event.location", ["loc", [null, [17, 17], [17, 37]]]]], [], []]], 0, null, ["loc", [null, [5, 4], [19, 21]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/event/edit", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 4
            },
            "end": {
              "line": 23,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/event/edit.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 24,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/event/edit.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "edit-event-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.editEvent", ["loc", [null, [3, 8], [3, 32]]]], ["block", "manage-event", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [6, 13], [6, 23]]]]], [], []], "selectedCalendarId", ["subexpr", "@mut", [["get", "selectedCalendarId", ["loc", [null, [7, 27], [7, 45]]]]], [], []], "saveEvent", "saveEvent", "cancel", "cancel", "updateEvent", "updateEvent", "updateSeries", "updateSeries", "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "selectedCalendarName", ["subexpr", "@mut", [["get", "selectedCalendarName", ["loc", [null, [14, 29], [14, 49]]]]], [], []], "onlyOneCalendar", ["subexpr", "@mut", [["get", "onlyOneCalendar", ["loc", [null, [15, 24], [15, 39]]]]], [], []], "event", ["subexpr", "@mut", [["get", "model.event", ["loc", [null, [16, 14], [16, 25]]]]], [], []], "title", ["subexpr", "@mut", [["get", "model.event.title", ["loc", [null, [17, 14], [17, 31]]]]], [], []], "description", ["subexpr", "@mut", [["get", "model.event.description", ["loc", [null, [18, 20], [18, 43]]]]], [], []], "location", ["subexpr", "@mut", [["get", "model.event.location", ["loc", [null, [19, 17], [19, 37]]]]], [], []], "isEdit", true, "isEditSeries", ["subexpr", "@mut", [["get", "model.isEditSeries", ["loc", [null, [21, 21], [21, 39]]]]], [], []]], 0, null, ["loc", [null, [5, 4], [23, 21]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/event/view", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 6,
              "column": 4
            },
            "end": {
              "line": 7,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/event/view.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 9,
            "column": 0
          }
        },
        "moduleName": "calendar/templates/event/view.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "view-event-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.viewEvent", ["loc", [null, [3, 8], [3, 32]]]], ["block", "view-event", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [6, 23], [6, 33]]]]], [], []], "event", ["subexpr", "@mut", [["get", "model", ["loc", [null, [6, 40], [6, 45]]]]], [], []], "goBack", "goBack"], 0, null, ["loc", [null, [6, 4], [7, 19]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/exi-event/view", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 2,
              "column": 2
            },
            "end": {
              "line": 3,
              "column": 2
            }
          },
          "moduleName": "calendar/templates/exi-event/view.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 4,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/exi-event/view.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "id", "exi-event-details");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(dom.childAt(fragment, [0]), 1, 1);
        return morphs;
      },
      statements: [["block", "exi-event-info", [], ["exiEvent", ["subexpr", "@mut", [["get", "model.exiEvent", ["loc", [null, [2, 29], [2, 43]]]]], [], []], "text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [2, 49], [2, 59]]]]], [], []], "goBack", "goBack"], 0, null, ["loc", [null, [2, 2], [3, 21]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
define("calendar/templates/index", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 4,
              "column": 12
            },
            "end": {
              "line": 5,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/index.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 8,
              "column": 12
            },
            "end": {
              "line": 14,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/index.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "add-event-button-container");
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "save");
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [1, 1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element1);
          morphs[1] = dom.createMorphAt(element1, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["goToAddEvent"], [], ["loc", [null, [10, 37], [10, 62]]]], ["content", "model.text.addAnEvent", ["loc", [null, [11, 20], [11, 45]]]]],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 15,
              "column": 12
            },
            "end": {
              "line": 21,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/index.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("div");
          dom.setAttribute(el1, "class", "add-calendar-button-container");
          var el2 = dom.createTextNode("\n                ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "save");
          var el3 = dom.createTextNode("\n                    ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1, 1]);
          var morphs = new Array(2);
          morphs[0] = dom.createElementMorph(element0);
          morphs[1] = dom.createMorphAt(element0, 1, 1);
          return morphs;
        },
        statements: [["element", "action", ["goToAddCalendar"], [], ["loc", [null, [17, 37], [17, 65]]]], ["content", "model.text.addACalendar", ["loc", [null, [18, 20], [18, 47]]]]],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 22,
              "column": 12
            },
            "end": {
              "line": 32,
              "column": 12
            }
          },
          "moduleName": "calendar/templates/index.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child4 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 40,
              "column": 8
            },
            "end": {
              "line": 53,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/index.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 55,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/index.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "main-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "main-view-header");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "main-view-left-column");
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("div");
        dom.setAttribute(el3, "class", "main-view-right-column");
        var el4 = dom.createTextNode("\n");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        dom.setAttribute(el2, "class", "clearBoth");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element2 = dom.childAt(fragment, [0]);
        var element3 = dom.childAt(element2, [1]);
        var element4 = dom.childAt(element3, [3]);
        var morphs = new Array(5);
        morphs[0] = dom.createMorphAt(dom.childAt(element3, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element4, 1, 1);
        morphs[2] = dom.createMorphAt(element4, 2, 2);
        morphs[3] = dom.createMorphAt(element4, 3, 3);
        morphs[4] = dom.createMorphAt(dom.childAt(element2, [5]), 1, 1);
        return morphs;
      },
      statements: [["block", "date-range", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [4, 31], [4, 41]]]]], [], []]], 0, null, ["loc", [null, [4, 12], [5, 27]]]], ["block", "if", [["get", "model.settings.operations.canadminevents", ["loc", [null, [8, 18], [8, 58]]]]], [], 1, null, ["loc", [null, [8, 12], [14, 19]]]], ["block", "if", [["get", "model.settings.operations.canadmincalendars", ["loc", [null, [15, 18], [15, 61]]]]], [], 2, null, ["loc", [null, [15, 12], [21, 19]]]], ["block", "included-calendars", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [23, 21], [23, 31]]]]], [], []], "calendars", ["subexpr", "@mut", [["get", "model.calendars", ["loc", [null, [24, 26], [24, 41]]]]], [], []], "isGuest", ["subexpr", "@mut", [["get", "model.isGuest", ["loc", [null, [25, 24], [25, 37]]]]], [], []], "isMyPages", ["subexpr", "@mut", [["get", "model.isMyPages", ["loc", [null, [26, 26], [26, 41]]]]], [], []], "updateFullCalendar", "updateFullCalendar", "subscribe", "subscribe", "removeCalendar", "removeCalendar", "settings", ["subexpr", "@mut", [["get", "model.settings", ["loc", [null, [30, 25], [30, 39]]]]], [], []]], 3, null, ["loc", [null, [22, 12], [32, 35]]]], ["block", "full-calendar", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [41, 17], [41, 27]]]]], [], []], "calendars", ["subexpr", "@mut", [["get", "model.calendars", ["loc", [null, [42, 22], [42, 37]]]]], [], []], "settings", ["subexpr", "@mut", [["get", "model.settings", ["loc", [null, [43, 21], [43, 35]]]]], [], []], "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "editEvent", "editEvent", "editOccurence", "editOccurence", "editSeries", "editSeries", "addEvent", "addEvent", "quickAddEventToAdd", "quickAddEventToAdd", "updateEvent", "updateEvent"], 4, null, ["loc", [null, [40, 8], [53, 27]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4]
    };
  })());
});
define("calendar/templates/manage-my-calendar", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 8
            },
            "end": {
              "line": 7,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("input");
          dom.setAttribute(el1, "id", "enableCalendarFeed");
          dom.setAttribute(el1, "type", "checkbox");
          dom.setAttribute(el1, "checked", "checked");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          if (this.cachedFragment) {
            dom.repairClonedNode(dom.childAt(fragment, [1]), [], true);
          }
          var element8 = dom.childAt(fragment, [1]);
          var morphs = new Array(1);
          morphs[0] = dom.createElementMorph(element8);
          return morphs;
        },
        statements: [["element", "action", ["toggleFeed"], [], ["loc", [null, [6, 59], [6, 82]]]]],
        locals: [],
        templates: []
      };
    })();
    var child1 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 7,
              "column": 8
            },
            "end": {
              "line": 9,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("            ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("input");
          dom.setAttribute(el1, "id", "enableCalendarFeed");
          dom.setAttribute(el1, "type", "checkbox");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element7 = dom.childAt(fragment, [1]);
          var morphs = new Array(1);
          morphs[0] = dom.createElementMorph(element7);
          return morphs;
        },
        statements: [["element", "action", ["toggleFeed"], [], ["loc", [null, [8, 59], [8, 82]]]]],
        locals: [],
        templates: []
      };
    })();
    var child2 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 14,
              "column": 4
            },
            "end": {
              "line": 15,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    var child3 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 20,
                "column": 8
              },
              "end": {
                "line": 30,
                "column": 8
              }
            },
            "moduleName": "calendar/templates/manage-my-calendar.hbs"
          },
          isEmpty: false,
          arity: 1,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("        ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("li");
            var el2 = dom.createTextNode("\n            ");
            dom.appendChild(el1, el2);
            var el2 = dom.createElement("button");
            var el3 = dom.createTextNode("\n                ");
            dom.appendChild(el2, el3);
            var el3 = dom.createElement("i");
            dom.setAttribute(el3, "class", "glyphicon glyphicon-eye-open");
            dom.appendChild(el2, el3);
            var el3 = dom.createTextNode("\n                ");
            dom.appendChild(el2, el3);
            var el3 = dom.createComment("");
            dom.appendChild(el2, el3);
            var el3 = dom.createTextNode("\n            ");
            dom.appendChild(el2, el3);
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n            |\n            ");
            dom.appendChild(el1, el2);
            var el2 = dom.createElement("a");
            dom.setAttribute(el2, "target", "_blank");
            var el3 = dom.createComment("");
            dom.appendChild(el2, el3);
            dom.appendChild(el1, el2);
            var el2 = dom.createTextNode("\n        ");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element4 = dom.childAt(fragment, [1]);
            var element5 = dom.childAt(element4, [1]);
            var element6 = dom.childAt(element4, [3]);
            var morphs = new Array(5);
            morphs[0] = dom.createAttrMorph(element5, 'class');
            morphs[1] = dom.createElementMorph(element5);
            morphs[2] = dom.createMorphAt(element5, 3, 3);
            morphs[3] = dom.createAttrMorph(element6, 'href');
            morphs[4] = dom.createMorphAt(element6, 0, 0);
            return morphs;
          },
          statements: [["attribute", "class", ["concat", ["ember-action-link included-calendars ", ["subexpr", "if", [["get", "sub.isVisible", ["loc", [null, [23, 69], [23, 82]]]], "enabled-calendar", "disabled-calendar"], [], ["loc", [null, [23, 64], [23, 123]]]]]]], ["element", "action", ["toggleVisible", ["get", "sub", ["loc", [null, [22, 45], [22, 48]]]]], [], ["loc", [null, [22, 20], [22, 51]]]], ["content", "sub.calendarName", ["loc", [null, [25, 16], [25, 36]]]], ["attribute", "href", ["get", "sub.portletUrl", ["loc", [null, [28, 22], [28, 36]]]]], ["content", "model.text.viewSection", ["loc", [null, [28, 55], [28, 81]]]]],
          locals: ["sub"],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 16,
              "column": 4
            },
            "end": {
              "line": 32,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("h5");
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("p");
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n    ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("ul");
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("    ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(3);
          morphs[0] = dom.createMorphAt(dom.childAt(fragment, [1]), 0, 0);
          morphs[1] = dom.createMorphAt(dom.childAt(fragment, [3]), 0, 0);
          morphs[2] = dom.createMorphAt(dom.childAt(fragment, [5]), 1, 1);
          return morphs;
        },
        statements: [["content", "model.text.autoIncluded", ["loc", [null, [17, 8], [17, 35]]]], ["content", "model.text.autoSubscribedCalendars", ["loc", [null, [18, 7], [18, 45]]]], ["block", "each", [["get", "model.autoSubs", ["loc", [null, [20, 16], [20, 30]]]]], [], 0, null, ["loc", [null, [20, 8], [30, 17]]]]],
        locals: [],
        templates: [child0]
      };
    })();
    var child4 = (function () {
      var child0 = (function () {
        return {
          meta: {
            "fragmentReason": false,
            "revision": "Ember@2.6.2",
            "loc": {
              "source": null,
              "start": {
                "line": 43,
                "column": 12
              },
              "end": {
                "line": 46,
                "column": 12
              }
            },
            "moduleName": "calendar/templates/manage-my-calendar.hbs"
          },
          isEmpty: false,
          arity: 0,
          cachedFragment: null,
          hasRendered: false,
          buildFragment: function buildFragment(dom) {
            var el0 = dom.createDocumentFragment();
            var el1 = dom.createTextNode("            |\n            ");
            dom.appendChild(el0, el1);
            var el1 = dom.createElement("a");
            dom.setAttribute(el1, "target", "_blank");
            var el2 = dom.createComment("");
            dom.appendChild(el1, el2);
            dom.appendChild(el0, el1);
            var el1 = dom.createTextNode("\n");
            dom.appendChild(el0, el1);
            return el0;
          },
          buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
            var element0 = dom.childAt(fragment, [1]);
            var morphs = new Array(2);
            morphs[0] = dom.createAttrMorph(element0, 'href');
            morphs[1] = dom.createMorphAt(element0, 0, 0);
            return morphs;
          },
          statements: [["attribute", "href", ["get", "sub.portletUrl", ["loc", [null, [45, 22], [45, 36]]]]], ["content", "model.text.viewCalendar", ["loc", [null, [45, 55], [45, 82]]]]],
          locals: [],
          templates: []
        };
      })();
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 36,
              "column": 8
            },
            "end": {
              "line": 50,
              "column": 8
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: false,
        arity: 1,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("        ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("li");
          var el2 = dom.createTextNode("\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          var el3 = dom.createTextNode("\n                ");
          dom.appendChild(el2, el3);
          var el3 = dom.createElement("i");
          dom.setAttribute(el3, "class", "glyphicon glyphicon-eye-open");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n                ");
          dom.appendChild(el2, el3);
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          var el3 = dom.createTextNode("\n            ");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n");
          dom.appendChild(el1, el2);
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("            |\n            ");
          dom.appendChild(el1, el2);
          var el2 = dom.createElement("button");
          dom.setAttribute(el2, "class", "ember-action-link");
          var el3 = dom.createComment("");
          dom.appendChild(el2, el3);
          dom.appendChild(el1, el2);
          var el2 = dom.createTextNode("\n        ");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element1 = dom.childAt(fragment, [1]);
          var element2 = dom.childAt(element1, [1]);
          var element3 = dom.childAt(element1, [5]);
          var morphs = new Array(6);
          morphs[0] = dom.createAttrMorph(element2, 'class');
          morphs[1] = dom.createElementMorph(element2);
          morphs[2] = dom.createMorphAt(element2, 3, 3);
          morphs[3] = dom.createMorphAt(element1, 3, 3);
          morphs[4] = dom.createElementMorph(element3);
          morphs[5] = dom.createMorphAt(element3, 0, 0);
          return morphs;
        },
        statements: [["attribute", "class", ["concat", ["ember-action-link included-calendars ", ["subexpr", "if", [["get", "sub.isVisible", ["loc", [null, [39, 67], [39, 80]]]], "enabled-calendar", "disabled-calendar"], [], ["loc", [null, [39, 62], [39, 121]]]]]]], ["element", "action", ["toggleVisible", ["get", "sub", ["loc", [null, [38, 45], [38, 48]]]]], [], ["loc", [null, [38, 20], [38, 51]]]], ["content", "sub.calendarName", ["loc", [null, [41, 16], [41, 36]]]], ["block", "unless", [["get", "sub.isCurrentPortlet", ["loc", [null, [43, 22], [43, 42]]]]], [], 0, null, ["loc", [null, [43, 12], [46, 23]]]], ["element", "action", ["unsubscribe", ["get", "sub", ["loc", [null, [48, 43], [48, 46]]]]], [], ["loc", [null, [48, 20], [48, 49]]]], ["content", "model.text.unsubscribe", ["loc", [null, [48, 76], [48, 102]]]]],
        locals: ["sub"],
        templates: [child0]
      };
    })();
    var child5 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 52,
              "column": 4
            },
            "end": {
              "line": 54,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/manage-my-calendar.hbs"
        },
        isEmpty: false,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("        ");
          dom.appendChild(el0, el1);
          var el1 = dom.createComment("");
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var morphs = new Array(1);
          morphs[0] = dom.createMorphAt(fragment, 1, 1, contextualElement);
          return morphs;
        },
        statements: [["content", "model.text.noCurrentSubs", ["loc", [null, [53, 8], [53, 36]]]]],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 60,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/manage-my-calendar.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "manage-my-calendar-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("p");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("div");
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("label");
        dom.setAttribute(el3, "for", "enableCalendarFeed");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h5");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("p");
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("ul");
        var el3 = dom.createTextNode("\n");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("p");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createElement("a");
        dom.setAttribute(el3, "href", "#");
        var el4 = dom.createTextNode("\n            ");
        dom.appendChild(el3, el4);
        var el4 = dom.createComment("");
        dom.appendChild(el3, el4);
        var el4 = dom.createTextNode("\n        ");
        dom.appendChild(el3, el4);
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element9 = dom.childAt(fragment, [0]);
        var element10 = dom.childAt(element9, [5]);
        var element11 = dom.childAt(element9, [18, 1]);
        var morphs = new Array(12);
        morphs[0] = dom.createMorphAt(dom.childAt(element9, [1]), 0, 0);
        morphs[1] = dom.createMorphAt(dom.childAt(element9, [3]), 0, 0);
        morphs[2] = dom.createMorphAt(element10, 1, 1);
        morphs[3] = dom.createMorphAt(dom.childAt(element10, [3]), 1, 1);
        morphs[4] = dom.createMorphAt(element9, 7, 7);
        morphs[5] = dom.createMorphAt(element9, 8, 8);
        morphs[6] = dom.createMorphAt(dom.childAt(element9, [10]), 0, 0);
        morphs[7] = dom.createMorphAt(dom.childAt(element9, [12]), 0, 0);
        morphs[8] = dom.createMorphAt(dom.childAt(element9, [14]), 1, 1);
        morphs[9] = dom.createMorphAt(element9, 16, 16);
        morphs[10] = dom.createElementMorph(element11);
        morphs[11] = dom.createMorphAt(element11, 1, 1);
        return morphs;
      },
      statements: [["content", "model.text.myCalendarFeed", ["loc", [null, [2, 8], [2, 37]]]], ["content", "model.text.myCalendarFeedDesc", ["loc", [null, [3, 7], [3, 40]]]], ["block", "if", [["get", "model.set.availableAsICalendarFeed", ["loc", [null, [5, 14], [5, 48]]]]], [], 0, 1, ["loc", [null, [5, 8], [9, 15]]]], ["content", "model.text.publishMyFeed", ["loc", [null, [11, 12], [11, 40]]]], ["block", "my-calendar-feed-url", [], ["model", ["subexpr", "@mut", [["get", "model", ["loc", [null, [14, 34], [14, 39]]]]], [], []]], 2, null, ["loc", [null, [14, 4], [15, 29]]]], ["block", "if", [["get", "model.autoSubs", ["loc", [null, [16, 10], [16, 24]]]]], [], 3, null, ["loc", [null, [16, 4], [32, 11]]]], ["content", "model.text.addedByYou", ["loc", [null, [33, 8], [33, 33]]]], ["content", "model.text.subscribedCalendars", ["loc", [null, [34, 7], [34, 41]]]], ["block", "each", [["get", "model.subs", ["loc", [null, [36, 16], [36, 26]]]]], [], 4, null, ["loc", [null, [36, 8], [50, 17]]]], ["block", "unless", [["get", "model.subs", ["loc", [null, [52, 14], [52, 24]]]]], [], 5, null, ["loc", [null, [52, 4], [54, 15]]]], ["element", "action", ["goBack"], [], ["loc", [null, [56, 20], [56, 40]]]], ["content", "model.text.goBack", ["loc", [null, [57, 12], [57, 33]]]]],
      locals: [],
      templates: [child0, child1, child2, child3, child4, child5]
    };
  })());
});
define("calendar/templates/recurring-event/edit", ["exports"], function (exports) {
  exports["default"] = Ember.HTMLBars.template((function () {
    var child0 = (function () {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.2",
          "loc": {
            "source": null,
            "start": {
              "line": 5,
              "column": 4
            },
            "end": {
              "line": 21,
              "column": 4
            }
          },
          "moduleName": "calendar/templates/recurring-event/edit.hbs"
        },
        isEmpty: true,
        arity: 0,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          return el0;
        },
        buildRenderNodes: function buildRenderNodes() {
          return [];
        },
        statements: [],
        locals: [],
        templates: []
      };
    })();
    return {
      meta: {
        "fragmentReason": {
          "name": "triple-curlies"
        },
        "revision": "Ember@2.6.2",
        "loc": {
          "source": null,
          "start": {
            "line": 1,
            "column": 0
          },
          "end": {
            "line": 22,
            "column": 6
          }
        },
        "moduleName": "calendar/templates/recurring-event/edit.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createElement("div");
        dom.setAttribute(el1, "class", "edit-event-view");
        var el2 = dom.createTextNode("\n    ");
        dom.appendChild(el1, el2);
        var el2 = dom.createElement("h4");
        var el3 = dom.createTextNode("\n        ");
        dom.appendChild(el2, el3);
        var el3 = dom.createComment("");
        dom.appendChild(el2, el3);
        var el3 = dom.createTextNode("\n    ");
        dom.appendChild(el2, el3);
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element0 = dom.childAt(fragment, [0]);
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(dom.childAt(element0, [1]), 1, 1);
        morphs[1] = dom.createMorphAt(element0, 3, 3);
        return morphs;
      },
      statements: [["content", "model.text.editEvent", ["loc", [null, [3, 8], [3, 32]]]], ["block", "manage-event", [], ["text", ["subexpr", "@mut", [["get", "model.text", ["loc", [null, [6, 13], [6, 23]]]]], [], []], "selectedCalendarId", ["subexpr", "@mut", [["get", "selectedCalendarId", ["loc", [null, [7, 27], [7, 45]]]]], [], []], "saveEvent", "saveEvent", "updateEvent", "updateEvent", "deleteEvent", "deleteEvent", "deleteRecurringEvent", "deleteRecurringEvent", "selectedCalendarName", ["subexpr", "@mut", [["get", "selectedCalendarName", ["loc", [null, [12, 29], [12, 49]]]]], [], []], "onlyOneCalendar", ["subexpr", "@mut", [["get", "onlyOneCalendar", ["loc", [null, [13, 24], [13, 39]]]]], [], []], "event", ["subexpr", "@mut", [["get", "model.event", ["loc", [null, [14, 14], [14, 25]]]]], [], []], "title", ["subexpr", "@mut", [["get", "model.event.title", ["loc", [null, [15, 14], [15, 31]]]]], [], []], "description", ["subexpr", "@mut", [["get", "model.event.description", ["loc", [null, [16, 20], [16, 43]]]]], [], []], "location", ["subexpr", "@mut", [["get", "model.event.location", ["loc", [null, [17, 17], [17, 37]]]]], [], []], "isEdit", true, "isEditSeries", true], 0, null, ["loc", [null, [5, 4], [21, 21]]]]],
      locals: [],
      templates: [child0]
    };
  })());
});
/* jshint ignore:start */



/* jshint ignore:end */

/* jshint ignore:start */

define('calendar/config/environment', ['ember'], function(Ember) {
  return { 'default': {"modulePrefix":"calendar","environment":"production","baseURL":"/","locationType":"hash","EmberENV":{"FEATURES":{}},"APP":{"name":"calendar","version":"1.1.0+"},"exportApplicationGlobal":false}};
});

/* jshint ignore:end */

/* jshint ignore:start */

if (!runningTests) {
  require("calendar/app")["default"].create({"name":"calendar","version":"1.1.0+"});
}

/* jshint ignore:end */

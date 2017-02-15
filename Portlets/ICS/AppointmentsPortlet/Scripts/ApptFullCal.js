;(function (apptCal, $) {
    var _settings = {};
    var _slotDuration = 15;
    var _newDate = null;
    apptCal.init = function (settings, defaultView) {
        //make sure defaults are reset
        _settings = $.extend(getDefaultSettings(), settings);
        _settings.origShowWknd = _settings.showWknd; //used for day => week view
        apptCal.renderFullCalendar(defaultView);
    };
    function getDefaultSettings() {
        return {
//defaults
            allowEditing: true,
            calElem: null,
            defaultDate: '',
            showWknd: false,
            showMonth: false,
            showWeekNav: false,
            hideViewSelector: false,
            origShowWknd: false,
            createEvent: function(start, end, rerenderAction) {},
            editEvent: function(event, revertFunc, rerenderAction) {},
            updateWknd: function(showWeekend) {},
            postRender: function(cal) {},
            rerender: function (cal) { },
            changeView: function (viewName){},
            postApptRender: function(appt, elem, view) {},
            data: { resourceId: '', userId: '' },
            readonlySources: [], //objects should be in format: {url:'',data:{}}
            g11n: { 'today': 'Today', 'prev': 'Prev', 'next': 'Next', 'month': 'Month', 'week': 'Week', 'day': 'Day', 'hideWknd': 'Hide weekends', 'showWknd': 'Show weekends' },
            listViewPageSize: 20,
            noApptMesg: 'no appointments'
        };
    }
    apptCal.reload = function () {
        if (isListView())
            apptCal.renderListView();
        else
            _settings.calElem.fullCalendar('refetchEvents');
    }
    apptCal.destroy = function() {
        _settings.calElem.fullCalendar('destroy');
    }
    apptCal.triggerClick = function (appt) {
        if (isListView())
            processAppointmentEdit(appt, true, function () { }, apptCal.renderListView);
        else
            _settings.calElem.fullCalendar('trigger', 'eventClick', appt, appt, appt);
    }
    apptCal.updateData = function (data) { 
        var origSource = buildEventSources();
        $.each(origSource, function(i, source) { _settings.calElem.fullCalendar('removeEventSource', source.url); });
       
        _settings.data = data;
        _settings.calElem.fullCalendar('removeEvents');
        var newSource = buildEventSources();
        $.each(newSource, function (i, source) { _settings.calElem.fullCalendar('addEventSource', source); });

        if(isListView())
            apptCal.renderListView();
    }
    apptCal.rebindReadOnlySources = function(sources) {
        _settings.readonlySources = sources;
        apptCal.renderFullCalendar(apptCal.getView().name);
    };
    apptCal.renderFullCalendar = function(defaultView) {
        renderCalendar(defaultView, _settings.postRender, _settings.rerender);
    };
    apptCal.renderAppt = function (appt) {
        if (isListView())
            apptCal.renderListView();
        else {
            _settings.calElem.fullCalendar('renderEvent', appt);
            _settings.calElem.fullCalendar('unselect');
        }
        _settings.rerender(_settings.calElem);
    };
    apptCal.getView = function () {
        if (isListView()) {
            return { name: 'list', start: moment(), end: moment(_settings.calElem.find("div.fc-list-day-wrapper").last().data('date')) };
        }
        return _settings.calElem.fullCalendar('getView');
    }
    apptCal.getAppointments = function () {
        if (isListView()) {
            var appts = [];
            $('div.fc-event-list').each(function(i, elem) { appts.push($(elem).data('appt')); });
            return appts;
        }
        return _settings.calElem.fullCalendar('clientEvents');
    }
    apptCal.updateAppointment = function (appt) {
        if (isListView()) {
            //find the appt and rerender it
        }
        _settings.calElem.fullCalendar('updateEvent', appt);
    }
    apptCal.renderListView = function () {
        var showCount = _settings.calElem.find(".fc-listView-content").data('showCount'); //incase rerendering list, we want to keep current showCounts
        _settings.calElem.empty();
        var listView = $("<div class='fc fc-listView'>");
        renderListViewHeader(listView);
        renderListViewAppts(listView, showCount);
        _settings.calElem.append(listView);
    }
    apptCal.gotToDate = function(viewName, date) {
        _settings.calElem.fullCalendar('destroy');
        _settings.calElem.empty();
        if (viewName != 'list') {
            _newDate = moment(date);
            apptCal.renderFullCalendar(viewName);
        } else {
            apptCal.renderListView();
        }
    }
    
    function isListView() {
        return _settings.calElem.find(".fc-listView").length > 0;
    }

    function renderCalendar(defaultView, postRenderAction, rerenderAction) {
        if (rerenderAction == null) //after any appointment creation/editing want to potentially call rerender
            rerenderAction = function (cal) { };

        if (defaultView == 'list') {
            _settings.calElem.fullCalendar('destroy');
            apptCal.renderListView();
            return;
        } else
            _settings.calElem.find(".fc-listView").remove();

        var view = defaultView != null ? defaultView : 'agendaWeek';
        var eventSources = buildEventSources(view);

        var date = moment(_settings.defaultDate);
        if(date.isValid()) {
            view = 'agendaDay';
            _newDate = date;
            _settings.defaultDate = '';
        }

        _settings.calElem.fullCalendar({
            header: { left: 'prev today next', right:(_settings.showMonth ? 'month ' :'') + 'agendaWeek agendaDay' },
            buttonIcons: { prev: '', next: '' },
            buttonText: { prev: _settings.g11n.prev, next: _settings.g11n.next, today: _settings.g11n.today, month: _settings.g11n.month, week: _settings.g11n.week, day: _settings.g11n.day},
            columnFormat: { month:'dddd', week: 'MM/DD/YYYY', day: 'MM/DD/YYYY' },
            defaultView: view,
            defaultDate: _newDate,
            fixedWeekCount: false,
            height:900,
            weekends: defaultView == null || defaultView != 'month' ? _settings.showWknd :true ,
            editable: _settings.allowEditing,
            slotDuration: "00:" + _slotDuration + ":00",
            scrollTime: '08:00:00',
            allDaySlot: true,
            timezone: 'local',
            eventSources: eventSources,
            viewRender: function (view, elem) { processPostViewRender(view, elem, postRenderAction); },
            loading: function (isLoading) { if (!isLoading) { _settings.calElem.unblock(); } else { _settings.calElem.block({ message: '<div class="appt-loading"><img src="ui/common/images/PortletImages/Icons/ajax_loader_large.gif"/> ' + _settings.g11n.loading + '</div>', css: { border: 'none', background: 'transparent', cursor: 'default' }, overlayCSS: { backgroundColor: '#666', opacity: 0.0 } }); } },
            selectable: _settings.allowEditing,
            selectHelper: _settings.allowEditing,
            select: function (start, end, jsEvent, view) { if (_settings.createEvent != null && start.hasTime()) { var startTime = getZonedMoment(start); var endTime = getZonedMoment(end);  _settings.createEvent(startTime, endTime, endTime.diff(startTime,'minutes') == _slotDuration,  rerenderAction, function () { _settings.calElem.fullCalendar('unselect'); }); } else _settings.calElem.fullCalendar('unselect'); },
            eventClick: function (appt, jsEvent, view) { if (appt.isReadOnly) { return; } processAppointmentEdit(appt, true, function() {}, rerenderAction); },
            eventResize: function (appt,delta, revertFunc) { if (appt.isReadOnly) { revertFunc(); return; } processAppointmentEdit(appt, false, revertFunc, rerenderAction); },
            eventDrop: function (appt, delta, revertFunc, jsEvent, ui, view) { if (appt.isReadOnly) { revertFunc(); return; } processAppointmentEdit(appt, false, revertFunc, rerenderAction); },
            eventAfterRender: _settings.postApptRender
        });

        _newDate = null;//reset incase it was set
    }
    function getZonedMoment(momentObj) {
        if (momentObj.zone() == 0) { //set zone to browser zone
            return moment(momentObj.format("MM/DD/YYYY HH:mm:ss"), "MM/DD/YYYY HH:mm:ss"); //properly handles zone timeoffset in constructor
        } 
        return momentObj;
    }
    function buildEventSources(viewName) {
        var arr = [];
        arr.push({ url: 'api/appointments', data: _settings.data, cache: true });// base URL

        //build up and process readonly sources
        if (_settings.readonlySources != null) {
            var sources = typeof _settings.readonlySources === 'function' ? _settings.readonlySources(viewName) : _settings.readonlySources;
            if (sources !== "") {
                $.each(sources, function(i, source) {
                    if (source.url != undefined) {
                        var eventSource = { url: source.url };
                        eventSource.cache = true;
                        eventSource.editable = false;
                        eventSource.className = 'inactiveItem';
                        eventSource.eventDataTransform = function(event) {
                            event.isReadOnly = true;
                            event.editable = false;
                            return event;
                        };
                        if (source.data != null)
                            eventSource.data = source.data;
                        arr.push(eventSource);
                    }
                });
            }
        }
        return arr;
    }

    function processAppointmentEdit(appt, isClick, revertFunc, rerenderAction) {
        if (_settings.editEvent != null) {
            appt.start = getZonedMoment(appt.start); //make sure timezone is set
            appt.end = getZonedMoment(appt.end); //make sure timezone is set
            _settings.editEvent(appt, isClick, revertFunc, rerenderAction);
        }
    }

    function processPostViewRender(view, jQObj, postRenderAction) {
        modifyCalendarTitle(_settings.calElem, view);
        var hasToday = (view.name == 'agendaDay' && _settings.showWeekNav)
                        ? createWeekHeaderForDayView(_settings.calElem, view)
                        : modifyColumnHeaderHtml(_settings.calElem, view);

        modifyCalendarActionHtml(_settings.calElem, view, hasToday);
        bindShowWeekendAction(_settings.calElem, view);
        bindClickableDays(_settings.calElem, view);

        //trigger postRenderAction
        if (postRenderAction != null)
            postRenderAction(_settings.calElem);
    }
    
    function bindClickableDays(cal, view) {
        if (view.name != 'month') return;

        cal.find("td.fc-day-number").each(function (i, item) {
            var day = $(item);
            if (!day.hasClass('fc-cus-clickable')) {
                day.addClass('fc-cus-clickable');
                processRenderViewItem(cal,day,'agendaDay',day.data('date'));
            }
        });
    }

    function modifyCalendarTitle(cal, view) {
        cal.find(".fc-toolbar > .fc-center").empty();
        var monthText = '',yearText='',cssHeaderMonth = 'headerMonth';
        if (view.name == 'month') {
            var today = cal.fullCalendar('getDate');
            monthText = today.format('MMMM');
            yearText = today.format('YYYY');
        } else {
            monthText = view.start.format('MMMM');
            if (view.start.month() != moment(view.end).subtract(1, 'minute').month()) {
                monthText += " - " + view.end.format("MMMM");
                cssHeaderMonth = 'headerMonths';
            }
            yearText = view.end.format('YYYY');
            
            if (view.name == 'agendaDay' && !_settings.showWeekNav) {
                monthText = view.start.format('dddd, MMMM D');
            }
        }
        cal.find(".fc-toolbar > .fc-center").append($("<span class='headerDate'>").append($("<span class='" + cssHeaderMonth + "'>").text(monthText)).append(yearText));
    }
    function modifyColumnHeaderHtml(cal, view) {
        var start = moment(view.start), end = moment(view.end),today = moment();
        var hasToday = (start.isBefore(today) && end.isAfter(today)) || (start.isSame(today, 'day') || end.subtract(1, 'minute').isSame(today, 'day'));

        if (view.name != 'month') {
            cal.find("thead div.fc-widget-header th.fc-widget-header").each(function (i, e) { //modify calendar header
                var th = $(e);
                var date = moment(th.text(),'MM/DD/YYYY');
                if (date.isValid()) {
                    if (today.isSame(date, 'day')) {
                        th.addClass('headerToday');
                    } else
                        th.removeClass('headerToday');
                    th.html("<span class='headerDay'>" + date.format("dddd") + "</span><span class='headerDayNum'>" + date.format("D") + "</span>");
                    processRenderViewItem(cal, th, 'agendaDay', date);
                } else if (th.hasClass('fc-axis')) {
                    th.addClass('fc-axis-left').append($("<i class='fa fa-chevron-left apptStrong activeItem'>")).click(function () { cal.fullCalendar('prev'); }).attr('title', view.name == 'month' ? _settings.g11n.prevMonth : (view.name == 'agendaWeek' ? _settings.g11n.prevWeek : _settings.g11n.prevDay));;
                }
            });
            cal.find("thead div.fc-widget-header").addClass('fc-header-wrapper');
            cal.find("thead div.fc-widget-header table tr").append($("<th>", { 'class': 'fc-day-header fc-widget-header fc-axis-right', style: 'width:15px;' }).append($("<i class='fa fa-chevron-right apptStrong activeItem'>")).click(function () { cal.fullCalendar('next'); }).attr('title', view.name == 'month' ? _settings.g11n.nextMonth : (view.name == 'agendaWeek' ? _settings.g11n.nextWeek : _settings.g11n.nextDay)));

            if (view.name == 'agendaDay' && !_settings.showWeekNav) //hide header for agendaDay
                cal.find("thead div.fc-widget-header table tr").hide();

        } else {
            cal.find(".fc-widget-header thead > tr").addClass('monthHeader');
        }
        return hasToday;
    }

    function createWeekHeaderForDayView(cal, view) {
        var tempStart = getZonedMoment(view.start);
        var start = moment(tempStart).startOf('week'), end = moment(tempStart).endOf('week'), today = moment();
        if (!_settings.showWknd) {
            start.add(1, 'days');
            end.subtract(1, 'days');
        }
        if (start.get('month') != end.get('month')) {
            modifyCalendarTitle(cal, {name:view.name, start: start, end: end });
        }
        var tr = cal.find("thead div.fc-widget-header thead tr");
        tr.find("th.fc-widget-header").each(function (i, e) { //modify calendar header
            var th = $(e);
            if (th.hasClass('fc-axis')) {
                th.addClass('fc-axis-left').append($("<i class='fa fa-chevron-left apptStrong activeItem'>")).click(function () { cal.fullCalendar('gotoDate', moment(end).subtract(7, 'days')); }).attr('title', _settings.g11n.prevWeek);
            }
            else {
                //build div wrapper
                th.empty();
                var row = $("<tr>");
                for (var i = 0; i <= end.diff(start, 'days') ; i++) {
                    var date = moment(start).add(i, 'days');
                    var cell = "<span class='headerDay'>" + date.format("dddd") + "</span><span class='headerDayNum'>" + date.format("D") + "</span>";
                    var td = $("<td>", { 'class': date.isSame(tempStart) ? 'currentViewDay' : '' }).html(cell);
                    if (date.isSame(today,'day')) {
                        td.addClass('headerToday');
                    }
                    else
                        td.removeClass('headerToday');
                    processRenderViewItem(cal, td, 'agendaDay', date);
                    row.append(td);
                }
                th.append($("<table class='weekNav'>").append(row));
            }
        });
        cal.find("thead div.fc-widget-header").addClass('fc-header-wrapper');
        tr.append($("<th>", { 'class': 'fc-day-header fc-widget-header fc-axis-right', style: 'width:15px;' }).append($("<i class='fa fa-chevron-right apptStrong activeItem'>")).click(function () { cal.fullCalendar('gotoDate', moment(start).add(7, 'days')); }).attr('title', _settings.g11n.nextWeek));
    }

    function modifyCalendarActionHtml(cal, view, hasToday) {
        cal.find(".fc-toolbar > .fc-left button, .fc-toolbar > .fc-right button").each(function (i, elem) {
            var item = $(elem);
            item.attr('type', 'button'); //have to put this on to tell the browser not to cause a submit action!
            var classes = item.hasClass('fc-today-button') && hasToday ? 'inactiveItem' : 'activeItem';
            classes += item.hasClass('fc-state-active') ? ' apptStrong' : ' headerAction';

            if (item.hasClass('fc-today-button')) {
                item.unbind('click').click(function () { cal.fullCalendar('today'); });
            }
            if (item.hasClass('fc-prev-button')) {
                
                item.unbind('click').click(function () { cal.fullCalendar('prev'); });
                item.attr('title', view.name == 'month' ? _settings.g11n.prevMonth : (view.name == 'agendaWeek' ? _settings.g11n.prevWeek : _settings.g11n.prevDay));
                item.html(_settings.showMonth ? '' : item.html());
                if (item.find('.fa-chevron-left').length == 0)
                    item.prepend("<i class='fa fa-chevron-left apptStrong activeItem'></i>" + (_settings.showMonth ? '' : '&nbsp;'));
            }
            if (item.hasClass('fc-next-button')) {
                item.unbind('click').click(function () { cal.fullCalendar('next'); });
                item.attr('title', view.name == 'month' ? _settings.g11n.nextMonth : (view.name == 'agendaWeek' ? _settings.g11n.nextWeek : _settings.g11n.nextDay));
                item.html(_settings.showMonth ? '' : item.html());
                if (item.find('.fa-chevron-right').length == 0)
                    item.append("<i class='fa fa-chevron-right apptStrong activeItem'></i>");
            }

            item.removeClass('fc-button  fc-state-default fc-state-disabled headerAction inactiveItem apptStrong').addClass(classes);

            //custom click events, since showWeekends should always be true for day view  (showWeekends only apply to week view)
            var start = view.name == 'month' ? cal.fullCalendar('getDate') : view.start;
            if (item.hasClass('fc-agendaDay-button')) {
                processRenderViewItem(cal, item, 'agendaDay', hasToday ? moment() : start);
            }
            if (item.hasClass('fc-agendaWeek-button')) {
                processRenderViewItem(cal, item, 'agendaWeek', start);
            }
            if (item.hasClass('fc-month-button')) {
                //logic is used for when displaying month overlap
                var date = view.start.month() != view.end.month() ? cal.fullCalendar('getDate') : view.start;
                processRenderViewItem(cal, item, 'month', date);
            }
        });

        //create list element
        if (cal.find(".fc-toolbar > .fc-right").has('.fc-button-listView').length < 1) {
            var listItem = $("<button type='button' class='fc-button-listView fc-corner-left fc-corner-right activeItem headerAction'>").html(_settings.g11n.list);
            processRenderViewItem(cal, listItem, 'list', moment());
            cal.find(".fc-toolbar > .fc-right").append($("<span class='fc-header-space activeItem headerAction'>"))
                    .append(listItem);
        }

        if (_settings.hideViewSelector)
            cal.find("div.fc-toolbar div.fc-right").css('visibility', 'hidden');
    }

    function bindShowWeekendAction(cal, view) {
        if (view.name == 'agendaWeek' || (view.name == 'agendaDay' && _settings.showWeekNav)) {
            if (cal.find(".fc-toolbar .fc-left .showWeekend").length > 0) return;

            var showWkend = $("<button type='button' class='activeItem showWeekend headerAction'>")
                            .text(_settings.g11n[_settings.showWknd ? "hideWknd" : "showWknd"])
                            .click(function () {
                                apptCal.showWeekends(cal, (!_settings.showWknd), getZonedMoment(cal.fullCalendar('getDate')));
                                $(this).text(_settings.g11n[_settings.showWknd ? "hideWknd" : "showWknd"]);
                            });
            cal.find(".fc-toolbar .fc-left").append(showWkend);

        } else {
            cal.find(".showWeekend").remove();
        }
    }

    apptCal.showWeekends = function(cal, showWeekend, currDate) {
        _settings.updateWknd("showWeekends", showWeekend); //toggle
        _settings.showWknd = _settings.origShowWknd = showWeekend; //rebind
        var view = cal.fullCalendar('getView').name;
        cal.fullCalendar("destroy");
        _newDate = moment(currDate);
        apptCal.renderFullCalendar(view);
    }

    function processRenderViewItem(cal, elem, viewName, date) {
        var showWknd = (viewName == 'agendaWeek' || (viewName == 'agendaDay' && _settings.showWeekNav)) ? _settings.origShowWknd : true;
        elem.unbind('click');
        elem.click(function () {
            var forceShowWknd = !_settings.showMonth && !_settings.origShowWknd && ((viewName == 'agendaDay' && cal.fullCalendar('getView').name != 'agendaDay') || (viewName == 'agendaWeek' && cal.fullCalendar('getView').name != 'agendayWeek'));
            if (!forceShowWknd && viewName != 'month' && viewName != 'list' && cal.fullCalendar('getView').name != 'month' && !isListView()) {
                //switching between week and day views, no need to destory/reload if we don't have to
                cal.fullCalendar('gotoDate', date);
                cal.fullCalendar('changeView', viewName);
            } else {
                _settings.showWknd = showWknd;
                cal.fullCalendar('destroy');
                if (viewName != 'list') {
                    _newDate = date;
                    apptCal.renderFullCalendar(viewName);
                } else {
                    apptCal.renderListView();
                }
            }
            _settings.changeView(viewName);
        });
        return elem;
    }

    function renderListViewAppts(listView, reloadCount) {
        var listContent = $("<div class='fc-listView-content'>");
        processListViewAppt(listContent, moment(), reloadCount);
        listView.append(listContent);
        listView.append($("<a href='' class='activeItem fc-list-showMore' style='display:none'>")
            .html("<i class='fa fa-plus-circle'></i> " + _settings.g11n.showMoreAppts)
            .click(function (e) {
                e.preventDefault();
                if ($(this).attr('disabled'))
                    return;
                var showCount = listContent.data('showCount');
                listContent.data('showCount', (showCount == null ? 0 : showCount) + 1);
                $(this).attr('disabled', 'disabled');
                processListViewAppt(listContent, listContent.data('lastDate'));
        }));
    }

    function processListViewAppt(ctr, startDate, reloadCount) {
        var data = $.extend(true, { start: startDate.format('YYYY-MM-DD H:mm:ss') }, _settings.data);//clone
        $.get('api/appointments', data, function (appts) {
            var showMore = ctr.parent().find("a.fc-list-showMore");
            if (appts == null || appts.length < _settings.listViewPageSize) showMore.hide(); //paging count
            else showMore.removeAttr('disabled').show();

            if ((appts == null || appts.length == 0) && ctr.find(".fc-list-day-wrapper").length == 0) //none
            {
                ctr.append($("<div class='fc-list-noAppt inactiveItem'>").html(_settings.noApptMesg));
                return;
            } else
                ctr.find(".fc-list-noAppt").remove();

            $.each(appts, function (i, appt) {
                ctr.data('lastDate', moment(appt.start));
                appt.start = moment(appt.start);
                appt.end = moment(appt.end);
                var wrapper = ctr.find("[data-date='" + appt.start.format('YYYY-MM-DD') + "']");
                var apptWrapper = {};
                if (wrapper.length <= 0) {
                    var dateDisplay = appt.start.format("dddd") + ",<span class='fc-list-day-num'>" + appt.start.format("MMMM D") + "</span>";
                    var dateDiff = appt.start.date() - moment().date(); //only accounts for day diff
                    if (appt.start.format('M-YYYY') == moment().format('M-YYYY') && (dateDiff == 0 || dateDiff == 1))
                        dateDisplay = dateDiff == 0 ? _settings.g11n.today : _settings.g11n.tomorrow;

                    wrapper = $("<div class='fc-list-day-wrapper' data-date='" + appt.start.format('YYYY-MM-DD') + "'>").append($("<span class='fc-list-day'>").html(dateDisplay));
                    apptWrapper = $("<div class='fc-list-appointments'>");
                    wrapper.append(apptWrapper);
                    ctr.append(wrapper);
                } else
                    apptWrapper = wrapper.find("div.fc-list-appointments");

                var apptCtr = $("<div>", { 'style':'display:none', 'class': 'fc-event-list fc-event ' + appt.className })
                        .append($("<div class='fc-event-date'>").html(stringUtil.format("{0} - {1}",appt.start.format('h:mm a'),appt.end.format('h:mm a'))))
                        .append($("<div class='fc-event-info'>").append($("<span class='fc-event-who'>").html(appt.hasAttendees ? (appt.isOwner ? appt.attendeeInfo : (appt.resourceId ? appt.resourceName : appt.owner)) : appt.title)).append($("<span class='fc-event-title'>").html(" - " + (appt.hasAttendees ? appt.title : _settings.g11n.available))))
                        .click(function () { processAppointmentEdit(appt, true, function () { }, apptCal.renderListView); })
                        .data('appt', appt);

                apptWrapper.append(apptCtr);
                apptCtr.show('normal');
                _settings.postApptRender(appt, apptCtr, { name: 'list' });
            });

            if (reloadCount != null && reloadCount > 0) {
                var showCount = ctr.data('showCount');
                showCount = showCount == null || showCount == '' ? 0 : showCount;
                if (showCount < reloadCount) {
                    ctr.data('showCount', (showCount+1));//increment
                    processListViewAppt(ctr, ctr.data('lastDate'),reloadCount);//recursive
                }
            }
        });
    }

    function renderListViewHeader(listView) {
        var header = $("<div class='fc-toolbar fc-toolbar-list'>");
        var headerLeft = $("<div class='fc-left fc-left-list'>&nbsp;</div>");
        var headerCenter = $("<div class='fc-center'>").append($("<span class='headerDate'>").append($("<span class='headerMonth'>").html(_settings.g11n.apptList)));

        var headerRight = $("<div class='fc-right'>");
        var spacer = "<span class='fc-header-space activeItem headerAction'></span>";
        var link = "<button type='button' class='activeItem headerAction'>";
        
        headerRight.append($("<button type='button' class='activeItem fc-state-active apptStrong headerAction'>").html(_settings.g11n.list));
        headerRight.append(processRenderViewItem(_settings.calElem, $(link).html(_settings.g11n.day), 'agendaDay', moment())).append(spacer);
        headerRight.append(processRenderViewItem(_settings.calElem, $(link).html(_settings.g11n.week), 'agendaWeek', moment())).append(spacer);
        
        if (_settings.showMonth)
            headerRight.append(processRenderViewItem(_settings.calElem, $(link).html(_settings.g11n.month), 'month', moment())).append(spacer);

        header.append(headerRight).append(headerLeft).append(headerCenter);
        listView.append(header);
    }

}(window.apptFullCal = window.apptFullCal || {}, jQuery));
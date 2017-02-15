; (function (apptMiniCal, $) {

    var _miniCal = null, _infoArea = {}, _g11n = {}, _userIds = [], _resourceId = '';
    apptMiniCal.init = function (miniCalendar, infoArea, g11n, userIds, resourceId) {
        _miniCal = $(miniCalendar);
        _infoArea = infoArea;
        _g11n = g11n;
        _userIds = userIds;
        _resourceId = resourceId == undefined ? '' : resourceId;
    };

    apptMiniCal.onWeekendClick = function (date) { };

    apptMiniCal.rerenderMiniCalendar = function (calElem) {
        _miniCal.removeData();
        apptMiniCal.renderMiniCalendar(calElem);
    };
    apptMiniCal.updateUsers = function (userIds) {
        _userIds = userIds;
    }
    apptMiniCal.renderMiniCalendar = function (calElem) {
        _miniCal.datepicker('destroy');
        var view = calElem.fullCalendar('getView');
        if (view == null || view.name == undefined)
            return;

        var date = view.start.month() != view.end.month() ? calElem.fullCalendar('getDate') : view.start;
        _miniCal.datepicker({
            defaultDate: date.format("MM/DD/YYYY"),
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (d, picker) {
                var selectedDate = moment(d,'MM/DD/YYYY');
                if (selectedDate.weekday() == 0 || selectedDate.weekday() == 6)
                    apptMiniCal.onWeekendClick(selectedDate);
                calElem.fullCalendar('gotoDate', selectedDate);
            },
            onChangeMonthYear: function (year, month, picker) {
                processMiniCalAppts($(this), moment({ year: year, month: month - 1, day: 1 }));
            },
            beforeShowDay: function (day) {
                var mDay = view.start.clone().local().toDate();
                var css = "";
                var cal = $(this);
                if (day.getTime() === mDay.getTime() || (view.start.isBefore(day) && view.end.isAfter(day))) {
                    css += "currentViewDay";
                    if (day.getTime() === mDay.getTime())
                        css += " cvd-first";
                    if (view.end.clone().subtract(1, 'minute').get('date') === day.getDate())
                        css += " cvd-last";
                }
                if (cal.data('appts') != null) {
                    $(cal.data('appts')).each(function (i, appt) {
                        if (appt.date.isSame(day)) {
                            css += (appt.hasAvailable ? ' miniAvailable' : '') + (appt.hasAttendee ? ' miniAttendee' : '');
                        }
                    });
                }
                return [true, css, ""];
            }
        });
        _miniCal.datepicker("option", "dayNamesMin", _miniCal.datepicker("option", "dayNamesShort"));
        processMiniCalAppts(_miniCal, date);
    };

    function processMiniCalAppts(miniCalendar, startDate) {
        var currDate = miniCalendar.data('currDate');

        if (currDate == null || currDate.month() != startDate.month() || currDate.year() != startDate.year()) {
            //get or refresh mini month appt data
            miniCalendar.data('currDate', startDate);
            $.get('rpc/appointmentsInfo/GetMiniCalendarEvents', { currentDate: startDate.format('MM/DD/YYYY'), resourceId: _resourceId, userIds: _userIds }, function (apptInfo) {
                $(apptInfo.appts).each(function (i, appt) {appt.date = moment(appt.date,'YYYY-MM-DD'); }); //create moment wrapper on each date
                miniCalendar.data('appts', apptInfo.appts);
                miniCalendar.datepicker('refresh');
                _infoArea.text(apptInfo.countText);
            });
        }
    }
}(window.apptMiniCal = window.apptMiniCal || {}, jQuery));
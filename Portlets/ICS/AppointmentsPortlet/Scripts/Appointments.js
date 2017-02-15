;(function(appt, $) {

    var _settings = {};
    appt.showWeekends = false;
    appt.portletId = '';
    appt.id = '';
    appt.name = {};
    appt.g11n = {};
    appt.imgUrl = '';
    appt.listViewPageSize = 0;
    appt.ableToEdit = false;
    appt.canAdmin = false;
    appt.canManageSettings = false;
    appt.canAddAttendees = false;
    appt.apptSetting = 0;
    appt.hosts = [];
    appt.resourceId = '';
    appt.baseUrl = '';
    appt.sections = [];

    appt.init = function(settings) {
        bindSettings(settings);
    };

    function bindSettings(settings) {
        _settings = settings;
        appt.showWeekends = settings.showWeekends;
        appt.portletId = settings.portletId;
        appt.baseUrl = settings.baseUrl;
        appt.name = settings.name;
        appt.id = settings.id;
        appt.g11n = settings.g11n;
        appt.imgUrl = settings.imgUrl;
        appt.ableToEdit = settings.ableToEdit;
        appt.canAdmin = settings.canAdmin;
        appt.canManageSettings = settings.canManageSettings;
        appt.canAddAttendees = settings.canAddAttendees;
        appt.listViewPageSize = settings.listViewPageSize;
        appt.apptSetting = settings.apptSetting;
        appt.hosts = settings.hosts;
        appt.resourceId = settings.resourceId;
        appt.sections = settings.sections;
    }

    appt.updateSettings = function (settingName, value) {
        for (var key in _settings) {
            if (key == settingName) {
                saveSettings(settingName, value);
                _settings[key] = value;
                bindSettings(_settings);
                return;
            }
        }
    };

    appt.getUser = function (id) {
        if (id == null || id == '') return {};

        var user = {};
        $.ajax({
            type: 'GET',
            url: 'rpc/appointmentsInfo/GetUser/?id=' + id,
            async: false,
            success: function (u) {
                if (u != null)
                    user = u;
            }
        });
        return user;
    };

    appt.getResource = function (id) {
        if (id == null || id == '') return {};

        var resource = {};
        $.ajax({
            type: 'GET',
            url: 'rpc/appointmentsSettings/GetResource/?portletId=' + appt.portletId + '&id=' + id,
            async: false,
            success: function (r) {
                if(r != null)
                    resource = r;
            }
        });
        return resource;
    }

    function saveSettings(name, val) {
        $.ajax({
            url: 'rpc/appointmentsInfo/PostSettings/?settingName=' + name + '&value=' + val,
            type: 'POST',
        });
    }

}(window.apptPortlet = window.apptPortlet || {}, jQuery));

// apptDateUtil
(function (du) {
    'use strict';

    du.getDateDisplay = function (start, end) {
        return moment(start).format('dddd, MMMM D, h:mm a') + " - " + moment(end).format('h:mm a');
    };
    du.getTimeDiff = function (start, end, g11n) {
        var hours = end.diff(start, 'hours');
        var mins = end.diff(start, 'minutes') % 60;
        var timeDiff = '';
        if (hours > 0) {
            timeDiff += stringUtil.format('{0} {1}', hours, (hours == 1 ? g11n.hour : g11n.hours));
        }
        if (mins > 0) {
            timeDiff += stringUtil.format("{0} {1} {2}", (hours > 0 ? ', ' : ''), mins, (mins == 1 ? g11n.min : g11n.mins));
        }
        return timeDiff;
    };
}(window.apptDateUtil = window.apptDateUtil || {}));

function roundedMoment(day) {
    var now = moment();
    var date = day == null ? now : moment(day).hour(now.hour()).minute(now.minute());
    if (day != null && date.dayOfYear() == now.dayOfYear())
        date = now; //if today then set it to NOW

    var roundedMin = (date.minute() - (date.minute() % 15)) + 15;
    var roundedHour = date.hour();
    if (roundedMin == 60) {
        roundedMin = 0;
        roundedHour++;
    }
    date.minutes(roundedMin);
    date.hour(roundedHour);
    return date;
}

function addApptToCtr(ctr, appt, date) {
    var cssClass = 'fc-event fc-event-vert' + (appt.isReadOnly || (appt.isOwner == false && appt.owner != undefined) ? ' inactiveItem' : (appt.hasAttendees ? ' hasAttendee' : '')) ;
    var wrapper = $("<div>", { 'class': cssClass });
    if (date != null && !date.isSame(appt.start, 'day')) {
        var dateFormat = !date.isSame(appt.start, 'year') ? "ddd, MMM D YYYY" : "ddd, MMM D";
        wrapper.append($("<span class='overlapDate'>").html(appt.start.format(dateFormat)));
    }
    wrapper.append($("<span>").html(appt.start.format("h:mm a") + '-' + appt.end.format("h:mm a")))
           .append($("<span class='overlapTitle'>").html(appt.title.substring(0, 18)));
    if ((appt.isReadOnly && appt.owner != null) || (appt.isOwner == false && appt.owner != undefined))
        wrapper.append($("<span class='overlapTitle'>").html("(" + appt.owner + ")"));
    ctr.append(wrapper);
}
function bindConfirmModal(mesg, infoElem, cancelTxt, btnTxt, action, otherTxt, otherAction) {
    bindConfirmModalCtr($(".confirmModal"), mesg, infoElem, cancelTxt, btnTxt, action, otherTxt, otherAction);
}
function bindConfirmModalCtr(confirmModal, mesg, infoElem, cancelTxt, btnTxt, action, otherTxt, otherAction) {
    confirmModal.find(".otherItem").remove();
    confirmModal.find(".confirmMesg").html(mesg);
    confirmModal.find(".confirmInfo").empty().append(infoElem);
    confirmModal.find(".apptDetailAction a.activeItem").unbind('click').text(cancelTxt).click(function (e) { e.preventDefault(); confirmModal.dialog('close'); });
    confirmModal.find("button.activeAction").unbind('click').text(btnTxt).click(function () { action(confirmModal); });
    if (otherTxt != null && otherTxt.length > 0 && otherAction != null) {
        var otherItem = $("<a href='' class='activeItem otherItem'>").text(otherTxt).click(function (e) { e.preventDefault(); otherAction(confirmModal); });
        confirmModal.find("button.activeAction").after(otherItem);
    }
    confirmModal.dialog("open");
}
function bindModal(id, cancelTxt, btnTxt, okAction, cancelAction) {
    var confirmModal = $("#"+id);
    confirmModal.find(".apptDetailAction a.activeItem").unbind('click').text(cancelTxt).click(function (e) { e.preventDefault(); confirmModal.dialog('close'); if(cancelAction != null) cancelAction(); });
    confirmModal.find("button.activeAction").unbind('click').text(btnTxt).click(function () { okAction(confirmModal); });
    confirmModal.dialog("open");
}


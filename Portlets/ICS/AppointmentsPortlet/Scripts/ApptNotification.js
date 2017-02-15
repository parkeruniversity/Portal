; (function ($, window, document, undefined) {
    //global vars
    var apptNotification = "apptNotification",
        apptNotificationData = "plugin_" + apptNotification;

    //boilerplate plugin logic
    $.fn.apptNotification = function (options) {

        var args, apptNotify;
        var container = this;

        if (!(container.data(apptNotificationData) instanceof ApptNotification)) {
            container.data(apptNotificationData, new ApptNotification(container, options));
        }

        apptNotify = container.data(apptNotificationData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptNotify['render'] === 'function') {
                apptNotify.render();
            }
        } else if (typeof options === 'string' && typeof apptNotify[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptNotify[options].apply(apptNotify, args);

        } else if (options === 'destroy') {
            this.removeData(apptNotificationData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + apptResource);
        }
        return apptNotify;
    };

    function ApptNotification(elem, options) {
        var appt = this, _ctr = $(elem), _g11n = options.g11n, _options = $.extend(getDefaultOptions(), options);
        appt.render = render;

        function getDefaultOptions() {
            return {g11n: {}, apptSetting: 0, baseUrl: '', callback:null, renderFullTxt: false, isSchedule:false, includeNextAvail:false, resourceId: '', hostIds: '' };
        }

        function render() {
            _ctr.removeData('appt');
            var hostIds = _options.hostIds != '' && _options.resourceId == '' ? _options.hostIds : '';

            $.get('rpc/appointmentsInfo/GetMyNextAppointment', { resourceId: _options.resourceId, hostIds: hostIds, includeNextAvail: _options.includeNextAvail }, function (apptInfo) {
                _ctr.removeClass('apptNotification').empty();
                if (apptInfo == null) {
                    return;
                }
                apptInfo.start = moment(apptInfo.start);
                apptInfo.end = moment(apptInfo.end);
                _ctr.data('appt', apptInfo);
                _ctr.addClass('apptNotification');
                if (!_options.renderFullTxt)
                    _ctr.append($("<span class='apptNotifyNext'>").html(_g11n.next + ":"));
                else {
                    var txtVal = _g11n.myNextAppt;
                    if (_options.isSchedule) {
                        var key = apptInfo.attendeeCount == 0 ? _g11n.nextAvailWith : _g11n.myNextApptWith;
                        txtVal = stringUtil.format(key, getNames(apptInfo));
                    }
                    _ctr.append($("<span class='apptNotifyMyNext'>").html(txtVal));
                }

                var wrapper = $(!_options.renderFullTxt ? "<div class='apptNotifyInfo'>" : "<span>");
                var txt = getDateDisplay(apptInfo.start);
                if(!_options.isSchedule)
                    txt += " " + _g11n.with + " " + getNames(apptInfo);
                
                var apptTitle = $("<span class='activeItem'>").html(txt);
                var path = _options.apptSetting == 3 ? "scheduleId" : "mainId"; //default paths
                var idKey = apptInfo.id + '|' + apptInfo.start.format('MM-DD-YYYY');

                if (_options.isSchedule) {
                    var hostCount = hostIds.split(',').length;
                    path = _options.resourceId != '' ? 'scheduleId' : (hostCount > 1 ? 'specificScheduleId' : 'userScheduleId');
                    if (hostCount == 1) //parsing in userScheduleId route
                        idKey = hostIds + "_" + idKey;
                }
                wrapper.append(apptTitle);

                if (apptInfo.newCommentCount > 0)
                    wrapper.append($("<span class='apptNotifyComment'>").append($("<i class='fa fa-comment'/>")).append(stringUtil.format((apptInfo.newCommentCount == 1 ? _g11n.newComment : _g11n.newComments), apptInfo.newCommentCount)));
                
                _ctr.append(wrapper);
                if (_options.callback != null)
                    _ctr.unbind('click').click(function () { _options.callback(_ctr.data('appt')); });
                else
                    _ctr.unbind('click').click(function () { window.location.href = _options.baseUrl + "#/" + path + '/' + idKey; });
            });
        }
        function getDateDisplay(start) {
            var dateDisplay = start.format("dddd") + ", " +  start.format("MMMM D");
            var dateDiff = start.date() - moment().date(); //only accounts for day diff
            if (start.format('M-YYYY') == moment().format('M-YYYY') && (dateDiff == 0 || dateDiff == 1))
                dateDisplay = dateDiff == 0 ? _g11n.today : _g11n.tomorrow;
            return dateDisplay + " " + _g11n.at + " " + start.format('h:mm a').replace('AM','am').replace('PM','pm');
        }
        function getNames(apptInfo) {
            if (apptInfo.isOwner)
                return apptInfo.attendeeInfo;
            else 
                return apptInfo.resourceId != '' ? apptInfo.resourceName :  apptInfo.owner;
        }
    }
}(jQuery, window, document));
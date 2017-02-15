
; (function ($, window, document, undefined) {
    //global vars
    var addAppointmentPlugin = "addAppointment",
        addAppointmentData = "plugin_" + addAppointmentPlugin;

    //boilerplate plugin logic
    $.addAppointment = function (options) {

        var args, addAppt;
        var container = $("#addAppointmentPlugin");
        if (container.attr('id') === undefined) {
            $.ajax({
                  type: 'GET',
                  async: false,
                  url: 'portlets/ics/appointmentsportlet/templates/addAppointment.htm',
                  success: function (source) {
                      var template = Handlebars.compile(source);
                      container = $(template({ g11n: options.g11n })); //create addAppointmentPlugin
                      $("#appointmentWrapper").append(container);
                  }
            });
        }

        // only allow the plugin to be instantiated once
        if (!(container.data(addAppointmentData) instanceof AddAppointment)) {
            container.data(addAppointmentData, new AddAppointment(container, options));
        }

        addAppt = container.data(addAppointmentData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof addAppt['render'] === 'function') {
                addAppt.render();
            }
        } else if (typeof options === 'string' && typeof addAppt[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return addAppt[options].apply(addAppt, args);

        }else if (options === 'destroy') {
            container.removeData(addAppointmentData);
            container.empty();
        } else {
            $.error('Method ' + options + ' does not exist on jQuery.' + addAppointmentPlugin);
        }
        return addAppt;
    };

    function AddAppointment(element, options) {
        var appt = this;
        appt.render = render;
        appt.open = open;
        appt.syncAppointment = syncAppointment;

        var _ctr = $(element), _options = $.extend(getDefaultOptions(), options), _g11n = options.g11n, _isEdit = false;

        function getDefaultOptions() {
            return {
                appointment: null, portletId: null,
                currentUser: {}, resource: {}, hostId:null, day: null,
                onOk: function (obj, isReoccurring) { },
                onCancel: function () { },
                onRemove: function () { },
                onAddAttendee: function(func) {},
                g11n: {}, fullCalView: null, appts: [], sections:[],
                appendCtr: null, parentModal: null, bypassTimeCheck: false, showAdvanced: false, canAddAttendees: false,
            };
        }

        function render() {
            if (_ctr.hasClass('ui-dialog-content')) return; //already bound

            _ctr.dialog({
                autoOpen: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: 740,
                dialogClass: 'addAppointmentContainer',
                close: function (event, ui) { if (_ctr.data("isSubmit") != true && _options.onCancel != null) _options.onCancel(); }
            });

            _ctr.find("a.showAdvanced").unbind('click').data('showAdvanced', true).click(function (e) { e.preventDefault(); processAdvancedOptions($(this).data('showAdvanced')); });
            _ctr.find("#addApptStart").timepicker({ 'scrollDefaultNow': true, 'step': 15, 'timeFormat': 'g:i a' }).change(function () { _ctr.data('hasEdit', true); renderTimeDiff(); validate($(this)); });
            _ctr.find("#addApptEnd").timepicker({ 'scrollDefaultNow': true, 'step': 15, 'timeFormat': 'g:i a' }).change(function () { _ctr.data('hasEdit', true); renderTimeDiff(); validate($(this)); });

            var until = _ctr.find("#addApptUntil");
            until.datepicker({
                dateFormat: "DD, MM d yy",
                dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                showOtherMonths: true,
                minDate: "+1d",
                maxDate: "+2y",
                onSelect: function(date, picker) {
                    validate();
                    until.data('hasSelection', moment($(this).datepicker('getDate')));
                }
            }).attr('readonly', true);
            _ctr.find(".calUntil").click(function () { until.datepicker("show"); });

            var when = _ctr.find("#addApptWhen");
            when.datepicker({
                dateFormat: "DD, MM d yy",
                dayNames:[ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
                showOtherMonths: true,
                minDate: new Date(),
                onSelect: function(date, picker) {
                    var actualDate = new Date($(this).datepicker('getDate'));
                    _ctr.data("apptDate", moment(actualDate));
                    validate();

                    until.datepicker('option', 'minDate', moment(actualDate).add(1, 'd').toDate());
                    until.datepicker('option', 'maxDate', moment(actualDate).add(1, 'd').add(2, 'y').toDate());
                    var selDate = until.data('hasSelection'); //user set until date
                    until.datepicker('setDate', selDate != null && selDate.isAfter(moment(actualDate)) ? selDate.toDate() : moment(actualDate).add(3, 'M').toDate());
                    bindRepeatOptions(true);
                    bindNumAppts(true);
                    processAdvancedOptions(!$("a.showAdvanced").data('showAdvanced'));
                    _ctr.data('hasEdit', true);
                }
            }).attr('readonly', true);
            _ctr.find(".calWhen").click(function() { when.datepicker("show"); });

            _ctr.find("#addApptTitle").change(function () { _ctr.data('hasEdit', true); validate(); });
            _ctr.find("#addApptWhere, #addApptDescrip").change(function () { _ctr.data('hasEdit', true); });
            _ctr.find("#addApptBtn").html(_g11n.saveDetails).focus().click(function () { submitAppointment(); });
            _ctr.find("#addApptCancel").html(_g11n.noThanks).click(function (e) {
                e.preventDefault();
                if (_options.appendCtr == null)
                    _ctr.dialog('close');
                else
                    _options.onCancel();
            });

            _ctr.find(".confirmAddModal").dialog({
                autoOpen: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: 550,
                dialogClass: 'confirmModalWrapper'
            });
        }

        function renderTimeDiff() {
            var date = _ctr.data("apptDate");
            if (!date.isValid())
                return;
            $("#addApptStart, #addApptEnd").removeClass('invalidItem');
            var start = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptStart").val(),'MM/DD/YYYY hh:mm a');
            var end = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptEnd").val(), 'MM/DD/YYYY hh:mm a');
            if (start.isValid() && end.isValid() && start.isBefore(end)) {
                _ctr.find("#apptLength").text("(" + apptDateUtil.getTimeDiff(start, end, _g11n) + ")");
                bindNumAppts(true);
                processAdvancedOptions(!$("a.showAdvanced").data('showAdvanced'));
            }
            else
                _ctr.find("#apptLength").text('');
        }

        function submitAppointment() {
            var newAppt = createAppointment();
            if (newAppt.id == null) {
                alert('An error occurred trying to save the appointment.');
            } else {
                _ctr.data('isSubmit', true);

                if (_ctr.data('downloadIcs') != null) {
                    _ctr.removeData('downloadIcs').removeData('hasEdit');
                    _ctr.find(".downloadIcs").click();
                }
                if(_options.appendCtr == null)
                    _ctr.dialog("close");
                var ids = newAppt.id.split(',');
                //call onOk with array OR appt
                _options.onOk(ids.length > 1 ? { ids: ids, appt: newAppt } : syncAppointment(_options.appointment, newAppt), ids.length > 1);
            }
        }

        function syncAppointment(orig, editedAppt) {
            //sync up properties that are modified within this plugin to the original appointment
            if (orig == null)
                orig = {};

            if (orig.id == null || orig.id == undefined)
                orig.id = editedAppt.id;

            orig.portletId = editedAppt.portletId;
            orig.title = editedAppt.title;
            orig.location = editedAppt.location;
            orig.start = editedAppt.start;
            orig.end = editedAppt.end;
            orig.description = editedAppt.description;
            orig.maxAttendees = editedAppt.maxAttendees;
            orig.roles = editedAppt.roles;
            orig.users = editedAppt.users;
            orig.sectionId = editedAppt.sectionId;
            if (editedAppt.ownerId != undefined && editedAppt.owner != undefined) {
                orig.ownerId = editedAppt.ownerId;
                orig.owner = editedAppt.owner;
            }
            orig.isOwner = editedAppt.isOwner;
            orig.sendReminder = editedAppt.sendReminder;
            orig.remindHost = editedAppt.remindHost;
            orig.reminderMins = editedAppt.reminderMins;
            orig.attendeeTemplate = editedAppt.attendeeTemplate;
            orig.hostTemplate = editedAppt.hostTemplate;
            orig.editable = true;
            if (editedAppt.hasAttendees != undefined) {    
                orig.hasAttendees = editedAppt.hasAttendees;
                orig.attendeeCount = editedAppt.attendeeCount;
            }
            return orig;
        }

        function createAppointment() {
            var date = _ctr.data("apptDate");
            var selectedHost = _ctr.find("#selHosts option:selected");
            var apptWho = _ctr.find("#addApptWho").val();
            //only want str values for dates, date timezone will be handled serverside
            var appt = {
                id: _ctr.data("apptId"),
                portletId: _options.portletId,
                title: _ctr.find("#addApptTitle").val(),
                location: _ctr.find("#addApptWhere").val(),
                start: date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptStart").val(),
                end: date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptEnd").val(),
                description: _ctr.find("#addApptDescrip").val(),
                maxAttendees: _ctr.find("#addApptSetHowMany").val() != '' ? Math.floor(_ctr.find("#addApptSetHowMany").val()) : _ctr.find("#addApptHowMany").val(),
                roles: apptWho == 2 ? $.map(_ctr.find("#roleDisplay > li"), function (li) { return { id: $(li).data('roleId'), name: $(li).find("span").text() }; }) : null,
                users: apptWho == 2 ? $.map(_ctr.find("#peopleDisplay > li"), function (li) { return { id: $(li).data('personId'), name: $(li).find("span").text(), myInfoHtml: $(li).find("div").html() }; }) : null,
                sectionId: apptWho == 1 ? _ctr.find("select.whoStudent").val() : null,
                ownerId: selectedHost.val() == null ? _options.currentUser.id : selectedHost.val(),
                owner: selectedHost.val() == null ? _options.currentUser.name : selectedHost.text(),
                sendReminder: _ctr.find("#cbxRemind").prop('checked'),
                remindHost: _ctr.find("#cbxRemindMe").prop('checked'),
                reminderMins: _ctr.find("#selRemind").val(),
                attendeeTemplate: $("#cbxRemind").data('template'),
                hostTemplate:$("#cbxRemindMe").data('template'),
                isOwner: true,
                editable:true
            };

            if (!_isEdit) {
                appt.repeatType = _ctr.find("#addApptRepeat").val();
                appt.repeatUntilDate = $("#addApptUntil").datepicker('getDate');
                appt.repeatMins = _ctr.find("#addApptNum").val();
            }

            $.ajax({
                type: "POST",
                url: 'api/appointments/' + (_options.resource.id != null ? ("?resourceId=" + _options.resource.id) : ""),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(appt),
                async: false, //don't want to async the saving of an event, freeze thread until save returns
                cache: false,
                success: function (id) {
                    appt.id = id; //id could be comma list with multipl id's
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert('There was an error saving the appointment');
                }
            });
            appt.start = moment(appt.start);
            appt.end = moment(appt.end);
            if (_options.resource != null) {
                appt.resourceId = _options.resource.id;
                appt.resourceName = _options.resource.name;
                appt.resourceImg = _options.resource.imgUrl;
            }
            return appt;
        }

        function open(apptOptions) {
            if (apptOptions != null) {
                _options = $.extend(getDefaultOptions(), apptOptions); //create new eachtime
                _g11n = $.extend(_g11n, apptOptions.g11n); //override default g11n
            }

            var start = _options.appointment.start != null ? moment(_options.appointment.start) : roundedMoment(_options.day);
            var end = _options.appointment.end != null ? moment(_options.appointment.end) : start.clone().add(30, 'm');

            if (moment().isAfter(start) && _options.appendCtr == null) {
                showInPastModal();
                return this;
            }

            _ctr.find(".addEditAppt").empty();
            if (_options.appointment.id != null) {
                if(_options.appendCtr == null)
                    _ctr.find(".addEditAppt").html(_g11n.editAppt);
                _ctr.data("apptId", _options.appointment.id);
                _isEdit = true;
            } else {
                if (_options.appendCtr == null)
                    _ctr.find(".addEditAppt").html(_g11n.addAppt);
                _ctr.removeData("apptId");
                _isEdit = false;
            }

            _ctr.data("apptDate", start);
            _ctr.find("#addApptBtn").removeAttr('disabled');
            _ctr.find("#addApptUntil").removeData('hasSelection');
            _ctr.removeData("isSubmit").removeData("apptOverlapStart").removeData("apptOverlap").removeData('downloadIcs').removeData('hasEdit');
            _ctr.find("#cbxRemind, #cbxRemindMe").removeData('template');
            bindRepeatOptions();
            bindReminder();
            processEditActions();
            renderWho();
            renderHosts();
            bindAppointment(start, end);
            renderTimeDiff();
            bindNumAppts();
            bindDownloadIcs();
            $("#addApptRoleChooser, #addApptPeopleChooser").empty();
            processAdvancedOptions(_options.showAdvanced);
            renderControlToScreen();
            validate();

            return this;
        }

        function bindAppointment(start, end) {
            var appointment = _options.appointment;
            _ctr.find("#addApptTitle").val(appointment.title);
            _ctr.find("#addApptWhere").val(appointment.location);
            _ctr.find("#quickDescrip, #addApptDescrip").val(appointment.description).html(appointment.description);
            var when = _ctr.find("#addApptWhen");
            when.val(start.format("ddd, MMM D YYYY"));
            when.datepicker('setDate', start.toDate());
           
            var until = _ctr.find("#addApptUntil");
            until.datepicker('option', 'minDate', moment(start).add(1, 'd').toDate());
            until.datepicker('option', 'maxDate', moment(start).add(1, 'd').add(2, 'y').toDate());
            until.datepicker('setDate', moment(start).add(3, 'M').toDate());

            $("#addApptStart").timepicker('setTime',start.toDate()).val(start.format("h:mm a"));
            $("#addApptEnd").timepicker('setTime', end.toDate()).val(end.format("h:mm a"));
            if (appointment.maxAttendees > 0) {
                if (appointment.maxAttendees > 5) {
                    _ctr.find("#addApptSetHowMany").val(appointment.maxAttendees);
                    _ctr.find("#addApptHowMany").val('');
                } else {
                     _ctr.find("#addApptSetHowMany").val('');
                     _ctr.find("#addApptHowMany").val(appointment.maxAttendees);
                }
            } else {
                _ctr.find("#addApptSetHowMany").val('');
                _ctr.find("#addApptHowMany").prop('selectedIndex', appointment.maxAttendees == -1 ? 0 : 1);
            }
            bindUsers(appointment.users);
            bindRoles(appointment.roles);
            bindSections(appointment.sectionId);
            //set who dropdown
            _ctr.find("#addApptWho").val((appointment.users != null && appointment.roles != null && (appointment.users.length > 0 || appointment.roles.length > 0)) ? 2 : (appointment.sectionId != null && appointment.sectionId.length > 0 ? 1 : 0));
            if (appointment.ownerId != null && _ctr.find('#selHosts > option[value="' + appointment.ownerId + '"]').length > 0) {
                _ctr.find("#selHosts").val(appointment.ownerId);
            }

            if (appointment.reminderMins > 0) {
                if (!appointment.sendReminder)
                    _ctr.find("#cbxRemind").click(); //trigger change event

                _ctr.find("#cbxRemindMe").prop('checked', appointment.remindHost);
                _ctr.find("#selRemind").val(appointment.reminderMins);
            }
        }
        function renderControlToScreen() {
            if (_options.appendCtr == null){
                _ctr.dialog("option", "position", { my: "center", at: "center", of: window });
                _ctr.dialog('open');
            }
            else {
                _ctr.dialog('destroy');
                _ctr.show().appendTo(_options.appendCtr);
            }
        }
        function bindDownloadIcs() {
            var lnk = _ctr.find(".downloadIcs");
            if (!_isEdit) {
                lnk.hide();
                return;
            }
            lnk.show().unbind('click').click(function(e) {
                e.preventDefault();
                if (_ctr.data('hasEdit') == null) //if no edits!
                    window.location.href = "rpc/appointmentsdetail/geticsfile?id=" + _options.appointment.id;
                else {
                    bindConfirmModal(_g11n.madeChanges, '', _g11n.noThanks, _g11n.saveDownload, function (modal) {
                        modal.dialog("close");
                        _ctr.data('downloadIcs', true);
                        _ctr.find("#addApptBtn").click();
                    });
                }
            });
        }
        function processEditActions() {
            var btn = _ctr.find("button.cancelAction");
            var addAttendee = _ctr.find("a.addAttendee");
            btn.unbind('click').hide();
            addAttendee.unbind('click').hide();
            if (!_isEdit) {
                return;
            }
            
            btn.show().click(function () {
                var info = $("<div>").html(_options.appointment.attendeeCount != null && _options.appointment.attendeeCount > 0 ? stringUtil.format((_options.appointment.attendeeCount == 1 ? _g11n.attendeeSignUpCount : _g11n.attendeesSignUpCount), _options.appointment.attendeeCount) : _g11n.noAttendees);
                bindConfirmModal(_g11n.cancelThisAppt, info, _g11n.keepAppt, _g11n.cancelAppt, function(modal) {
                    $.ajax({
                        type: "DELETE",
                        url: 'api/appointments/' + _options.appointment.id,
                        async: false, //don't want to async the deleting of an appt, freeze thread until save returns
                        cache: false,
                        success: function () {
                            modal.dialog("close");
                            if (_options.appendCtr == null)
                                _ctr.dialog("close");
                            _options.onRemove();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert('There was an error deleting the appointment');
                        }
                    });
                });
            });

            if (_options.canAddAttendees) {
                addAttendee.show().click(function (e) {
                    e.preventDefault();
                    if (_options.appendCtr == null)
                        _ctr.dialog("close");
                    _options.onAddAttendee(function () { _ctr.dialog("open"); });
                });
            }
        }
        function processAdvancedOptions(showAdvanced) {
        
            var link = _ctr.find("a.showAdvanced");
            var modal = _options.parentModal != null ? _options.parentModal : _ctr;
            $("#addApptRCWrapper, #addApptPCWrapper").hide();
            $(".addApptContent").show();

            if (showAdvanced) {
                //show advanced options
                link.data('showAdvanced', false);
                link.html(_g11n.showQuick);
                showHide(_ctr.find(".setHowMany"), _ctr.find("#addApptHowMany").val() == '');
                showHide(_ctr.find('.untilOptions'), _ctr.find("#addApptRepeat").prop('selectedIndex') > 0);

                showHide(_ctr.find(".specificPeople, .whoDescrip, .whoStudent"), _ctr.find("#addApptWho").val() == 0);
                showHide(_ctr.find(".whoStudent"), _ctr.find("#addApptWho").val() == 1);
                showHide(_ctr.find(".specificPeople, .whoDescrip"), _ctr.find("#addApptWho").val() == 2);
                _ctr.find(".apptAdvancedQuick").addClass('advancedOptionsWrapper');
                _ctr.find(".advancedOptions, .advancedOptionsHeader").slideDown({duration: 200, step: function () {
                        if (_isEdit) { _ctr.find(".advancedOptionsNew").hide();}
                        modal.dialog('option', 'position', { my: "center", at: "center", of: window });
                    }
                });
                _ctr.find(".quickOptions").slideUp('fast');
                _ctr.find(".apptDetailAction").addClass('advancedAction');

            } else {
                //show quick setup
                link.data('showAdvanced', true);
                link.html(_g11n.showAdvanced);
                _ctr.find(".apptAdvancedQuick").removeClass('advancedOptionsWrapper');
                _ctr.find(".apptDetailAction").removeClass('advancedAction');
                _ctr.find("#quickDescrip").html(_ctr.find("#addApptDescrip").val());
                
                var whoText = _ctr.find("#addApptWho").val() == 1
                    ? stringUtil.format(_g11n.availTo, _ctr.find('select.whoStudent option:selected').text().toLowerCase())
                    : stringUtil.format(_g11n.availTo, _ctr.find("#addApptWho option:selected").text().toLowerCase());  
                _ctr.find("#quickWho").empty().append($("<div>").html(whoText));
               
                if (_ctr.find("#addApptHowMany").val() != -1) {
                    var num = _ctr.find("#addApptSetHowMany").val() != '' ? Math.floor(_ctr.find("#addApptSetHowMany").val()) : _ctr.find("#addApptHowMany").val();
                    if(num > 0)
                        _ctr.find("#quickWho").append($("<div>").html(stringUtil.format(num == 1 ? _g11n.upToAttendee : _g11n.upToAttendees, num)));
                }
                var quickRepeat = $("#quickRepeat");
                quickRepeat.empty();
               
                if (!_isEdit && (_ctr.find("#addApptRepeat").prop('selectedIndex') > 0 || _ctr.find("#addApptNum").prop('selectedIndex') > 0)) {
                    var content = _ctr.find("#addApptRepeat option:selected").text();
                    if (_ctr.find("#addApptRepeat").prop('selectedIndex') > 0)
                        content += " until " + _ctr.find("#addApptUntil").val();
                    quickRepeat.append($("<div>").html(content));
                    if (_ctr.find("#addApptNum").prop('selectedIndex') > 0)
                        quickRepeat.append($("<div>").html(_ctr.find("#addApptNum option:selected").text()));
                }
               
                _ctr.find('.quickOptions.addApptEmailTemplate').html(_ctr.find("#cbxRemind").prop('checked') ? stringUtil.format(_g11n.reminderEmail, _ctr.find("#selRemind option:selected").text()) : _g11n.noReminder);
                _ctr.find(".quickOptions").slideDown('fast');
           
                _ctr.find(".advancedOptions, .advancedOptionsHeader").slideUp({ duration: 200, step: function () { modal.dialog('option', 'position', { my: "center", at: "center", of: window }); } });
             
            }

            if (_isEdit) {
                _ctr.find(".advancedOptionsNew").hide();
            }
        }
        function showHide(ctrs, show) {
            if (show)
                ctrs.show();
            else
                ctrs.hide();
        }
        function bindRepeatOptions(keepSelection) {
            var date = _ctr.data("apptDate");
            var repeat = _ctr.find("#addApptRepeat");
            var repeatSelection = keepSelection && repeat.prop('selectedIndex') > 0 ? repeat.val() : 0;
            repeat.empty().unbind('change').change(function () {
                if ($(this).val() > 0) 
                    _ctr.find(".untilOptions").show('normal');
                else
                    _ctr.find(".untilOptions").hide('normal');
                validate();
            });
            repeat.append($("<option></option>").attr("value", "0").text(stringUtil.format(_g11n.dayOnly,date.format('dddd MMMM D'))));
            if(date.day() > 0 && date.day() <6)
                repeat.append($("<option></option>").attr("value", "1").text(_g11n.everyWkday));
            repeat.append($("<option></option>").attr("value", "2").text(_g11n.everyDayWknd));
            repeat.append($("<option></option>").attr("value", "3").text(stringUtil.format(_g11n.everyDayName, date.format("dddd"))));
            if(date.date() <=30) //don't show on 31st
                repeat.append($("<option></option>").attr("value", "4").text(stringUtil.format(_g11n.dayNumOfMonth, date.format("Do"))));
            if (Math.ceil(date.date() / 7) < 5) {
                var wkOfMonthDisplay = moment().date(Math.ceil(date.date() / 7)).format("Do");
                repeat.append($("<option></option>").attr("value", "5").text(stringUtil.format(_g11n.everyWkofDay,wkOfMonthDisplay,date.format("dddd"))));
            }
            if (date.date() == moment(date).endOf('month').date()) {
                repeat.append($("<option></option>").attr("value", "6").text(_g11n.lastDayMonth));
            }
            var until = _ctr.find(".untilOptions");
            if (repeatSelection > 0 && _ctr.find("#addApptRepeat option[value='" + repeatSelection + "']").length !== 0) {
                repeat.val(repeatSelection);
                until.show('normal');
            } else
                until.hide('normal');
        }
        function bindNumAppts(keepSelection) {
            var date = _ctr.data("apptDate");
            var start = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptStart").val(), 'MM/DD/YYYY hh:mm a');
            var end = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptEnd").val(), 'MM/DD/YYYY hh:mm a');
            var numAppts = $("#addApptNum");
            var selection = keepSelection && numAppts.prop('selectedIndex') > 0 ? numAppts.val() : (_options.appointment.repeatMins != undefined ? _options.appointment.repeatMins : 0);
            numAppts.empty().unbind('change').change(function() { validate(); });
            if (date.isValid() && start.isValid() && end.isValid() && start.isBefore(end)) {
                var totalMinutes = end.diff(start, 'minutes');
                addNumAppt(numAppts, totalMinutes, totalMinutes, apptDateUtil.getTimeDiff(start,end,_g11n));
                addNumAppt(numAppts, totalMinutes, 120, '');
                addNumAppt(numAppts, totalMinutes, 60, '');
                addNumAppt(numAppts, totalMinutes, 45, '');
                addNumAppt(numAppts, totalMinutes, 30, '');
                addNumAppt(numAppts, totalMinutes, 15, '');
                addNumAppt(numAppts, totalMinutes, 10, '');
                if (selection > 0 && _ctr.find("#addApptNum option[value='" + selection + "']").length !== 0)
                    numAppts.val(selection);
            }
        }
        function addNumAppt(numAppts, totalMins, diff, singleText) {
            var num = Math.floor(totalMins / diff);
            if (num > 1 || singleText.length > 0) {
                var apptText = singleText.length > 0 ? singleText : (diff < 60 ? stringUtil.format(_g11n.minEach, diff) : stringUtil.format(_g11n.hourEach, (diff / 60)));
                apptText = (num > 1 ? stringUtil.format(_g11n.numAppts, num) : _g11n.oneAppt) + " (" + apptText + ")";
                numAppts.append($("<option></option>").attr('value', diff).text(apptText));
            }
        }
        function renderWho() {
            var howMany = _ctr.find("#addApptHowMany");
            howMany.empty().unbind('change').change(function () {
                if ($(this).val() == '') {
                    _ctr.find(".setHowMany").show('normal');
                    _ctr.find(".setHowMany").unbind('keypress').find("input").keypress(function (e) {if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {return false;}});
                }
                else
                    _ctr.find(".setHowMany").hide('normal').find("input").val('');
            });
            howMany.append($("<option></option>").attr("value", "-1").text(_g11n.unlimited));
            howMany.append($("<option></option>").attr("value", "1").text("1"));
            howMany.append($("<option></option>").attr("value", "2").text("2"));
            howMany.append($("<option></option>").attr("value", "3").text("3"));
            howMany.append($("<option></option>").attr("value", "4").text("4"));
            howMany.append($("<option></option>").attr("value", "5").text("5"));
            howMany.append($("<option></option>").attr("value", "").text(_g11n.setNum));

            var who = _ctr.find("#addApptWho");
            who.empty().unbind('change').change(function () {
                var ddl = $(this);
                _ctr.find('.specificPeople, .whoDescrip, .whoStudent').hide();
                if (ddl.val() == '1') {
                    _ctr.find(".whoStudent").show('normal');
                }
                else if (ddl.val() == '2') {
                    _ctr.find(".specificPeople, .whoDescrip").slideDown('normal');
                }
            });

            who.append($("<option></option>").attr("value", "0").text(_g11n.anyone));
            if (_options.sections != null && _options.sections.length > 0) {
                who.append($("<option></option>").attr("value", "1").text(_g11n.myStudents));
            }
            who.append($("<option></option>").attr("value", "2").text(_g11n.specificPeople));

            _ctr.find("#addApptPeople").html(_g11n.choosePeople).unbind('click').click(function (e) {
                e.preventDefault();
                var peopleIds = new Array();
                $.each($("#peopleDisplay").find("li"), function (i, li) { peopleIds.push($(li).data('personId')); });
                _ctr.find(".addApptContent").slideUp();
                _ctr.find("#addApptPeopleChooser").empty().peopleChooser('destroy').peopleChooser({ showFull: true, initPeopleIds: peopleIds });
                _ctr.find("#addApptSavePeople").unbind('click').click(function () {
                    bindUsers($("#addApptPeopleChooser").peopleChooser('getPeople'));
                    _ctr.find("#addApptCancelPeople").click();
                });
                _ctr.find("#addApptCancelPeople").unbind('click').click(function (e) { e.preventDefault(); _ctr.find("#addApptPeopleChooser").empty().peopleChooser('destroy'); $("#addApptPCWrapper").slideUp(); _ctr.find(".addApptContent").slideDown(); });
                _ctr.find("#addApptPCWrapper").slideDown();
            });
            _ctr.find("#addApptRole").html(_g11n.chooseRoles).unbind('click').click(function(e) {
                e.preventDefault();
                var roleIds = new Array();
                $.each($("#roleDisplay").find("li"), function (i, li) { roleIds.push($(li).data('roleId')); });
                _ctr.find(".addApptContent").slideUp();
                _ctr.find("#addApptRoleChooser").roleChooser('destroy').roleChooser({ roleIds: roleIds });
                _ctr.find("#addApptSaveRole").unbind('click').click(function() {
                    var contextRoles = $("#addApptRoleChooser").roleChooser('getRoles');
                    if (contextRoles.length > 0) {
                        bindRoles(contextRoles[0].roles);
                    } else {
                        bindRoles([]);}
                    _ctr.find("#addApptCancelRole").click();
                });
                _ctr.find("#addApptCancelRole").unbind('click').click(function (e) { e.preventDefault(); _ctr.find("#addApptRoleChooser").roleChooser('destroy'); $("#addApptRCWrapper").slideUp(); _ctr.find(".addApptContent").slideDown(); });
                _ctr.find("#addApptRCWrapper").slideDown();
            });
        }
        function bindSections(sectionId) {
            var ddl = _ctr.find("select.whoStudent").empty();
            var term = '';
            ddl.append($("<option>").attr("value", '00000000-0000-0000-0000-000000000000').text(_g11n.allSections));
            $.each(_options.sections, function (i, sec) {
                if (term != sec.term) {
                    ddl.append($("<option disabled='true'>").attr("value", '').text("-- " +sec.term + " --"));
                    term = sec.term;
                }
                ddl.append($("<option>").attr("value", sec.id).text(sec.name));
            });
            if (sectionId != null && sectionId.length > 0)
                ddl.val(sectionId);
        }
        function bindUsers(users) {
            var ul = $("#peopleDisplay");
            ul.hide().empty();
            if (users == null || users.length == 0) return;
            ul.show();
            $.each(users, function (i, person) {
                ul.append($("<li>").data('personId', person.id).html("<span>" + person.name + "</span>&nbsp;").append($("<div style='display:inline;'>" + person.myInfoHtml + "</div>")).append($("<i class='fa fa-times activeItem'>")
                    .click(function () { $(this).parent().hide('slow', function () { $(this).remove(); if (ul.find("li").length == 0) { ul.hide(); } }); })));
            });
        }
        function bindRoles(roles) {
            var ul = $("#roleDisplay");
            ul.hide().empty();
            if (roles == null || roles.length == 0) return;
            ul.show();
            $.each(roles, function (i, role) {
                ul.append($("<li>").data('roleId', role.id).html("<span>" + role.name + "</span>").append($("<i class='fa fa-times activeItem'>")
                    .click(function () { $(this).parent().hide('slow', function () { $(this).remove(); if(ul.find("li").length == 0){ul.hide();} }); })));
            });
        }
        function renderHosts() {
            var hostCtr = _ctr.find("#addApptHosts");
            if (_options.resource == null || _options.resource.hosts == null || _options.resource.hosts.length == 0) {
                hostCtr.hide();
                return;
            };
            
            hostCtr.show();
            var selHosts = $("#selHosts").empty().show().unbind('change').change(function () { _ctr.removeData('apptOverlapStart'); _ctr.find("#cbxRemind, #cbx").removeData(); validate(); });
            var tempHost = '';
            $.each(_options.resource.hosts, function (i, host) {
                selHosts.append($("<option>").attr("value", host.id).text(host.name));
                if (_options.hostId == host.id)
                    tempHost = host.name;
            });

            if (_options.hostId != null && _options.hostId.length > 0 && _ctr.find('#selHosts > option[value="' + _options.hostId+'"]').length > 0) {
                selHosts.val(_options.hostId);
            }

            //bind data, but hide ctr
            if(!_options.resource.canEdit && _options.resource.isHost)
                hostCtr.hide();
        }
        function bindReminder() {
            var selRemind = _ctr.find("#selRemind");
            selRemind.empty().unbind('change').change(function () { if (!_ctr.find("#cbxRemind").prop('checked')) { _ctr.find("#cbxRemind").click(); } });
            selRemind.append($("<option>").attr("value", "30").text(_g11n.thirtyMins));
            selRemind.append($("<option>").attr("value", "60").text(_g11n.oneHour));
            selRemind.append($("<option>").attr("value", "1440").text(_g11n.oneDay));
            selRemind.append($("<option>").attr("value", "2880").text(_g11n.twoDays));
            selRemind.append($("<option>").attr("value", "10080").text(_g11n.oneWeek));

            selRemind.val('1440'); //default 1 day
            var cbx = _ctr.find("#cbxRemind");
            cbx.prop('checked', true);
            cbx.change(function() { _ctr.find("label[for='cbxRemindMe']").html($(this).prop('checked') ? _g11n.remindMeToo : _g11n.remindMe); } );

            _ctr.find("#cbxRemindMe").prop('checked', false);

            var modal = _options.parentModal != null ? _options.parentModal : _ctr;
            var centerFunc = function () { modal.dialog('option', 'position', { my: "center", at: "center", of: window }); };
            
            _ctr.find("#hypEditReminder").unbind('click').click(function (e) {
                e.preventDefault(); _ctr.find(".addApptContent")
                    .fadeOut(500, function () {
                        var selectedHost = _ctr.find("#selHosts option:selected");
                        $("#addApptEmailTemplate").apptEmailTemplate({
                            g11n: _g11n,modal: modal,isForHost: false,
                            template: _ctr.find("#cbxRemind").data('template'),
                            userId: selectedHost.val() == null ? _options.currentUser.id : selectedHost.val(),
                            resourceId: _options.resource.id, appointmentId: _options.appointment.id,
                            onSave: function (template) { _ctr.find(".addApptContent").show(centerFunc); _ctr.find("#cbxRemind").data('template', template).prop('checked', true); },
                            onCancel: function () { _ctr.find(".addApptContent").show(centerFunc); }
                        });
            }); });
            _ctr.find("#hypEditRemindMe").unbind('click').click(function (e) { e.preventDefault(); _ctr.find(".addApptContent")
                    .fadeOut(500, function () {
                        var selectedHost = _ctr.find("#selHosts option:selected");
                        $("#addApptEmailTemplate").apptEmailTemplate({
                            g11n: _g11n,modal: modal, isForHost: true,
                            template: _ctr.find("#cbxRemindMe").data('template'),
                            resourceId: _options.resource.id, appointmentId: _options.appointment.id,
                            userId: selectedHost.val() == null ? _options.currentUser.id : selectedHost.val(),
                            onSave: function (template) { _ctr.find(".addApptContent").show(centerFunc); _ctr.find("#cbxRemindMe").data('template', template).prop('checked', true); },
                            onCancel: function () { _ctr.find(".addApptContent").show(centerFunc); }
                        });
                    }); });
        }
        function validate(triggerCtr) {
            var isValid = true;
            var overlap = $("#overlap");
            overlap.html('').css('display', 'none').removeClass();

            var title = _ctr.find("#addApptTitle").val();
            if (title == null || title.length <= 0)
                isValid = false;

            var date = _ctr.data("apptDate");
            if (!date.isValid())
                isValid = false;

            var start = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptStart").val(), 'MM/DD/YYYY hh:mm a');
            var end = moment(date.format("MM/DD/YYYY") + " " + _ctr.find("#addApptEnd").val(), 'MM/DD/YYYY hh:mm a');
            if (!start.isValid() || !end.isValid())
                isValid = false;

            if (isValid && (start.isAfter(end) || start.isSame(end))) {
                isValid = false;
                if (triggerCtr != null) {
                    triggerCtr.addClass('invalidItem');
                    _ctr.find("#apptLength").html("(" + (triggerCtr.attr('id') == 'addApptStart' ? _g11n.startBeforeEnd : _g11n.endAfterStart) + ")");
                }
            }

            if (isValid && start.isBefore(moment()) && !_options.bypassTimeCheck) {
                renderInPastMesg(overlap);
                isValid = false;
            }
                

            isValid = validateOverlaps(overlap, isValid, title, start, end);

            setAddBtn(isValid);
        }
        function setAddBtn(isValid, btnText) {
            var btn = $("#addApptBtn");

            if (!isValid) {
                btn.removeClass('activeAction').addClass('inactiveAction').unbind('click');
            } else {
                btn.removeClass('inactiveAction').addClass('activeAction').unbind('click').click(function () { $(this).attr('disabled', 'disabled'); submitAppointment(); });
            }
            if (btnText != null && btnText.length > 0)
                btn.html(btnText);
        }

        function renderInPastMesg(ctr) {
            $("#addApptBtn").parent().find("i.fa").remove(); //clear;
            $("#addApptBtn").before($("<i>", { 'class': 'fa fa-exclamation-circle overlapExact' }));
            ctr.css('display', 'block')
                    .addClass('overlapArea overlapExact')
                    .prepend($('<i>', { 'class': 'fa fa-exclamation-circle fa-2x' }))
                    .append($("<div>").html(_g11n.noPastMesg))
                    .append(ctr);
        }

        function validateOverlaps(overlap, isValid, title, start, end) {
            if (!isValid) return isValid;

            var id = _ctr.data("apptId");
            var ctr = $("<div class='overlapAppts' style='display:none'>");
            var overlapCount = 0;
            var isAdvanced = _ctr.find("#addApptRepeat").prop('selectedIndex') > 0 || _ctr.find("#addApptNum").prop('selectedIndex') > 0;
            if (_options.fullCalView != null && _options.fullCalView.name != 'list' && moment(_options.fullCalView.start).isBefore(start) && _options.fullCalView.end.isAfter(end) && !isAdvanced) { //within the viewable range
                overlapCount = processOverlapAppointments(ctr, _options.appts, id, title, start, end);
            } else {
                overlapCount = getServerOverlapCount(ctr, id, title, start, end, isAdvanced);
            }
            isValid = renderOverlaps(overlapCount, overlap, ctr);
            return isValid;
        }

        function getServerOverlapCount(ctr, id, title, start, end, isAdvanced) {
            var overlapCount = 0;
            var doy = _ctr.data('apptOverlapStart');
            var startDoy = start.dayOfYear();
            var dateFormat = 'MM/DD/YYYY, h:mm:ss a';
            if (isAdvanced || doy == null || startDoy < doy || startDoy > doy) { //cache test or isAdvanced
                setAddBtn(false, _g11n.checkConflicts);
                $.ajax({
                    type: "GET",
                    url: 'rpc/appointmentsInfo/GetOverlaps',
                    contentType: 'application/json; charset=utf-8',
                    data: {
                        'id': id == null ? '' : id,
                        title: title,
                        startDate: start.format(dateFormat),
                        endDate: end.format(dateFormat),
                        untilDate: moment(_ctr.find("#addApptUntil").datepicker('getDate')).format(dateFormat),
                        repeatType: _ctr.find("#addApptRepeat").val(),
                        repeatMins: _ctr.find("#addApptNum").val(), 
                        resourceId: _ctr.find("#selHosts option:selected").val() != null && _ctr.find("#selHosts").is(':visible') && _options.resource.id != null ? _options.resource.id : '', //only load for resource manager view
                        ownerId: _options.resource.id != null ?  $("#selHosts").val() : ''
                    },
                    async: false, //don't want to async the validation check
                    cache: false,
                    success: function (appts) {
                        $($.grep($(appts), function (app, indx) { return app.end != null; })).each(function (i, appt) {
                            appt.start = moment(appt.start);
                            appt.end = moment(appt.end);
                            appt.isReadOnly = !appt.isOwner;
                        }); //create moment wrapper on each date
                        overlapCount = processOverlapAppointments(ctr, appts, id, title, start, end, isAdvanced);

                        if (!isAdvanced) {//cache
                            _ctr.data('apptOverlapStart', start.dayOfYear());
                            _ctr.data('apptOverlap', appts);     
                        }
                        setAddBtn(true, _g11n.saveDetails);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('There was an error trying to validate your request');
                    }
                });
            } else { //read from cache
                overlapCount = processOverlapAppointments(ctr, _ctr.data('apptOverlap'), id, title, start, end);
            }

            return overlapCount;
        }

        function renderOverlaps(overlapCount, overlap, ctr) {
            var isValid = true;
            if (overlapCount != 0) {
                if (overlapCount < 0)
                    isValid = false;

                overlap.css('display', 'block')
                    .addClass('overlapArea ' + (!isValid ? "overlapExact" : ""))
                    .prepend($('<i>', { 'class': 'fa fa-exclamation-circle fa-2x' }))
                    .append($("<div class='overlapInfo'>")
                                .append($("<span>").html(stringUtil.format((isValid ? _g11n.overlapMesg : _g11n.exactMesg), overlapCount) + "&nbsp;"))
                                .append($("<a href='' class='activeItem'>").html(_g11n.showOverlap)
                                        .click(function (e) { e.preventDefault(); $(this).html($(this).html() == _g11n.showOverlap ? _g11n.hideOverlap : _g11n.showOverlap );  _ctr.find(".overlapAppts").slideToggle('normal'); }))
                            )
                    .append(ctr);
                $("#addApptBtn").parent().find("i.fa").remove();
                if (!isValid)
                    $("#addApptBtn").before($("<i>", { 'class': 'fa fa-exclamation-circle overlapExact' }));

            } else {
                overlap.css('display', 'none');
                $("#addApptBtn").parent().find("i.fa").remove();
            }
            return isValid;
        }

        function processOverlapAppointments(ctr, appts, id, title, start, end, isAdvanced) {
            var overlapCount = 0;
            var selectedHost = _ctr.find("#selHosts option:selected");
            var ownerId = _ctr.find("#selHosts").is(':visible') && selectedHost.val() != null ? selectedHost.val() : '';
            $($.grep($(appts), function (app, indx) { return app.end != null; })).each(function (i, appt) {
                if (appt.isExact || (appt.id != id && appt.title == title && appt.start.isSame(start) && appt.end.isSame(end) && (ownerId == '' || appt.ownerId == ownerId))) {
                    overlapCount = -1;
                    ctr.empty(); //clear
                    addApptToCtr(ctr, appt, start);
                    return false; //break
                }
                //logic for overlapping
                if ((isAdvanced && appt.id != id) || ((ownerId == '' || appt.ownerId == ownerId) && appt.id != id && ((appt.start.isBefore(end) && appt.start.isAfter(start)) || (appt.end.isBefore(end) && appt.end.isAfter(start)) || (start.isBefore(appt.end) && end.isAfter(appt.start))))) {
                    addApptToCtr(ctr, appt, start);
                    overlapCount++;
                }
            });
            return overlapCount;
        }

        function showInPastModal() {
            var pastModal = $("<div class='addApptNoPast'>").html(_g11n.noPastMesg);
            pastModal.dialog({
                modal: true,
                draggable: false,
                width: 500,
                dialogClass: 'addAppointmentContainer',
                buttons: [{ "class": "activeAction" }], //placeholder
                open: function (event, ui) {
                    //replace dialog button element with our own custom version
                    var buttonPane = $(this).parent().find(".ui-dialog-buttonpane");
                    var origBtn = buttonPane.find(".activeAction");
                    $("<button>", { 'class': 'activeAction', id: 'addApptBtn', text: _g11n.ok, type: 'button' })
                        .appendTo(buttonPane)
                        .click(function () { pastModal.dialog('close'); });
                    origBtn.remove();
                },
                close: function (event, ui) { //destroy
                    if (_options.onCancel != null) { _options.onCancel(); }
                    $(this).dialog('destroy').remove();
                } 
            });
        }
        function bindConfirmModal(mesg, infoElem, cancelTxt, btnTxt, action) {
            var confirmModal = $(".confirmAddModal");
            confirmModal.find(".otherItem").remove();
            confirmModal.find(".confirmMesg").html(mesg);
            confirmModal.find(".confirmInfo").empty().append(infoElem);
            confirmModal.find(".apptDetailAction a.activeItem").unbind('click').text(cancelTxt).click(function (e) { e.preventDefault(); confirmModal.dialog('close'); });
            confirmModal.find("button.activeAction").unbind('click').text(btnTxt).click(function () { action(confirmModal); });
            confirmModal.dialog("open");
        }
    }
}(jQuery, window, document));
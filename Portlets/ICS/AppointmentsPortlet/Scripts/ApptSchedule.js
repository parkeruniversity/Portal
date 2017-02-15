
function initSchedule(ApptApp) {
    ApptApp.UserScheduleRoute = Ember.Route.extend({
        model: function (param) {
            return apptPortlet.getUser(param.user_id);
        },
        setupController: function (controller, model) {
            ApptApp.history = { view: 'userSchedule', isSchedule: true, param: model.id };
            this.controllerFor('schedule')
                .set('isEditMode', model.id == apptPortlet.id).set('user', model).set('resource', {}).set('isSpecific', false)
                .set('isResource', false).set('apptSetting', apptPortlet.apptSetting).set('apptId', '')
                .set('canAddAppt', model.id == apptPortlet.id)
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });
    ApptApp.UserScheduleIdRoute = Ember.Route.extend({
        model: function (param) {
            var ids = param.ids.split('_');
            var info = ids[1].split('|');
            return { user: apptPortlet.getUser(ids[0]), apptId: info[0], defaultDate: info[1].replace(/-/g, '/'), rawParam:param.ids };
        },
        setupController: function (controller, model) {
            ApptApp.history = { view: 'userScheduleId', isSchedule: true, param: model.rawParam };
            this.controllerFor('schedule')
                .set('isEditMode', model.user.id == apptPortlet.id).set('user', model.user).set('resource', {}).set('isSpecific', false)
                .set('isResource', false).set('apptSetting', apptPortlet.apptSetting).set('apptId', model.apptId).set('defaultDate', model.defaultDate)
                .set('canAddAppt', model.id == apptPortlet.id)
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });
    ApptApp.ScheduleSpecificRoute = Ember.Route.extend({
        setupController: function(controller, model) {
            var isEditMode = false;
            if (apptPortlet.apptSetting == 2 && $.grep(apptPortlet.hosts, function(host) { return host.id == apptPortlet.id; }).length > 0) {
                isEditMode = true;
            }
            ApptApp.history = { view: 'scheduleSpecific', isSchedule: true };
            this.controllerFor('schedule')
                .set('isEditMode', isEditMode).set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific', apptPortlet.apptSetting == 2)
                .set('resource', {}).set('isResource', false).set('apptSetting', apptPortlet.apptSetting).set('apptId', '')
                .set('canAddAppt', isEditMode)
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });
    ApptApp.ScheduleSpecificIdRoute = Ember.Route.extend({
        model: function (param) {
            var info = param.appt_id.split('|');
            return { apptId: info[0], defaultDate: info[1].replace(/-/g, '/'), rawParam: param.appt_id };
        },
        setupController: function(controller, model) {
            var isEditMode = false;
            if (apptPortlet.apptSetting == 2 && $.grep(apptPortlet.hosts, function(host) { return host.id == apptPortlet.id; }).length > 0) {
                isEditMode = true;
            }
            ApptApp.history = { view: 'scheduleSpecificId', isSchedule: true, param: model.rawParam };
            this.controllerFor('schedule')
                .set('isEditMode', isEditMode).set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific', apptPortlet.apptSetting == 2)
                .set('resource', {}).set('isResource', false).set('apptSetting', apptPortlet.apptSetting).set('apptId', model.apptId).set('defaultDate', model.defaultDate)
                .set('canAddAppt', isEditMode)
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });

    ApptApp.ScheduleDateRoute = Ember.Route.extend({
        model: function (param) {
            return { date: param.date.replace(/-/g, '/'), rawParam:param.date };
        },
        setupController: function(controller, model) {
            var resource = apptPortlet.getResource(apptPortlet.resourceId);
            ApptApp.history = { name: resource.name, view: 'scheduleDate', isSchedule: true, param: model.rawParam };
            this.controllerFor('schedule')
                .set('isEditMode', resource.canEdit).set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific', false)
                .set('resource', resource).set('isResource', apptPortlet.resourceId != '').set('defaultDate', model.date).set('apptSetting', apptPortlet.apptSetting).set('apptId', '')
                .set('canAddAppt', (resource.canEdit || (resource.isHost && resource.canSchedule)))
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });

    ApptApp.ScheduleResourceRoute = Ember.Route.extend({
        model: function (param) {
            return { resourceId: param.resource_id};
        },
        setupController: function(controller, model) {
            var resource = apptPortlet.getResource(model.resourceId);
            var isFromCampus = ApptApp.history.view == 'campus';
            ApptApp.history = { name: resource.name, view: 'scheduleResource', isSchedule: true, param: model.resourceId };
            this.controllerFor('schedule').set('isFromCampus', isFromCampus)
                .set('isEditMode', resource.canEdit).set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific', false)
                .set('resource', resource).set('isResource', resource.id != null).set('defaultDate', model.date).set('apptSetting', apptPortlet.apptSetting).set('apptId', '')
                .set('canAddAppt', (resource.canEdit || (resource.isHost && resource.canSchedule)))
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });
    ApptApp.ScheduleIdRoute = Ember.Route.extend({
        model: function (param) {
            var info = param.appt_id.split('|');
            return { apptId: info[0], defaultDate: info[1].replace(/-/g, '/'), rawParam:param.appt_id};
        },
        setupController: function (controller, model) {
            var resource = apptPortlet.getResource(apptPortlet.resourceId);
            var isEditMode = resource.id != null ? resource.canEdit : true;
            ApptApp.history = { name: resource.name, view: 'scheduleId', isSchedule: true, param: model.rawParam };
            this.controllerFor('schedule')
                .set('isEditMode', isEditMode)
                .set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific', false)
                .set('resource', resource).set('isResource', apptPortlet.resourceId != '').set('apptSetting', apptPortlet.apptSetting).set('apptId', model.apptId).set('defaultDate', model.defaultDate)
                .set('canAddAppt', (isEditMode || resource.canEdit || (resource.isHost && resource.canSchedule)))
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
        renderTemplate: function () {
            this.render('schedule');
        }
    });

    ApptApp.ScheduleRoute = Ember.Route.extend({
        setupController: function (controller, model) {
            var resource = apptPortlet.getResource(apptPortlet.resourceId);
            var isEditMode = resource.id != null ? resource.canEdit : true;
            ApptApp.history = { name: resource.name, view: 'schedule', isSchedule: true};
            controller.set('isEditMode', isEditMode)
                .set('user', { name: apptPortlet.name, imgUrl: apptPortlet.imgUrl }).set('isSpecific',false)
                .set('resource', resource).set('isResource', apptPortlet.resourceId != '').set('apptSetting', apptPortlet.apptSetting).set('apptId', '')
                .set('canAddAppt', (isEditMode || resource.canEdit || (resource.isHost && resource.canSchedule)))
                .set('isAnyone', apptPortlet.apptSetting == 0);
        },
    });

    ApptApp.ScheduleController = Ember.Controller.extend({
        user: {},
        resource:{},
        isEditMode: true,
        isResource: false,
        isSpecific: false,
        g11n: apptPortlet.g11n,
        canManageSettings: apptPortlet.canManageSettings,
        canAdmin: apptPortlet.canAdmin,
        defaultDate: '',
        apptSetting: 0,
        apptId:''
    });

    ApptApp.rerenderAll = function (calendar, rerenderAction, onlyrerender) {
        if(onlyrerender == null || !onlyrerender)
            apptFullCal.reload();

        rerenderAction(calendar);
        $("#scheduleNotifications").apptNotification('render');
    },

    ApptApp.ScheduleView = Ember.View.extend({
        didInsertElement: function () {
            ApptApp.currentController = this.controller;
            var controller = this.controller;
            this.renderView(controller, this.editAppt, this.signUpApptModal);
        },
        renderView: function (controller, editAppt, signUpApptModal, isRerender, defaultView) {
            if ((((!apptPortlet.ableToEdit && !controller.isResource) || (controller.isResource && !controller.resource.canEdit)) && controller.isEditMode) || apptPortlet.name == null) {
                if (apptPortlet.apptSetting == 0) controller.transitionTo('main');
                else controller.transitionTo('mainParam', 'myS');
            }

            var calendar = $("#calendar");
            var resource = controller.resource;
            var apptUserId = getApptUserId();
            setNewAppt(calendar, null);

            var userIds = controller.isSpecific && !controller.isEditMode ? $.map(apptPortlet.hosts, function (host, i) { return host.id; }).join(',') : apptUserId;

            apptMiniCal.init($("#miniCalendar"), $(".miniCalApptCount"), controller.g11n, userIds, controller.resource.id);
            apptMiniCal.onWeekendClick = function (date) {
                if (apptFullCal.getView().name != 'agendaDay' && apptPortlet.showWeekends == false) {
                    apptFullCal.showWeekends(calendar, true, date);
                }
            };

            if (isRerender)
                apptFullCal.destroy();

            apptFullCal.init({
                data: { resourceId: resource.id ? resource.id : '', userIds: userIds },
                defaultDate: controller.defaultDate,
                allowEditing: controller.isEditMode || (controller.isResource && resource.isHost && resource.canSchedule),
                hideViewSelector: controller.isResource && controller.isEditMode,
                calElem: calendar,
                noApptMesg: controller.g11n.noAppts,
                showWknd: apptPortlet.showWeekends || (controller.isResource && controller.isEditMode),
                updateWknd: apptPortlet.updateSettings,
                postRender: apptMiniCal.renderMiniCalendar,
                rerender: function (cal) { apptMiniCal.rerenderMiniCalendar(cal); $("#scheduleNotifications").apptNotification('render'); },
                createEvent: this.createAppt,
                editEvent: function (appt, isClick, revertFunc, rerenderAction) {
                    if (controller.isEditMode && !appt.editable) return;
                    if (appt.editable)
                        editAppt(appt, isClick, revertFunc, rerenderAction);
                    else
                        signUpApptModal(appt, isClick, revertFunc, rerenderAction);
                },
                changeView: processScheduleChangeView,
                g11n: controller.g11n,
                listViewPageSize: apptPortlet.listViewPageSize,
                readonlySources: controller.isResource && controller.isEditMode ? '' : [{ url: 'rpc/appointmentsinfo/GetOtherSchedules', data: { resourceId: (controller.isResource ? resource.id : ''), excludedUserIds: (controller.isEditMode || controller.isResource ? apptPortlet.id : userIds) } }, { url: 'api/calendarevents?fullCalendar=true&filter=conflictable' }],
                postApptRender: function (appt, elem, view) {
                    if (appt.isReadOnly && !appt.editable) return;
                    var apptWrapper = view.name == 'list' ? elem : elem.find('.fc-content');

                    if (controller.isEditMode && appt.hasAttendees && view.name != 'list') {
                        apptWrapper.html(appt.attendeeInfo).append($("<span class='fc-cus-event-info'>").html(appt.title));
                    }
                    if (!controller.isResource && !controller.isSpecific && !controller.isEditMode && appt.hasAttendees && view.name=='list') {
                        apptWrapper.find('.fc-event-title').html("");
                        apptWrapper.find('.fc-event-who').html(appt.title);
                    }
                    if (controller.resource.canEdit || (controller.isSpecific && appt.owner != null && appt.owner.length > 0)) {
                        if (view.name == 'list' && controller.isSpecific) {
                            apptWrapper.find('.fc-event-title').html(" (" + appt.owner + ")");
                            if (appt.hasAttendees)
                                apptWrapper.find('.fc-event-who').html(appt.title);
                            if (controller.isEditMode && !appt.editable)
                                apptWrapper.css('cursor', 'default');;
                        }
                        else
                            apptWrapper.append($("<span class='fc-cus-event-info'>").html("(" + appt.owner + ")"));
                    }
                    if (controller.apptId == appt.id) {
                        controller.apptId = '';
                        apptFullCal.triggerClick(appt);
                    }
                    if (appt.newCommentCount > 0) {
                        var comTxt = $("<span class='fc-comment'>").append($("<i class='fa fa-comment'/>")).append(view.name == 'list' ? stringUtil.format((appt.newCommentCount == 1 ? controller.g11n.newComment : controller.g11n.newComments), appt.newCommentCount) : '');
                        apptWrapper.prepend(comTxt);
                    }
                }
            }, controller.isResource && controller.isEditMode ? 'agendaDay' : defaultView);

            if(!isRerender)
                this.bindHeader(controller, calendar);

            if (controller.isEditMode || (resource.canEdit || (resource.isHost && resource.canSchedule))) {
                $("#addAppt").click(function () {
                    var view = apptFullCal.getView();
                    var today = moment();
                    //if 'today' is shown in the week view, then default to today, else use the view's start date
                    var dayInfo = view.name == 'agendaWeek' && moment(view.start).isBefore(today) ? today : moment(view.start);
                    $.addAppointment({ g11n: apptPortlet.g11n }).open({
                        appointment: getNewAppt(calendar, controller, roundedMoment(dayInfo), null, true),
                        currentUser: { id: apptPortlet.id, name: apptPortlet.name.full },
                        portletId: apptPortlet.portletId,
                        resource: controller.resource,
                        showAdvanced: controller.resource.canEdit,
                        hostId: getApptUserId(),
                        day: dayInfo,
                        fullCalView: view,
                        canAddAttendees: apptPortlet.canAddAttendees,
                        appts: apptFullCal.getAppointments(),
                        sections: !controller.isResource ?  apptPortlet.sections : [],
                        onOk: function (appt, isReoccurring) {
                            if (isReoccurring) {
                                ApptApp.rerenderAll(calendar, apptMiniCal.rerenderMiniCalendar);
                                setNewAppt(calendar, appt.appt);
                            }
                            else if (appt != null) {
                                setNewAppt(calendar, appt);
                                apptFullCal.renderAppt(appt);
                            }
                        }
                    });
                });

                processSpecificHosts(controller, calendar, false);
                processManageHosts(controller, calendar);
            }
            else
                $("#addAppt").hide();

            var hosts = userIds != null && userIds.length > 0 ? userIds : (controller.user.id != null ? controller.user.id : apptPortlet.id);

            $("#scheduleNotifications").apptNotification({
                g11n: controller.g11n,
                baseUrl: apptPortlet.baseUrl, renderFullTxt: true, isSchedule: !controller.isEditMode && !resource.isHost,
                resourceId: (controller.isResource ? controller.resource.id : ''), hostIds: controller.isResource ? '' : hosts, includeNextAvail: !controller.isEditMode && !resource.isHost, callback: function (apptInfo) {
                    var date = moment(apptInfo.start);
                    if ((date.weekday() == 0 || date.weekday() == 6) && apptPortlet.showWeekends == false)
                        apptFullCal.showWeekends(calendar, true, date);

                    controller.set('apptId', apptInfo.id);
                    apptFullCal.gotToDate('agendaDay', date);
                    processScheduleChangeView('agendaDay');
                }
            });

            if (controller.isFromCampus && controller.isResource) {
                ApptApp.history = {name:'',isSchedule:false,view:'main'};
                $(".backLnk a.activeItem").unbind('click').html(controller.g11n.backToCampus).click(function (e) { e.preventDefault(); controller.transitionTo('campus'); return false; });
            }

            bindHelp(controller,false);
            if (controller.resource.canEdit)
                $("#managerHelp").show().appointmentHelp({ g11n: controller.g11n, isHost: true, screen: 7, linkTxt: controller.g11n.resourceApptWork, titleTxt: controller.g11n.resourceApptWork, portletId: apptPortlet.portletId });

        },
        bindHeader: function (controller, cal) {
            $("img.userPhoto").attr('src', controller.isResource ? controller.resource.imgUrl : controller.user.imgUrl);
            $(".mySchedulePersonal .apptsHeader").html(controller.isResource && controller.resource.isHost && !controller.resource.canEdit
                            ? stringUtil.format(controller.g11n.resApptWithUser,apptPortlet.name.full,controller.resource.name)
                            : stringUtil.format(controller.g11n.apptWithUser, controller.isResource ? controller.resource.name : controller.user.name.full));

            bindResourceHosts(controller, cal);

            if (controller.isSpecific) {
                var ul = $("#specificHosts");
                var countIndex = apptPortlet.hosts.length - 1;
                $.each(apptPortlet.hosts, function (i, host) {
                    var li = $("<li>").append($("<img>", { src: host.imgUrl })).append($("<span>").html(host.name + (i == countIndex ? "" : ", ")));
                    if (i + 1 == countIndex)
                        li.append(" " + controller.g11n.and);
                    ul.append(li);
                });
            }
            var facWrapper = $("#myFaculty").empty().hide();
            if (!controller.isSpecific && !controller.isResource && !controller.isEditMode) {
                $.get('rpc/appointmentslms/getfacultyinfo/?facultyId=' + controller.user.id,function(info) {
                    if (info == null) return;
                    var sections = $.map(info.sections,function (section) { return section; }).join(', ');
                    facWrapper.append($("<span class='inactiveItem itemInfo'>").html(controller.g11n.myFacFor + "&nbsp;" + sections))
                        .show('normal');
                });
            }
        },
        createAppt: function (start, end, isClick, rerenderAction, revertFunc) {
            var calendar = $("#calendar");

            $.addAppointment({ g11n: apptPortlet.g11n }).open({
                appointment: getNewAppt(calendar, ApptApp.currentController, start, end, isClick),
                currentUser: { id: apptPortlet.id, name: apptPortlet.name.full },
                portletId: apptPortlet.portletId,
                resource: ApptApp.currentController.resource,
                hostId: getApptUserId(),
                showAdvanced: ApptApp.currentController.resource.canEdit,
                canAddAttendees: apptPortlet.canAddAttendees,
                fullCalView: apptFullCal.getView(),
                appts: apptFullCal.getAppointments(),
                sections: !ApptApp.currentController.isResource ? apptPortlet.sections : [],
                onCancel: function () { revertFunc(); },
                onOk: function (appt, isReoccurring) {
                    if (isReoccurring) {
                        ApptApp.rerenderAll(calendar, rerenderAction);
                        setNewAppt(calendar, appt.appt);
                    }
                    else if (appt != null) {
                        setNewAppt(calendar, appt);
                        apptFullCal.renderAppt(appt);
                    }
                }
            });
        },
        editAppt: function (appt, isClick, revertFunc, rerenderAction) {
            var calendar = $("#calendar");
            if (appt.hasAttendees && isClick) {
                revertFunc();
                $.apptDetails({
                    controller: ApptApp.currentController, appointment: appt, resource: ApptApp.currentController.resource, hostId: getApptUserId(), g11n: apptPortlet.g11n,
                    hideHostLink: ApptApp.currentController.isSpecific, canAddAttendees: apptPortlet.canAddAttendees, rerender: function () {ApptApp.rerenderAll(calendar, rerenderAction); },
                    onRemoveAttendees: function (ap) { apptFullCal.triggerClick(ap); }
                });
                return;
            }
            $.addAppointment({ g11n: apptPortlet.g11n }).open({
                appointment: appt,
                resource: ApptApp.currentController.resource,
                hostId: getApptUserId(),
                showAdvanced: ApptApp.currentController.resource.canEdit,
                canAddAttendees: apptPortlet.canAddAttendees,
                fullCalView: apptFullCal.getView(),
                appts: apptFullCal.getAppointments(),
                sections: !ApptApp.currentController.isResource ? apptPortlet.sections : [],
                onOk: function (edited, isReoccurring) {
                    if (isReoccurring) {
                        ApptApp.rerenderAll(calendar, rerenderAction);
                    }
                    else if (edited != null) {
                        //make sure start/end is the fullCal moment obj
                        appt.start = $.fullCalendar.moment(edited.start);
                        appt.end = $.fullCalendar.moment(edited.end);
                        apptFullCal.updateAppointment(appt);
                        rerenderAction(calendar);
                    }
                },
                onAddAttendee: function (returnFunc) { $.apptDetails({ showAttendeeFunc: returnFunc, controller: ApptApp.currentController, appointment: appt, resource: ApptApp.currentController.resource, hostId: getApptUserId(), g11n: apptPortlet.g11n, hideHostLink: ApptApp.currentController.isSpecific, canAddAttendees: apptPortlet.canAddAttendees, rerender: function () { ApptApp.rerenderAll(calendar, rerenderAction); }, onRemoveAttendees: function (ap) { apptFullCal.triggerClick(ap); } }); },
                onCancel: function () { if (revertFunc != null) revertFunc(); },
                onRemove: function () { ApptApp.rerenderAll(calendar, rerenderAction); }
            });
        },
        signUpApptModal: function (appt, isClick, revertFunc, rerenderAction) {
            var resource = ApptApp.currentController.resource;
            var calendar = $("#calendar");
            if (appt.hasAttendees) {
                $.apptDetails({
                    controller: ApptApp.currentController, appointment: appt, resource: resource, hostId: getApptUserId(), g11n: apptPortlet.g11n, hideHostLink: ApptApp.currentController.isSpecific, canAddAttendees: apptPortlet.canAddAttendees,
                    rerender: function () { ApptApp.rerenderAll(calendar, rerenderAction); }, onRemoveAttendees: function (ap) { if (resource != null && resource.isHost || ApptApp.currentController.isEditMode) { apptFullCal.triggerClick(ap); } }
                });
                return;
            }

            var signUpModal = $(".signUpAppt").removeData();
            signUpModal.data('appt', appt);
            signUpModal.dialog({
                modal: true,
                draggable: false,
                width: 600,
                dialogClass: 'signUpContainer',
                open: function (event, ui) {
                    var host = resource == null || !resource.isHost ? "" : "<span class='inactiveItem'>(" + appt.owner + ")</span>";
                    $(this).siblings().find(".ui-dialog-title").html(stringUtil.format('<strong>{0}</strong> {1} {2} {3}', appt.title, host, (appt.location.length > 0 ? apptPortlet.g11n.at : ''), appt.location));
                },
                close: function () { $(this).dialog('destroy'); }
            });
            
            
            signUpModal.find(".signUpInfo").show();
            signUpModal.find(".signUpDescip").html(appt.description);
            signUpModal.find(".signUpDate").html(apptDateUtil.getDateDisplay(appt.start, appt.end));
            signUpModal.find(".signUpTime").html(apptDateUtil.getTimeDiff(appt.start, appt.end, apptPortlet.g11n));
            signUpModal.find(".signUpOverlap").html(getOverlapHtml(calendar, appt));
            signUpModal.find(".signUpAttendees").hide();
            signUpModal.find(".signUpChooserWrapper").hide();
            signUpModal.find('.signupAction.apptDetailAction button.activeAction').unbind('click')
                        .click(function () {
                            var success = signupAppt(signUpModal.data('appt'));
                            signUpModal.dialog('close');
                            if (success) {
                                appt.className = 'hasAttendee';
                                appt.hasAttendees = true;
                                apptFullCal.updateAppointment(appt);
                                ApptApp.rerenderAll(calendar, rerenderAction,true);
                            } else { alert('unable to sign up');}
                        });
            signUpModal.find(".signupAction.apptDetailAction a.activeItem").unbind('click').click(function (e) { e.preventDefault(); signUpModal.dialog('close'); });
            
            if (resource != null && resource.isHost || ApptApp.currentController.isEditMode) 
            {
                signUpModal.find('.apptDetailAction').hide();
                if (apptPortlet.canAddAttendees) {
                    signUpModal.find(".signUpAttendees").show();
                    signUpModal.find(".signUpAttendees a").unbind('click').click(function (e) {
                        e.preventDefault();
                        signUpModal.find(".signUpInfo").fadeToggle('fast', function () {
                            var wrapper = signUpModal.find(".signUpChooserWrapper").show();
                            wrapper.find(".apptDetailAction").show();
                            var chooser = wrapper.find("#signUpChooser").peopleChooser('destroy').empty();
                            chooser.peopleChooser({
                                showFull: true
                            });
                            wrapper.find("button.activeAction").unbind('click').click(function () {
                                var userIds = $.map(chooser.peopleChooser('getPeople'), function (person) { return person.id; }).join(',');
                                var isRemoveAll = (userIds == null || userIds.length == 0);
                                $.post('rpc/appointmentsDetail/AddAttendees/', { appointmentId: appt.id, attendeeIds: userIds, removeAll: isRemoveAll, portletId:apptPortlet.portletId },
                                      function (attendees) {
                                          if (attendees == null) { alert('unable to modify attendees'); }
                                          else {
                                              if (isRemoveAll) {
                                                  wrapper.find("a.activeItem").click();
                                              } else {
                                                  var origAppt = $.grep(calendar.fullCalendar('clientEvents'), function(event) { return event.id == appt.id; })[0];
                                                  origAppt.className = 'hasAttendee';
                                                  origAppt.hasAttendees = true;
                                                  apptFullCal.updateAppointment(origAppt);
                                                  rerenderAction(calendar);
                                                  apptFullCal.triggerClick(origAppt);
                                              }
                                          }
                                          signUpModal.dialog('close');
                                      });
                            });
                            wrapper.find("a.activeItem").unbind('click').click(function (e) { e.preventDefault(); wrapper.find("#signUpChooser").peopleChooser('destroy'); wrapper.hide(); signUpModal.find(".signUpInfo").show(); });
                        });
                    });
                }
            }
            else
                signUpModal.find('.apptDetailAction').show();
       
            function getOverlapHtml(cal, signUpAppt) {
                var appts = apptFullCal.getAppointments();
                var ctr = $("<div class='overlapAppts'>");
                var hasOverlap = false;
                $(appts).each(function (i, appt) {
                    //logic for overlapping
                    if (appt.id != signUpAppt.id && (appt.isReadOnly || appt.hasAttendees) && ((appt.start.isBefore(signUpAppt.end) && appt.start.isAfter(signUpAppt.start)) || (appt.end.isBefore(signUpAppt.end) && appt.end.isAfter(signUpAppt.start)) || (signUpAppt.start.isBefore(appt.end) && signUpAppt.end.isAfter(appt.start)))) {
                        addApptToCtr(ctr, appt);
                        hasOverlap = true;
                    }
                });
                if (!hasOverlap) return ' ';

                var overlap = $("<div>").addClass('overlapArea')
                    .prepend($('<i>', { 'class': 'fa fa-exclamation-circle fa-2x' }))
                    .append($("<div class='overlapInfo'>").html(apptPortlet.g11n.overlapSignupMesg))
                    .append(ctr);
                return $("<div>").append(overlap).html();
            }

            function signupAppt(appt) {
                var rVal = false;
                $.ajax({
                    type: "PUT",
                    url: 'api/appointments/' + appt.id + "?userId=" + apptPortlet.id + "&portletId=" + apptPortlet.portletId,
                    async: false, //make sure the user can sign up for the appointment
                    cache: false,
                    success: function (result) {
                        rVal = result;
                    },
                });
                return rVal;
            }
        }
    });
    function processScheduleChangeView(viewName) {
        var wrapper = $(".miniCalWrapper");
        if (viewName == 'list') {
            wrapper.hide('normal');
            $(".apptKeyHolder .apptKeyInfo.inactiveItem").hide();
        } else {
            if (!wrapper.is(':visible'))
                apptMiniCal.rerenderMiniCalendar($("#calendar"));
            wrapper.fadeIn('normal');
            $(".apptKeyHolder .apptKeyInfo.inactiveItem").show();
        }

        if (ApptApp.currentController.isEditMode) {
            var addApptActions = $(".addApptActions");
            var specific = $(".specificShowHosts");
            var hosts = $(".resourceHostWrapper");
            if (viewName == 'list') {
                specific.detach().addClass('addAppt-list').insertBefore(wrapper).hide().show('fast');
                addApptActions.detach().addClass('addAppt-list').insertBefore(wrapper).hide().show('fast');
                hosts.detach().addClass('addAppt-list').insertBefore(wrapper).hide().show('fast');

            } else if (addApptActions.hasClass('addAppt-list')) {
                addApptActions.detach().removeClass('addAppt-list').prependTo($(".addApptTop")); //moveback
                specific.detach().removeClass('addAppt-list').prependTo($(".miniCal-details")); //moveback
                hosts.detach().removeClass('addAppt-list').appendTo($(".miniCal-details")); //moveback
            }
        }
        bindHelp(ApptApp.currentController, viewName == 'list');
    }
    function bindResourceHosts(controller, cal) {
        if (controller.isResource && controller.resource.canEdit) {
            $("#hypChangeIntro").unbind('click').click(function (e) { e.preventDefault(); $(this).hide(); $(".rg-descrip").hide(); renderIntroMesgEditor(controller, $(this), $(".rg-descrip")); });
            var selHosts = $("#selShowHosts").empty();
            selHosts.append($("<option>").attr('value', '').text(stringUtil.format(controller.g11n.allHosts, controller.resource.name)));
            $.each(controller.resource.hosts, function (i, host) {
                selHosts.append($("<option>").attr('value', host.id).text(host.name));
            });
            selHosts.unbind('change').change(function () {
                var newOwner = $(this).val();
                if (newOwner == apptPortlet.id)
                    apptFullCal.rebindReadOnlySources([{ url: 'rpc/appointmentsinfo/GetOtherSchedules', data: { resourceId: controller.resource.id, excludedUserIds: apptPortlet.id } }, { url: 'api/calendarevents?fullCalendar=true&filter=conflictable' }]);
                else
                    apptFullCal.rebindReadOnlySources(null);
                apptFullCal.updateData({ resourceId: controller.resource.id, userIds: newOwner });
                apptMiniCal.updateUsers(newOwner);
                apptMiniCal.rerenderMiniCalendar(cal);
            });
            $(".miniCalApptCount, .addApptTop span.itemInfo").hide();
        }
        else {
            $(".miniCalApptCount, .addApptTop span.itemInfo").show();
        }
    }
    function processManageHosts(controller, cal) {
        //bind link, on save reset the apptPortlet.hosts, set processSpecificHosts
        if (!controller.isResource || !controller.resource.canEdit) return;
        $("#schManageResHosts").unbind('click').click(function (e) { e.preventDefault();
            $.apptManageHosts({
                g11n: controller.g11n, resource: controller.resource, isResource: true, portletId: apptPortlet.portletId,
                onSave: function (res) { controller.resource = res; bindResourceHosts(controller,cal); ApptApp.rerenderAll(cal, apptMiniCal.rerenderMiniCalendar); }
            });
        });
    }
    function processSpecificHosts(controller, calendar, showAllHosts) {
        if (!controller.isSpecific) return;
            
        $(".specificHostInfo").html(showAllHosts ? controller.g11n.showEveryoneAppts : controller.g11n.showMyAppts);
        $("#specificHostLnk").data('showAll', showAllHosts).html(showAllHosts ? controller.g11n.showMyLnk : controller.g11n.showEveryoneLnk).unbind('click')
           .click(function (e) {
               e.preventDefault();
               var isEveryone = !$(this).data('showAll');
               var userIds = isEveryone ? $.map(apptPortlet.hosts, function (host, i) { return host.id; }).join(',') : '';
               apptFullCal.updateData({ resourceId: '', userIds: userIds });
               apptMiniCal.updateUsers(userIds);
               apptMiniCal.rerenderMiniCalendar(calendar);
               processSpecificHosts(controller, calendar, isEveryone);
            });
    }
    function renderIntroMesgEditor(controller, hyp, descrip) {
        var introWrapper = $("#introMesgWrapper");
        var txtIntro = introWrapper.find("#txtIntro");

        introWrapper.find("a.activeItem").unbind('click').click(function (e) { e.preventDefault(); introWrapper.slideUp(300, function () { hyp.show(); descrip.show(); textEditor.destroy(txtIntro); }); });
        introWrapper.find("button.activeAction").unbind('click').click(function () {
            $.post('rpc/appointmentsSettings/SaveResourceDescription/', { id: controller.resource.id, description: txtIntro.val() }, function(bVal) {
                if (bVal) {
                    controller.resource.description = textEditor.decodeForHtmlDisplay(txtIntro.val());
                    descrip.html(controller.resource.description);
                    introWrapper.find("a.activeItem").click();
                }
                else { alert('error saving description'); }
            });
        });
        
        txtIntro.val(controller.resource.description);
        //clear out control
        if (textEditor.exists(txtIntro)) {
            textEditor.destroy(txtIntro);
        }
        textEditor.create(txtIntro, { height: '100px' });
        
        introWrapper.slideDown();
    }
    function getApptUserId() {
        var controller = ApptApp.currentController;
        
        return controller.isEditMode
            ? (controller.isResource && controller.resource.canEdit ? $("#selShowHosts").val() : '')
            : (controller.user.id != undefined && controller.user.id != null ? controller.user.id : apptPortlet.id);
    }
    function getNewAppt(cal, controller, start, end, useCacheTime) {
        var apptCache = cal.data('apptCache');
        if (apptCache != null) {
            return setTimeOnApptCache(apptCache, start, end, useCacheTime);
        }
            
        var title = (controller.isResource ? controller.resource.name : apptPortlet.name.full) + ' ' + apptPortlet.g11n.capAppt;
        var location = controller.isResource ? controller.resource.location : '';
        var newAppt = { title: title, description: '', location: location, repeatMins: 0 };
        if (start != null && end != null) {
            newAppt.start = start;
            newAppt.end = end;
        }
        var ownerId = getApptUserId();
        if (ownerId != '')
            newAppt.ownerId = ownerId;

        return newAppt;
    }
    function setNewAppt(cal, appt) {
        if (appt == null)
            cal.removeData('apptCache');
        else {
            cal.removeData('apptCache');
            cal.data('apptCache', { title: appt.title, description: appt.description, location: appt.location, ownerId: appt.ownerId, maxAttendees: appt.maxAttendees, repeatMins: appt.repeatMins, duration: appt.end.diff(appt.start, 'minutes') });
        }
    }
    function setTimeOnApptCache(apptCache, start, end, useCacheTime) {
        apptCache.id = null;
        if (start != null) {
            apptCache.start = start;
            apptCache.end = useCacheTime ? moment(start).add(apptCache.duration,'minutes') : end;
        }
        return apptCache;
    }
    function bindHelp(controller, isListView) {
        var name = controller.isResource ? controller.resource.name : (controller.isSpecific ? $(apptPortlet.hosts).map(function (i, u) { return u.name; }).toArray().join(', ') : controller.user.name.full);
        var isHost = controller.isEditMode || controller.resource.canSchedule;
        var screen = isListView ? 4 : 3;
        if (isHost && controller.isSpecific && !isListView) screen = 5;
        if (isHost && controller.resource.canEdit && !isListView) screen = 6;
        if (controller.isResource && controller.resource.isHost && !controller.resource.canSchedule)
            screen = isListView ? 9 : 8;

        $("#apptHelp").appointmentHelp({ g11n: controller.g11n, isHost: isHost, screen: screen, portletId: apptPortlet.portletId, name: name });
    }
}
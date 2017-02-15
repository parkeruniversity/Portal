function initMain(ApptApp) {
    
    ApptApp.MainController = Ember.Controller.extend({
        g11n: apptPortlet.g11n,
        ableToEdit: apptPortlet.ableToEdit,
        canManageSettings: apptPortlet.canManageSettings,
        canAdmin: apptPortlet.canAdmin,
        defaultDate: '',
        showMySchedule: false,
        apptId: '',
        isDirect: false
    });

    ApptApp.MainParamRoute = Ember.Route.extend({
        model: function (param) {
            var date = moment(param.val.replace(/-/g, '/'));
            return { defaultDate: (date.isValid() ? date.format('MM/DD/YYYY') : ''), showMySchedule: (param.val == 'myS') };
        },
        setupController: function (controller, model) {
            this.controllerFor('main').set('defaultDate', model.defaultDate).set('showMySchedule', model.showMySchedule).set('apptId', '').set('isDirect',false);
        },
        renderTemplate: function () {
            this.render('main');
        }
    });

    ApptApp.MainIdRoute = Ember.Route.extend({
        model: function (param) {
            var items = param.appt_id.split('|');
            var date = moment(items[1].replace(/-/g, '/'));
            return { apptId: items[0], defaultDate: (date.isValid() ? date.format('MM/DD/YYYY') : '') };
        },
        setupController: function (controller, model) {
            this.controllerFor('main').set('defaultDate', model.defaultDate).set('showMySchedule', false).set('apptId', model.apptId.toLowerCase()).set('isDirect', false);
        },
        renderTemplate: function () {
            this.render('main');
        }
    });
    ApptApp.MainDirectRoute = Ember.Route.extend({
        model: function (param) {
            var items = param.appt_id.split('|');
            var date = moment(items[1].replace(/-/g, '/'));
            return { apptId: items[0], defaultDate: (date.isValid() ? date.format('MM/DD/YYYY') : '') };
        },
        setupController: function (controller, model) {
            this.controllerFor('main').set('defaultDate', model.defaultDate).set('showMySchedule', apptPortlet.apptSetting != 0).set('apptId', model.apptId.toLowerCase()).set('isDirect', true);
        },
        renderTemplate: function () {
            this.render('main');
        }
    });

    ApptApp.MainView = Ember.View.extend({
        didInsertElement: function() {
            var controller = this.get('controller');

            if (this.processRedirect(controller))
                return;

            this.renderView(controller);
        },
        renderView: function (controller, isRerender) {
            if (isRerender) {
                apptFullCal.destroy();
            }
            var g11n = controller.g11n;

            apptFullCal.init({
                data: {},
                defaultDate: controller.defaultDate,
                showMonth: true,
                showWeekNav: true,
                allowEditing: false,
                calElem: $("#myCalendar"),
                showWknd: apptPortlet.showWeekends,
                updateWknd: apptPortlet.updateSettings,
                g11n: controller.g11n,
                listViewPageSize: apptPortlet.listViewPageSize,
                noApptMesg: controller.g11n.noSignedUpAppts,
                rerender: function () {
                    apptFullCal.reload();
                    $("#myNotifications").apptNotification('render');
                },
                editEvent: function(appt, isClick, revertFunc, rerenderAction) {
                    var resource = {};
                    if (appt.resourceId != '' && appt.resourceEdit)
                        resource = apptPortlet.getResource(appt.resourceId);
                    $.apptDetails({ controller: controller, appointment: appt, g11n: controller.g11n, resource: resource, canAddAttendees: apptPortlet.canAddAttendees, rerender: function () { rerenderAction(); $("#myNotifications").apptNotification('render'); } });
                },
                readonlySources: function (viewName) { return viewName == 'month' ? [{ url: 'rpc/appointmentsinfo/getcalendaraggregate' }] : [{ url: 'api/calendarevents?fullCalendar=true&filter=conflictable' }]; },
                postApptRender: function (appt, elem, view) {
                    if (appt.isReadOnly) return;
                    var item = elem.find('.fc-content');
                    item.html(appt.isOwner ? appt.attendeeInfo : (appt.resourceId != '' ? appt.resourceName : appt.owner));
                    if (view.name != 'month') {
                        item.append($("<span class='fc-cus-event-info'>").html(appt.title));
                    }
                    if (appt.id == controller.apptId) {
                        controller.apptId = '';
                        apptFullCal.triggerClick(appt);
                    }
                    if (appt.newCommentCount > 0) {
                        var ctr = view.name == 'list' ? elem : item;
                        var comTxt = $("<span class='fc-comment'>").append($("<i class='fa fa-comment'/>")).append(view.name == 'list' ? stringUtil.format((appt.newCommentCount == 1 ? controller.g11n.newComment : controller.g11n.newComments), appt.newCommentCount) : '');
                        ctr.prepend(comTxt);
                    }
                },
                changeView: function(viewName) {
                    if (viewName == 'list')
                        $(".apptKeyInfo.otherEvents").hide();
                    else
                        $(".apptKeyInfo.otherEvents").show();
                    if (viewName == 'month')
                        $(".apptKeyInfo.otherEvents").removeClass("inactiveItem");
                    else
                        $(".apptKeyInfo.otherEvents").addClass("inactiveItem");

                    bindHelpText(g11n, viewName == 'list' ? '2' : (viewName == 'month' ? 0 : 1));
                }
            }, 'month');

            bindHelpText(g11n, 0);

            $("#myNotifications").apptNotification({
                g11n: apptPortlet.g11n,
                baseUrl: apptPortlet.baseUrl,
                renderFullTxt: true,
                callback: function(apptInfo) {
                    var date = moment(apptInfo.start);
                    if ((date.weekday() == 0 || date.weekday() == 6) && apptPortlet.showWeekends == false)
                        apptFullCal.showWeekends($("#myCalendar"), true, date);
                    controller.set('apptId', apptInfo.id);
                    apptFullCal.gotToDate('agendaDay', date);
                }
            });

            $("#peopleChooser").peopleChooser({
                peopleSource: 'rpc/appointmentsInfo/GetUserSearch',
                watermark: controller.g11n.watermark,
                onSelect: function(person) {
                    if (person.isResource)
                        controller.transitionTo('scheduleResource', person.id);
                    else
                        controller.transitionTo('userSchedule', { id: person.id, imgUrl: person.imgUrl, name: { full: person.fullName } });
                }
            });

            if (controller.canManageSettings || controller.canAdmin)
                $(".permissionAction").click(function() { ApptApp.history = { name: '', view: 'main', isSchedule: false }; });

            var schLinkAction = this.bindScheduleLink;
            $(".permHosts").hide();
            if (apptPortlet.canManageSettings && (apptPortlet.apptSetting == 2 || (apptPortlet.apptSetting == 3 && apptPortlet.resourceId.length > 0))) {
                var resource = apptPortlet.apptSetting == 2 ? null : apptPortlet.getResource(apptPortlet.resourceId);
                if (apptPortlet.apptSetting == 2 || (resource != null && resource.canEdit)) {
                    $(".permHosts").show().find('a').html("<i class='fa fa-group'></i>" + (apptPortlet.apptSetting == 2 ? g11n.apptHosts : g11n.managersAndHosts))
                        .unbind('click').click(function(e) {
                            e.preventDefault();
                            $.apptManageHosts({
                                g11n: controller.g11n,
                                resource: resource,
                                isResource: resource != null,
                                portletId: apptPortlet.portletId,
                                onSave: function(res) {
                                    if (apptPortlet.apptSetting == 2) {
                                        apptPortlet.hosts = res;
                                        schLinkAction(controller);
                                    } else {
                                        apptPortlet.hosts = res.hosts;
                                    }
                                }});
                        });
                }
            }


            if (controller.showMySchedule) {
                $(".mySchedule").hide();
                this.bindResourceInfo(controller);
            } else {
                $(".mySchedule").show();
            }
            this.bindSidebar(controller);
        },
        bindSidebar: function(controller) {
            var campus = $(".campusWrapper").hide();
            var myfac = $(".myFacWrapper").hide();
            $.get('rpc/appointmentsinfo/getsidebarinfo/', function (sidebarInfo) {
                if (sidebarInfo == null) return;
                if (sidebarInfo.campusResources != null) {
                    var ul = campus.find('#campusResources').empty();
                    for (var key in sidebarInfo.campusResources) {
                        ul.append($("<li>").append($("<a href='#'  class='activeItem apptStrong'>").data('id', key).html(sidebarInfo.campusResources[key]).click(function (e) { e.preventDefault(); controller.transitionTo('scheduleResource', $(this).data('id')); })));
                    }
                    if (ul.find('li').length > 0)
                        campus.show();
                }
                if (sidebarInfo.currentFaculty != null && sidebarInfo.currentFaculty.length > 0) {
                    myfac.show();
                    var container = myfac.find(".myFacUsers").empty();
                    $.each(sidebarInfo.currentFaculty, function (i, fac) {
                        var div = $("<div class='myFac'>");
                        div.append($("<a class='activeItem apptStrong'>").html(fac.name).click(function (e) { e.preventDefault(); controller.transitionTo('userSchedule', { id: fac.id, imgUrl: fac.imgUrl, name: { full: fac.name } }); }));
                        if (!fac.hasAvailAppts)
                            div.append($("<span class='pc-details'>").html(controller.g11n.noAppt));
                        $.each(fac.sections, function (j, sec) {
                            div.append($("<div class='inactiveItem itemInfo'>").html(sec));
                        });
                        container.append(div);
                    });
                }
            });
        },
        processRedirect: function (controller) {
            if (apptPortlet.name == null) {
                controller.transitionTo("noAccess");
                return true;
            }
            if (controller.isDirect) return false;

            var date = controller.defaultDate != null && controller.defaultDate != '' ? moment(controller.defaultDate).format('MM-DD-YYYY') : null;
            if ((apptPortlet.resourceId != '' || apptPortlet.apptSetting == 2) && !controller.showMySchedule) {
                var url = apptPortlet.apptSetting == 2 ? 'scheduleSpecific' : 'schedule';
                if (controller.apptId != '' || date != null) {
                    controller.transitionTo(url + "Id", (controller.apptId + '|' + date));
                }
                else
                    controller.transitionTo(url);
                return true;
            }
            else if (apptPortlet.apptSetting == 1 && !controller.showMySchedule && apptPortlet.hosts != null && apptPortlet.hosts.length > 0) {
                var host = apptPortlet.hosts[0];
                if (controller.apptId != '' || date != null) {
                    controller.transitionTo('userScheduleId', host.id + '_' + ((controller.apptId == '' ? ' ' : controller.apptId) + '|' + date));
                }
                else
                    controller.transitionTo('userSchedule', { id: host.id, imgUrl: host.imgUrl, name: { full: host.name } });
                return true;
            }

            return false;
        },
        bindScheduleLink: function (controller) {
            var showLink = false;
            if (apptPortlet.resourceId != '') {
                var resource = apptPortlet.getResource(apptPortlet.resourceId);
                $(".scheduleLink").html(stringUtil.format(controller.g11n.bckToSchedule, resource.name)).unbind('click').click(function (e) { e.preventDefault(); controller.transitionTo('schedule'); });
                showLink = true;
            }
            else if (apptPortlet.apptSetting == 1) {
                var host = apptPortlet.hosts[0];
                $(".scheduleLink").html(stringUtil.format(controller.g11n.bckToSchedule, host.name)).unbind('click').click(function (e) { e.preventDefault(); controller.transitionTo('userSchedule', { id: host.id, imgUrl: host.imgUrl, name: { full: host.name } }); });
                showLink = true;
            }
            else if (apptPortlet.apptSetting == 2) {
                var names = '';
                var userCount = apptPortlet.hosts.length;
                for (var i = 0; i < userCount; i++) {
                    names += " " + apptPortlet.hosts[i].name;
                    if (userCount > 1 && (userCount - i != 1)) {
                        names += userCount - i == 2 ? ", " + controller.g11n.and : ",";
                    }
                }
                $(".scheduleLink").html(stringUtil.format(controller.g11n.bckToSchedule, names)).unbind('click').click(function (e) { e.preventDefault(); controller.transitionTo('scheduleSpecific'); });
                showLink = true;
            }
            if(showLink)
                $(".bckToSchedule").show();
            else
                $(".bckToSchedule").hide();
        },
        bindResourceInfo: function (controller) {
            this.bindScheduleLink(controller);

            var ul = $("#userSchedules").empty();
            if (apptPortlet.ableToEdit) {
                ul.append($("<li>").append($("<a href='#' class='activeItem apptStrong'>").html(apptPortlet.name.full).click(function (e) { e.preventDefault(); controller.transitionTo('userSchedule', apptPortlet.id); })));
                $(".rg-sidebar").show();
            }
            $.get('rpc/appointmentsInfo/GetMySchedules/', function (schedules) {
                if (schedules == null) return;
                for (var key in schedules) {
                    ul.append($("<li>").append($("<a href='#'  class='activeItem apptStrong'>").data('id',key).html(schedules[key]).click(function (e) { e.preventDefault(); controller.transitionTo('scheduleResource', $(this).data('id')); })));
                }
                if (schedules.length > 0)
                    $(".rg-sidebar").show();
            });
        }
    });
    function bindHelpText(g11n, screen) {
        $(".apptHelpWrapper").appointmentHelp({ g11n: g11n, isHost: apptPortlet.ableToEdit, portletId:apptPortlet.portletId, screen: screen });
    }
}
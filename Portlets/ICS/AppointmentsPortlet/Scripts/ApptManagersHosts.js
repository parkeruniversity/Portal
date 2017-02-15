; (function ($, window, document, undefined) {
    //global vars
    var apptManageHosts = "apptManagersHosts",
        apptManageHostsData = "plugin_" + apptManageHosts;

    $.apptManageHosts = function (options) {

        var args, apptManage;

        var container = $("#mhModal");
        if (container.attr('id') === undefined) {
            $.ajax({
                type: 'GET',
                async: false,
                url: 'portlets/ics/appointmentsportlet/templates/apptManagersHosts.htm',
                success: function (source) {
                    var template = Handlebars.compile(source);
                    container = $(template({ g11n: options.g11n })); //create mhModal
                    $("#appointmentWrapper").append(container); //ember render container
                }
            });
        }

        if (!(container.data(apptManageHostsData) instanceof ApptManageHosts)) {
            container.data(apptManageHostsData, new ApptManageHosts(container, options));
        }

        apptManage = container.data(apptManageHostsData);

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptManage['render'] === 'function') {
                apptManage.render(options);
            }
        } else if (typeof options === 'string' && typeof apptManage[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptManage[options].apply(apptManage, args);

        } else if (options === 'destroy') {
            this.removeData(apptManageHostsData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + apptResource);
        }
        return apptManage;
    };

    function ApptManageHosts(elem, options) {
        var appt = this, _ctr = $(elem), _g11n = options.g11n, _options = $.extend(getDefaultOptions(), options);
        appt.render = render;

        function getDefaultOptions() {
            return {g11n:null, resource:null, isResource:false, portletId: '', onCancel:function (){}, onSave:function (res){}};
        }

        function render(opts) {
            _options = $.extend(getDefaultOptions(), opts);
            _ctr.removeData('isSubmit');
            _ctr.dialog({
                autoOpen: true,
                modal: true,
                draggable: false,
                resizable: false,
                width: 740,
                dialogClass: 'mh-container',
                close: function (event, ui) { if(_ctr.data('isSubmit') == null) _options.onCancel(); }
            });

            _ctr.find("#mh-chooser").hide();
            _ctr.find("#managePeople").peopleChooser('destroy');
            _ctr.find("#mh-content").show();

            var actions = _ctr.find(".mh-actions");
            actions.find("button").unbind('click').click(function () { _ctr.data('isSubmit',true); saveUsers(_ctr); });
            actions.find("a").unbind('click').click(function (e) { e.preventDefault(); _ctr.dialog('close'); });
            _ctr.find("#hostRemoval").dialog({ autoOpen: false, modal: true, draggable: false, resizable: false, width: 550, dialogClass: 'confirmModalWrapper' });
            _ctr.find("#hostConfirm").dialog({ autoOpen: false, modal: true, draggable: false, resizable: false, width: 570, dialogClass: 'confirmModalWrapper' });

            bindUsers();
        }
        function bindUsers() {
            var g11n = _options.g11n;
            var isResource = _options.isResource;
            if (!isResource) {
                _ctr.find("#manageHosts").hide();
                _ctr.find(".mh-header-info").html(g11n.chooseSpecificPeople);
                _ctr.find("#manageManagers > span.apptsHeader, .mh-host-mesg").empty();
            } else {
                _ctr.find("#manageHosts").show();
                _ctr.find(".mh-header-info").empty();
                _ctr.find("#manageManagers > span.apptsHeader").html(g11n.resourceManagers);
                _ctr.find(".mh-host-mesg").html(stringUtil.format(g11n.whoCanHaveAppts, _options.resource.name));
            }
            _ctr.find("#thManager").html(isResource ? g11n.manager : g11n.host);
            _ctr.find(".mh-header").html(isResource ? stringUtil.format(g11n.assignMangHost,_options.resource.name) : g11n.apptHosts);
            _ctr.find("#manageManagers > span.infoItem").html(isResource ? stringUtil.format(g11n.whoManagesHosts, _options.resource.name) : g11n.whosApptShow);

            var tblManager = _ctr.find("#tblManagers");
            var tblHost = _ctr.find("#tblHosts");
            tblManager.find("tbody > tr").remove();
            tblHost.find("tbody > tr").remove();
            $.get('rpc/appointmentsHosts/GetManagersAndHosts/?portletId=' + _options.portletId + '&resourceId=' + (_options.isResource ? _options.resource.id : '' ) , function (users) {
                if (users == null) return;
                $.each(users, function (i, u) {
                    if (u.isManager)
                        renderRow(tblManager, u, false);
                    else
                        renderRow(tblHost, u, true);
                });
                syncAndVerify();
            });
            _ctr.find("#hosts").unbind('click').click(function (e) { e.preventDefault(); renderPeopleChooser($("#tblHosts"), true); });
            _ctr.find("#managers").unbind('click').click(function (e) { e.preventDefault(); renderPeopleChooser($("#tblManagers"), false); });
        }
        function renderRow(tbl, user, isHost) {
            var g11n = _options.g11n;
            var row = $("<tr data-id='" + user.id + "'>").data('user', user);
            var userInfo = $("<div>").append($("<span class='mh-name'>").html(user.fullName != null ? user.fullName : user.name));
            if (user.hostId != null)
                userInfo.append($("<span class='mh-id'>").html("(" + user.hostId + ")"));
            userInfo.append($("<div class='inactiveItem itemInfo'>").html(user.roles));
            var info = $(user.myInfoHtml).css('display', 'none');
            userInfo.append(info)
                .append($("<span class='fa fa-info-circle activeItem'>"))
                .append($("<a class='activeItem'>").html(g11n.info).click(function (e) { e.preventDefault(); info.click(); }));

            $("<td class='attendee'>").html($("<div>").append($("<img src='" + user.imgUrl + "' class='attendeePhoto'>")).append(userInfo)).appendTo(row);
            if (isHost)
                $("<td>").append($("<input type='checkbox' id='cbx" + user.id + "' data-id='" + user.id + "'>").prop('checked', user.canSchedule)).append($("<label for='cbx" + user.id + "'>").html(g11n.yes)).appendTo(row);
            $("<td class='mh-remove'>").append($("<i class='fa fa-times activeItem'  data-hasappts='" + (user.hasAppointments != undefined ? user.hasAppointments : false) + "'>")
                .click(function () {
                    if ($(this).data('hasappts') && isHost)
                        removeHosts(user.id, function () { removeUser(row); }, function(){});
                    else
                        removeUser(row);
                })).appendTo(row);
            tbl.find("tbody").append(row);
        }
        function renderPeopleChooser(tbl, isHost) {
            var ids = new Array();
            $.each(tbl.find("tbody > tr"), function (i, tr) { ids.push($(tr).data('id')); });
            _ctr.find("#mh-content").fadeOut(500, function () {
                var chooser = _ctr.find("#mh-chooser").show();
                chooser.find("span.apptsHeader").html(isHost ? 'Choose resource hosts' : (_options.isResource ? 'Choose resource managers' : 'Choose hosts'));
                chooser.find("#managePeople").peopleChooser('destroy').peopleChooser({
                    showFull: true,
                    initPeopleIds: ids
                });
                chooser.find("button.activeAction").unbind('click').html(isHost ? 'Save hosts' : (_options.isResource ? 'Save managers' : 'Save hosts'))
                        .click(function () { processChooserSelections(chooser.find("#managePeople").peopleChooser('getPeople'), tbl, isHost, function () { chooser.find('a.activeItem').click(); }); });
                chooser.find("a.activeItem").unbind('click').click(function (e) {
                    e.preventDefault();
                    _ctr.find('#mh-chooser').fadeOut(500, function () {
                        _ctr.find("#mh-content").fadeIn(500, function () { _ctr.dialog('option', 'position', { my: "center", at: "center", of: window }); });
                        _ctr.find("#managePeople").peopleChooser('destroy');
                    });
                });
            });
        }
        function processChooserSelections(people, tbl, isHost, postAction) {
            var isResource = _options.isResource;
            var userIds = $.map(people, function (person) { return person.id; }).join(',');
            var selectedIds = $.map(people, function (person) { return person.id; });
            if (userIds == null || userIds.length == 0) {
                var isManager = !isHost && isResource;
                var isSpecific = !isResource;
                var g11n = _options.g11n;
                bindConfirmModalCtr($("#hostConfirm"), (isManager ? g11n.mustHaveManager : (isSpecific ? g11n.mustHaveSpecific : g11n.mustHaveHost)), (isManager ? g11n.mustHaveManagerInfo : g11n.mustHaveHostInfo), '', g11n.ok,
                            function (modal) { modal.dialog('close'); });
                return;
            }
            people.sort(sortName);

            if (isHost) {
                var removalIds = [];
                var currentHosts = tbl.find("tbody > tr").map(function () { return { user: $(this).data('user'), hasAppts: $(this).find('i.fa-times').data('hasappts') }; }).get();
                $.each(currentHosts, function (i, host) {
                    if (selectedIds.indexOf(host.user.id) < 0 && host.hasAppts) {
                        removalIds.push(host.user.id);
                    }
                    //update people obj with hasAppts
                    var persons = $.grep(people, function (p) { return p.id == host.user.id; });
                    if (persons.length > 0)
                        persons[0].hasAppointments = host.hasAppts;
                });
                if (removalIds.length > 0) {
                    removeHosts(removalIds.join(','), function () { addRemoveUsers(people, isHost, tbl); postAction(); }, function () { renderPeopleChooser(tbl, isHost); });
                } else {
                    addRemoveUsers(people, isHost, tbl);
                    postAction();
                }
            } else {
                addRemoveUsers(people, isHost, tbl);
                postAction();
            }
        }
        function removeHosts(removalIds, okAction, cancelAction) {
            var  g11n = _options.g11n, wrapper = $("#hostReassign").empty();
            $.get('rpc/appointmentsHosts/GetHostAppointmentCounts/?resourceId=' + _options.resource.id, { ids: removalIds }, function (removalHosts) {
                var isMulti = removalHosts.length > 1;
                wrapper.append($("<div class='confirmMesg'>").html(isMulti ? g11n.removeTheseHosts : g11n.removeThisHost));
                $.each(removalHosts, function (i, hostInfo) {
                    var ctr = $("<div class='hostRemoval'>").append(stringUtil.format(g11n.removalCountMesg, hostInfo.host.name, hostInfo.availableCount, hostInfo.signedUpCount));
                    wrapper.append(ctr);
                });

                wrapper.append($("<p class='invalidItem'>").html(isMulti ? g11n.removeHostsMesg : g11n.removeHostMesg));
                wrapper.append($("<p>").html(g11n.keepApptMesg));

                bindModal('hostRemoval', (isMulti ? g11n.keepHosts : g11n.keepHost), (isMulti ? g11n.removeHosts : g11n.removeHost), function (modal) {
                    modal.dialog('close');
                    if (okAction != null)
                        okAction();
                }, function () { cancelAction(); });
            });
        }
        function removeUser(row) {
            row.hide('normal', function () { $(this).remove(); syncAndVerify(); });
        }
        function addRemoveUsers(people, isHost, tbl) {
            var canScheduleIds = tbl.find("input:checked").map(function () { return $(this).data('id'); });
            tbl.find("tbody > tr").remove();
            $.each(people, function (i, p) { renderRow(tbl, p, isHost); });
            if (canScheduleIds.length > 0) { //reset checkbox
                tbl.find("input:checkbox").each(function (i, c) {
                    var cbx = $(c);
                    if ($.inArray(cbx.data("id"), canScheduleIds) >= 0) {
                        cbx.prop('checked', true);
                    }
                });
            }
            syncAndVerify();
        }
        function sortName(a, b) {
            var aName = a.name.toLowerCase();
            var bName = b.name.toLowerCase();
            return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
        }
        function syncAndVerify() {
            var tblManagers = _ctr.find("#manageManagers");
            if (tblManagers.find("tbody > tr").length == 1) //must have a least 1 manager
                tblManagers.find("i.fa").remove();

            var tblHosts = _ctr.find("#manageHosts");
            if (tblHosts.find("tbody > tr").length == 1) //must have a least 1 host
                tblHosts.find("i.fa").remove();

            var managerIds = tblManagers.find("tbody > tr").map(function () { return $(this).data('id'); });
            //sync managers + canSchedule
            tblHosts.find("input:checkbox").each(function (i, c) {
                var cbx = $(c);
                if ($.inArray(cbx.data("id"), managerIds) >= 0) {
                    if (!cbx.prop('checked'))
                        cbx.click();
                    cbx.prop('checked', true).attr('disabled', 'disabled');
                } else
                    cbx.removeAttr('disabled');
            });

            _ctr.dialog('option', 'position', { my: "center", at: "center", of: window });
        }
        function saveUsers(modal) {
            var users = { portletId: _options.portletId, resourceId: '', managers: _ctr.find("#manageManagers tbody > tr").map(function () { return $(this).data('user').id; }).get() };

            if (_options.isResource) {
                users.resourceId = _options.resource.id;
                users.hosts = _ctr.find("#manageHosts tbody > tr").map(function() { var tr = $(this); return {key:tr.data('user').id,value: tr.find('input:checkbox').prop('checked')}; }).get();
            }
            $.post('rpc/appointmentsHosts/' + (_options.isResource ? 'SetManagersAndHosts/' : 'SetSpecificHosts/'), users, function (result) {
                _options.onSave(result);
                modal.dialog('close');
            });
        }
    }
}(jQuery, window, document));
function initSettings(ApptApp) {

    ApptApp.SettingsController = Ember.Controller.extend({
        g11n: apptPortlet.g11n,
        canManageSettings: apptPortlet.canManageSettings,
        actions: {
            goBack: function () {
                if (ApptApp.history.view != '') { //custom
                    if (ApptApp.history.param != null && ApptApp.history.param != undefined && ApptApp.history.param.length > 0)
                        this.transitionTo(ApptApp.history.view, ApptApp.history.param);
                    else
                        this.transitionTo(ApptApp.history.view);
                }
                else
                    this.transitionTo('main');
            }
        }
    });

    ApptApp.SettingsView = Ember.View.extend({
        didInsertElement: function () {
            var controller = this.get('controller');
            if (!controller.canManageSettings)
                controller.transitionTo('main');

            bind(controller);
        },
    });

    function bind(controller) {
        $('#goBack').html(controller.g11n.bckToAppts);
        $('.settingWrapper > input[type="radio"]').attr('disabled', 'disabled'); //disable until load done
        $.get('rpc/appointmentsSettings/GetSettings/?portletId=' + apptPortlet.portletId, function (apptSettings) {
            if (apptSettings == null)
                alert('unable to retrieve settings');
            $(".settingWrapper input[value='" + apptSettings.setting + "']").prop('checked', true).parent().addClass("settingSelected");
            $(".settingsSelector").data('setting', apptSettings.setting);
            $('.settingWrapper input[type="radio"]').removeAttr('disabled').click(function () { processSettingChange($(this), controller, controller.g11n); });
            $(".showHideDetails").html(controller.g11n.showDetails).click(function(e) {
                e.preventDefault();
                var link = $(this);
                var isShow = link.html() == controller.g11n.showDetails;
                link.html(isShow ? controller.g11n.hideDetails : controller.g11n.showDetails);
                if (isShow)
                    link.parent().prev().show('normal');
                else
                    link.parent().prev().hide();
            });
            $("#manageSpecific").click(function (e) {
                e.preventDefault();
                $.apptManageHosts({
                    g11n: controller.g11n, isResource: false, portletId: apptPortlet.portletId,
                    onSave: function (hosts) { apptPortlet.hosts = hosts; renderHosts(hosts); }
                });
            });
            bindAvailableResources(apptSettings.availableResources, controller, controller.g11n);
            bindSettingInfo(apptSettings, controller, controller.g11n);
        });
    }
    function renderHosts(hosts) {
        $(".settingHosts .rg-host-holder").html($(hosts).map(function (i, u) { return u.name; }).toArray().join(', '));
    }
    function bindSettingInfo(apptSettings, controller, g11n) {
        if (apptSettings.setting == 1 && apptSettings.users != null && apptSettings.users.length > 0)
            $(".justMeName").html("(" + apptSettings.users[0].name + ")");
        if(apptSettings.setting == 3 && apptSettings.resourceId != null) 
            bindResource(apptSettings.resourceId, controller, g11n);
        if (apptSettings.setting == 2 && apptSettings.users != null && apptSettings.users.length > 0)
            renderHosts(apptSettings.users);
    }
    function processSettingChange(radBtn, controller, g11n, resourceId) {
        if (radBtn.val() == $(".settingsSelector").data('setting') && resourceId == null) return; //same btn

        $(".settingWrapper").removeClass('settingSelected').find(".settingDetails").show();
        radBtn.parent().addClass('settingSelected');
        radBtn.next().find(".showHideDetails").html(g11n.hideDetails).click();//trigger hide
        
        var data = { portletId: apptPortlet.portletId, 'setting': radBtn.val() };
        if (resourceId != null)
            data.resourceId = resourceId;
        else {
            $("#selResource").val('');
            $("#resourceContainer").apptResource('destroy');
        }
        
        $.post('rpc/appointmentsSettings/SetSetting/', data,
                    function (bVal) {
                        if (bVal == false) { alert('unable to save setting'); }
                        else {
                            //update apptPortletSetting
                            apptPortlet.updateSettings('apptSetting', radBtn.val());
                            $(".settingsSelector").data('setting', radBtn.val());
                            if (bVal && resourceId != null) {
                                apptPortlet.updateSettings('resourceId', resourceId);
                                bindResource(resourceId, controller, g11n);
                            }
                            else
                                apptPortlet.updateSettings('resourceId', '');

                            var tempHost = [{ id: apptPortlet.id, name: apptPortlet.name.full, imgUrl: apptPortlet.imgUrl }];
                            if (radBtn.val() == 1) apptPortlet.hosts = tempHost;
                            else if (radBtn.val() == 2)  renderHosts(tempHost);
                        }
                    });
    }
    function bindAvailableResources(availResources, controller, g11n) {
        var selResource = $("#selResource");
        selResource.unbind('change').change(function () { processSettingChange($("#radResource"), controller, g11n, $(this).val()); }).empty();
        for (var resource in availResources) {
            selResource.append($("<option></option>").attr('value', resource).text(availResources[resource]));
        }
        if (selResource.find('option').length <= 0) {
            selResource.hide().next('span').hide();
        } else {
            selResource.prepend($("<option></option>").attr('value', '').text(g11n.chooseResource));
            selResource.val('');
        }
        $("#createResource").unbind('click').click(function (e) {
            e.preventDefault();
            processResourceManagement(false);
            $("#resourceContainer").apptResource('destroy');
            $("#resourceContainer").apptResource({
                g11n: g11n,
                createResource: true,
                userName: apptPortlet.name,
                portletId: apptPortlet.portletId,
                controller: controller, apptApp: ApptApp,
                onSave: function (res) { addResourceToDDL(res, g11n); bindResource(res.id,controller, g11n); },
                onCancel: function () {
                    processResourceManagement(true);
                    if ($("#selResource").val() != '')
                        bindResource($("#selResource").val(),controller, g11n);
                    else
                        $("#resourceContainer").apptResource('destroy');
                }
            });
        });
    }
    function addResourceToDDL(resource, g11n) {
        var selResource = $("#selResource");
        selResource.show().next('span').show();
        if (selResource.find('option').length <= 0) {
            selResource.append($("<option></option>").attr('value', '').text(g11n.chooseResource));
        }
        if (selResource.find('option[value="' + resource.id + '"]').length == 0) {
            selResource.append($("<option></option>").attr('value', resource.id).text(resource.name));
            $("#selResource").val(resource.id).change();
        } else {
            selResource.find('option[value="' + resource.id + '"]').text(resource.name);
        }
        processResourceManagement(true);
    }
    function bindResource(resourceId, controller, g11n) {
        $("#selResource").val(resourceId);
        $("#resourceContainer").apptResource({
            id: resourceId, portletId: apptPortlet.portletId, g11n: g11n,
            controller: controller,
            apptApp: ApptApp,
            onDelete: function (resource) { $("#resourceContainer").apptResource('destroy'); $("#selResource option[value='" + resource.id + "']").remove(); $("#selResource").val(''); processResourceManagement(true); },
            onBeforeEdit: function (resource) { processResourceManagement(false); },
            onSave: function (resource) { processResourceManagement(true); addResourceToDDL(resource,g11n);},
            onCancel: function () { processResourceManagement(true); }
        });
    }
    function processResourceManagement(showCtrs) {
        if (showCtrs) {
            $("#chooseResource").show();
            $("div.settingWrapper > input[name='setting']").removeAttr('disabled');
        } else {
            $("#chooseResource").hide();
            $("div.settingWrapper > input[name='setting']").attr('disabled', 'disabled');
        }
    }
}
function initCampus(ApptApp) {

    ApptApp.CampusController = Ember.Controller.extend({
        g11n: apptPortlet.g11n,
        canAdmin: apptPortlet.canAdmin,
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

    ApptApp.CampusView = Ember.View.extend({
        didInsertElement: function () {
            var controller = this.get('controller');
            if (!controller.canAdmin)
                controller.transitionTo('main');
            bind(controller);
        }
    });

    function bind(controller) {
        $('.goBack').html(controller.g11n.bckToAppts);
        $("#campusNewResource").click(function() {
            actionsEnabled('', false);
            $("#newCampusResource").apptResource({
                g11n: controller.g11n,
                createResource: true,
                userName: apptPortlet.name,
                portletId: apptPortlet.portletId,
                controller: controller, apptApp: ApptApp,
                onSave: function (resource) { bindData(controller); $("#newCampusResource").apptResource('destroy'); actionsEnabled('', true); },
                onCancel: function () {
                    $("#newCampusResource").apptResource('destroy');
                    actionsEnabled('', true);
                }
            });
        });
        bindData(controller);
    }
    function bindData(controller) {
        var campus = $("#campusResources").empty();
        var other = $("#otherResources").empty();
        $.get('rpc/appointmentscampus/getresources', function(resources) {
            $.each(resources, function(i, res) {
                bindResource(res, res.isCampus ? campus : other,res.isCampus ? other : campus, controller);
            });

            if (campus.find("div").length == 0)
                campus.append($("<div class='noResources'>").html(controller.g11n.noCampusResources));
            if (other.find("div").length == 0)
                other.append($("<div class='noResources'>").html(controller.g11n.noOtherResources));
        });
    }
    function bindResource(resource, ctr, otherCtr, controller) {
        var wrapper = $("<div class='campus-rg-wrapper' data-res-id='" + resource.id + "' data-res-name='" + resource.name + "'>");
        wrapper.append($("<button type='button' class='campusAction activeAction " + (resource.isCampus ? 'cancelAction' : 'checkInAction') + "'>")
            .append($("<i>").addClass('fa ' + (resource.isCampus ?  'fa-minus-circle': 'fa-plus-circle')))
            .append($("<span class='campusActionTitle'>").html(resource.isCampus ? 'Remove' : 'Add'))
            .append($("<span class='campusActionInfo'>").html(resource.isCampus ? 'from campus resources' : 'to campus resources'))
            .unbind('click').data('isCampus',resource.isCampus).click(function (e) {
                $.post('rpc/appointmentscampus/SetResourceCampusStatus?resourceId=' + resource.id + "&isCampus=" + !$(this).data('isCampus'), function () {
                    $("[data-res-id='" + resource.id + "']").hide('normal', function () { processMove($(this), resource, ctr, otherCtr, controller);});
                });
            }));

        //figrue out where to put resources (alpha sort)
        wrapper.append($("<div class='rg-campus-ctr'>").attr('id', resource.id)).hide();
        var index = -1;
        ctr.find("div.campus-rg-wrapper").each(function (i) { if ($(this).data('res-name').toString().toLowerCase() >= resource.name.toLowerCase()) { index = i; return false; } });
        if (index != -1)
            wrapper.insertBefore(ctr.find("div.campus-rg-wrapper")[index]);
        else
            wrapper.appendTo(ctr);
        wrapper.show('fast');

        $("#" + resource.id).apptResource({
            resource: resource, portletId: apptPortlet.portletId, g11n: controller.g11n,
            controller: controller,
            apptApp: ApptApp,
            isCampus: true,
            onDelete: function (res) { $("[data-res-id='" + res.id + "']").remove(); actionsEnabled(res.id, true); },
            onBeforeEdit: function (res) { actionsEnabled(res.id, false); },
            onSave: function (res) { $("[data-res-id='" + res.id + "']").hide('normal', function () {  //refetch resource
                 $(this).remove(); bindResource(apptPortlet.getResource(res.id),ctr,otherCtr,controller); actionsEnabled(res.id, true);
            });},
            onCancel: function (res) { actionsEnabled(res.id, true); }
        });
    }
    function processMove(wrapper, resource, ctr, otherCtr, controller) {
        wrapper.remove();
        if (ctr.find("div.campus-rg-wrapper").length == 0)
            ctr.append($("<div class='noResources'>").html(ctr.attr('id') == 'campusResources' ? controller.g11n.noCampusResources : controller.g11n.noOtherResources));
        otherCtr.find(".noResources").remove();

        resource.isCampus = !resource.isCampus;
        bindResource(resource, otherCtr, ctr, controller);
    }
    function actionsEnabled(id, isEnabled) {
        $(".rg-campus-ctr").each(function (i, elem) { var rgCtr = $(elem); if (rgCtr.attr('id') != id) { rgCtr.apptResource('editEnabled', isEnabled); } });
        $("button.campusAction").each(function(i, elem) { if (isEnabled) $(elem).removeAttr('disabled'); else $(elem).attr('disabled','disabled'); });
        var newResource = $("#campusNewResource");
        if (isEnabled) {
            if (id.length == 0) newResource.show('normal');
            else newResource.removeAttr('disabled');
        }
        else {
            if (id.length == 0) newResource.hide('normal');
            else newResource.attr('disabled', 'disabled');
        }
    }
}

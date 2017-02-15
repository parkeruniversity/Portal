var JWF = {
    post: function (method, data, callback, sync) {
        $.ajax({
            type: 'POST',
            url: webServicePath + webService + method,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: callback,
            async: !sync
        });
    },
    emailBuilder: {
        onLoad : function(){
            JWF.emailBuilder.emailEventChanged();
        },
        emailEventChanged: function () {
            if ($('.jwf-email-panel select[id*=drpEvents]').val() == 'Scheduled') {
                $('.jwf-scheduled-email').show();
            }
            else {
                $('.jwf-scheduled-email').hide();
            }
        }
    },
    approverBuilder: {
        onLoad: function () {
            $('.jwf-approver-type').click(JWF.approverBuilder.approverTypeChanged);
            JWF.approverBuilder.approverTypeChanged();
            JWF.approverBuilder.populateList();
        },
        approverTypeChanged: function () {
            var checked = $('.jwf-approver-type input:checked');
            if(checked.val() == "static")
            {
                $('.jwf-static-settings').show();
                $('.jwf-dynamic-settings').hide();
            }
            else
            {
                $('.jwf-static-settings').hide();
                $('.jwf-dynamic-settings').show();
            }
        },
        approverDeleteClicked: function (btn) {
            if(confirm('Are you sure you want to remove this approver?'))
            {
                $(btn).closest('tr').remove();
            }
        },
        approverAddClicked: function () {
            var approver = {};

            approver.ApproverType = $('.jwf-approver-type input:checked').val();

            if (approver.ApproverType == "static") {
                approver.ObjectID = $('[id*=tbxStaticApprover]').val();
                approver.DisplayName = jQuery('.jwf-static-settings').attr('data-object-name');
                if (approver.DisplayName == null)
                    return false;
                approver.DisplayName = approver.DisplayName.substring(0, approver.DisplayName.indexOf(" ("));
            }
            else {
                approver.ObjectID = $('[id*=drpDynamicApprover]').val();
                approver.DisplayName = jQuery('[id*=drpDynamicApprover] option:selected').text();
            }
            if (jQuery('.jwf-static-settings').val() == '' && approver.ApproverType == 'static')
                return false;

            approver.ApproverID = 'Temp' + (new Date).getTime();
            
            approver.Required = $('[id*=cbxRequired]').is(':checked');
            approver.CanEdit = $('[id*=cbxEdit]').is(':checked');
            approver.CanReroute = $('[id*=cbxReroute]').is(':checked');
            approver.AlternateAppID = $('[id*=drpAltApprovers]').val();
            approver.AlternateDisplayName = $('[id*=drpAltApprovers] option:selected').text();
            
            JWF.approverBuilder.approverAddRow(approver);

            $('[id*=drpAltApprovers]').append('<option value="' + approver.ApproverID + '">' + approver.DisplayName + '</option>');

            $('[id*=drpAltApprovers]').val('');
            jQuery('.jwf-static-settings').val('');
        },
        approverAddRow: function (approver) {
            var req = '';
            var edt = '';
            var rrt = '';
            if (approver.Required)
                req = 'checked="checked"';
            if (approver.CanEdit)
                edt = 'checked="checked"';
            if (approver.CanReroute)
                rrt = 'checked="checked"';
            var str = '<tr data-approver-id="' + approver.ApproverID + '" data-approver-type="' + approver.ApproverType + '">' +
                        '<td data-object-id="' + approver.ObjectID + '">' + approver.DisplayName + '</td>' +
                        '<td data-alternate-id="' + approver.AlternateAppID + '">' + approver.AlternateDisplayName + '</td>' +
                        '<td><input type="checkbox" id="required" disabled="true" ' + req + '/></td>' +
                        '<td><input type="checkbox" id="edit" disabled="true" ' + edt + '/></td>' +
                        '<td><input type="checkbox" id="reroute" disabled="true" ' + rrt + '/></td>' +
                        '<td onclick="JWF.approverBuilder.approverDeleteClicked(this);">Remove</td>' +
                       '</tr>';
            $('.jwf-approver-list tbody').append(str);

        },
        populateList: function () {
            var listStr = $('[id*=hdnApproverList]').val();
            if (listStr != null && listStr != '') {
                var list = JSON.parse(listStr);
                for (var x in list) {
                    if (list[x] != null) {
                        JWF.approverBuilder.approverAddRow(list[x]);
                    }
                }
            }
        }
    },
    saveStage: function () {
        var stage = {};
        stage.StageID = $('[id*=hdnStageId]').val();
        var approvers = [];
        $('.jwf-approver-list tbody tr').each(function () {
            var approver = {};
            approver.ApproverID = $(this).attr('data-approver-id');
            approver.ObjectID = $('[data-object-id]', this).attr('data-object-id');
            approver.DisplayName = $('[data-object-id]', this).text();
            approver.AlternateAppID = $('[data-alternate-id]', this).attr('data-alternate-id');
            approver.AlternateDisplayName = $('[data-alternate-id]', this).text();
            approver.Required = $('[id=required]', this).is(':checked');
            approver.CanEdit = $('[id=edit]', this).is(':checked');
            approver.CanReroute = $('[id=reroute]', this).is(':checked');
            approver.ApproverType = $(this).attr('data-approver-type');
            approvers[approvers.length] = approver;
        });

        stage.Approvers = approvers;

        JWF.post("/SaveStage",
                { stage: stage },
                function (data) {
                    if (data.d != true)
                        alert('There was an error saving the stage. Please review the event viewer for more information.');
                    else
                        jQuery('[id*=pnlStageDef]').dialog('close');
                },
                true);
    },
    func: {
        Stage : {
            getStageSettings: function () {
                var item = {};
                $("[id*='$jwfStage']").each(function () {
                    var name = $(this).attr("id");
                    var prop = name.replace("jwfStage", "");
                    var val = null;
                    if ($(this).is(":checkbox")) {
                        val = $(this).is(":checked");
                    } else if ($(this).is("textarea")) {
                        val = tinymce.get($(this).attr("id")).getContent();
                    } else {
                        val = $(this).val();
                    }
                    item[prop] = val;
                });
            },
            getStageApprovers: function () {

            }
        }
    },
    ui : {
        Stage : {
            Approvers : {
                onLoad: function () {
                    $(".jwf-approver-type input").click(JWF.ui.Stage.Approvers.approverTypeChanged);
                    JWF.ui.Stage.Approvers.approverTypeChanged();
                    JWF.ui.Stage.Approvers.populateList();
                },
                approverTypeChanged: function () {
                    var checked = $(".jwf-approver-type input:checked");
                    if (checked.val() === "static") {
                        $(".jwf-static-settings").show();
                        $(".jwf-dynamic-settings").hide();
                    }
                    else {
                        $(".jwf-static-settings").hide();
                        $(".jwf-dynamic-settings").show();
                    }
                },
                approverDeleteClicked: function (btn) {
                    if (confirm("Are you sure you want to remove this approver?")) {
                        var tr = $(btn).closest("tr");
                        var tempId = tr.attr("data-approver-id");
                        $("#drpAltApprovers option[value='" + tempId + "']").remove();
                        tr.remove();
                    }
                },
                approverAddClicked: function () {
                    var approver = {};
                    approver.IsDynamic = $(".jwf-approver-type input:checked").val() === "dynamic";

                    if (!approver.IsDynamic) {
                        approver.UserHostID = $("#tbxStaticApprover").val();
                        approver.DisplayName = $(".jwf-static-settings").attr("data-object-name");
                        approver.DynamicApprover = null;
                    }
                    else {
                        approver.DynamicApprover = $("#drpDynamicApprover").val();
                        approver.DynamicApproverName = $("#drpDynamicApprover option:selected").text();
                        approver.DisplayName = $("#drpDynamicApprover option:selected").text();
                    }
                    if ($(".jwf-static-settings").val() === "" && !approver.IsDynamic)
                        return false;

                    approver.ApproverID = "Temp" + (new Date).getTime();

                    approver.Required = $("#cbxRequired").is(":checked");
                    approver.CanEdit = $("#cbxEdit").is(":checked");
                    approver.CanReroute = $("#cbxReroute").is(":checked");
                    approver.AlternateFor = $("#drpAltApprovers").val();
                    approver.AlternateDisplayName = $("#drpAltApprovers option:selected").text();

                    JWF.ui.Stage.Approvers.approverAddRow(approver);

                    $("#drpAltApprovers").append("<option value='" + approver.ApproverID + "'>" + approver.DisplayName + "</option>");

                    $("#drpAltApprovers").val("");
                    $(".jwf-static-settings").val("");
                },
                approverAddRow: function (approver) {
                    var req = "";
                    var edt = "";
                    var rrt = "";
                    if (approver.Required)
                        req = "checked='checked'";
                    if (approver.CanEdit)
                        edt = "checked='checked'";
                    if (approver.CanReroute)
                        rrt = "checked='checked'";
                    var str = "<tr data-approver-id='" + approver.ApproverID + "' data-is-dynamic='" + approver.IsDynamic + "'>" +
                                "<td data-user-id='" + approver.UserHostID + "' data-dynamic-id='" + approver.DynamicApprover + "'>" + approver.DisplayName + "</td>" +
                                "<td data-alternate-id='" + approver.AlternateFor + "'>" + approver.AlternateDisplayName + "</td>" +
                                "<td><input type='checkbox' id='required' disabled='true' " + req + "/></td>" +
                                "<td><input type='checkbox' id='edit' disabled='true' " + edt + "/></td>" +
                                "<td><input type='checkbox' id='reroute' disabled='true' " + rrt + "/></td>" +
                                "<td><a href='#' onclick='JWF.ui.Stage.Approvers.approverDeleteClicked(this);return false;'>Remove</a></td>" +
                               "</tr>";
                    $(".jwf-approver-list tbody").append(str);

                },
                populateList: function () {
                    var listStr = $('[id*=hdnApproverList]').val();
                    if (listStr != null && listStr != '') {
                        var list = JSON.parse(listStr);
                        for (var x in list) {
                            if (list[x] != null) {
                                JWF.approverBuilder.approverAddRow(list[x]);
                            }
                        }
                    }
                }
            }
        }  
    },
    data : {
        populateData : function(target) {
            switch(target.data("datasource")) {
                case "DynamicApprovers":
                    break;
                case "StageApprovers":
                    break;
            }
        }
    }
};

var cache = {};
var kcache = {};
jQuery(document).ready(function () {
    initAutoComplete();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(initAutoComplete);
});
function initAutoComplete() {
    jQuery('.tbxLookUp').autocomplete({
        source: function (request, response) {
            var term = request.term;
            if (cache.length > 0) {
                var vals = getValues(cache, term);
                response(vals);
                if(vals.length != 0)
                    return;
            }

            $.getJSON(urlUtil.getAppRoot() + '/Portlets/CUS/ICS/Jenzabar.Workflow/Services/WorkflowService.asmx/GetData', request, function (data, status, xhr) {
                cache = data;
                response(getValues(cache, term));
            });
        },
        minLength: 1,
        select: function (event, ui) {
            jQuery('.tbxLookUp').val(ui.item.id);
            jQuery('.tbxLookUp').data('object-name', ui.item.value);
            return false;
        }
    });
    jQuery('.jwf-static-settings').autocomplete({
        source: function (request, response) {
            var term = request.term;
            if (cache.length > 0) {
                var vals = getValues(cache, term);
                response(vals);
                if (vals.length != 0)
                    return;
            }

            $.getJSON(urlUtil.getAppRoot() + '/Portlets/CUS/ICS/Jenzabar.Workflow/Services/WorkflowService.asmx/GetData', request, function (data, status, xhr) {
                cache = data;
                response(getValues(cache, term));
            });
        },
        minLength: 1,
        select: function (event, ui) {
            jQuery('.jwf-static-settings').val(ui.item.id);
            jQuery('.jwf-static-settings').attr('data-object-name', ui.item.value);
            return false;
        }
    });
}
function getValues(data, term) {
    var arr = new Array();
    var count = 0;
    for (var x in data) {
        if (data[x].value.toString().toLowerCase().indexOf(term.toLowerCase()) >= 0) {
            arr[count] = data[x];
            count++;
        }
    }
    return arr;
}
function showTrackSettings() {
    jQuery('.jwf-track-settings').dialog({
        width: 685,
        minheight: 450,
        appendTo: 'form[name=MAINFORM]',
        position: { my: "center", at: "center", of: $('.pSection') }
    }).parent().css('z-index', 99).css('top', '120px');
    renderTabs();
}
function renderTabs() {
    jQuery('.jwf-settings-tabs').tabs();
}
jQuery(document).ready(function () {
    jQuery('.SortStages').sortable({
        handle: '.dragHandle',
        stop: function (event, ui) {
            var pos = 0;
            var rows = new Array();
            $('.AdminTrackRow', '.SortStages').each(function () {
                rows[pos] = jQuery('#rowID', this).val();
                pos++;
            });
            JWF.post('/SaveOrder',
                        { 'rows': rows, 'track': jQuery('[id*=hdnTrackID]').val() },
                        function (data) {

                        }
                );
        }
    });
    if (jQuery('[id*=pnlStageDef]').is(':visible')) {
        jQuery('[id*=pnlStageDef]').dialog({
            width: 685,
            minheight: 450,
            appendTo: 'form[name=MAINFORM]',
            position: { my: "center", at: "center", of: $('.pSection') }
        }).parent().css('z-index', 99).css('top', '120px');
        jQuery(".ui-dialog-titlebar").hide()
        JWF.approverBuilder.onLoad();
    }
    renderTabs();
});
function initTestLSR() {
    jQuery('.testLSRModal').dialog({ width: '600' });
    jQuery('.lsrTestOutput').html('');
    var query = jQuery('[id*=taValue]').val();
    var pat = /@@\w+/g
    var p = query.match(pat);
    jQuery('.lsrTest').html('<tr><td colspan="2"><b>Values Needed</b></td></tr>');
    for (x in p) {
        jQuery('.lsrTest').append('<tr><td>' + p[x] + '</td><td><input type="text" data-lsr="' + p[x] + '"/></td></tr>');
    }
}
function testLSR() {
    var name = jQuery('[id*=ddlLiterals] option:selected').text();
    if (name == null || name == '')
        name = null;
    var opts = {};
    jQuery('[data-lsr]').each(function () {
        opts[jQuery(this).attr('data-lsr')] = jQuery(this).val();
    });
    ajaxUtil.callWebService(webServicePath + webService + 'TestLSR',
        { portlet: portletId, lsrVal: name, values: opts },
        function (data) {
            if (data.d.isError)
                alert(data.d.Message);
            else {
                jQuery('.lsrTestOutput').html('<b>Output</b><br/>');
                jQuery('.lsrTestOutput').append('<span>' + name + '</span><span>' + data.d.Message + '</span>');
            }
        });
}
function saveLSR() {
    var oldName = jQuery('[id*=ddlLiterals]').val(),
        name = jQuery('[id*=tbxNewName]').val(),
        type = jQuery('[id*=ddlSourceType]').val(),
        conn = jQuery('[id*=drpConnectionString]').val(),
        cache = jQuery('[id*=ddlCacheMode]').val(),
        desc = jQuery('[id*=taDescription]').val(),
        val = jQuery('[id*=taValue]').val();

    if (name == null || name == '')
        name = null;
    ajaxUtil.callWebService(webServicePath + webService + 'SaveLSR',
        { portlet: portletId, lsrId: oldName, name: name, lsrType: type, conn: conn, cache: cache, desc: desc, val: val },
        function (data) {
            if (data.d.isError)
                alert(data.d.Message);
        });
}
var webServicePath = urlUtil.getAppRoot() + '/Portlets/CUS/ICS/Jenzabar.Workflow/Services/';
var webService = 'WorkflowBuildService.asmx/';

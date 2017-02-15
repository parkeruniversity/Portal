var cache = {};
var kcache = {};
var webServicePath = urlUtil.getAppRoot() + 'Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/';
var webService = 'FormBuildWebService.asmx/';
var dataSources = {};
var reqViol = false;

Jcf.Globalization = {};
Jcf.cache = {
    SubmissionId: null,
    FormId: null
};
Jcf.func = {
    checkUserExists: function(emailAddress) {
        Jcf.post("CheckExternalUserExists",
            { emailAddress: emailAddress },
            function(data) {
                if (data.d.isError) {
                    alert(data.d.Message);
                    $('[name*=btnCreateAccount]').attr('disabled', 'disabled');
                } else {
                    $('[name*=btnCreateAccount]').removeAttr('disabled');
                }
            }, true);
    },
    saveTab: function (tabId) {
        var answers = [];
        $(".jcf-tab[id*=Tab" + tabId + "] .InputItem").each(function () {
            var item = $(this).closest(".jcf-col");
            if (item.attr("itemtype") !== "CollectionGrid" &&
                item.attr("itemtype") !== "CheckBox" &&
                item.attr("itemtype") !== "Button" &&
                item.attr("data-grid") !== "") {
                //For all question types that aren't multi response and that are not associated with multi response
                var answer = {};

                answer.Item = item.attr("itemid");
                answer.RowIndex = 0;
                answer.RequiredOnSubmit = item.attr("isrequired");
                answer.ValidationError = item.attr("validation-fail");
                if (item.attr("itemtype") === "RadioButton") {
                    answer.AnswerValue = $(this).find("input[type=radio]:checked").val();
                } else if (item.attr("itemtype") === "DatePicker") {
                    answer.AnswerValue = $(this).find("input").val();
                } else {
                    answer.AnswerValue = $(this).val();
                }

                answers[answers.length] = answer;
            } else if (item.attr("itemtype") === "CheckBox") {
                var checks = [];
                $(this).find("input[type=checkbox]:checked").each(function() {
                    checks[checks.length] = { "value": $(this).val() };
                });

                var answer = {};
                checks[checks.length] = {};
                answer.Item = item.attr("itemid");
                answer.RequiredOnSubmit = item.attr("isrequired");
                answer.AnswerValue = JSON.stringify(checks);
                answer.RequiredOnSubmit = item.attr("isrequired");
                answer.ValidationError = item.attr("validation-fail");
                answers[answers.length] = answer;
            }
        });
        $(".jcf-tab[id*=Tab" + tabId + "] .jcf-grid").each(function()
        {
            var item = $(this).closest(".jcf-col");
            if (item.attr("itemtype") === "CollectionGrid") {
                prepCollectionGrid(item.attr("itemid"));

                var answer = {};

                answer.Item = item.attr("itemid");
                answer.RequiredOnSubmit = item.attr("isrequired");
                answer.AnswerValue = item.find(".jcf-control-cell input[id*=ColGrid" + item.attr("itemid") + "]").val();
                answer.RequiredOnSubmit = item.attr("isrequired");
                answer.ValidationError = item.attr("validation-fail");
                answers[answers.length] = answer;
            }
        });
        Jcf.post("SaveTabProgress",
            {
                submissionId: Jcf.cache.SubmissionId,
                formId: Jcf.cache.FormId,
                tabId: tabId,
                responses: answers
            },
            function(data) {
                if (!data.d.isError) {
                    if (data.d.Object === true && $("a[data-tabid='" + tabId + "'] img").length == 0) {
                        var check = "<img src='" + urlUtil.getAppRoot() +
                            "/UI/Common/Images/PortletImages/Icons/check.gif' class='jcf-progress-check' />";
                        $("a[data-tabid='" + tabId + "']").prepend(check);
                    } else if (data.d.Object !== true && $("a[data-tabid='" + tabId + "'] img").length > 0) {
                        $("a[data-tabid='" + tabId + "'] img").remove();
                    }
                }
            });
    }
};
Jcf.ui = {
    itemWorking: function(itemId, working) {
        var item = $('[id*="' + itemId + '"]');
        if (working && item.length > 0) {
            item.find('.jcf-element').append('<span class="jcf-item-working-input fa fa-spinner fa-spin"></span>');
        } else if (item.length > 0) {
            item.find('.jcf-item-working-input').remove();
        }
    },
    showActiveSubmissionsModal: function(formId, submissions, url) {
        if (submissions.length == 0)
            return;
        var submissionsStr = "<div id='jcfErrorContainer'>" +
            "<ul class='jcf-submission-list'>" +
            "<li>Last Updated" +
            "<span class='jcf-submission-progress'>Progress</span>" +
            "</li>";
        for (var i in submissions) {
            submissionsStr += "<li data-status='" + submissions[i].Status + "'>" +
                "<a href='" + url + "&submission_id=" + submissions[i].SubmissionID + "'>" + submissions[i].StartDate + "</a>" +
                "<span class='jcf-submission-delete fa fa-lg fa-trash-o' data-submissionid='" + submissions[i].SubmissionID + "'></span>" +
                "<span class='jcf-submission-progress'>" + submissions[i].Progress + "</span></li>";
        }
        submissionsStr += "</ul></div>";
        var alertModal = jQuery(submissionsStr);
        alertModal.find('.jcf-submission-delete')
            .click(function() {
                Jcf.events.onSubmissionDeleteClicked($(this).attr('data-submissionid'));
            });
        alertModal
            .dialog({
                title: 'Would you like to pick up where you left off?',
                zindex: 1001,
                dialogClass: 'jcf-alert',
                modal: true,
                width: 500,
                buttons: [
                    {
                        text: "Start New",
                        icons: {
                            primary: "ui-icon-plus"
                        },
                        click: function() {
                            document.location.href = url;
                        }
                    }
                ]
            });
    },
    showCreateAccountModal: function() {
        $(".jcf-create-login").show();
        $(".jcf-login-form").hide();
    },
    hideCreateAccountModal: function() {
        $(".jcf-create-login").hide();
        $(".jcf-login-form").show();
    },
    fileSelected: function (messageId, path) {
        var fileName = path.substring(path.lastIndexOf("\\") + 1);
        $('[id*=' + messageId + ']').html(fileName);
    }
};
Jcf.events = {
    onFormLinkClicked: function(formId, userId, url) {
        Jcf.post("GetUserActiveSubmissions",
            { formId: formId, userId: userId },
            function(data) {
                if (data.d.isError) {
                    Jcf.common.ui.handleError(data.d.Message, "GetUserActiveSubmissions");
                } else {
                    Jcf.ui.showActiveSubmissionsModal(formId, data.d.Object, url);
                }
            });
    },
    onSubmissionDeleteClicked: function(submissionId) {
        Jcf.post("DeleteSubmission",
            { submissionId: submissionId },
            function(data) {
                if (data.d.isError) {
                    Jcf.common.ui.handleError("Submission could not be deleted.", "DeleteSubmission");
                } else {
                    $(".jcf-alert [data-submissionid='" + submissionId + "']").closest("li").remove();
                }
            });
    },
    onCreateAccountClicked: function() {
        Jcf.ui.showCreateAccountModal();
    },
    onCloseAccountClicked: function() {
        Jcf.ui.hideCreateAccountModal();
    },
    onCreateEmailAddressBlur: function() {
        Jcf.func.checkUserExists($('input[id*=tbxCreateEmail]').val());
    },
    onLoad: function() {
        Jcf.cache.SubmissionId = $("[id*=hdn_submissionID]").val();
        Jcf.cache.FormId = $(".jcf-form-display").attr("formid");
    }
};
$(document).ready(function() {
    Jcf.events.onLoad();
});
function GetValues(data, term) {
    var arr = new Array();
    var count = 0;
    for (var x in data) {
        if (data[x].Name == null) {
            if (data[x].toString().toLowerCase().indexOf(term.toLowerCase()) >= 0) {
                arr[count] = data[x];
                count++;
            }
        }
        else {
            if (data[x].Name.toString().toLowerCase().indexOf(term.toLowerCase()) >= 0) {
                arr[count] = data[x];
                count++;
            }
        }
    }
    return arr;
}
function CacheContainsText(cache, term) {
    for (var x in cache) {
        if (cache[x].Name.indexOf(term) > 0) {
            return true;
        }
    }
    return false;
}
function colGrdDeleteRow(btn) {
    var id = jQuery(btn).closest('.jcf-col').attr("itemid");
    var tr = jQuery(btn).closest('tr');
    var formID = jQuery('[id*=hdn_formID]').val();
    formID = formID.replace(/-/g, "");
    jQuery('td',tr).each(function () {
        if (jQuery(this).attr('data-itemid') != null) {
            var id = jQuery(this).attr('data-itemid');
            var tpe = jQuery('[itemid=' + id + ']').attr('itemtype');
            var value = '';
            switch(tpe)
            {
                case 'RadioButton':
                    try {
                        value = jQuery('input[type=hidden]', this).val();
                        jQuery('[itemid=' + id + '] .InputItem [optvalue="' + value + '"] input').prop('checked', true);
                    }
                    catch (err) { }
                    jQuery('[itemid=' + id + '] .InputItem [optvalue="' + value + '"] input').attr('checked', true);
                    //jQuery('[itemid=' + id + '] .InputItem [optvalue="' + value + '"] input').click();
                    break;
                case 'DatePicker':
                    value = jQuery('input[type=hidden]', this).val();
                    jQuery('[itemid=' + id + '] .InputItem input').val(value);
                    //jQuery('[itemid=' + id + '] .InputItem input').change();
                    break;
                case 'DropDown':
                    value = jQuery('input[type=hidden]', this).val();
                    jQuery('[itemid=' + id + '] .InputItem').val(value);
                    jQuery('[itemid=' + id + '] [id*=DrpHdn]').val(value);
                    //jQuery('[itemid=' + id + '] .InputItem').change();
                    break;
                default:
                    value = jQuery('input[type=hidden]', this).val();
                    jQuery('[itemid=' + id + '] .InputItem').val(value);
                    //jQuery('[itemid=' + id + '] .InputItem').blur();
            }
            if (jQuery('span[id*="vs' + id + '"]').length > 0)
                jQuery('span[id*="vs' + id + '"]').html(value);

            formChange(formID, id, jQuery(this).val());
            processLoadDateSources(id);
        }
        else {
            //populate details
            jQuery('input[type=hidden]', this).each(function () {
                var id = jQuery(this).attr('name').substring(jQuery(this).attr('name').indexOf('|') + 1);
                var tpe = jQuery('[itemid=' + id + ']').attr('itemtype');

                switch (tpe)
                {
                    case 'RadioButton':
                        jQuery('[itemid=' + id + '] .InputItem input[type=radio][value="' + jQuery(this).val() + '"]').attr('checked', 'checked');
                        jQuery('[itemid=' + id + '] .InputItem input[type=radio][value="' + jQuery(this).val() + '"]').prop('checked', 'checked');
                        //jQuery('[itemid=' + id + '] .InputItem input[type=radio][value="' + jQuery(this).val() + '"]').click();
                        break;
                    case 'DropDown':
                        jQuery('[itemid=' + id + '] .InputItem').val(jQuery(this).val());
                        jQuery('[itemid=' + id + '] [id*=DrpHdn]').val(jQuery(this).val());
                        //jQuery('[itemid=' + id + '] .InputItem').change();
                        break;
                    default:
                        jQuery('[itemid=' + id + '] .InputItem').val(jQuery(this).val());
                        //jQuery('[itemid=' + id + '] .InputItem').blur();
                        break;
                }
                formChange(formID, id, jQuery(this).val());
                processLoadDateSources(id);
            });
        }
    });

    jQuery(tr).remove();
    triggerCGChanged(formID, id, '-');
    prepCollectionGrid(id);
}
function processLoadDateSources(id) {
    $("[itemid*='" + id + "'] [data-conditional-datasource='true']").change();
}
function prepCollectionGrid(id) {
    var val = [];
    var formID = jQuery('[id*=hdn_formID]').val();
    formID = formID.replace(/-/g, "");

    jQuery('[itemid=' + id + '] .jcf-grid tbody tr').each(function () {
        var obj = {};
        jQuery('td', this).each(function () {
            if (jQuery(this).attr('data-itemid') != null) {
                obj[jQuery(this).attr('data-itemid')] = jQuery('input[type=hidden]',this).val();
            }
            else if (jQuery('input[type=file]', this).length > 0) {
                var file = jQuery('input[type=file]', this);
                obj["file"] = file.attr("name");
            }
            else {
                //populate details
                jQuery('input[type=hidden]', this).each(function () {
                    var hdnId = jQuery(this).attr('name');
                    if (hdnId.indexOf('|') >= 0)
                        hdnId = jQuery(this).attr('name').substring(jQuery(this).attr('name').indexOf('|') + 1);
                    obj[hdnId] = jQuery(this).val();
                });
            }
        });
        val[val.length] = obj;
    });
    if (val.length > 0)
        triggerCGChanged(formID, id, '*');
    else
        triggerCGChanged(formID, id, '');
    jQuery('input[id*=' + id + ']').val(JSON.stringify(val));
    updateBalance();
}
function onloadCollectionGridEvent(id) {
    var formID = jQuery('[id*=hdn_formID]').val();
    if(formID != null)
        formID = formID.replace(/-/g, "");
    if (jQuery('[itemid=' + id + '] .jcf-grid tbody tr').filter(function () { return $('td', this).length > 0; }).length >= 1)
        triggerCGChanged(formID, id, '*');
    else 
        triggerCGChanged(formID, id, '');
}
var rowCount = 0;
function addCollectionGridRow(id) {
    var formID = jQuery("[id*=hdn_formID]").val();
    formID = formID.replace(/-/g, "");
    reqViol = false;

    var length = parseInt(jQuery("[itemid=" + id + "] .jcf-grid").attr("data-max-length"));
    var currentCount = jQuery("[itemid=" + id + "] .jcf-grid tbody tr:has(td)").length;
    if (length > 0 && currentCount >= length) {
        alert("The maximum number of allowed entries is " + length.toString() + ".");
        return false;
    }
    rowCount ++;
    var r = [];
    jQuery(".jcf-hidden-questions [data-grid=" + id + "]").each(function () {
        var itm = {};
        itm.gridid = id;
        itm.id = jQuery(this).attr("itemid");
        itm.func = jQuery(this).attr("data-grid-function");
        itm.type = jQuery(this).attr("itemtype");
        itm.required = jQuery(this).attr("isrequired");

        r[r.length] = itm;
    });
    jQuery(".FormControls [data-grid=" + id + "]").each(function () {
        var itm = {};
        itm.gridid = id;
        itm.id = jQuery(this).attr("itemid");
        itm.func = jQuery(this).attr("data-grid-function");
        itm.type = jQuery(this).attr("itemtype");
        itm.required = jQuery(this).attr("isrequired");

        r[r.length] = itm;
    });
    var showDetails = jQuery("[itemid=" + id + "] .jcf-grid").data("show-details");
    var showUpdate = jQuery("[itemid=" + id + "] .jcf-grid").data("show-update");
    var fileName = jQuery("[itemid=" + id + "] .jcf-grid").data("file-upload");
    if (fileName == "none")
        fileName = null;
    var row = populateGridRow(r, showDetails, showUpdate, fileName);
    var rowKey = jQuery(row).attr("data-rowkey");
    if (rowKey != "" && jQuery("[itemid=" + id + "] tr[data-rowkey='" + rowKey + "']").length > 0)
    {
        alert("This row cannot be added because it is a duplicate.");
        return;
    }
    if (!reqViol) {
        jQuery("[itemid=" + id + "] .cgPlaceholder").remove();
        jQuery("[itemid=" + id + "] .jcf-grid tbody").append(row);

        jQuery("[data-grid=" + id + "] .InputItem").filter(function () { return !jQuery(this).is("button"); }).val("");
        jQuery("[data-grid=" + id + "] .InputItem option").removeAttr("selected");
        jQuery("[data-grid=" + id + "] .InputItem input").removeAttr("checked");
        jQuery("[data-grid=" + id + "] .InputItem .jsDatePicker").val("");
		if (jQuery("[data-grid=" + id + "][isreadonly=true] .jcf-element span").length > 0)
		    jQuery("[data-grid=" + id + "][isreadonly=true] .jcf-element span").html("");

		triggerCGChanged(formID, id, "+");
		prepCollectionGrid(id);
    }
    else {
        alert("Please answer all required questions before attempting to add.");
        return false;
    }
    return true;
}
function populateGridRow(row, showDetails, showUpdate, fileName) {

    var rowstr = '<tr>';
    var hdnstr = '';
    var rowKey = '';
    var hasDtl = false;
    var addUpload = true;
    for (var x in row) {
        var itm = row[x];
        var obj = jQuery('[itemid=' + itm.id + ']');
        if ((itm.func == 'Summary' || itm.func == 'Key')
                && itm.type != 'RadioButton'
                && itm.type != 'DatePicker'
                && itm.type != 'DropDown'
                && itm.type != 'Hidden') {
            if(itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem', obj).val() != undefined ? jQuery('.InputItem', obj).val() : '';
            var required = itm.required;
            if (itm.func == 'Key')
                rowKey += itm.value + ';';
            rowstr += '<td data-itemid="' + itm.id + '">';
            rowstr += itm.value;
            rowstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            rowstr += '</td>';
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if ((itm.func == 'Summary' || itm.func == 'Key')
            && itm.type == 'DropDown') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem', obj).val();
            itm.text = jQuery('.InputItem option[value="' + itm.value + '"]', obj).text();
            var required = itm.required;
            if (itm.func == 'Key')
                rowKey += itm.value + ';';
            rowstr += '<td data-itemid="' + itm.id + '">';
            rowstr += itm.text != '' ? itm.text : itm.value;
            rowstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            rowstr += '</td>';
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if ((itm.func == 'Summary' || itm.func == 'Key')
            && itm.type == 'RadioButton') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem input:checked', obj).val() == undefined ? '' : jQuery('.InputItem input:checked', obj).val();
            itm.text = jQuery('.InputItem input[value="' + itm.value + '"]', obj).next('label').html() != undefined ? jQuery('.InputItem input[value=' + itm.value + ']', obj).next('label').html() : '';
            var required = itm.required;
            if (itm.func == 'Key')
                rowKey += itm.value + ';';
            rowstr += '<td data-itemid="' + itm.id + '">';
            rowstr += itm.text != '' ? itm.text : itm.value;
            rowstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            rowstr += '</td>';
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if ((itm.func == 'Summary' || itm.func == 'Key')
            && itm.type == 'DatePicker') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem input', obj).val() != undefined ? jQuery('.InputItem input', obj).val() : '';
            var required = itm.required;
            if (itm.func == 'Key')
                rowKey += itm.value + ';';
            rowstr += '<td data-itemid="' + itm.id + '">';
            rowstr += itm.value;
            rowstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            rowstr += '</td>';
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if ((itm.func == 'Summary' || itm.func == 'Key')
            && itm.type == 'Hidden') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('[type=hidden]', obj).val();
            var required = itm.required;
            if (itm.func == 'Key')
                rowKey += itm.value + ';';
            rowstr += '<td data-itemid="' + itm.id + '">';
            rowstr += itm.value;
            rowstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            rowstr += '</td>';
        }
        else if (itm.func == 'Detail'
            && itm.type == 'RadioButton') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem input:checked', obj).val() == undefined ? '' : jQuery('.InputItem input:checked', obj).val();
            var required = itm.required;
            hdnstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            hasDtl = true;
            reqViol = (required == 'true' && (itm.value.trim() == '')) || reqViol;
        }
        else if (itm.func == 'Detail'
            && itm.type == 'DatePicker') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem input', obj).val();
            var required = itm.required;
            hdnstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            hasDtl = true;
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if (itm.func == 'Detail'
            && itm.type == 'Hidden') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('[type=hidden]', obj).val();
            hdnstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            hasDtl = true;
        }
        else if (itm.func == 'Detail') {
            if (itm.value == null || itm.value == '')
                itm.value = jQuery('.InputItem', obj).val();
            var required = itm.required;
            hdnstr += '<input type="hidden" name="' + itm.id + '" value="' + itm.value + '"/>';
            hasDtl = true;
            reqViol = (required == 'true' && itm.value.trim() == '') || reqViol;
        }
        else if (fileName != null && itm.func == 'File' && typeof itm.value != 'undefined') {
            rowstr += '<td><a target="_blank" href="' + itm.value + '">File</a>' +
                '<input type="hidden" name="' + itm.id + '" value=""/></td>';
            addUpload = false;
        }
    }
    var colspan = "2";
    if (showDetails == "True" || showUpdate == "True")
        colspan = "1";
    if (fileName != null && addUpload) {
        rowstr += '<td colspan="' + colspan + '"><input type="file" name="cgFileUpload' + rowCount + '" /></td>';
    }
    if (showDetails == "True" || showUpdate == "True") {
        rowstr += '<td class="jcf-control-cell">' + hdnstr;
        if (hasDtl && showDetails == "True")
            rowstr += '<button onclick="viewGrdRow(this);return false;">' + Jcf.Globalization.TxtCGDetailBtn + '</button>';
        if (showUpdate == "True")
            rowstr += '<button onclick="colGrdDeleteRow(this);return false;">' + Jcf.Globalization.TxtCGUpdateBtn + '</button>';
        rowstr += '</td>';
    }
    rowstr += '</tr>';
    var row = jQuery(rowstr)
                .attr('data-rowkey', rowKey);
    if (showDetails != "True" && showUpdate != "True") {
        row.find('td:last').attr('colspan', '2');
    }
    return row;
}
function populateGrid(id) {
    var val = jQuery('input[id*=' + id + ']').val();
    if (val == '')
        return;
    var grid = JSON.parse(val);
    var showDetails = jQuery('[itemid=' + id + '] .jcf-grid').data('show-details');
    var showUpdate = jQuery('[itemid=' + id + '] .jcf-grid').data('show-update');
    var fileName = jQuery('[itemid=' + id + '] .jcf-grid').data('file-upload');
    if (fileName == 'none')
        fileName = null;
    for (var row in grid) {
        rowCount ++;
        var r = [];
        var rowObj = grid[row];
        for (var c in rowObj) {
            var obj = jQuery('[itemid=' + c + ']');
            var itm = {};
            itm.value = rowObj[c];
            itm.id = c;
            itm.gridid = id;
            itm.func = jQuery(obj).attr('data-grid-function');
            itm.type = jQuery(obj).attr('itemtype');
            itm.required = jQuery(obj).attr('isrequired');
            r[r.length] = itm;
        }
        if (fileName != null) {
            var itm = {};
            itm.value = rowObj[id];
            itm.gridid = id;
            itm.func = "file";
            itm.type = "File";
            itm.required = false;
            r[r.length] = itm;
        }
        if (r.length == 0)
            continue;
        var gr = populateGridRow(r, showDetails, showUpdate, fileName);

        jQuery('[itemid=' + id + '] .jcf-grid tbody').append(gr);
    }
}
function viewGrdRow(btn) {
    var str = '<div>';
    var id = jQuery(btn).closest('.jcf-col').attr("itemid");
    jQuery('[data-grid=' + id + ']').each(function () {
        if (jQuery(this).attr('itemtype') != 'Button') {
            var itId = jQuery(this).attr('itemid');
            var tr = jQuery(btn).closest('tr');
            str += '<div><a class="jcf-grid-label">';
            str += jQuery('.jcf-label', this).html() + "</a>";

            str += jQuery('[name$=' + itId + ']', tr).val() + '</div>';
        }
    });
    str += '</div>';
    var width = jQuery(window).width();
    if (width < 750) {
        width = "90%";
    }
    else {
        width = "700px";
    }
    jQuery(str).dialog({ width : width, title : 'Row Details', dialogClass : 'pt_JenzContainedForm' });
}
function updateBalance() {
    var eq = jQuery('[id*=hdn_equation]').val();
    var usesGrid = false;
    var grid = null;
    if (eq != '' && eq != null) {
        var pat = /(\#\#[\d]+)/g
        var matches = eq.match(pat);
        for (var x in matches) {
            try {
                var n = matches[x];
                var num = n.replace(/##/g, "");
                var val = '0';
                if (jQuery('[itemnum=' + num + ']').attr('data-grid') != null
					&& jQuery('[itemnum=' + num + ']').attr('data-grid').length > 0
                    && jQuery('[itemnum=' + num + ']').attr('data-grid') != '')
                {
                    usesGrid = true;
                    grid = jQuery('[itemnum=' + num + ']').attr('data-grid');
                }
                if (jQuery('[itemnum=' + num + '] select').length > 0) {
                    val = jQuery('[itemnum=' + num + '] input[id*=DrpBal]').val();
                }
                else if (jQuery('[itemnum=' + num + '] .InputItem').length > 0) {
                    val = jQuery('[itemnum=' + num + '] .InputItem').val();
                }
                else if (jQuery('[itemnum=' + num + '] input[type=hidden]').length > 0) {
                    val = jQuery('[itemnum=' + num + '] input[type=hidden]').val();
                }
                if (val == '')
                    val = '0';
                eq = eq.replace('##' + num, val);
            }
            catch (err) { }
        }
        if (usesGrid) {
            var bal = 0;
            var rowNum = -1;
            jQuery('[itemid=' + grid + '] .jcf-grid tbody tr').each(function () {
                var grEq = jQuery('[id*=hdn_equation]').val();
                var matches = grEq.match(pat);
                rowNum++;
                grEq = grEq.replace('##rowNum', rowNum);
                for (var x in matches) {
                    var n = matches[x];
                    var num = n.replace(/##/g, "");
                    var guid = jQuery('[itemnum=' + num + ']').attr('itemid');
                    var value = jQuery(this).find('input[name=' + guid + ']').val();
                    grEq = grEq.replace('##' + num, value);
                }
                try {
                    bal += eval(grEq);
                }
                catch (er) {
                }
            });
            jQuery('[id*=hdn_payBalance]').val(bal.toFixed(2));
        }
        else {
            try {
                jQuery('[id*=hdn_payBalance]').val(eval(eq));
            }
            catch (er) {
                jQuery('[id*=hdn_payBalance]').val('0');
            }
        }
    }
}
function LookUpValues(itemID, datasourceID, value, trigger) {
    Jcf.ui.itemWorking(itemID, true);
    if (dataSources[itemID + '|' + datasourceID + '|' + value] == null) {
        var submissionId = $('[id*=hdn_submissionID]').val();
        if (submissionId == '' || submissionId == null)
            submissionId = null;
        ajaxUtil.callWebService(webServicePath + webService + 'GetDataSourceWithValue',
			{ ItemID: itemID, DataSourceID: datasourceID, value: value, submissionID: submissionId },
			function (data) {
			    ParseLookUpValues(data.d.ItemID, data.d.DSList, data.d.Object.TriggerItem);
			    dataSources[data.d.ItemID + '|' + data.d.Object.DataSourceID + '|' + data.d.Value] = data.d.DSList;
			    Jcf.ui.itemWorking(itemID, false);
			});
    }
    else {
        ParseLookUpValues(itemID, dataSources[itemID + '|' + datasourceID + '|' + value], trigger);
        Jcf.ui.itemWorking(itemID, false);
    }
}
function ParseLookUpValues(triggerItem, data, trigger) {
    for (var x in data) {
        if (x == triggerItem)
            continue;
        var val = data[x];
        var itm = jQuery('[itemid*=' + x + '] .InputItem');
        jQuery('[itemid*=' + x + '] .InputItem').val(val);
        if (trigger == 'true' || trigger == 'True') {
            jQuery('[itemid*=' + x + '] .InputItem').change();
            jQuery('[itemid*=' + x + '] [type=text]').blur();
        }
        if (jQuery('[itemid*=' + x + '] img.InputItem').length > 0) {
            jQuery('[itemid*=' + x + '] img.InputItem').attr('src', val);
        }
        jQuery('[itemid*=' + x + '] [id*=DrpHdn' + x + ']').val(val);
        jQuery('[itemid*=' + x + '] [id*=DropDown' + x + ']').val(val);
        if (trigger == 'true' || trigger == 'True')
            jQuery('[itemid*=' + x + '] [id*=DropDown' + x + ']').change();

        jQuery('[itemid*=' + x + '] [id*=RadioButton' + x + '][value="' + val + '"]').prop("checked", true);
        jQuery('[itemid*=' + x + '] [id*=DatePicker' + x + '] input').val(val);
        
        if (jQuery('[itemid*=' + x + '] .InputItem').length > 0 && !jQuery('[itemid*=' + x + '] .InputItem').is(':visible')) {
            jQuery('[id*=vs' + x + ']').html(val);
        }
        if (jQuery('[itemid*=' + x + '] [id*=DrpHdn' + x + ']').length > 0 && !jQuery('[itemid*=' + x + '] [id*=DropDown' + x + ']').is(':visible')) {
            jQuery('[id*=vs' + x + ']').html(jQuery('[itemid*=' + x + '] [id*=DropDown' + x + '] option:selected').text());
        }
    }
}
function LoadDataSource(DataSourceID, array, ItemID) {
    Jcf.ui.itemWorking(ItemID, true);
    var data = {};
    for (var itm in array) {
        if (jQuery('[itemid*=' + array[itm] + '] .InputItem').length > 0) {
            data[array[itm]] = jQuery('[itemid*=' + array[itm] + '] .InputItem').val();
        }
        else if (jQuery('[itemid*=' + array[itm] + '] input[type=hidden]').length > 0) {
            data[array[itm]] = jQuery('[itemid*=' + array[itm] + '] input[type=hidden]').val();
        }
    }
    ajaxUtil.callWebService(webServicePath + webService + 'GetConditionalDataSource',
        { DataSourceID: DataSourceID, Params: data, ItemID: ItemID },
        function (data) {
            jQuery('[itemid*=' + ItemID + '] .InputItem option').remove();
            jQuery('[itemid*=' + ItemID + '] .InputItem').append('<option></option>');
            for (var x in data.d.Object) {
                jQuery('[itemid*=' + ItemID + '] .InputItem').append('<option value="' + data.d.Object[x].Value + '">' + data.d.Object[x].Text + '</option>');
            }
            jQuery('[itemid*=' + ItemID + '] .InputItem').val(jQuery('[id*=DrpHdn' + ItemID + ']').val());
            Jcf.ui.itemWorking(ItemID, false);
        });
}

//////////////////////////////////////////////////////////////////////////////
// Rule Builder Actions 
//////////////////////////////////////////////////////////////////////////////
function setPaymentProfile(profile)
{
    jQuery('[id*=hdn_PayProfile]').val(profile);
}
function showQuestionGroup(group)
{
    if(!jQuery('[itemgroup*="' + group + '"]')
        .closest('.jcf-row')
        .is(':visible'))
    { 
        jQuery('[itemgroup*="' + group + '"]').closest('.jcf-row').show();
    }
    jQuery('[itemgroup*="' + group + '"]').show();
}
function hideQuestionGroup(group)
{
    jQuery('[itemgroup*="' + group + '"]').hide();
    var row = jQuery('[itemgroup*="' + group + '"]')
        .closest('.jcf-row');
    var visible = jQuery('.jcf-col', row).filter(function () { return $(this).css('display') != 'none'; });
    if(visible.length == 0)
    { 
        jQuery('[itemgroup*="' + group + '"]').closest('.jcf-row').hide();
    }
}
function toggleQuestionGroup(group)
{
    var display = jQuery('[itemgroup*="' + group + '"]').toggle().css('display');
    var visible = display == 'inline-block' || display == 'block';
    if (visible) {
        jQuery('[itemgroup*="' + group + '"]').closest('.jcf-row').show();
    }
    if (jQuery('[itemgroup*="' + group + '"]')
        .closest('.jcf-row').find('.element:visible').length == 0) {
        jQuery('[itemgroup*="' + group + '"]').closest('.jcf-row').hide();
    }
}
function makeGroupRequired(group)
{
    var req = jQuery("[id*=hdn_requiredQuestions]").val();
    
    if(req != null && req.indexOf(group) < 0)
    { 
        jQuery("[id*=hdn_requiredQuestion]").val(req + ";" + group); 
    } 
    if(jQuery(".reqIndicator", "[itemgroup*='" + group + "']").length === 0)
    {
        jQuery(".jcf-req-holder", "[itemgroup*='" + group + "']").remove();
        jQuery(".reqIndicator", "[itemgroup*='" + group + "']").remove();
        jQuery("[piece=label]", "[itemgroup*='" + group + "']").prepend("<span class='reqIndicator'>*</span>");
        jQuery("[itemgroup*='" + group + "']").attr("isrequired", "true");
    }
}
function makeGroupNotRequired(group)
{
    var req = jQuery("[id*=hdn_requiredQuestions]").val();
    if (req == null)
        return;
    jQuery("[id*=hdn_requiredQuestions]").val(req.replace(";" + group, ""));
    jQuery(".reqIndicator", "[itemgroup*='" + group + "']").remove();
    jQuery(".jcf-req-holder", "[itemgroup*='" + group + "']").remove();
    jQuery("[piece=label]", "[itemgroup*='" + group + "']").prepend("<span class='jcf-req-holder'>&nbsp;</span>");
    jQuery("[itemgroup*='" + group + "']").removeAttr("isrequired");
}
function clearQuestions(group) {
    jQuery('[itemgroup*="' + group + '"] .InputItem').filter(function () { return !jQuery(this).is('button'); }).val('');
    jQuery('[itemgroup*="' + group + '"] select option').removeAttr('selected');
    jQuery('[itemgroup*="' + group + '"] [id*=DrpHdn]').val("");
    jQuery('[itemgroup*="' + group + '"] [id*=DrpBal]').val("");
    jQuery('[itemgroup*="' + group + '"] input[type=radio]').removeAttr('checked');
    jQuery('[itemgroup*="' + group + '"] input[type=checkbox]').removeAttr('checked');
}
function setApprovalTrack(track, emailId)
{
    jQuery('[id*=hdn_useTrack]').val(track);
    if (emailId != null)
    {
        jQuery('[id*=hdn_trackEmail]').val(jQuery('[id*=' + emailId + ']').val());
    }
    else
    {
        jQuery('[id*=hdn_trackEmail]').val('');
    }
}
function setEmailTemplate(templateId)
{
    var ind = jQuery('[id*=hdn_sendEmails]').val();
    if(ind.indexOf(templateId) < 0)
    { 
        jQuery('[id*=hdn_sendEmails]').val(jQuery('[id*=hdn_sendEmails]').val() + ';' + templateId);
    }
}
function clearEmailTemplate(templateId)
{
    var ind = jQuery('[id*=hdn_sendEmails]').val();
    if (ind.indexOf(templateId) > 0) {
        jQuery('[id*=hdn_sendEmails]').val(jQuery('[id*=hdn_sendEmails]').val().replace(';' + templateId,''));
    }
}
function setQuestionDataSource(targetId, datasourceId)
{
    jQuery('[itemid="' + targetId + '"] select option').remove();
    if (dataSources[datasourceId] == null) {
        ajaxUtil.callWebService(webServicePath + webService + 'GetDataSource',
        { DataSourceID: datasourceId },
        function (data) {
            dataSources[datasourceId] = data.d.DSList;
            setDropdownDataSource(targetId, data.d.DSList);
        });
    }
    else {
        setDropdownDataSource(targetId, dataSources[datasourceId]);
    }
}
function setDropdownDataSource(targetId, d) {
    jQuery('select', '[itemid=' + targetId + ']').append('<option doublevalue="" value=""></option>');
    var opts = '';
    for (var x in d) {
        opts += '<option doublevalue="" value="' + x + '">' + d[x] + '</option>';
    }
    jQuery('select', '[itemid=' + targetId + ']').append(opts);
    jQuery('select', '[itemid=' + targetId + ']').val(jQuery('[id*=DrpHdn' + targetId + ']').val());
}
function printForm()
{
    window.print();
}
function SelectTab(tabID, serverSide) {
    var index = jQuery("[id*=formTabs] ul li").index(jQuery('[data-tabid*=' + tabID + ']').parent());
    var nextTabId = tabID;
    if (tabID == '11111111-1111-1111-1111-111111111111') {
        //Next visible tab
        var tab = jQuery('[id*=formTabs] .ui-tabs-active').nextAll('li:visible:first');
        nextTabId = jQuery('a', tab).attr('data-tabid');
        if (tab != null)
            index = jQuery("[id*=formTabs] ul li").index(tab);
    }
    else if (tabID == '22222222-2222-2222-2222-222222222222') {
        //Previous visible tab
        var tab = jQuery('[id*=formTabs] .ui-tabs-active').prevAll('li[role=tab]:visible:first');
        nextTabId = jQuery('a', tab).attr('data-tabid');
        if (tab != null)
            index = jQuery("[id*=formTabs] ul li").index(tab);
    }
    if (typeof serverSide == 'undefined') {
       jQuery('[id*=formTabs]').tabs({ active: index });
    } 

    jQuery('[id*=hdnSetTab]').val(nextTabId);
    jQuery('.jcf-tab:visible .InputItem:visible:first').focus();
}
function showTab(tabID) {
    jQuery('[data-tabid="' + tabID + '"]').parent().show();
}
function hideTab(tabID) {
    jQuery('[data-tabid="' + tabID + '"]').parent().hide();
}

function compareValues(item, compareToId) {
    item.attr('data-focus-accepted', 'true');
    var compareTo = jQuery('[itemid*="' + compareToId + '"] .InputItem');
    if (compareTo.attr('data-focus-accepted') != 'true')
        return;
    var guid = jQuery(item).closest('.jcf-col').attr('itemid');
    if (jQuery(item).val() != compareTo.val()) {
        if (jQuery(item).nextUntil('.jcf-col', '.jcf-validation-msg:contains("Values must match")').length == 0) {
            jQuery(item).after('<span class="jcf-validation-msg">Values must match</span>');
        }
        if (compareTo.nextUntil('.jcf-col', '.jcf-validation-msg:contains("Values must match")').length == 0) {
            compareTo.after('<span class="jcf-validation-msg">Values must match</span>');
        }
        jQuery(item).closest('.jcf-col').addClass('required');
        compareTo.closest('.jcf-col').addClass('required');
        var req = jQuery('[id*=hdn_invalidData]').val();
        if (req.indexOf(guid) < 0) {
            jQuery('[id*=hdn_invalidData]').val(req + ';' + guid);
        }
    }
    else {
        jQuery(item).nextUntil('.jcf-col', '.jcf-validation-msg:contains("Values must match")').remove();
        compareTo.nextUntil('.jcf-col', '.jcf-validation-msg:contains("Values must match")').remove();
        jQuery(item).closest('.jcf-col').removeClass('required');
        compareTo.closest('.jcf-col').removeClass('required');
        var req = jQuery('[id*=hdn_invalidData]').val();
        if (req.indexOf(guid) >= 0) {
            jQuery('[id*=hdn_invalidData]').val(req.replace(';' + guid, ''));
        }
    }
}
function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}
///////////////////////////////////////////////////////////////////////////////
// ajaxUtil
///////////////////////////////////////////////////////////////////////////////
(function (au, $) {
    au.callWebService = function (webService, data, callback) {
        $.ajax({
            type: 'POST',
            url: webService,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: callback
        });
    };
}(window.ajaxUtil = window.ajaxUtil || {}, jQuery));

/*
    jQuery Masked Input Plugin
    Copyright (c) 2007 - 2015 Josh Bush (digitalbush.com)
    Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license)
    Version: 1.4.1
*/
!function (factory) {
    "function" == typeof define && define.amd ? define(["jquery"], factory) : factory("object" == typeof exports ? require("jquery") : jQuery);
}
(function ($) {
    var caretTimeoutId, ua = navigator.userAgent, iPhone = /iphone/i.test(ua), chrome = /chrome/i.test(ua), android = /android/i.test(ua);
    $.mask = {
        definitions: {
            "9": "[0-9]",
            a: "[A-Za-z]",
            "*": "[A-Za-z0-9]"
        },
        autoclear: !0,
        dataName: "rawMaskFn",
        placeholder: "_"
    }, $.fn.extend({
        caret: function (begin, end) {
            var range;
            if (0 !== this.length && !this.is(":hidden")) return "number" == typeof begin ? (end = "number" == typeof end ? end : begin,
            this.each(function () {
                this.setSelectionRange ? this.setSelectionRange(begin, end) : this.createTextRange && (range = this.createTextRange(),
                range.collapse(!0), range.moveEnd("character", end), range.moveStart("character", begin),
                range.select());
            })) : (this[0].setSelectionRange ? (begin = this[0].selectionStart, end = this[0].selectionEnd) : document.selection && document.selection.createRange && (range = document.selection.createRange(),
            begin = 0 - range.duplicate().moveStart("character", -1e5), end = begin + range.text.length),
            {
                begin: begin,
                end: end
            });
        },
        unmask: function () {
            return this.trigger("unmask");
        },
        mask: function (mask, settings) {
            var input, defs, tests, partialPosition, firstNonMaskPos, lastRequiredNonMaskPos, len, oldVal;
            if (!mask && this.length > 0) {
                input = $(this[0]);
                var fn = input.data($.mask.dataName);
                return fn ? fn() : void 0;
            }
            return settings = $.extend({
                autoclear: $.mask.autoclear,
                placeholder: $.mask.placeholder,
                completed: null
            }, settings), defs = $.mask.definitions, tests = [], partialPosition = len = mask.length,
            firstNonMaskPos = null, $.each(mask.split(""), function (i, c) {
                "?" == c ? (len--, partialPosition = i) : defs[c] ? (tests.push(new RegExp(defs[c])),
                null === firstNonMaskPos && (firstNonMaskPos = tests.length - 1), partialPosition > i && (lastRequiredNonMaskPos = tests.length - 1)) : tests.push(null);
            }), this.trigger("unmask").each(function () {
                function tryFireCompleted() {
                    if (settings.completed) {
                        for (var i = firstNonMaskPos; lastRequiredNonMaskPos >= i; i++) if (tests[i] && buffer[i] === getPlaceholder(i)) return;
                        settings.completed.call(input);
                    }
                }
                function getPlaceholder(i) {
                    return settings.placeholder.charAt(i < settings.placeholder.length ? i : 0);
                }
                function seekNext(pos) {
                    for (; ++pos < len && !tests[pos];);
                    return pos;
                }
                function seekPrev(pos) {
                    for (; --pos >= 0 && !tests[pos];);
                    return pos;
                }
                function shiftL(begin, end) {
                    var i, j;
                    if (!(0 > begin)) {
                        for (i = begin, j = seekNext(end) ; len > i; i++) if (tests[i]) {
                            if (!(len > j && tests[i].test(buffer[j]))) break;
                            buffer[i] = buffer[j], buffer[j] = getPlaceholder(j), j = seekNext(j);
                        }
                        writeBuffer(), input.caret(Math.max(firstNonMaskPos, begin));
                    }
                }
                function shiftR(pos) {
                    var i, c, j, t;
                    for (i = pos, c = getPlaceholder(pos) ; len > i; i++) if (tests[i]) {
                        if (j = seekNext(i), t = buffer[i], buffer[i] = c, !(len > j && tests[j].test(t))) break;
                        c = t;
                    }
                }
                function androidInputEvent() {
                    var curVal = input.val(), pos = input.caret();
                    if (oldVal && oldVal.length && oldVal.length > curVal.length) {
                        for (checkVal(!0) ; pos.begin > 0 && !tests[pos.begin - 1];) pos.begin--;
                        if (0 === pos.begin) for (; pos.begin < firstNonMaskPos && !tests[pos.begin];) pos.begin++;
                        input.caret(pos.begin, pos.begin);
                    } else {
                        for (checkVal(!0) ; pos.begin < len && !tests[pos.begin];) pos.begin++;
                        input.caret(pos.begin, pos.begin);
                    }
                    tryFireCompleted();
                }
                function blurEvent() {
                    checkVal(), input.val() != focusText && input.change();
                }
                function keydownEvent(e) {
                    if (!input.prop("readonly")) {
                        var pos, begin, end, k = e.which || e.keyCode;
                        oldVal = input.val(), 8 === k || 46 === k || iPhone && 127 === k ? (pos = input.caret(),
                        begin = pos.begin, end = pos.end, end - begin === 0 && (begin = 46 !== k ? seekPrev(begin) : end = seekNext(begin - 1),
                        end = 46 === k ? seekNext(end) : end), clearBuffer(begin, end), shiftL(begin, end - 1),
                        e.preventDefault()) : 13 === k ? blurEvent.call(this, e) : 27 === k && (input.val(focusText),
                        input.caret(0, checkVal()), e.preventDefault());
                    }
                }
                function keypressEvent(e) {
                    if (!input.prop("readonly")) {
                        var p, c, next, k = e.which || e.keyCode, pos = input.caret();
                        if (!(e.ctrlKey || e.altKey || e.metaKey || 32 > k) && k && 13 !== k) {
                            if (pos.end - pos.begin !== 0 && (clearBuffer(pos.begin, pos.end), shiftL(pos.begin, pos.end - 1)),
                            p = seekNext(pos.begin - 1), len > p && (c = String.fromCharCode(k), tests[p].test(c))) {
                                if (shiftR(p), buffer[p] = c, writeBuffer(), next = seekNext(p), android) {
                                    var proxy = function () {
                                        $.proxy($.fn.caret, input, next)();
                                    };
                                    setTimeout(proxy, 0);
                                } else input.caret(next);
                                pos.begin <= lastRequiredNonMaskPos && tryFireCompleted();
                            }
                            e.preventDefault();
                        }
                    }
                }
                function clearBuffer(start, end) {
                    var i;
                    for (i = start; end > i && len > i; i++) tests[i] && (buffer[i] = getPlaceholder(i));
                }
                function writeBuffer() {
                    input.val(buffer.join(""));
                }
                function checkVal(allow) {
                    var i, c, pos, test = input.val(), lastMatch = -1;
                    for (i = 0, pos = 0; len > i; i++) if (tests[i]) {
                        for (buffer[i] = getPlaceholder(i) ; pos++ < test.length;) if (c = test.charAt(pos - 1),
                        tests[i].test(c)) {
                            buffer[i] = c, lastMatch = i;
                            break;
                        }
                        if (pos > test.length) {
                            clearBuffer(i + 1, len);
                            break;
                        }
                    } else buffer[i] === test.charAt(pos) && pos++, partialPosition > i && (lastMatch = i);
                    return allow ? writeBuffer() : partialPosition > lastMatch + 1 ? settings.autoclear || buffer.join("") === defaultBuffer ? (input.val() && input.val(""),
                    clearBuffer(0, len)) : writeBuffer() : (writeBuffer(), input.val(input.val().substring(0, lastMatch + 1))),
                    partialPosition ? i : firstNonMaskPos;
                }
                var input = $(this), buffer = $.map(mask.split(""), function (c, i) {
                    return "?" != c ? defs[c] ? getPlaceholder(i) : c : void 0;
                }), defaultBuffer = buffer.join(""), focusText = input.val();
                input.data($.mask.dataName, function () {
                    return $.map(buffer, function (c, i) {
                        return tests[i] && c != getPlaceholder(i) ? c : null;
                    }).join("");
                }), input.one("unmask", function () {
                    input.off(".mask").removeData($.mask.dataName);
                }).on("focus.mask", function () {
                    if (!input.prop("readonly")) {
                        clearTimeout(caretTimeoutId);
                        var pos;
                        focusText = input.val(), pos = checkVal(), caretTimeoutId = setTimeout(function () {
                            input.get(0) === document.activeElement && (writeBuffer(), pos == mask.replace("?", "").length ? input.caret(0, pos) : input.caret(pos));
                        }, 10);
                    }
                }).on("blur.mask", blurEvent).on("keydown.mask", keydownEvent).on("keypress.mask", keypressEvent).on("input.mask paste.mask", function () {
                    input.prop("readonly") || setTimeout(function () {
                        var pos = checkVal(!0);
                        input.caret(pos), tryFireCompleted();
                    }, 0);
                }), chrome && android && input.off("input.mask").on("input.mask", androidInputEvent),
                checkVal();
            });
        }
    });
});
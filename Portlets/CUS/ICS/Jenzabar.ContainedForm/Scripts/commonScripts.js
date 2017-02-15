var Jcf = {
    webServicePath: urlUtil.getAppRoot() + "Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/FormBuildWebService.asmx/",
    post: function (action, data, callback, sync) {
        var asynch = !(true && sync);
        var postData = {};
        postData["portlet"] = $("[id*=hdnPortletID]").val();
        for (var x in data) {
            postData[x] = data[x];
        }
        $.ajax({
            type: "POST",
            url: Jcf.webServicePath + action,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(postData),
            dataType: "json",
            success: callback,
            error: function (message) { Jcf.common.ui.handleError(message, action) },
            async: asynch
        });
    },
    common: {
        CurrentModal: null,
        ui: {
            closeModal: function () {
                if (Jcf.common.CurrentModal != null) {
                    Jcf.common.CurrentModal.dialog("close");
                    Jcf.common.CurrentModal = null;
                }
            },
            createModal: function(title, content, width, height, buttonsArr) {
                var wrapper = $("<div class='jcf-modal-content'></div>");
                wrapper.append(content);

                var dialog = jQuery(wrapper).dialog({
                    title: title,
                    modal: true,
                    width: width,
                    autoOpen: false,
                    appendTo: "form[name=MAINFORM]",
                    resize: "auto"
                });
                if (buttonsArr != null) {
                    var wrapperFooter = $("<div class='jcf-modal-buttons  ui-dialog-buttonpane ui-widget-content ui-helper-clearfix'></div>");
                    for (var i in buttonsArr) {
                        $(buttonsArr[i]).addClass("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary");
                        wrapperFooter.append($(buttonsArr[i]));
                    }
                    dialog.after(wrapperFooter);
                }
                if (height != null)
                    dialog.dialog("option", "height", height);
                return dialog;
            },
            handleError: function (message, action) {
                if (typeof message === "object") {
                    jQuery("<div id='jcfErrorContainer'>" + message.statusText + " - " + message.responseJSON.Message + " (" + action + ")</div>").dialog({ title: "An error occurred", zindex: 1001, dialogClass: "jcf-alert", modal: true });
                } else {
                    jQuery("<div id='jcfErrorContainer'>" + message + " (" + action + ")</div>").dialog({ title: "An error occurred", zindex: 1001, dialogClass: "jcf-alert", modal: true });
                }
            },
            showModal: function(title, content, width, height, buttonsArr) {
                var modal = content.closest(".jcf-modal-content");
                if (modal.length == 0) {
                    if (Jcf.common.CurrentModal != null)
                        Jcf.common.ui.closeModal();
                    Jcf.common.CurrentModal = Jcf.common.ui.createModal(title, content, width, height, buttonsArr);
                } else {
                    Jcf.common.CurrentModal = modal;
                    Jcf.common.CurrentModal.dialog("option", "title", title);
                }
                content.show();
                Jcf.common.CurrentModal.dialog("open");
                $(".jcf-modal-buttons input[type='button']").focus();
            }
        }
    }
};

(function (proxied) {
    window.alert = function (str) {
        Jcf.common.ui.showModal("Alert!", $("<a>" + str + "</a>"), 300, null, [$("<input type='button' value='OK'/>").click(function() { Jcf.common.ui.closeModal(); })]);
    };
})(window.alert);

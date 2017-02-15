; (function ($, window, document, undefined) {
    //global vars
    var emailTemplate = "plugin_apptEmailTemplate";

    //boilerplate plugin logic
    $.fn.apptEmailTemplate = function (options) {

        var args, apptEmail;
        var container = this;

        if (!(container.data(emailTemplate) instanceof ApptEmailTemplate)) {
            container.data(emailTemplate, new ApptEmailTemplate(container, options));
        }

        apptEmail = container.data(emailTemplate);


        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptEmail['render'] === 'function') {
                apptEmail.render(options);
            }
        } else if (typeof options === 'string' && typeof apptEmail[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptEmail[options].apply(apptEmail, args);

        } else if (options === 'destroy') {
            this.removeData(emailTemplate);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + emailTemplate);
        }
        return apptEmail;
    };

    function ApptEmailTemplate(elem, options) {
        var appt = this, _ctr = $(elem), _g11n = options.g11n, _options = $.extend(getDefaultOptions(), options);
        appt.render = render;

        function getDefaultOptions() {
            return { g11n: {}, modal: null, userId: '', resourceId: '', appointmentId: null, template: null, isForHost: false, onSave: function(template) {}, onCancel: function() {} };
        }

        function render(opts) {

            _options = $.extend(getDefaultOptions(), opts);

            if (textEditor.exists(_ctr.find("#emailBody"))) {
                textEditor.destroy(_ctr.find("#emailBody"));
            }
            
            _ctr.empty();
            $.ajax({
                type: 'GET',
                async: false,
                url: 'rpc/appointmentsemailtemplate/GetEmailTemplateInfo',
                data:{isForHost: _options.isForHost, userId: _options.userId == null ? '' : _options.userId, resourceId:_options.resourceId == null ? '' : _options.resourceId, appointmentId:_options.appointmentId },
                success: function (settings) {
                    var template = Handlebars.compile(settings.emailTemplateHtml);
                    _ctr.append($(template({ g11n: _options.g11n })));
                    _ctr.find("span.addEditAppt").html(_options.isForHost ? _g11n.editEmailHost : _g11n.editEmailAttendee);
                    _ctr.find(_options.isForHost ? "#tokenHost" : "#tokenAttendee").hide();
                    bindInputs(settings);
                    bindActions();
                    _ctr.show();
                }
            });
        }
        function bindInputs(settings) {
            _ctr.find("#txtSubject").val(_options.template == null ? settings.subject : _options.template.subject);
            var body = _ctr.find("#emailBody").val(_options.template == null ? settings.body : _options.template.body);
            textEditor.create(body, { initInstanceCallback: function () { if (_options.modal != null) { _ctr.fadeIn(600, function () { _options.modal.dialog('option', 'position', { my: "center", at: "center", of: window }); }); } }, height: '175px' });
        }
        function bindActions() {
            _ctr.find(".apptDetailAction button.activeAction").click(function () { _ctr.hide(); textEditor.destroy(_ctr.find("#emailBody")); changeWidth(false); _options.onSave({ subject: _ctr.find("#txtSubject").val(), body: textEditor.decodeForHtmlDisplay(_ctr.find("#emailBody").val()), asTemplate:$(this).attr('id') == 'btnTemplate' }); });
            _ctr.find(".apptDetailAction a.activeItem").click(function (e) { e.preventDefault(); _ctr.hide(); textEditor.destroy(_ctr.find("#emailBody")); changeWidth(false); _options.onCancel(); });;
            _ctr.find("#hypToken").click(function (e) { e.preventDefault(); changeWidth(true); _ctr.find("#templateInfo").css('width', '650px').css('float', 'left'); _ctr.find("#tokenInfo").show('slow'); });
            if (_options.appointmentId != null) 
                _ctr.find("#btnTemplate").attr("disabled", "disabled");
            else
                _ctr.find("#btnTemplate").removeAttr('disabled');
        }
        function changeWidth(makeBigger) {
            _options.modal.dialog('option', 'width', makeBigger ? '950px' : '750px');
        }
    }
}(jQuery, window, document));
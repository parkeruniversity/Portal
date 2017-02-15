; (function ($, window, document, undefined) {
    //global vars
    var helpData = "plugin_apptHelp";

    //boilerplate plugin logic
    $.fn.appointmentHelp = function (options) {

        var args, apptHelp;
        var container = this;

        if (!(container.data(helpData) instanceof AppointmentHelp)) {
            container.data(helpData, new AppointmentHelp(container, options));
        }

        apptHelp = container.data(helpData);

        createModal();

        if (typeof options === 'undefined' || typeof options === 'object') {
            if (typeof apptHelp['render'] === 'function') {
                apptHelp.render(options);
            }
        } else if (typeof options === 'string' && typeof apptHelp[options] === 'function') {
            args = Array.prototype.slice.call(arguments, 1);
            return apptHelp[options].apply(apptHelp, args);

        } else if (options === 'destroy') {
            this.removeData(helpData);
            this.empty();
        }
        else {
            $.error('Method ' + options + ' does not exist on jQuery.' + helpData);
        }
        return apptHelp;
    };

    function createModal() {
        var modal = $("#apptHelpModal");
        if (modal.attr('id') === undefined) {
            modal = $("<div id='apptHelpModal'>");
            $("#appointmentWrapper").append(modal);
        }
        if (modal.hasClass('ui-dialog-content')) return; //already bound

        modal.dialog({
            autoOpen: false,
            modal: true,
            draggable: true,
            resizable: true,
            width: 760,
            dialogClass: 'apptHelpContainer'
        });
    }

    function AppointmentHelp(elem, options) {
        var appt = this, _ctr = $(elem), _options = $.extend(getDefaultOptions(), options);
        appt.render = render;

        function getDefaultOptions() {
            return { g11n: {}, isHost:false, screen:0,portletId:'', linkTxt:null,titleTxt:null, name:'' };
        }

        function render(opts) {
            _options = $.extend(getDefaultOptions(), opts);
            _ctr.empty();
            var lnk = $("<a href='#' class='activeItem'>").append('<i class="fa fa-question-circle"></i>').append($("<span>").html(_options.linkTxt != null ? _options.linkTxt : _options.g11n.apptHelp))
                .unbind('click').click(function(e) { e.preventDefault(); bindText(); });
            _ctr.append(lnk);
        }
        function bindText() {
            $.get('api/appointmentshelp/?isHost=' + _options.isHost + "&screen=" + _options.screen + "&portletId=" + _options.portletId +"&name="+_options.name, function(txt) {
                $("#apptHelpModal").html(txt).dialog("option", "title", _options.titleTxt != null ? _options.titleTxt : _options.g11n.apptHelp).dialog('open');
            });
            
        }
    }
}(jQuery, window, document));
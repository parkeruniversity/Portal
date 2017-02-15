(function ($) {

    // jQuery plugin definition
    $.fn.timePicker = function (params) {

        // merge default and user parameters
        params = $.extend({ defaultTime: "", mouseoverClass: 'jquery-timepicker-mouseover' }, params);

        this.val(params.defaultTime);

        // some default cars
        var newHTML = '';
        var doWrap = true;
        if ($(this).parent().attr('id') == ($(this).attr('id') + "-container")) {
            doWrap = false;
        }
        var $t = $(this);

        // calculate the offsets
        var height = this.height() + 3;
        var width = this.outerWidth();

        // generate our html dropdown
        var timeMargins = ['00', '05', '10', '15', '20', '25', '30', '35', '40', '45', '50', '55'];
        newHTML += ' <select style="position: absolute; left:0;top:' + height + 'px; width: ' + width + 'px; z-index:10000000;" size="7">'
        for (var h = 0; h <= 23; h++) {

            for (var i = 0; i < timeMargins.length; i++) {
                var ampm = "AM";
                var hr = h;
                if (hr >= 12) {
                    ampm = "PM";
                }
                if (hr == 0) {
                    hr = 12;
                }
                else if (hr > 12) {
                    hr = h - 12;
                }
                var newhour = "" + hr;
                var v = (newhour.length == 1 ? '0' : '') + hr + ':' + timeMargins[i] + ' ' + ampm;
                newHTML += '<option value="' + v + '">' + v + '</option>';
            }
        }
        newHTML += '</select>';

        var id = this.attr('id');
        var newid = id + '-container';

        $t.wrap('<div id="' + newid + '" style="position: relative; display: inline;"></div>');
        if ($('#' + newid + ' select', $t.parent()).length == 0) {
            $t.after(newHTML);
        }

        $("#" + newid + " select").hide();

        scrollTo(params.defaultTime);

        function scrollTo(value) {
            $("#" + newid + " select").val(value);
        }

        $t.focus(function () {
            if (!$('#' + newid + ' select').is(':visible')) {
                $("#" + newid + " select").show();
            }
        });

        $t.keyup(function () {
            var index = -1;
            var searchText = $t.val();
            $("#" + newid + " select").children().each(function (index, child) {
                var searchIndex = String(child.textContent).indexOf(searchText);
                if (searchIndex == 0) {
                    scrollTo(child.textContent);
                    return false;
                }

            });
        });

        $("#" + newid + " select").blur(function () {
            $("#" + newid + " select").hide();
        });

        $("#" + newid + " select").change(function () {
            $('input', $(this).parent()).removeAttr('readonly');
            $('input', $(this).parent()).val($(this).val());
            $('input', $(this).parent()).attr('readonly', 'readonly');
            $(this).hide();
        });

        // allow jQuery chaining
        return this;
    };

})(jQuery);
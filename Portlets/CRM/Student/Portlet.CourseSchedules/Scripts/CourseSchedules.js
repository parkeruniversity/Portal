(function (csp, $) {
    'use strict';

    $(document).ready(function ($) {


        $('.CS, .AdviseeRoster').on('click', '.ApprovalCheckBox, .ConfirmedCheckBox, .WaitlistCheckBox, .MustPayCheckBox', function (e) {
            var body = $(this).parents('.gbody');
            var section = body.parents('.CourseSchedulesSection');
            var dropButton = section.find('.DropButton');
            if (body.find('input:checked').length > 0) {
                dropButton.prop("disabled", false);
                dropButton.removeClass("aspNetDisabled");
            }
            else {
                dropButton.prop("disabled", true);
                dropButton.addClass("aspNetDisabled");
            }
        });

    });
}(window.CourseSchedulesPortlet = window.CourseSchedulesPortlet || {}, jQuery));
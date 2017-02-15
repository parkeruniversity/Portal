jQuery(document).ready(function ($) {
    coShowHideOverview();
    colimitULto10();
    coClicktoShow();
    sizeContainers();
    ajaxUtil.callAsmxWebService('portlets/lms/CourseOrganizerPortlet/Services/CourseOrganizerService.asmx/GetOverviewVisibility', {sectionID : $('input:hidden[id$=SectionId]').val()}, coCheckOverviewStatus);
});
//execute on resize
$(window).resize(function () {
    sizeContainers();
});
//fixes the size of containers to make sure that very long names don't affect the layout
function sizeContainers() {
    $(".coListContainer").each(function() {
        var width = $(this).closest(".coSectionContainer").width();
        width = width - 75;
        $(this).css("max-width", width);
    });
}
//Limits each header of Unit in Detail to 10 items, then creates a button to show the rest.
function colimitULto10() {
    var count;
    $(".coListUL").each(function () {
        count = 0;
        $(this).children("li").each(function () {
            count++;
            if (count > 10) {
                $(this).addClass("coListResourcesHidden");
            }
        });
        if (count > 10) {
            $(this).append("<li class='coListShowAll'><a><b>Show " + (count-10) +" More</b></a></li>");
        }

    });
}
//Shows the rest of the Unit in Detail items for a given header
function coClicktoShow() {
    $(".coListShowAll").click(function () {
        var ul = $(this).closest('ul');
        ul.children().each(function () {
            $(this).show("medium");
        });
        $(this).hide("fade");
    });
    
}

//this hides the CoOverview if you click the "UP" Button
function coShowHideOverview(parameters) { 
    $(".coSectionHeaderOverview").click(function () {
        var visible = {};
        visible.sectionID = $('input:hidden[id$=SectionId]').val();
        $(".coOverviewContainer1").slideToggle('fast', function () {
            if ($(".coOverviewContainer1").is(":visible")) {
                visible.visible = 'true';
                $(".coOverviewArrow").css('background-image', 'url(ui/common/images/PortletImages/Icons/16/bullet_arrow_up.png)');
                ajaxUtil.callAsmxWebService('portlets/lms/CourseOrganizerPortlet/Services/CourseOrganizerService.asmx/SetOverviewVisibility', visible);
            }
            else {
                visible.visible = 'false';
                $(".coOverviewArrow").css('background-image', 'url(ui/common/images/PortletImages/Icons/16/bullet_arrow_down.png)');
                ajaxUtil.callAsmxWebService('portlets/lms/CourseOrganizerPortlet/Services/CourseOrganizerService.asmx/SetOverviewVisibility', visible);
            }
        });
    });
    
    if (!$(".coOverviewNextDueDate").length) {
        $(".coOverviewNextEvent").css('border', '0');
    }
   }

//callback for getting data
function coCheckOverviewStatus(data) {
    if (data.d == 'true'){
        //$(".coOverviewContainer1").show();
        $(".coOverviewArrow").css('background-image', 'url(ui/common/images/PortletImages/Icons/16/bullet_arrow_up.png)');
    }
}
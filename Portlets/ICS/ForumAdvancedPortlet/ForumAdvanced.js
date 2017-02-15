
function ToggleSearchOption(hyp, img, showTxt, hideTxt) {
    $('#searchOptionValues').slideToggle('slow');
    var link = $('#' + hyp);
    var isShow = link.text() == showTxt;
    link.text(isShow ? hideTxt : showTxt);

    var image = $('#' + img);
    image.attr('src', image.attr('src').replace(isShow ? "down" : "up", isShow ? "up" : "down"));
}

function EmulateHover(emulateText) {

    $("body").append("<div class='tooltip' id='tooltip'><p>" + emulateText + "</p></div>");
    var tooltipDiv = $("#tooltip" );
    
    $("[title='" + emulateText + "']").
            each(function(i) {
                $(this).removeAttr("title")
                .mouseover(function() { tooltipDiv.css({ opacity: 0.8, display: "none" }).fadeIn(400); })
                .mousemove(function(evt) { var leftX = $(window).width() - evt.pageX < 300 ? -265 : 15; tooltipDiv.css({ left: evt.pageX + leftX, top: evt.pageY + 15 }); })
                .mouseout(function() { tooltipDiv.hide(); });
            });
            //300 and 265 px are based on the width of the .toolTip (default=250)
}

function QuoteReply(quoteCtr, editorID, originalID, quotingWrapper) {
    //<a href="javascript:;" onclick="$('#elm1').tinymce().execCommand('mceInsertContent',false,'<b>Hello world!!</b>');return false;">[Insert HTML]</a>
    var ed = $('#' + editorID).tinymce();
    var txt = document.getElementById(originalID).innerHTML;
    ed.execCommand('mceInsertContent', false, quotingWrapper.replace("|~quote~|", txt)); //replacement key defined in ForumContentUtil.cs
    ed.focus();
    quoteCtr.style.visibility = "hidden";
}

function RegisterUserParticipation() {
    HideUserParticipationRows();
    $("a.expandTopic") //attach click handles on the expand/collapse images
        .each(
            function (i) {
                $(this).click(
                    function () {
                        var img = $(this).find('img');
                        var expand = img.attr("src").indexOf("expand") >= 0;
                        HideUserParticipationRows();
                        if (expand) {
                            $("[rel='" + $(this).attr("id") + "']").fadeIn('normal');
                            img.attr("src", img.attr("src").replace("expand", "collapse"));
                        }
                    })
            });
}

function HideUserParticipationRows() {
    $("tr.participationPost") //hide Post rows
        .each(function(i) { $(this).hide(); });

    //make sure all images are the Expand instead of Collapse
    $("a.expandTopic")
        .each(
            function (i) {
                var img = $(this).find('img');
                if (img.attr("src").indexOf("expand") == -1) {
                    img.attr("src", img.attr("src").replace("collapse", "expand"));
                }
            });
        }

function ToggleShowMyPhoto(ctrShowPhoto) {
    var ctr = $('#' + ctrShowPhoto);
    if (ctr.is(':disabled')) {
        ctr.removeAttr('disabled');
    }
    else {
        ctr.attr('disabled', true);
        ctr.attr('checked', false);
    }
}

///////////////////////////////////////////////////////////////////////////////
// facultyGrading
///////////////////////////////////////////////////////////////////////////////
(function (tdlp, $) {
    tdlp.checkValidation = function() {
        $("span[class='FormTxtErr']").each(
            function() {
                if ($(this).text().trim().length > 0) {
                    var root = $(this).closest('.facultyPost');
                    var gradeInput = root.find('.facultyGradeInput');
                    var rightLayerOne = root.find('.facultyPostRightBoxLayerOne');
                    var rightLayerTwo = root.find('.facultyPostRightBoxLayerTwo');
                    var rightLayerThree = root.find('.facultyPostRightBoxLayerThree');
                    var expandContractBtn = root.find('.facultyAssignmentPostExpand');

                    gradeInput.show();
                    rightLayerTwo.show();
                    rightLayerThree.show();
                    rightLayerOne.attr('class', 'facultyPostRightBoxLayerOneExpandErr');
                    expandContractBtn.attr('class', 'facultyAssignmentPostRetractErr');
                }
            }
        );
    };
    
    tdlp.toggleExpand = function (ele) {
        var expandContractBtn = $(ele);
        var root = expandContractBtn.closest('.facultyPost');
        var gradeInput = root.find('.facultyGradeInput');
        var rightLayerOne = root.find('.facultyPostRightBoxLayerOne');
        var rightLayerOneErr = root.find('.facultyPostRightBoxLayerOneExpandErr');
        var rightLayerTwo = root.find('.facultyPostRightBoxLayerTwo');
        var rightLayerThree = root.find('.facultyPostRightBoxLayerThree');

        if (expandContractBtn.attr('class') == "facultyAssignmentPostRetractErr") {
            expandContractBtn.attr('class', 'facultyAssignmentPostExpand');
        } else {
            expandContractBtn.toggleClass("facultyAssignmentPostRetract");
        }

        if (rightLayerOneErr.attr('class') == 'facultyPostRightBoxLayerOneExpandErr') {
            rightLayerOneErr.attr('class', 'facultyPostRightBoxLayerOne');
        } else {
            rightLayerOne.toggleClass('facultyPostRightBoxLayerOneExpand');
        }

        gradeInput.toggle();
        rightLayerTwo.toggle();
        rightLayerThree.toggle();
    };

}(window.facultyGrading = window.facultyGrading || {}, jQuery));


function pageLoad() {
    facultyGrading.checkValidation();
}


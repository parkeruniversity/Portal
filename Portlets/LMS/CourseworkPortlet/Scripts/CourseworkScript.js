var numericRegEx = /[^0-9\./-]/g;
var wholeNumberRegEx = /[^0-9]/g;

function HideWelcomeText() {
	$(".welcome").hide("normal");
}

function MoreMenu(moreItemClass, menuContentClass) {

	$("." + moreItemClass).click(function () {
		$("." + menuContentClass).slideDown('fast').show(); //Drop down the content on click

		$(this).parent().hover(function () {
		}, function () {
			$("." + menuContentClass).slideUp('slow'); //When the mouse hovers out of the content, move it back up
		});

		//Following events are applied to the trigger (Hover events for the trigger)
	}).hover(function () {
		$(this).addClass("moreHover"); //On hover over, add class "moreHover"
	}, function () {	//On Hover Out
		$(this).removeClass("moreHover"); //On hover out, remove class "moreHover"
	});
}

function TogglePartialCredit(itemOrder) {
    $("div[id*=_partial_" + itemOrder + "]").toggle('slow');
	$("div[id*=_correct_" + itemOrder + "]").toggle('slow');
}

function EnsureInclude(cbxCorrect, cbxIncludeID) {
    var include = $("#" + cbxIncludeID);
	if (cbxCorrect.checked == true && !include.is(':checked') )
		include.attr('checked', true);
}
function EnsureCorrect(cbxInclude, cbxCorrectID, itemOrder) {
    var correct = $("#" + cbxCorrectID);
	if (cbxInclude.checked == false && correct.is(':checked')) {
        correct.attr('checked', false);
        ClearCorrectBoxes(correct);
        TogglePartialCredit(itemOrder);
    }
}

function ClearCorrectBoxes(staticBox){
    $("table.questionTable tr td:first-child input:checkbox")
	    .each(function(i,cbx){ 
			    if($(cbx).attr('id') != $(staticBox).attr('id'))
			    {
                    if($(cbx).is(':checked'))
                    {
                        TogglePartialCredit(i + 1);
                    }

                    $(cbx).attr('checked',false);

                    if($(staticBox).is(':checked'))
                    {
                        $(cbx).attr('disabled',true);
				    }
                    else
                    {
                        $(cbx).attr('disabled',false);
                        $(cbx).closest('span').removeAttr('disabled');
                    }
			    }

	    });
}

function RenderBetweenMatch(matchType, betweenValue, betweenDivID) {
	var betweenDiv = $('#' + betweenDivID);
	var answerBox = $(matchType).next(); //should be textbox
	var betweenBox = $(betweenDiv.find('input')[0]);

	if ($(matchType).val() == betweenValue) {
		betweenDiv.show();
		answerBox.addClass('betweenText');
		answerBox.val(answerBox.val().replace(numericRegEx, ''));

		BindNumericOnly(answerBox);
		BindNumericOnly(betweenBox);
	}
	else {
		betweenDiv.hide();
		answerBox.removeClass('betweenText');
		betweenBox.val(''); //clear out value in the between textbox

		UnBindNumericOnly(answerBox);
		UnBindNumericOnly(betweenBox);
	}
}
function BindNumericOnly(obj) {
	$(obj).keyup(function () {
		this.value = this.value.replace(numericRegEx, '');
	});
}
function BindWholeNumberOnly(obj) {
    $(obj).keyup(function () {
		this.value = this.value.replace(wholeNumberRegEx, '');
	});
}
function UnBindNumericOnly(obj) {
	$(obj).unbind('keyup');
}

function OpenEquationPopup(linkObj){
	window.open($(linkObj).attr('href'), 'win1', 'menubar=0,width=730,height=520,toolbar=0,scrollbars=1');
	return false;
}

function toggleHeader(header,itemToShow, showText, hideText, showImg, hideImg){
	var head = $(header);
	var container = $('#'+itemToShow);
	var isShown = container.is(":visible");
	head.find("img").attr("src",isShown ? showImg : hideImg);
	head.html(head.html().replace( isShown ? hideText : showText, isShown ? showText : hideText));
	container.toggle();
}

function ToggleReview(reviewID, isExpand){
	var review = $('#' + reviewID);
	review.removeClass( isExpand ? 'showCollapse' : 'showExpand', isExpand ? "fast" : "");
	review.addClass(isExpand ? 'showExpand' : 'showCollapse',isExpand ? "" : "fast");
	return false;
}
function ToggleAllReview(thisId, otherId, isExpand){
	$('#' + thisId).hide();
	$('#' + otherId).show();
	$(".questionReviewContainer .questionDisplay").each(function(i){ ToggleReview($(this).attr('id'),isExpand);});
	return false;
}
function FadeSuccess(containerId) {
    $('#' + containerId).delay(4000).slideUp(600);
}
function ToggleStartDate(ddlId, showValue,startContainerId) {
    if (showValue == $('#' + ddlId + ' option:selected').val())
        $('#' + startContainerId).show(600);
    else
        $('#' + startContainerId).hide(600);
}
function clearUnitFields(name, fName, desc, fDesc, startDate, fStartDate, endDate, fEndDate){
    $('#' + fName).val(name);
    $('#' + fDesc).val(desc);
    $('#' + fStartDate).val(startDate);
    $('#' + fEndDate).val(endDate);
}

function SelectAllCheckBoxes(cbxId, containerId) {
    $("#" + cbxId).click(function () {
        var checkedStatus = this.checked;
        $("#" + containerId + " tbody tr td:first-child input:checkbox").each(function () {
            this.checked = checkedStatus;
        });
    });
}
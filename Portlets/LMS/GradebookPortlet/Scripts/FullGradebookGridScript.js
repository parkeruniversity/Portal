var GRADEBOOK_GRID_PREFIX = '.fullGradebookGrid ';
var LEFT_ARROW_KEYCODE = 37;
var RIGHT_ARROW_KEYCODE = 39;

var _firstCol;
var _lastCol;
var _displayFirstCol;
var _displayColCount;
var _isMaximizedView;
var _skipColumns;


/* Initialization */

function initializeGridValues(firstCol, lastCol, displayCol, displayCount)
{
	_firstCol = firstCol;
	_lastCol = lastCol;
	_displayFirstCol = displayCol;
	_displayColCount = displayCount;

	_isMaximizedView = false;
	_skipColumns = new Array();

	$(GRADEBOOK_GRID_PREFIX + '.scrollingViewButton').hide();
	$(GRADEBOOK_GRID_PREFIX + '.scrollingViewButton').click(function () { location.reload(); });
}

function initializeGridColumns()
{
    $(GRADEBOOK_GRID_PREFIX + "table").delegate("th", "mouseover mouseleave", hoverDelegate);
    $(GRADEBOOK_GRID_PREFIX + "table").delegate("td", "mouseover mouseleave", hoverDelegate);

    for (var colNum = _firstCol; colNum <= _lastCol; colNum++) {
        _skipColumns[colNum] = 0;
    }
}

function initializeSuperheaderToggle(firstCol, colRangeCount, expandAllButton, collapseAllButton) {
    assertParam(firstCol, "firstCol", "wireUpColumnToggle");
    assertParam(colRangeCount, "colRangeCount", "wireUpColumnToggle");

    $(GRADEBOOK_GRID_PREFIX + '#toggleCol' + firstCol).click(function () {
        markColumnToggled(firstCol, colRangeCount);
        setToggleAllButtonVisibility(expandAllButton, collapseAllButton);
        displayCurrentColumnRange();
    });

    if (expandAllButton != null) {
        expandAllButton.click(function () { markColumnExpanded(firstCol); });
    }

    if (collapseAllButton != null) {
        collapseAllButton.click(function () { markColumnCollapsed(firstCol, colRangeCount); });
    }

    markColumnCollapsed(firstCol, colRangeCount);
}

function initializeToggleAllButtons(expandAllButton, collapseAllButton, expandFullButton) {
    if (expandAllButton != null && collapseAllButton != null) {
        expandAllButton.click(function () { collapseAllButton.show(); expandAllButton.hide(); });
        collapseAllButton.click(function () { expandAllButton.show(); collapseAllButton.hide(); });
    }

    if (expandAllButton != null) {
        expandAllButton.click(function () {
            moveToColumn(_firstCol);
            displayCurrentColumnRange();
        });
    }

    if (collapseAllButton != null) {
        collapseAllButton.click(function() {
            displayCurrentColumnRange();
        });
    }

    if (expandFullButton != null) {
        expandFullButton.click(function () {
            expandFullButton.hide();
            expandAllButton.click();
            removePaging();
            displayCurrentColumnRange();
        });
    }

    setToggleAllButtonVisibility(expandAllButton, collapseAllButton);
}

function initializePaging() {
    if (_lastCol <= 0) {
        $(GRADEBOOK_GRID_PREFIX + '.instructions').hide();
    }

    $(GRADEBOOK_GRID_PREFIX + '.previousButtonColumn').click(function () {
        if (!isLeftPagingAllowed()) return;

        var actualRangeStart = getActualRangeStart(_displayFirstCol);
        _displayFirstCol = getPreviousColumn(actualRangeStart);

        displayCurrentColumnRange();
    });

    $(GRADEBOOK_GRID_PREFIX + '.nextButtonColumn').click(function () {
        if (!isRightPagingAllowed()) return;

        var actualRangeStart = getActualRangeStart(_displayFirstCol);
        _displayFirstCol = getNextColumn(actualRangeStart);

        displayCurrentColumnRange();
    });
}

function initializeKeyboardEvents() {
    $(document).keydown(handlePageKeyPress);
}

/* Hovering */

function hoverDelegate(action) {
    var colNum;
    for (colNum = _firstCol; colNum <= _lastCol; colNum++) {
        if ($(this).hasClass("col" + colNum) || $(this).hasClass("startCol" + colNum)) {
            break;
        }
    }

    if (colNum > _lastCol) return;

    if (action.type == "mouseover") {
        $(GRADEBOOK_GRID_PREFIX + '.superCol' + colNum).addClass("hoverColumn");
        $(GRADEBOOK_GRID_PREFIX + '.col' + colNum).addClass("hoverColumn");
    }
    else {
        $(GRADEBOOK_GRID_PREFIX + '.superCol' + colNum).removeClass("hoverColumn");
        $(GRADEBOOK_GRID_PREFIX + '.col' + colNum).removeClass("hoverColumn");
    }
}

/* Column Toggling Methods */

function markColumnToggled(colNum, colSpanCount)
{
	assertParam(colNum, "colNum", "markColumnToggled");
	assertParam(colSpanCount, "colSpanCount", "markColumnToggled");

	var superheaderCol = getActualRangeStart(colNum);

	if (isSuperheaderExpanded(superheaderCol)) {
	    markColumnCollapsed(superheaderCol, colSpanCount);
	}
	else {
	    moveToColumn(superheaderCol);
	    markColumnExpanded(superheaderCol);
	}
}

function markColumnExpanded(colNum) {
    _skipColumns[colNum] = 0;

    //toggle icons
    $(GRADEBOOK_GRID_PREFIX + '#toggleCol' + colNum + ' .collapseButton').show();
    $(GRADEBOOK_GRID_PREFIX + '#toggleCol' + colNum + ' .expandButton').hide();

    ensureMaximumColumnDisplay();
}

function markColumnCollapsed(colNum, colSpanCount) {
    _skipColumns[colNum] = colSpanCount - 1;

    //toggle icons
    $(GRADEBOOK_GRID_PREFIX + '#toggleCol' + colNum + ' .collapseButton').hide();
    $(GRADEBOOK_GRID_PREFIX + '#toggleCol' + colNum + ' .expandButton').show();

    ensureMaximumColumnDisplay();
}

function ensureMaximumColumnDisplay() {
    //Make sure we are still showing the maximum number of columns.
    var newRightmostStartColumn = getRightmostStartColumn();

    if (_displayFirstCol > newRightmostStartColumn) {
        moveToColumn(newRightmostStartColumn);
    }
}

function setToggleAllButtonVisibility(expandAllButton, collapseAllButton) {
    assertParam(expandAllButton, "expandAllButton", "setToggleAllButtonVisibility");
    assertParam(collapseAllButton, "collapseAllButton", "setToggleAllButtonVisibility");

    var showExpandAllButton = false;
    var showCollapseAllButton = false;

    for (var colNum = _firstCol; colNum <= _lastCol; colNum++) {
        if (!isSuperheaderColumn(colNum)) continue;

        if (!showExpandAllButton && isSuperheaderCollapsed(colNum)) {
            showExpandAllButton = true;
            if (showCollapseAllButton) break;
        }
        else if (!showCollapseAllButton && isSuperheaderExpanded(colNum)) {
            showCollapseAllButton = true;
            if (showExpandAllButton) break;
        }
    }

    expandAllButton.toggle(showExpandAllButton);
    collapseAllButton.toggle(showCollapseAllButton);
}


/* Column Utility */

function moveToColumn(colNum) {
    if (!_isMaximizedView) {
        _displayFirstCol = colNum;
    }
}

function isSuperheaderColumn(colNumber) {
    assertParam(colNumber, "colNumber", "isSuperheaderColumn");

    return $('.startCol' + colNumber).size() > 0;
}

function isSuperheaderExpanded(superheaderCol) {
    assertParam(superheaderCol, "superheaderCol", "isSuperheaderExpanded");

    return _skipColumns[superheaderCol] == 0;
}

function isSuperheaderCollapsed(superheaderCol) {
    assertParam(superheaderCol, "superheaderCol", "isSuperheaderCollapsed");

    return _skipColumns[superheaderCol] > 0;
}

function displayCurrentColumnRange() {
    var rangeStart = getActualRangeStart(_displayFirstCol);
    var rangeEnd = getActualRangeEnd(rangeStart, _displayColCount);

	displayColumnRange(rangeStart, rangeEnd);
}

function getActualRangeStart(startCol)
{
	assertParam(startCol, "startCol", "getActualRangeStart");

	//If the given column is being skipped by any superheaders, return the superheader's column number.
 	for (var colNum = startCol - 1; colNum >= _firstCol; colNum--) {
		if ((colNum + 1 + _skipColumns[colNum]) > startCol) {
			return colNum;
		}
	}

	return startCol;
}

function getActualRangeEnd(startCol, rangeColCount)
{
	assertParam(startCol, "startCol", "getActualRangeEnd");
	assertParam(rangeColCount, "rangeColCount", "getActualRangeEnd");

	var actualRangeEnd = startCol;
	for (var colCount = 1; colCount < rangeColCount; colCount++) {
		actualRangeEnd = getNextColumn(actualRangeEnd);
	}
	return actualRangeEnd;
}

function getRightmostStartColumn() {
    var displayedColumns = new Array();

    for (var colNum = _firstCol; colNum <= _lastCol; colNum++) {
        displayedColumns[displayedColumns.length] = colNum;
        if (_skipColumns[colNum] > 0) colNum += _skipColumns[colNum];
    }

    var rightmostStartColumnIndex = displayedColumns.length - _displayColCount;
    if (rightmostStartColumnIndex < 0) return _firstCol;

    return displayedColumns[rightmostStartColumnIndex];
}

function getNextColumn(colNum)
{
	assertParam(colNum, "colNum", "getNextColumn");

	if (colNum >= _lastCol) return _lastCol;

	var nextColNum = colNum + _skipColumns[colNum] + 1;
	return (nextColNum < _lastCol) ? nextColNum : _lastCol;
}

function getPreviousColumn(colNum)
{
	assertParam(colNum, "colNum", "getPreviousColumn");

	if (colNum <= _firstCol) return _firstCol;

	var prevColNum = getActualRangeStart(colNum - 1);
	return (prevColNum > _firstCol) ? prevColNum : _firstCol;
}

function displayColumnRange(rangeStartCol, rangeEndCol) {
    assertParam(rangeStartCol, "rangeStartCol", "displayColumnRange");
    assertParam(rangeEndCol, "rangeEndCol", "displayColumnRange");

    //Set column and superheader column visibility, and set colspans on superheaders.
    for (var colNum = _firstCol; colNum <= _lastCol; colNum++) {
        if (colNum < rangeStartCol) {
            $(GRADEBOOK_GRID_PREFIX + '.col' + colNum).hide();

            $(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum).show();
            $(GRADEBOOK_GRID_PREFIX + '.endCol' + colNum).hide();

            $(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum).attr('colSpan', rangeEndCol - rangeStartCol + 1);
        }
        else if (colNum <= rangeEndCol) {
            $(GRADEBOOK_GRID_PREFIX + '.col' + colNum).show();

            $(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum).show();
            $(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum).attr('colSpan', rangeEndCol - colNum + 1);

            subtractColSpan($(GRADEBOOK_GRID_PREFIX + '.endCol' + colNum), rangeEndCol - colNum);
        }
        else {
            $(GRADEBOOK_GRID_PREFIX + '.col' + colNum).hide();

            $(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum).hide();
        }
    }

    //Hide any "skipped" (toggled off) columns, and subtract skipped columns from the superheader colspan.
    var skipCount = 0;
    for (var colNum = rangeStartCol; colNum <= rangeEndCol; colNum++) {
        if (skipCount > 0) {
            $(".col" + colNum).hide();
            skipCount--;
        }

        if (_skipColumns[colNum] > 0) {
            skipCount = _skipColumns[colNum];
            subtractColSpan($(GRADEBOOK_GRID_PREFIX + '.startCol' + colNum), skipCount);
        }
    }

    //If necessary, show the arrow bars as "inactive."
    $(".previousButtonColumn").toggleClass("disabled", !isLeftPagingAllowed());
    $(".nextButtonColumn").toggleClass("disabled", !isRightPagingAllowed());
}

function subtractColSpan(elem, subtractCount)
{
	assertParam(elem, "elem", "subtractColSpan");
	assertParam(subtractCount, "subtractCount", "subtractColSpan");

	var currentColSpan = parseInt(elem.attr('colSpan'));
	if (currentColSpan > subtractCount) {
		elem.attr('colSpan', currentColSpan - subtractCount);
	}
	else {
		elem.attr('colSpan', 1);
	}
}


/* Paging Utility */

function isLeftPagingAllowed() {
    return _displayFirstCol > _firstCol;
}

function isRightPagingAllowed() {
    return _displayFirstCol < getRightmostStartColumn();
}

function removePaging() {
    _isMaximizedView = true;
    _displayColCount = _lastCol;
    _displayFirstCol = _firstCol;

    $(GRADEBOOK_GRID_PREFIX + '.previousButtonColumn').hide();
    $(GRADEBOOK_GRID_PREFIX + '.nextButtonColumn').hide();

    $(GRADEBOOK_GRID_PREFIX + '.instructionText').hide();
    $(GRADEBOOK_GRID_PREFIX + '.scrollingViewButton').show();
}


/* Keypress */

function handlePageKeyPress(e)
{
	if (_isMaximizedView) return;

	if (e.keyCode == LEFT_ARROW_KEYCODE) {
	    $(GRADEBOOK_GRID_PREFIX + '.previousButtonColumn').first().click();
	}
	else if (e.keyCode == RIGHT_ARROW_KEYCODE) {
	    $(GRADEBOOK_GRID_PREFIX + '.nextButtonColumn').first().click();
	}
}


/* Parameter Checking */

function assertParam(paramValue, paramName, functionName){
	if (paramValue == null) alert("Param " + paramName + " required in function " + functionName + "()");
}

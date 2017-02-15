
function InitializeMoreWindow(parentID, topOffset, leftOffset)
{
	var buttonSelector = CreateMoreWindowSelector(parentID, ".moreButton");
	var windowSelector = CreateMoreWindowSelector(parentID, ".moreWindow");
	var closeButtonSelector = CreateMoreWindowSelector(parentID, ".closeButton");

	TweakWindowOffset(windowSelector, topOffset, leftOffset);

	$(buttonSelector).click(function() {
	    if ($(windowSelector).is(':visible')) {
			CloseMoreWindow(windowSelector);
		} else {
			OpenMoreWindow(windowSelector);
		}
	});

	$(closeButtonSelector).click(function() {
		CloseMoreWindow(windowSelector);
	});
}

function TweakWindowOffset(windowSelector, topOffset, leftOffset)
{
	var currentOffset = $(windowSelector).show().offset();
	var newOffset = { top: currentOffset.top + topOffset, left: currentOffset.left + leftOffset };
	$(windowSelector).offset(newOffset).hide();
}

function OpenMoreWindow(windowSelector)
{
	$(windowSelector).slideDown('fast');
}

function CloseMoreWindow(windowSelector)
{
	$(windowSelector).slideUp('slow');
}

function CreateMoreWindowSelector(parentID, childSelector)
{
	if (childSelector != null)
		return "#" + parentID + " " + childSelector;
	else
		return "#" + parentID;
}

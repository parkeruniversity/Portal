var _employeeListControlData;
var _submitButtonLookup;

function initializeEmployeeListControlData(key, checkboxes, submittableCheckBoxes, selectAllCheckbox, submitButton, statusWindow)
{
	//Initialize new arrays.
	if (_employeeListControlData == null) _employeeListControlData = new Array();
	if (_submitButtonLookup == null) _submitButtonLookup = new Array();

	//Set up a new EmployeeListControlData object, which will handle all the internal data.
	_employeeListControlData[key] = new EmployeeListControlData(checkboxes, submittableCheckBoxes, submitButton, statusWindow);

	//Wire up the toggle checkboxes functionality of the select all button.
	if (selectAllCheckbox != null)
	{
		selectAllCheckbox.onclick = function() { _employeeListControlData[key].ToggleCheckboxes(this.checked); }
	}

	//Wire up the submit button enabling/disabling code based on whether the selected items are submittable.
	if (checkboxes != null)
	{
		for (i=0; i < checkboxes.length; i++)
		{
			checkboxes[i].onclick = function() { _employeeListControlData[key].ToggleSubmitButton(); }
		}
	}

	//Wire up the submit button lookup, so we can use a submit button to find the associated data.
	if (submitButton != null)
	{
		_submitButtonLookup[submitButton.id] = key;
	}

	_employeeListControlData[key].ToggleSubmitButton();
}

function checkTimecardSubmit(submitButton)
{
	if (
		(_submitButtonLookup == null) ||
		(_submitButtonLookup[submitButton.id] == null)
		)
		return;

	var data = _employeeListControlData[_submitButtonLookup[submitButton.id]];
	if (data == null) return;

	//Go through all the checkboxes until we find one that is not submittable.  If we find one, just warn the user.
	for (i=0; i < data.Checkboxes.length; i++)
	{
		if (
			(data.Checkboxes[i].checked) &&
			(!data.SubmittableCheckboxIDs[data.Checkboxes[i].id])
			)
		{
			//"Please note that only timecards with hours entered will be submitted to payroll."
			alert('<%= Jenzabar.Common.Globalization.Globalizer.GetJavascriptSafeString("MSG_TCAPPROVALPORTLET_ONLYVALIDTIMECARDSSUBMITTED") %>');
			return;
		}
	}
}

//Pops up the window with the possible timecard statuses.
function openTimecardStatusWindow(key, dockingElement)
{
	if (
		(_employeeListControlData[key] != null) && 
		(_employeeListControlData[key].StatusWindow != null)
		)
		_employeeListControlData[key].StatusWindow.open(dockingElement);
}

//Closes the window with the possible timecard statuses.
function closeTimecardStatusWindow(key)
{
	if (
		(_employeeListControlData[key] != null) && 
		(_employeeListControlData[key].StatusWindow != null)
		)
		_employeeListControlData[key].StatusWindow.close();
}

function EmployeeListControlData(checkboxes, submittableCheckboxes, submitButton, statusWindow)
{
	this.Checkboxes = checkboxes;
	this.SubmitButton = submitButton;
	this.StatusWindow = statusWindow;

	this.SubmittableCheckboxIDs = new Array();
	for (i=0; i < submittableCheckboxes.length; i++)
	{
		this.SubmittableCheckboxIDs[submittableCheckboxes[i]] = true;
	}

	this.ToggleCheckboxes = function(isChecked)
	{
		if (this.Checkboxes == null) return;

		//Go through the checkboxes, and set them all to checked or not checked.
		for (i=0; i < this.Checkboxes.length; i++)
		{
			this.Checkboxes[i].checked = (!this.Checkboxes[i].disabled && isChecked);
		}

		this.ToggleSubmitButton();
	}

	this.ToggleSubmitButton = function()
	{
		if ((this.Checkboxes == null) || (this.SubmitButton == null)) return;

		//Go through all the checked boxes, and see if any are submittable.  If so, enable the submit button.
		var isSubmitAllowed = false;
		for (i=0; i < this.Checkboxes.length; i++)
		{
			if (
				(this.Checkboxes[i].checked) &&
				(this.SubmittableCheckboxIDs[this.Checkboxes[i].id])
				)
			{
				isSubmitAllowed = true;
				break;
			}
		}
		this.SubmitButton.disabled = !isSubmitAllowed;
	}
}

<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PayPeriodEmployeesView.ascx.cs" Inherits="Portlet.TimecardApproval.PayPeriodEmployeesView" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" Src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeSearch" Src="../Controls/EmployeeSearch.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="ExceededHoursDisplay" Src="../Controls/ExceededHoursDisplay.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="PayPeriodListDisplay" Src="../Controls/PayPeriodListDisplay.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeListDisplay" Src="../Controls/EmployeeListDisplay.ascx" %>
<%@ Register TagPrefix="timecard" TagName="TimecardEntry" src="../../Portlet.Timecard/Controls/TimecardEntryPanel.ascx" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<link href="<%= this.ResolveUrl("~/Portlets/CRM/Staff/Portlet.Timecard/Controls/Styles/TimecardEntryPanel.css") %>?v=182" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]>
	<link href="<%= this.ResolveUrl("~/Portlets/CRM/Staff/Portlet.Timecard/Controls/Styles/TimecardEntryPanel_IE7.css") %>?v=182" rel="stylesheet" type="text/css" />
<![endif]-->

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />
<timecardApproval:EmployeeSearch ID="SearchBar" visible="false" runat="server" />

<div id="MainSection" class="pSection">
	<timecardApproval:ExceededHoursDisplay ID="ExceededHoursList" visible="false" runat="server" />

	<timecardApproval:PayPeriodListDisplay ID="ActivePayPeriodList"
			HeaderTextKey="TXT_ACTIVE_PAY_PERIODS" NoPayPeriodsTextKey="MSG_TCAPPROVALPORTLET_NO_ACTIVE_PAY_PERIODS_THIS_PAY_GROUP"
			AreQuickLinksVisible="true" runat="server" />
	<timecardApproval:EmployeeListDisplay ID="EmployeeList" DisplayFormat="Full" OnClientEditEmployeeHours="openEditBox()" runat="server" />
	<timecardApproval:EmployeeListDisplay ID="SubmittedEmployeeList"
			HeaderTextKey="LBL_PREVIOUSLY_SUBMITTED_TIMECARDS_FOR_THIS_PERIOD"
			DisplayFormat="ReadOnly" Visible="false" runat="server" />

	<common:GlobalizedLabel ID="lblGoTo" TextKey="LBL_GO_TO" runat="server" />
	<common:GlobalizedLinkButton ID="GoToMain" TextKey="TXT_PAY_GROUPS" runat="server" /> | 
	<common:GlobalizedLinkButton ID="GoToAllPayPeriods" TextKey="TXT_ALL_PAY_PERIODS" runat="server" />
</div>

<div id="HoursEntryPopup" style="display:none;" runat="server">
	<asp:UpdatePanel ID="EditBoxPanel" UpdateMode="Conditional" runat="server">
		<ContentTemplate>            
			<table id="HoursEntryContainer" runat="server" class="tcaTimecardEntryContainer">    
                <tr>
                    <td>
	                    <div class="tcaErrorColor"><common:GlobalizedLabel TextKey="MSG_TIMECARDPORTLET_WARNING_MANAGER_MODIFY_TIMECARD" runat="server" /></div>
                    </td>
                </tr>        
                <tr>
                    <td>
				        <timecard:TimecardEntry ID="HoursEntry" CssClass="tcHoursEntryPopup" ShowHeader="false" EmployeeCommentLabelKey="LBL_ADD_COMMENTS"
						    OnClientSave="saveHours()" OnClientCancel="closeEditBox()" runat="server" />
                    </td>
                </tr>
			</table>
			<div id="StatusDisplay" style="padding:5px;" runat="server"></div>
			<input id="EditBoxHeaderText" type="hidden" runat="server" />
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<script type="text/javascript">
	//constants for edit mode
	var EDITMODE_DEFAULT = 0;
	var EDITMODE_OPENING = 1;

	var _isInitialized = false;
	var _editHoursWindow = null;
	var _editMode = EDITMODE_DEFAULT;

	function initializeEditBox()
	{
		if (_isInitialized)
			return;

		_editHoursWindow = new JCSL.ui.windows.DialogWindow(document.getElementById('<%= this.HoursEntryPopup.ClientID %>'), '');
		//_editHoursWindow.modal = true;
		_editHoursWindow.fixed = true;

		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(onEditBoxOpened);

		_isInitialized = true;
	}

	function openEditBox()
	{
		initializeEditBox();

		toggleStatus(true, '<%= Globalizer.GetJavascriptSafeString("MSG_TCAPPROVALPORTLET_TIMECARD_LOADING_MESSAGE") %>');
		
		//pop up window
		_editHoursWindow.set_title('<%= Globalizer.GetJavascriptSafeString("TXT_EDIT_HOURS") %>');
		_editHoursWindow.open(document.getElementById('MainSection'));

		_editMode = EDITMODE_OPENING;
	}

	function onEditBoxOpened()
	{
		if (_editMode != EDITMODE_OPENING)
			return;

		var headerText = document.getElementById('<%= this.EditBoxHeaderText.ClientID %>').value;
		_editHoursWindow.set_title(headerText);
		toggleStatus(false);

		_editMode = EDITMODE_DEFAULT;

		_editHoursWindow.close();
		_editHoursWindow.open(document.getElementById('MainSection'));
	}

	function closeEditBox()
	{
		if (_editHoursWindow == null)
			return;

		_editHoursWindow.close();
		_editHoursWindow.set_title('<%= Globalizer.GetJavascriptSafeString("TXT_EDIT_HOURS") %>');
		toggleStatus(true, '<%= Globalizer.GetJavascriptSafeString("MSG_TCAPPROVALPORTLET_TIMECARD_LOADING_MESSAGE") %>');
	}

	function saveHours()
	{
		toggleStatus(true, '<%= Globalizer.GetJavascriptSafeString("MSG_TCAPPROVALPORTLET_TIMECARD_SAVING_MESSAGE") %>');
	}

	function toggleStatus(showStatus, statusMessage)
	{
		if (statusMessage)
		{
			document.getElementById('<%= this.StatusDisplay.ClientID %>').innerText = statusMessage;
		}

		document.getElementById('<%= this.StatusDisplay.ClientID %>').style.display = showStatus ? '' : 'none';
		document.getElementById('<%= this.HoursEntryContainer.ClientID %>').style.display = showStatus ? 'none' : '';
	}

</script>

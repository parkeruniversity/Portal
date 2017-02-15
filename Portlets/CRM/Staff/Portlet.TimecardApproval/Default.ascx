<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardApprovalPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div id="MainSection" class="pSection" runat="server">

<asp:TextBox ID="SelectedPayPeriod" CssClass="tcaHiddenField" Runat="server" />
<asp:TextBox ID="SelectedEmployee" CssClass="tcaHiddenField" Runat="server" />

<jenzabar:GlobalizedLabel ID="IntroText" TextKey="MSG_TCAPPROVALPORTLET_SELECTION_INTRO" runat="server" />

<div class="tcaDefaultSelection">
<table>	<tr>
		<td align="right" nowrap="true"><jenzabar:GlobalizedLabel ID="PayGroupLabel" TextKey="LBL_PAY_GROUP" CssClass="tcaDefaultSelectionItem" runat="server" /></td>
		<td><asp:DropDownList ID="PayGroup" CssClass="tcaDefaultSelectionItem" Runat="server" /></td>
	</tr>
	<tr>
		<td align="right" nowrap="true"><jenzabar:GlobalizedLabel ID="PayPeriodLabel" TextKey="LBL_PAY_PERIOD" CssClass="tcaDefaultSelectionItem" runat="server" /></td>
		<td><asp:DropDownList ID="PayPeriod" CssClass="tcaDefaultSelectionItem" Runat="server" /></td>
	</tr>
	<tr>
		<td align="right" nowrap="true"><jenzabar:GlobalizedLabel ID="EmployeeLabel" TextKey="LBL_EMPLOYEE" CssClass="tcaDefaultSelectionItem" runat="server" /></td>
		<td><asp:DropDownList ID="Employee" CssClass="tcaDefaultSelectionItem" Runat="server" /></td>
	</tr>
	<tr>
		<td></td>
		<td><jenzabar:GlobalizedButton ID="ViewEmployee" TextKey="TXT_REVIEW_TIMECARD" CssClass="tcaDefaultSelectionItem" Runat="server" /></td>
	</tr>
	<tr>
		<td></td>
		<td><strong><jenzabar:GlobalizedLabel ID="OrLabel" TextKey="TXT_OR" CssClass="tcaDefaultSelectionItem" runat="server" /></strong></td>
	</tr>
	<tr>
		<td></td>
		<td><jenzabar:GlobalizedButton ID="ViewAll" TextKey="TXT_VIEW_ALL_EMPLOYEES" CssClass="tcaDefaultSelectionItem" Runat="server" /></td>
	</tr>
</table>
</div>

<script>
	AttachEvent(window, 'load', initDefault_<%= this.ParentPortlet.UniqueID %>);

	function initDefault_<%= this.ParentPortlet.UniqueID %>()
	{
		if (document.getElementById('<%= PayGroup.ClientID %>') == null)
			return;

		//Wire up the javascript for the pay group and pay period dropdowns.
		document.getElementById('<%= PayGroup.ClientID %>').onchange = GetMyPayPeriods_<%= this.ParentPortlet.UniqueID %>;
		document.getElementById('<%= PayPeriod.ClientID %>').onchange = GetMyEmployees_<%= this.ParentPortlet.UniqueID %>;
		document.getElementById('<%= PayPeriod.ClientID %>').onupdated = GetMyEmployees_<%= this.ParentPortlet.UniqueID %>;

		document.getElementById('<%= ViewEmployee.ClientID %>').onclick = SubmitMyForm_<%= this.ParentPortlet.UniqueID %>;
		document.getElementById('<%= ViewAll.ClientID %>').onclick = SubmitMyForm_<%= this.ParentPortlet.UniqueID %>;

		//Initialize the pay period and employee dropdowns based on the default pay group.
		GetMyPayPeriods_<%= this.ParentPortlet.UniqueID %>();
	}

	function GetMyPayPeriods_<%= this.ParentPortlet.UniqueID %>()
	{
		//If the previous request hasn't completed, then keep looping until it's ready.  This will happen in the background.
		if (isAJAXRequestProcessing())
			setTimeout("GetMyPayPeriods_<%= this.ParentPortlet.UniqueID %>()", 100);
		else
			GetPayPeriods('<%= PayGroup.ClientID %>','<%= PayPeriod.ClientID %>','<%= this.ResolveUrl("~") %>');
	}

	function GetMyEmployees_<%= this.ParentPortlet.UniqueID %>()
	{
		//If the previous request hasn't completed, then keep looping until it's ready.  This will happen in the background.
		if (isAJAXRequestProcessing())
			setTimeout("GetMyEmployees_<%= this.ParentPortlet.UniqueID %>()", 100);
		else
			GetEmployees('<%= PayGroup.ClientID %>','<%= PayPeriod.ClientID %>','<%= Employee.ClientID %>','<%= this.ResolveUrl("~") %>');
	}

	function SubmitMyForm_<%= this.ParentPortlet.UniqueID %>()
	{
		var payPeriodDropdown = document.getElementById('<%= PayPeriod.ClientID %>');
		var employeeDropdown = document.getElementById('<%= Employee.ClientID %>');
		var hiddenPayPeriod = document.getElementById('<%= SelectedPayPeriod.ClientID %>');
		var hiddenEmployee = document.getElementById('<%= SelectedEmployee.ClientID %>');

		//Only submit the form if all of the dropdowns have been initialized.
		if ((payPeriodDropdown.options.length == 0) || (employeeDropdown.options.length == 0))
			return false;

		hiddenPayPeriod.value = payPeriodDropdown.options[payPeriodDropdown.selectedIndex].value;
		hiddenEmployee.value = employeeDropdown.options[employeeDropdown.selectedIndex].value;
		return true;
	}

</script>

</div>

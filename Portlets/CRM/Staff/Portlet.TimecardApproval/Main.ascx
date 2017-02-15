<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardApprovalPortlet.Main" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.CRM"%>
<%@ Import namespace="Jenzabar.CRM.Staff.Web.Portlets.TimecardApprovalPortlet"%>
<div id="MainSection" class="pSection" runat="server">

<div class="tcaMainSelection">
	<p><jenzabar:GlobalizedLabel ID="MainSelectionIntro" TextKey="MSG_TCAPPROVALPORTLET_SELECTION_INTRO" runat="Server" /></p>
	<ul>
		<li><jenzabar:GlobalizedLabel ID="PayGroupLabel" TextKey="LBL_PAY_GROUP" CssClass="tcaMainSelectionLabel" runat="server" /></li>
		<li><asp:DropDownList ID="PayGroup" AutoPostBack="True" Runat="server" /></li>
		<li><jenzabar:GlobalizedLabel ID="PayPeriodLabel" TextKey="LBL_PAY_PERIOD" CssClass="tcaMainSelectionLabel" runat="server" /></li>
		<li><asp:DropDownList ID="PayPeriod" AutoPostBack="True" Runat="server" /></li>
	</ul>
</div>

<jenzabar:Hint ID="NoTimecardsMessage" TextKey="MSG_TCAPPROVALPORTLET_ALLTIMECARDSSUBMITTED" visible="false" runat="server" />

<asp:Repeater ID="EmployeeRepeater" Runat="server">
	<HeaderTemplate>
		<table class="groupedGrid tcaMainGrid" cellpadding="0" cellspacing="0" border="0">
		<thead>
			<tr>
				<td colspan="5"><span ID="EmployeeHeader" Runat="server" /></th>
			</tr>
			<tr>
				<th onclick="checkForButtonDisable();"><input type="checkbox" /></th>
				<th>
					<jenzabar:GlobalizedLabel ID="EmployeeHeaderText" TextKey="TXT_EMPLOYEE" Runat="server" /> 
					(<jenzabar:GlobalizedLabel ID="PositionHeaderText" TextKey="TXT_POSITION" Runat="server" />)
				</th>
				<th><jenzabar:GlobalizedLabel ID="TotalHoursHeaderText" TextKey="TXT_TOTAL_HOURS" Runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="RegularHeaderText" TextKey="TXT_REGULAR" Runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="OtherHeaderText" TextKey="TXT_OTHER" Runat="server" /></th>
			</tr>
		</thead>
		<tbody class="gbody">
	</HeaderTemplate>
	<ItemTemplate>
			<tr class="<%# ((Container.ItemIndex % 2) == 1) ? "alt" : "" %>">
				<td>
					<img id="ApprovedIcon" visible="<%# ((Timecard.TimecardTotal)Container.DataItem).IsApproved %>" Runat="server" />
					<asp:CheckBox ID="ApproveBox" visible="<%# !((Timecard.TimecardTotal)Container.DataItem).IsApproved %>" Runat="server" />
				</td>
				<td>
					<asp:LinkButton ID="EmployeeName" CommandName="ViewEmployee" Runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).User.NameDetails.ToLastFirstNameString() %></asp:LinkButton> 
					(<%# ((Timecard.TimecardTotal)Container.DataItem).Position %>)
					<span id="UserID" visible="false" runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).User.ID.AsGuid.ToString() %></span>
					<span id="HostID" visible="false" runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).User.HostID %></span>
					<span id="Position" visible="false" runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).Position %></span>
				</td>
				<td class="tcaTotalHours"><%# ((Timecard.TimecardTotal)Container.DataItem).TotalHours.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
				<td><%# ((Timecard.TimecardTotal)Container.DataItem).TotalRegular.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
				<td><%# DisplayOtherHours((Timecard.TimecardTotal)Container.DataItem) %></td>
			</tr>
	</ItemTemplate>
	<FooterTemplate>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><jenzabar:GlobalizedButton ID="ApproveSelected" TextKey="TXT_APPROVE_SELECTED_TIMECARDS" CommandName="ApproveSelected" Runat="server" /></td>
			</tr>
		</tfoot>
		</table>
	</FooterTemplate>
</asp:Repeater>

<div id="SubmitButtonSection" runat="server">
	<!-- Trying to avoid nested tables like this, but this is necessary because of an IE7 CSS bug. -->
	<table cellpadding="0" cellspacing="0" width="100%"><tr><td width="100%" align="center">
		<table cellpadding="0" cellspacing="0" border="0"><tr><td>
			<div class="tcaMainFooter">
				<jenzabar:GlobalizedButton ID="SubmitToPayroll" TextKey="TXT_SUBMIT_ALL_APPROVED_TIMECARDS_TO_PAYROLL" Runat="server" />
			</div>
		</td></tr></table>
	</td></tr></table>
</div>

<asp:Repeater ID="SubmittedRepeater" Visible="False" Runat="server">
	<HeaderTemplate>
		<table class="groupedGrid tcaMainGrid" cellpadding="0" cellspacing="0" border="0">
		<thead>
			<tr>
				<td colspan="4"><span ID="SubmittedHeader" Runat="server" /></th>
			</tr>
			<tr>
				<th>
					<jenzabar:GlobalizedLabel ID="SubmittedEmployeeHeader" TextKey="TXT_EMPLOYEE" Runat="server" /> 
					(<jenzabar:GlobalizedLabel ID="SubmittedPositionHeader" TextKey="TXT_POSITION" Runat="server" />)
				</th>
				<th><jenzabar:GlobalizedLabel ID="SubmittedTotalHeader" TextKey="TXT_TOTAL_HOURS" Runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="SubmittedRegularHeader" TextKey="TXT_REGULAR" Runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="SubmittedOtherHeader" TextKey="TXT_OTHER" Runat="server" /></th>
			</tr>
		</thead>
		<tbody class="gbody">
	</HeaderTemplate>
	<ItemTemplate>
			<tr class="<%# ((Container.ItemIndex % 2) == 1) ? "alt" : "" %>">
				<td>
					<asp:LinkButton ID="SubmittedEmployeeName" CommandName="ViewEmployee" Runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).User.NameDetails.ToLastFirstNameString() %></asp:LinkButton> 
					(<%# ((Timecard.TimecardTotal)Container.DataItem).Position %>)
					<span id="SubmittedUserID" visible="false" runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).User.ID.AsGuid.ToString() %></span>
					<span id="SubmittedPosition" visible="false" runat="server"><%# ((Timecard.TimecardTotal)Container.DataItem).Position %></span>
				</td>
				<td class="tcaTotalHours"><%# ((Timecard.TimecardTotal)Container.DataItem).TotalHours.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
				<td><%# ((Timecard.TimecardTotal)Container.DataItem).TotalRegular.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
				<td><%# DisplayOtherHours((Timecard.TimecardTotal)Container.DataItem) %></td>
			</tr>
	</ItemTemplate>
	<FooterTemplate>
		</tbody>
		</table>
	</FooterTemplate>
</asp:Repeater>

<script>
AttachEvent(window, 'load', initTimecardApprovalMain);

var checkboxArray = new Array ();
var approveButton;

function initTimecardApprovalMain()
{
	<asp:Literal ID="JSVariableInit" runat="Server" />

	for (i=0; i < checkboxArray.length; i++)
	{
		checkboxArray[i].onclick = checkForButtonDisable;
	}

	if (approveButton != null)
		approveButton.disabled = true;
}

function checkForButtonDisable()
{
	if (approveButton == null)
		return;

	var isAtLeastOneChecked = false;
	for (i=0; i < checkboxArray.length; i++)
	{
		if (checkboxArray[i].checked)
		{
			isAtLeastOneChecked = true;
		}
	}
	approveButton.disabled = !isAtLeastOneChecked;
}

</script>

</div>

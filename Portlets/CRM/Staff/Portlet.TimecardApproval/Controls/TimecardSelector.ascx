<%@ Control Language="c#" AutoEventWireup="True" Codebehind="TimecardSelector.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.TimecardSelector" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<table class="tcaTimecardApprovalSelector">
    <tr align=left>
        <td colspan="3" class="tcaCellHeader">
	        <common:GlobalizedLabel ID="SelectorHeader" TextKey="TXT_FIND_A_SPECIFIC_TIMECARD" runat="server" />
        </td>
    </tr>
    <tr>
		<td class="tcaCellSolidBorderBottom">
			<common:GlobalizedLabel ID="lblPayGroup" TextKey="LBL_PAY_GROUP" runat="server" />
		</td>
		<td class="tcaCellSolidBorderBottom">
			<common:GlobalizedLabel ID="lblPeriodEndDate" TextKey="LBL_PERIOD_END_DATE" runat="server" />
		</td>
		<td class="tcaCellSolidBorderBottom">
			<common:GlobalizedLabel ID="lblEmployee" TextKey="LBL_EMPLOYEE" runat="server" />
		</td>
	</tr>
	<tr>
		<td class="tcaCellCentered"><asp:DropDownList ID="PayGroupDropDown" runat="server" /></td>
		<td class="tcaCellCentered"><asp:DropDownList ID="PayPeriodDropDown" runat="server" /></td>
		<td class="tcaCellCentered"><asp:DropDownList ID="EmployeeDropDown" runat="server" /></td>
	</tr>
	<tr class="buttonBarCenteredVer2">
		<td colspan="3"><common:GlobalizedButton ID="SubmitButton" TextKey="TXT_REVIEW_TIMECARD" runat="server" /></td>
	</tr>
</table>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Timecard.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardApprovalPortlet.TimecardEntry"%>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.CRM"%>
<%@ Import namespace="Jenzabar.CRM.Staff.Web.Portlets.TimecardApprovalPortlet"%>

<jenzabar:Subheader ID="TimecardPageHeader" TextKey="TXT_VIEW_AND_APPROVE_A_TIMECARD" runat="server" />

<div class="pSection">

<div class="tcaTimecardMainHeader" style="margin:0px;"><framework:MyInfoPopup id="EmployeeName" NameFormat="FullName" ClickableName="false" runat="server" /></div>
<div style="margin: 5px 0px 20px 0px;">
	<span id="PositionDisplay" runat="server" />, 
	<span id="PayGroupDisplay" runat="server" />
	<span style="margin: 0px 10px;">|</span>
	<jenzabar:ImageAndTextButton ID="EmailButton" TextKey="TXT_EMAIL" ToolTipKey="TXT_EMAIL" runat="server" />
</div>

<table cellpadding="0" cellspacing="0" border="0" style="padding:0px;margin:0px;"><tr><td>
<div class="contentBox tcaTimecardSummary">
	<h4><span id="SummaryHeader" runat="server" /></h4>

	<table class="tcaTimecardSummaryTable">
		<tr>
			<td align="right"><jenzabar:GlobalizedLabel ID="TotalRegularLabel" TextKey="LBL_TOTAL_REGULAR" CssClass="tcaTimecardSummaryLabel" runat="server" /></td>
			<td><span id="SummaryTotalRegular" runat="Server" /></td>
		</tr>
		<tr>
			<td align="right"><jenzabar:GlobalizedLabel ID="TotalOtherLabel" TextKey="LBL_TOTAL_OTHER" CssClass="tcaTimecardSummaryLabel" runat="server" /></td>
			<td><span id="SummaryTotalOther" runat="Server" /></td>
		</tr>
		<tr>
			<td align="right"><jenzabar:GlobalizedLabel ID="TotalLabel" TextKey="LBL_TOTAL" CssClass="tcaTimecardSummaryLabel" runat="server" /></td>
			<td class="tcaTotalHours"><span id="SummaryTotalHours" runat="Server" /></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td id="SummaryLeftColumn" align="center" style="border-right: solid 1px #000000;" runat="server">
				<jenzabar:ImageAndTextButton ID="ApproveTimecard" TextKey="MSG_TCAPPROVALPORTLET_APPROVE_TIMECARD" runat="server" />
				<span id="AlreadyApproved" runat="server">
					<img id="AlreadyApprovedImage" runat="server" />
					<jenzabar:GlobalizedLabel ID="AlreadyApprovedText" TextKey="TXT_ALREADY_APPROVED" runat="server" />
				</span>
			</td>
			<td id="SummaryRightColumn" align="center" runat="server">
				<jenzabar:ImageAndTextButton ID="NotYetButton" TextKey="MSG_TCAPPROVALPORTLET_NOTYET" Runat="server" />
				<jenzabar:ImageAndTextButton ID="WithdrawApproval" TextKey="TXT_WITHDRAW_APPROVAL" Runat="server" />
				<span id="AlreadySubmitted" runat="server">
					<img id="AlreadySubmittedImage" runat="server" />
					<jenzabar:GlobalizedLabel ID="AlreadySubmittedText" TextKey="TXT_ALREADY_SUBMITTED" runat="server" />
				</span>
			</td>
		</tr>
	</table>
</div>
</td></tr></table>

<div id="CancelButtonContainer" style="margin:0px 0px 20px 0px;padding:0px;" runat="server">
	<jenzabar:GlobalizedLinkButton ID="CancelButton" TextKey="MSG_TCAPPROVALPORTLET_BACKTOMAIN" Runat="server" />
</div>

<table cellpadding="0" cellspacing="0" border="0"><tr><td>
<asp:Repeater ID="TimecardDetail" Runat="server">
	<HeaderTemplate>
		<table class="groupedGrid" cellpadding="0" cellspacing="0" border="0">
		<thead>
			<tr>
				<td colspan="4"><span id="DetailHeader" runat="server" /></td>
			</tr>
			<tr>
				<th><jenzabar:GlobalizedLabel ID="DayHeaderText" TextKey="TXT_DAY" runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="RegularHeaderText" TextKey="TXT_REGULAR" runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="OtherHeaderText" TextKey="TXT_OTHER" runat="server" /></th>
				<th><jenzabar:GlobalizedLabel ID="TotalHeaderText" TextKey="TXT_TOTAL" runat="server" /></th>
			</tr>
		</thead>
		<tbody class="gbody">
	</HeaderTemplate>
	<ItemTemplate>
			<tr class="<%# ((Container.ItemIndex % 2) == 1) ? "alt" : "" %>">
				<td><%# DisplayShortDate((Timecard.TimecardDay)Container.DataItem) %></td>
				<td><%# ((Timecard.TimecardDay)Container.DataItem).TotalRegular.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
				<td><%# DisplayOtherHours((Timecard.TimecardDay)Container.DataItem) %></td>
				<td class="tcaTotalHours"><%# ((Timecard.TimecardDay)Container.DataItem).TotalHours.ToString(TimecardApprovalPortlet.HoursFormat) %></td>
			</tr>
	</ItemTemplate>
	<FooterTemplate>
		</tbody>
		<tfoot>
			<tr>
				<td class="tcaTotalHours"><jenzabar:GlobalizedLabel ID="TotalFooterText" TextKey="TXT_TOTAL" runat="server" /></td>
				<td class="tcaTotalHours"><span id="DetailsTotalRegular" runat="Server" /></td>
				<td class="tcaTotalHours"><span id="DetailsTotalOther" runat="Server" /></td>
				<td class="tcaTotalHours"><span id="DetailsTotalHours" runat="Server" /></td>
			</tr>
		</tfoot>
		</table>
	</FooterTemplate>
</asp:Repeater>
</table>

</div>

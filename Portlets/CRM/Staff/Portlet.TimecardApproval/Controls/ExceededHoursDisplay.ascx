<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ExceededHoursDisplay.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.ExceededHoursDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<div class="feedbackError">
	<p><strong>
		<common:GlobalizedLiteral ID="ExceededHoursLabel" TextKey="MSG_TCAPPROVALPORTLET_EXCEEDED_HOURS_LABEL" runat="server" />
	</strong></p>
	<asp:Repeater ID="ExceededHoursList" runat="server">
		<HeaderTemplate><ul></HeaderTemplate>
		<ItemTemplate>
			<li style="list-style-type:disc;margin-left:50px;">
				<strong><asp:Literal ID="EmployeeName" runat="server" /></strong> 
				<asp:Literal ID="ExceededHours" runat="server" />
			</li>
		</ItemTemplate>
		<FooterTemplate></ul></FooterTemplate>
	</asp:Repeater>
	<p id="NoOverrideMessage" runat="server">
		<common:GlobalizedLiteral ID="EditHoursNote" TextKey="MSG_TCAPPROVALPORTLET_EXCEEDED_HOURS_EDIT_NOTE" runat="server" />
	</p>
	<div id="OverrideMessage" runat="server">
		<asp:CheckBox ID="OverrideCheckbox" runat="server" />
		<strong><common:GlobalizedLiteral ID="OverrideLabel" TextKey="LBL_OVERRIDE" runat="server" /></strong>
		<common:GlobalizedLiteral ID="OverrideNote" TextKey="MSG_TCAPPROVALPORTLET_EXCEEDED_HOURS_RESUBMIT_NOTE" runat="server" />
	</div>
	<div id="ResubmitDisplay" style="padding:10px;text-align:center;" runat="server">
		<common:GlobalizedButton ID="ResubmitButton" TextKey="TXT_RESUBMIT_AS_IS" runat="server" />
	</div>
</div>

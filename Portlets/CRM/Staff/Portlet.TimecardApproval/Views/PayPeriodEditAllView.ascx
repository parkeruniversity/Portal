<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PayPeriodEditAllView.ascx.cs" Inherits="Portlet.TimecardApproval.PayPeriodEditAllView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" Src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeListDisplay" Src="../Controls/EmployeeListDisplay.ascx" %>

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />

<div id="MainSection" class="pSection" runat="server">
	<div><common:GlobalizedLiteral ID="EditAllIntro" TextKey="MSG_TCAPPROVALPORTLET_EDIT_ALL_HOURS_INTRO" runat="server" /></div>
    <common:GlobalizedLabel CssClass="tcaErrorColor" TextKey="MSG_TIMECARDPORTLET_WARNING_MANAGER_MODIFY_TIMECARD"
        runat="server" /><br />
	<timecardApproval:EmployeeListDisplay ID="EmployeeEditList" DisplayFormat="EditAllHours" runat="server" />
</div>

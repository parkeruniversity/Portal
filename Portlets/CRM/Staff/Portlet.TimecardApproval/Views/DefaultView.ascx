<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Portlet.TimecardApproval.DefaultView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeSearch" src="../Controls/EmployeeSearch.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="PayGroupPeriodDisplay" src="../Controls/PayGroupPeriodDisplay.ascx" %>

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />
<timecardApproval:EmployeeSearch ID="SearchBar" visible="false" runat="server"/>

<div class="pSection">
	<timecardApproval:PayGroupPeriodDisplay ID="PayGroupPeriodDisplay" DisplayFormat="Minimal" runat="server" />
	<div class="tcaCellCenteredText">
		<common:GlobalizedLinkButton ID="ViewAllPeriodsButton" TextKey="MSG_TCAPPROVALPORTLET_VIEW_OLDER_PERIODS" Visible="false" runat="server" />
		<common:GlobalizedLinkButton ID="MainScreenLink" TextKey="MSG_TCAPPROVAL_DEFAULTPAGE_GOTOMAINSCREEN" runat="server" />
	</div>
</div>

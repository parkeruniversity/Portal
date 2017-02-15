<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AllPayPeriodsView.ascx.cs" Inherits="Portlet.TimecardApproval.AllPayPeriodsView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeSearch" Src="../Controls/EmployeeSearch.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="PayPeriodListDisplay" Src="../Controls/PayPeriodListDisplay.ascx" %>

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />
<timecardApproval:EmployeeSearch ID="SearchBar" visible="false" runat="server" />

<div id="MainSection" class="pSection" runat="server">
	<p><common:GlobalizedLinkButton ID="BackButton" TextKey="TXT_BACK_TO_PAY_GROUPS" runat="server" /></p>
	<p><timecardApproval:PayPeriodListDisplay ID="PayPeriodDisplay" IsYearSelectionVisible="true" 
			HeaderTextKey="LBL_ALL_PAY_PERIODS" NoPayPeriodsTextKey="MSG_TCAPPROVALPORTLET_NO_PAY_PERIODS_FOR_YEAR" 
			runat="server" /></p>
	<p><common:GlobalizedLinkButton ID="BackButton2" TextKey="TXT_BACK_TO_PAY_GROUPS" runat="server" /></p>
</div>

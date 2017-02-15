<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MainView.ascx.cs" Inherits="Portlet.TimecardApproval.MainView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardApprovalHeader" Src="../Controls/TimecardApprovalHeader.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="EmployeeSearch" Src="../Controls/EmployeeSearch.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="PayGroupPeriodDisplay" Src="../Controls/PayGroupPeriodDisplay.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="TimecardSelector" Src="../Controls/TimecardSelector.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="SupervisorSelector" Src="../Controls/SupervisorSelector.ascx" %>
<%@ Register TagPrefix="timecardApproval" TagName="AlternateSelector" Src="../Controls/AlternateSelector.ascx" %>

<div id="AdminButtonDisplay" class="PortletAdminButtonPanel" visible="false" runat="server">
	<common:ImageAndTextButton ID="AdminButton" TextKey="TXT_ADMIN_OPTIONS" 
			ImageUrl="~\UI\Common\Images\PortletImages\Icons\portlet_admin_icon.gif" runat="server" />
</div>

<timecardApproval:TimecardApprovalHeader ID="PageHeader" runat="server" />
<timecardApproval:EmployeeSearch ID="SearchBar" visible="false" runat="server" />

<div id="MainSection" class="pSection" runat="server">
	<div id="IntroText" runat="server" visible="false"></div>
	<timecardApproval:PayGroupPeriodDisplay ID="PayGroupPeriodDisplay" DisplayFormat="Full" runat="server" />
	<timecardApproval:TimecardSelector ID="TimecardSelector" visible="false" runat="server" />
	<common:GlobalizedLinkButton ID="CancelImpersonationButton" TextKey="TXT_BACK_TO_MY_PAY_GROUPS" visible="false" runat="server" />
</div>

<timecardApproval:SupervisorSelector ID="SupervisorSelector" visible="false" runat="server" />
<timecardApproval:AlternateSelector ID="AlternateSelector" visible="false" runat="server" />

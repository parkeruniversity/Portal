<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomWeightingSetupView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.CustomWeightingSetupView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="gbk" TagName="WeightingAdminPanel" Src="Controls/WeightingAdminPanel.ascx" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/ui/common/scripts/jquery.blockui.js") %>"></script>

<portlet:NavBar ID="NavBar" runat="server" />

<div class="portletScreen customWeightingScreen">

    <div class="title">
	    <common:GlobalizedLabel TextKey="HDR_A_CUSTOM_METHOD" CssClass="headerText" runat="server" />
		<common:GlobalizedLabel TextKey="MSG_GBK_CUSTOMGRADEWEIGHTING_DESCRIPTION" CssClass="desc" runat="server" />
    </div>

    <gbk:WeightingAdminPanel ID="AssignmentGrouping" runat="server" />

    <gbk:WeightingAdminPanel ID="GroupWeighting" runat="server" />

    <gbk:WeightingAdminPanel ID="AssignmentWeighting" runat="server" />

    <div id="SavePanel" visible="false" class="savePanel" runat="server">
	    <common:GlobalizedLabel ID="SaveMessage" LabelKey="TXT_YOUR_CUSTOM_WEIGHTING_METHOD_WILL_BE" CssClass="saveMessage" runat="server" />
	    <asp:Label ID="CustomWeightDescription" class="weightDescription" runat="server" />
	    <div class="buttonBar">
		    <common:GlobalizedButton ID="SaveButton" TextKey="TXT_USE_THIS_METHOD" CssClass="saveButton" runat="server" />
		    <common:GlobalizedLinkButton ID="CancelAllButton" TextKey="TXT_RESET_AND_START_OVER_AT_QUESTION_1" CssClass="resetButton" runat="server" />
	    </div>
    </div>

    <common:GlobalizedHyperLink ID="CancelButton" TextKey="TXT_CANCEL_AND_RETURN_TO_THE_WEIGHTING_METHOD_SCREEN" CssClass="backButton" runat="server" />

	<div class="screenFooter"></div>
</div>

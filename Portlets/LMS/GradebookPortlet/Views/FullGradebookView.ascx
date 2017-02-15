<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FullGradebookView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.FullGradebookView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="portlet" TagName="FullGradebook" Src="Controls/FullGradebookGrid.ascx" %>

<div class="fullGradebookScreen">
	<portlet:NavBar ID="NavBar" AreCustomDetailsVisible="false" runat="server">
	<TopNavBarContent>
		<div id="NavBarButtonBar" runat="server">
			<common:GlobalizedHyperLink ID="ExpandAllGroupsButton" TextKey="MSG_GBK_EXPAND_ALL_UNITS"
					NavigateUrl="javascript:" CssClass="expandGroupsButton" runat="server" />
			<common:GlobalizedHyperLink ID="CollapseAllGroupsButton" TextKey="MSG_GBK_COLLAPSE_ALL_UNITS"
					NavigateUrl="javascript:" CssClass="collapseGroupsButton" runat="server" />
			<common:GlobalizedHyperLink ID="ExportButton" TextKey="MSG_GBK_EXPORT_TO_EXCEL"
					CssClass="exportButton" runat="server" />
			<common:GlobalizedHyperLink ID="ViewEverythingButton" TextKey="MSG_GBK_VIEW_EVERYTHING_AT_ONCE_ON_ONE_PAGE"
					NavigateUrl="javascript:" CssClass="expandAllButton" runat="server" />
		</div>
	</TopNavBarContent>
	<CustomDetailsContent>
		<div id="MissingWeightsMessage" class="missingWeightsMessage" runat="server"></div>
	</CustomDetailsContent>
	</portlet:NavBar>
</div>

<div class="portletScreen fullGradebookScreen">

<div class="introPanel">
	<asp:Label ID="ScreenHeader" CssClass="headerText" runat="server" />
	<common:GlobalizedLabel ID="Instructions" TextKey="MSG_GBK_FULLGRADEBOOK_INSTRUCTIONS" CssClass="messageText" runat="server" />
</div>

<portlet:FullGradebook ID="FullGradebook" runat="server" />

<div class="studentFilterButtonBar">
	<common:GlobalizedHyperLink ID="ActiveStudentsLink" TextKey="TXT_VIEW_ACTIVE_STUDENTS" runat="server" />
	<common:GlobalizedHyperLink ID="EmulatedStudentsLink" TextKey="TXT_VIEW_GUEST_STUDENTS" runat="server" />
	<common:GlobalizedHyperLink ID="WithdrawnStudentsLink" TextKey="TXT_VIEW_WITHDRAWN_STUDENTS" runat="server" />
</div>

<div class="screenFooter"></div>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$('#<%= ViewEverythingButton.ClientID %>').click(function () {
			$('.gradebookPortlet .fullGradebookScreen .introPanel .messageText').hide();
		});
	});
</script>

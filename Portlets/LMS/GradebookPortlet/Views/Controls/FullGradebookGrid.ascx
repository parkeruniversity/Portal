<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FullGradebookGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.FullGradebook" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls.TemplateFields" %>

<div class="fullGradebookGrid">

<common:StyledGridView Id="FullGrid" ShowFooter="true" runat="server">
<Columns>

	<common:SuperheaderTemplateField ColumnCssClass="studentColumn" 
			SuperheaderCssClass="instructions" SuperheaderColumnSpan="2" HeaderTextKey="HDR_STUDENT"
			FooterCssClass="instructions" FooterColumnSpan="2">
		<SuperheaderTemplate>
			<common:GlobalizedLabel TextKey="MSG_GBK_FULLGRADEBOOK_SCROLL_INSTRUCTIONS" CssClass="instructionText" runat="server" />
			<common:GlobalizedHyperLink TextKey="TXT_BACK_TO_SCROLLING_GRADEBOOK_VIEW" NavigateUrl="javascript:" CssClass="scrollingViewButton" runat="server" />
		</SuperheaderTemplate>
		<ItemTemplate>
			<asp:HyperLink ID="StudentName" runat="server" />
		</ItemTemplate>
		<FooterTemplate>
			<common:GlobalizedLabel TextKey="MSG_GBK_FULLGRADEBOOK_SCROLL_INSTRUCTIONS" CssClass="instructionText" runat="server" />
			<common:GlobalizedHyperLink TextKey="TXT_BACK_TO_SCROLLING_GRADEBOOK_VIEW" NavigateUrl="javascript:" CssClass="scrollingViewButton" runat="server" />
		</FooterTemplate>
	</common:SuperheaderTemplateField>

	<common:GlobalizedTemplateField HeaderTextKey="HDR_FINAL_GRADE" ColumnCssClass="finalGradeColumn">
		<ItemTemplate>
			<asp:Label ID="FinalGrade" runat="server" />
		</ItemTemplate>
	</common:GlobalizedTemplateField>

</Columns>
</common:StyledGridView>

</div>

<script type="text/javascript">

$(document).ready(function () {
    var expandAllButton = <asp:Literal ID="ExpandAllButtonClientSideID" runat="server">null</asp:Literal>;
    var collapseAllButton = <asp:Literal ID="CollapseAllButtonClientSideID" runat="server">null</asp:Literal>;
    var expandEverythingButton = <asp:Literal ID="ExpandEverythingButtonClientSideID" runat="server">null</asp:Literal>;
    
	initializeGridValues(<%= this.FirstColumnNumber %>, <%= this.LastColumnNumber %>, <%= this.FirstColumnNumber %>, 5);

	initializeGridColumns();

    <asp:Repeater ID="ColumnToggleWireUpRepeater" runat="server">
<ItemTemplate>
	initializeSuperheaderToggle(
		<%# DataBinder.Eval(Container.DataItem, "FirstColumn") %>,
		<%# DataBinder.Eval(Container.DataItem, "ColumnCount") %>,
		expandAllButton,
		collapseAllButton
	);
</ItemTemplate>
</asp:Repeater>

    initializeToggleAllButtons(expandAllButton, collapseAllButton, expandEverythingButton);

	initializePaging();

	initializeKeyboardEvents();

	displayCurrentColumnRange();
});

</script>

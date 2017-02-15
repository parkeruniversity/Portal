<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WeightingList.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.WeightingList" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<script>
	$(document).ready(function() {
	    var groupWeight = <%= DisplayParentGroupWeight("null", "") %>;
	    InitializeWeightingList(new GradebookWeightingLocations(), new GradebookWeightingCss(), groupWeight);
	});
</script>

<div id="ControlDisplay" class="weightingListControl initialView" runat="server">

<div class="listWarnings">
	<common:GlobalizedLabel TextKey="MSG_GBK_UNIT_DOES_NOT_HAVE_A_WEIGHT" CssClass="weightMissingDisplay warningText orgUnitText orgHeaderText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_TYPE_DOES_NOT_HAVE_A_WEIGHT" CssClass="weightMissingDisplay warningText orgTypeText orgHeaderText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_ASSIGNMENT_DOES_NOT_HAVE_A_WEIGHT" CssClass="weightMissingDisplay warningText assignmentText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_UNIT_MISSING_ASSIGNMENT_WEIGHT" CssClass="weightItemMissingDisplay warningText orgUnitText orgHeaderText" runat="server" />
	<common:GlobalizedLabel TextKey="MSG_GBK_TYPE_MISSING_ASSIGNMENT_WEIGHT" CssClass="weightItemMissingDisplay warningText orgTypeText orgHeaderText" runat="server" />
</div>

<common:StyledGridView ID="ItemWeightGrid" ShowHeader="true" ShowFooter="true" CssClass="itemWeightList gradeList" runat="server">
<Columns>
	<asp:TemplateField>

		<HeaderStyle CssClass="extraCreditColumn" />
		<ItemStyle CssClass="extraCreditColumn" />
		<ItemTemplate>
			<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/star.png" AlternateTextKey="TXT_EXTRA_CREDIT" runat="server" /> 
		</ItemTemplate>
		<FooterStyle CssClass="extraCreditColumn" />

	</asp:TemplateField>
	<asp:TemplateField>

		<HeaderStyle CssClass="itemNameColumn" />
		<HeaderTemplate>
			<common:GlobalizedLabel TextKey="HDR_UNIT" CssClass="orgUnitText orgHeaderText" runat="server" />
			<common:GlobalizedLabel TextKey="HDR_TYPE" CssClass="orgTypeText orgHeaderText" runat="server" />
			<common:GlobalizedLabel TextKey="HDR_ASSIGNMENT" CssClass="assignmentText" runat="server" />
		</HeaderTemplate>

		<ItemStyle CssClass="itemNameColumn" />
		<ItemTemplate>
			<div>
				<asp:HyperLink ID="ItemNameLink" CssClass="orgHeaderText" runat="server" />
				<asp:Label ID="ItemNameDisplay" CssClass="assignmentText" runat="server" />
			</div>
		</ItemTemplate>

		<FooterStyle CssClass="itemNameColumn" />
		<FooterTemplate>
			<common:GlobalizedLabel TextKey="MSG_GBK_THIS_IS_YOUR_BREAKDOWN" CssClass="introText" runat="server" />
			<div class="saveButton">
				<common:GlobalizedButton ID="SaveWeightsButton" TextKey="TXT_SAVE_CHANGES" CommandName="SaveWeights" runat="server" />
			</div>
			<common:GlobalizedLabel TextKey="MSG_GBK_WEIGHTS_MUST_ADD_UP" CssClass="invalidTotalDisplay" runat="server" />
			<common:GlobalizedLabel TextKey="TXT_PLEASE_ENTER_THE_MISSING_VALUE" CssClass="weightMissingDisplay warningText" runat="server" />
			<common:GlobalizedLinkButton ID="ResetButton" TextKey="TXT_RESET" CommandName="ResetWeights" CssClass="resetButton" runat="server" />
		</FooterTemplate>

	</asp:TemplateField>
	<asp:TemplateField>

		<HeaderStyle CssClass="pointsColumn" />
		<HeaderTemplate>
			<common:GlobalizedLabel TextKey="HDR_POINTS" runat="server" />
		</HeaderTemplate>

		<ItemStyle CssClass="pointsColumn" />
		<ItemTemplate>
			<asp:Label ID="PointsDisplay" runat="server" />
		</ItemTemplate>

		<FooterStyle CssClass="pointsColumn" />
		<FooterTemplate>
			<asp:Label ID="PointsTotalDisplay" runat="server" />
		</FooterTemplate>

	</asp:TemplateField>
	<asp:TemplateField>

		<HeaderStyle CssClass="weightColumn" />
		<HeaderTemplate><common:GlobalizedLabel TextKey="HDR_WEIGHT" runat="server" /></HeaderTemplate>

		<ItemStyle CssClass="weightColumn" />
		<ItemTemplate>
			<common:NumberValidator ControlToValidate="WeightInput" DecimalPlaces="2" runat="server" />
			<asp:TextBox ID="WeightInput" Columns="3" MaxLength="5" CssClass="weightEntry" runat="server" /><!--
			--><asp:Label ID="WeightDisplay" CssClass="weightDisplay" runat="server" /><!--
			-->%<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/chart_pie_error.png"
					AlternateTextKey="TXT_INVALID_WEIGHT" CssClass="weightMissingDisplay" runat="server" />
		</ItemTemplate>

		<FooterStyle CssClass="weightColumn" />
		<FooterTemplate>
			<div id="WeightTotal" class="dynamicTotal"></div>
			<div class="totalDisplay staticTotal">100%</div>
		</FooterTemplate>

	</asp:TemplateField>
	<asp:TemplateField>

		<HeaderStyle CssClass="finalPercentColumn" />
		<HeaderTemplate>
			<common:GlobalizedLabel TextKey="HDR_FINAL_GRADE_%" runat="server" />
		</HeaderTemplate>

		<ItemStyle CssClass="finalPercentColumn" />
		<ItemTemplate>
			<div id="FinalPercent<%# Container.DataItemIndex %>"></div>
		</ItemTemplate>

		<FooterStyle CssClass="finalPercentColumn" />
		<FooterTemplate>
			<div id="FinalTotalPercent" class="dynamicTotal"></div>
			<div class="staticTotal"><%= DisplayParentGroupWeight("", "%") %></div>
		</FooterTemplate>

	</asp:TemplateField>
</columns>
</common:StyledGridView>

<div id="ExtraCreditPanel" class="extraCreditPanel" runat="server">
	<common:GlobalizedLabel TextKey="HDR_EXTRA_CREDIT_UNITS" CssClass="headerText orgHeaderText orgUnitText" runat="server" />
	<common:GlobalizedLabel TextKey="HDR_EXTRA_CREDIT_TYPES" CssClass="headerText orgHeaderText orgTypeText" runat="server" />
	<common:GlobalizedLabel TextKey="HDR_EXTRA_CREDIT_ASSIGNMENTS" CssClass="headerText assignmentText" runat="server" />

	<common:StyledGridView ID="ExtraCreditGrid" ShowHeader="false" ShowFooter="true" CssClass="extraCreditList gradeList" runat="server">
	<Columns>
		<asp:TemplateField>

			<HeaderStyle CssClass="extraCreditColumn" />
			<ItemStyle CssClass="extraCreditColumn" />
			<ItemTemplate>
				<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/star.png" AlternateTextKey="TXT_EXTRA_CREDIT" runat="server" /> 
			</ItemTemplate>
			<FooterStyle CssClass="extraCreditColumn" />

		</asp:TemplateField>
		<asp:TemplateField>

			<ItemStyle CssClass="itemNameColumn" />
			<ItemTemplate>
				<div>
					<asp:Literal ID="ItemUniqueID" Visible="false" runat="server" />
					<asp:HyperLink ID="ItemNameLink" CssClass="orgHeaderText" runat="server" />
					<asp:Label ID="ItemNameDisplay" CssClass="assignmentText" runat="server" />
				</div>
			</ItemTemplate>

			<FooterStyle CssClass="itemNameColumn" />
			<FooterTemplate>
				<common:GlobalizedLabel TextKey="MSG_GBK_EXTRA_CREDIT_UNITS_NOTE" CssClass="introText orgHeaderText orgUnitText" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_EXTRA_CREDIT_TYPES_NOTE" CssClass="introText orgHeaderText orgTypeText" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_EXTRA_CREDIT_ASSIGNMENTS_NOTE_UNIT" CssClass="introText assignmentText orgUnitText" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_EXTRA_CREDIT_ASSIGNMENTS_NOTE_TYPE" CssClass="introText assignmentText orgTypeText" runat="server" />
				<common:GlobalizedLabel TextKey="MSG_GBK_EXTRA_CREDIT_ASSIGNMENTS_NOTE" CssClass="introText assignmentText allAssignmentsText" runat="server" />
			</FooterTemplate>

		</asp:TemplateField>
		<asp:TemplateField>

			<HeaderStyle CssClass="pointsColumn" />
			<HeaderTemplate>
				<common:GlobalizedLabel TextKey="HDR_POINTS" runat="server" />
			</HeaderTemplate>

			<ItemStyle CssClass="pointsColumn" />
			<ItemTemplate>
				<asp:Label ID="PointsDisplay" runat="server" />
			</ItemTemplate>

			<FooterStyle CssClass="pointsColumn" />
			<FooterTemplate>
				<asp:Label ID="PointsTotalDisplay" runat="server" />
			</FooterTemplate>

		</asp:TemplateField>
		<asp:TemplateField>

			<ItemStyle CssClass="weightColumn" />
			<ItemTemplate>
				<common:NumberValidator ControlToValidate="WeightInput" DecimalPlaces="2" runat="server" />
				+<!--
				--><asp:TextBox ID="WeightInput" Columns="3" MaxLength="5" CssClass="weightEntry manualWeightingText" runat="server" /><!--
				--><asp:Label ID="WeightDisplay" CssClass="weightDisplay automaticWeightingText" runat="server" /><!--
				-->%
			</ItemTemplate>

			<FooterStyle CssClass="weightColumn" />
			<FooterTemplate>
				<div id="extraCreditTotal" class="totalDisplay"></div>
			</FooterTemplate>

		</asp:TemplateField>
		<asp:TemplateField>

			<ItemStyle CssClass="finalPercentColumn" />
			<ItemTemplate>
				<div id="FinalExtraPercent<%# Container.DataItemIndex %>"></div>
			</ItemTemplate>

			<FooterStyle CssClass="finalPercentColumn" />
			<FooterTemplate>
				<div id="FinalTotalExtraPercent"></div>
			</FooterTemplate>

		</asp:TemplateField>
	</columns>
	</common:StyledGridView>
</div>

</div>

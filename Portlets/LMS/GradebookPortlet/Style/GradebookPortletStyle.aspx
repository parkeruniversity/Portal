<%@ Page Language="C#"  ContentType="text/css" EnableViewState="false"   AutoEventWireup="true" CodeBehind="GradebookPortletStyle.aspx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Style.GradebookPortletStyle" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.CourseworkPortlet.Utils" %>
@import url('<%= ResolveUrl("~/Portlets/LMS/Common/Style/LmsCommonStyle.aspx") %>');

.gradebookPortlet .portletScreen
{
	margin: 10px;
}

.gradebookPortlet .screenFooter
{
	height: 20px;
	clear: both;
}

.gradebookPortlet .headerText
{
	display: block;
	font-size: 120%;
	font-weight: bold;
	padding-bottom: 5px;
}

.gradebookPortlet .endFloat
{
	clear: both;
}

.gradebookPortlet .roundedTextButton
{
	padding: 8px;
	width: 120px;
	font-size: 110%;
	color: Black;
	text-decoration: none;
	border: solid 1px #0d004c;
	text-align: center;
	display: block;
	float: left;
	border-radius: 8px;
}

.gradebookPortlet .linkButton
{
    text-decoration: underline;
    cursor: pointer;
    color: blue;
}

.gradebookPortlet .linkable
{
    cursor: pointer;
}

.gradebookPortlet .helpLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/help.png")%>) no-repeat 0 0;
}

.gradebookPortlet .disabledLink
{
	color: black;
}

.gradebookPortlet .hint
{
	font-size: 100%;
}

.gradebookPortlet .pageFooter,
.gradebookPortlet .controlFooter
{
	clear: both;
}

.gradebookPortlet .modalDiv #innerModal>p
{
	margin: 10px;
}


/* Full Gradebook Grid Control */

.gradebookPortlet .fullGradebookGrid tr.superheaderRow>th
{
	background-color: #EEEEEE;
}

.gradebookPortlet .fullGradebookGrid,
.gradebookPortlet .fullGradebookGrid>div
{
	display: inline;
}

.gradebookPortlet .fullGradebookGrid .studentColumn
{
	width: 150px;
	min-width: 150px;
}

.gradebookPortlet .fullGradebookGrid .gradeItemColumn
{
	width: 130px;
	min-width: 130px;
}

.gradebookPortlet .fullGradebookGrid .gradeItemColumn .droppedGrade
{
	color: #545454;
	font-style: italic;
}

.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.gradeItemColumn.altColumn
{
	background-color: #e8f5ff;
}

.gradebookPortlet .fullGradebookGrid tbody>tr.alt:hover>td,
.gradebookPortlet .fullGradebookGrid tbody>tr.alt:hover>td.gradeItemColumn.altColumn
{
	background-color: #cbe2f4;
}

.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.studentColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.hoverColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.hoverColumn.altColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr.alt:hover>td.hoverColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr.alt:hover>td.hoverColumn.altColumn
{
	background-color: #e6ffe2;
}

.gradebookPortlet .fullGradebookGrid thead>tr>th.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid thead>tr>th.gradeItemColumn.hoverColumn.altColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.gradeItemColumn.altColumn,
.gradebookPortlet .fullGradebookGrid tfoot>tr>td.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid tfoot>tr>td.gradeItemColumn.hoverColumn.altColumn
{
	border-top: solid 2px #003663;
	border-bottom: solid 2px #003663;
}

.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td:first-child,
.gradebookPortlet .fullGradebookGrid tr>th.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid tr>th.gradeItemColumn.hoverColumn.altColumn,
.gradebookPortlet .fullGradebookGrid tr>td.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid tr>td.gradeItemColumn.hoverColumn.altColumn
{
	border-left: solid 2px #003663;
}

.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.studentColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td:last-child,
.gradebookPortlet .fullGradebookGrid tr>th.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid tr>th.gradeItemColumn.hoverColumn.altColumn,
.gradebookPortlet .fullGradebookGrid tr>td.gradeItemColumn.hoverColumn,
.gradebookPortlet .fullGradebookGrid tr>td.gradeItemColumn.hoverColumn.altColumn
{
	border-right: solid 2px #003663;
}

.gradebookPortlet .fullGradebookGrid .instructions
{
	font-style: italic;
}

.gradebookPortlet .fullGradebookGrid thead>tr.superheaderRow>th.altColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr.alt>td.altColumn,
.gradebookPortlet .fullGradebookGrid tfoot>tr>td.altColumn
{
	background-color: #DDDDDD;
}

.gradebookPortlet .fullGradebookGrid tbody>tr>td.altColumn
{
	background-color: #EEEEEE;
}

.gradebookPortlet .fullGradebookGrid .finalGradeColumn
{
	white-space: nowrap;
}

.gradebookPortlet .fullGradebookGrid .finalGradeColumn .gradeLetter
{
	font-weight: bold;
}

.gradebookPortlet .fullGradebookGrid .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn
{
	padding: 0px;
	margin: 0px;
	width: 15px;
	min-width: 15px;
	border: solid 2px #367CB4;
	text-decoration: none;
}

.gradebookPortlet .fullGradebookGrid .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn
{
	border-right-width: 3px;
}

.gradebookPortlet .fullGradebookGrid .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn
{
	border-left-width: 3px;
}

.gradebookPortlet .fullGradebookGrid tr.superheaderRow>th.previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tr.superheaderRow>th.nextButtonColumn,
.gradebookPortlet .fullGradebookGrid .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn
{
	background-color: #E9F8FD;
	background-repeat: no-repeat;
	background-position: center;
}

.gradebookPortlet .fullGradebookGrid thead .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid thead .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn
{
	border-bottom: 0px;
}

.gradebookPortlet .fullGradebookGrid tbody .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tfoot .previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tfoot .nextButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn
{
	border-top: 0px;
}

.gradebookPortlet .fullGradebookGrid .previousButtonColumn
{
	background-image: url(<%= this.GetIconURL("gbk-scroll-left.png")%>);
}

.gradebookPortlet .fullGradebookGrid .nextButtonColumn
{
	background-image: url(<%= this.GetIconURL("gbk-scroll-right.png")%>);
}

.gradebookPortlet .fullGradebookGrid tr.superheaderRow>th.previousButtonColumn.disabled,
.gradebookPortlet .fullGradebookGrid tr.superheaderRow>th.nextButtonColumn.disabled,
.gradebookPortlet .fullGradebookGrid .previousButtonColumn.disabled,
.gradebookPortlet .fullGradebookGrid .previousButtonColumn.disabled:hover,
.gradebookPortlet .fullGradebookGrid .nextButtonColumn.disabled,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.previousButtonColumn.disabled,
.gradebookPortlet .fullGradebookGrid tbody>tr:hover>td.nextButtonColumn.disabled
{
	border-width: 1px;
	background-color: #EBEBEB;
	border-color: #BABABA;
	cursor: default;
}

.gradebookPortlet .fullGradebookGrid .previousButtonColumn.disabled
{
	background-image: url(<%= this.GetIconURL("gbk-scroll-left-disabled.png")%>);
}

.gradebookPortlet .fullGradebookGrid .nextButtonColumn.disabled
{
	background-image: url(<%= this.GetIconURL("gbk-scroll-right-disabled.png")%>);
}


/* Nav Bar Control */

.gradebookPortlet .navBar
{
	padding: 0px;
	margin: 0px;
	overflow: hidden;
}

.gradebookPortlet .navBar #NavTabs
{
	margin: 0px;
	padding: 0px;
	display: block;
	border-bottom: solid 1px #B2B2B2;
	background-color: #efefef;
	height: 30px;
}

.gradebookPortlet .navBar ul#NavTabs>li
{
	padding: 0px;
	margin: 0px;
	display: block;
}

.gradebookPortlet .navBar ul#NavTabs>li.regularTab
{
	border-right: solid 1px #B2B2B2;
	float: left;
}

.gradebookPortlet .navBar ul#NavTabs>li.customTab
{
	float: right;
	height: 30px;
	line-height: 30px;
}

.gradebookPortlet .navBar ul#NavTabs>li.regularTab a
{
	text-decoration: none;
	padding: 0px;
	margin: 0px;
	height: 30px;
	width: 30px;
	text-align: center;
	display: block;
}

.gradebookPortlet .navBar ul#NavTabs>li img
{
	display: block;
	margin: 0px;
	padding; 0px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 8px;
}

.gradebookPortlet .navBar.hideStudentListTab #StudentListTab,
.gradebookPortlet .navBar.hideFullGradebookTab #FullGradebookTab,
.gradebookPortlet .navBar.hideEvaluationsTab #EvaluationsTab,
.gradebookPortlet .navBar.hideWeightingTab #WeightingTab,
.gradebookPortlet .navBar.hideSettingsTab #SettingsTab,
.gradebookPortlet .navBar.hideGradeLetterTab #GradeLetterTab
{
	display: none;
}

.gradebookPortlet .navBar.fullGradebookNavBar #FullGradebookTab,
.gradebookPortlet .navBar.evaluationsNavBar #EvaluationsTab,
.gradebookPortlet .navBar.lowGradeSettingsNavBar #SettingsTab,
.gradebookPortlet .navBar.letterGradeAdminNavBar #GradeLetterTab,
.gradebookPortlet .navBar.weightingNavBar.hideExpandedTab #WeightingTab
{
	background-color: #FFFFFF;
	height: 31px;
}

.gradebookPortlet .navBar.warning.fullGradebookNavBar #FullGradebookTab,
.gradebookPortlet .navBar.warning.evaluationsNavBar #EvaluationsTab,
.gradebookPortlet .navBar.warning.lowGradeSettingsNavBar #SettingsTab,
.gradebookPortlet .navBar.warning.letterGradeAdminNavBar #GradeLetterTab,
.gradebookPortlet .navBar.warning.weightingNavBar.hideExpandedTab #WeightingTab
{
	background-color: #FFF899;
}

.gradebookPortlet .navBar.attendanceDetailNavBar #EvaluationsTab,
.gradebookPortlet .navBar.evaluationDetailNavBar #EvaluationsTab
{
	background-color: #FFF6E4;
	height: 31px;
}

.gradebookPortlet .navBar.weightingNavBar #WeightingTab
{
	background-color: #E5FFD4;
	height: 31px;
}

.gradebookPortlet .navBar #DetailsPanel
{
	display: none;
	clear: both;
	background-color: #EFEFEF;
	border-bottom: solid 1px #B2B2B2;
	width: 100%;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

.gradebookPortlet .navBar .customDetailsPanel
{
	clear: both;
	background-color: #EFEFEF;
	border-bottom: solid 1px #B2B2B2;
	width: 100%;
	margin: 0px;
	padding: 10px;
	overflow: hidden;
}

.gradebookPortlet .navBar.warning .customDetailsPanel
{
	background-color: #FFF899;
}

.gradebookPortlet .navBar.attendanceDetailNavBar #DetailsPanel,
.gradebookPortlet .navBar.evaluationDetailNavBar #DetailsPanel,
.gradebookPortlet .navBar.weightingNavBar #DetailsPanel
{
	display: block;
}

.gradebookPortlet .navBar ul#DetailsPanel>li
{
	padding: 10px;
	margin: 0px;
	float: left;
	border-right: solid 1px #B2B2B2;
}

.gradebookPortlet .navBar .navigationLink
{
	float: right;
	margin: 10px;
	display: block;
	padding-right: 10px;
}

.gradebookPortlet .navBar .generalWeightingLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/chart_pie_edit.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .navBar .gradeWeightingLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("arrow-left.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .navBar #EvaluationDetails,
.gradebookPortlet .navBar #WeightingMethodDetails,
.gradebookPortlet .navBar #EvaluationDetailWindow
{
	display: none;
}

.gradebookPortlet .navBar ul#DetailsPanel>li#EvaluationDetails
{
	background-color: #FFF6E4;
	padding-right: 30px;
}

.gradebookPortlet .navBar.evaluationDetailNavBar #EvaluationDetails,
.gradebookPortlet .navBar.attendanceDetailNavBar #EvaluationDetails,
.gradebookPortlet .navBar.evaluationDetailNavBar #EvaluationDetailWindow,
.gradebookPortlet .navBar.attendanceDetailNavBar #EvaluationDetailWindow
{
	display: block;
}

.gradebookPortlet .navBar #EvaluationDetails .evaluationHeader
{
	font-weight: bold;
	display: block;
}

.gradebookPortlet .navBar.evaluationDetailNavBar #EvaluationDetails .evaluationHeader
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/medal_gold_1.png")%>) no-repeat 0 0;
}

.gradebookPortlet .navBar.attendanceDetailNavBar #EvaluationDetails .evaluationHeader
{
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL("16/calendar.png")%>) no-repeat 0 0;
}

.gradebookPortlet .navBar.weightingNavBar #WeightingMethodDetails
{
	display: block;
}

.gradebookPortlet .navBar.hideExpandedTab #DetailsPanel
{
	display: none;
}

.gradebookPortlet .navBar #WeightingMethodDetails
{
	background-color:  #E5FFD4;
	width: 100%;
}

.gradebookPortlet .navBar #WeightingMethodDetails .weightingMethodDisplay
{
	float: left;
}

.gradebookPortlet .navBar #WeightingMethodDetails .weightingMethodDisplay .label
{
	display: block;
	padding-bottom: 2px;
}

.gradebookPortlet .navBar #WeightingMethodDetails .weightingMethodDisplay .textDisplay
{
	display: block;
	font-weight: bold;
}

.gradebookPortlet .navBar .generalWeightingLink,
.gradebookPortlet .navBar .gradeWeightingLink,
.gradebookPortlet .navBar.generalWeightingNavBar.gradingRulesManualEntry .gradeWeightingLink
{
	display: none;
}

.gradebookPortlet .navBar.gradeWeightingNavBar .generalWeightingLink,
.gradebookPortlet .navBar.orgWeightingNavBar .generalWeightingLink,
.gradebookPortlet .navBar.generalWeightingNavBar .gradeWeightingLink
{
	display: block;
}

.gradebookPortlet .navBar ul#DetailsPanel>li#EvaluationDetailWindow
{
	background-color: #EFEFEF;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .buttonPanel
{
	padding-bottom: 10px;
	border-bottom: dashed 1px #BABABA;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .buttonPanel a
{
	margin-left: 20px;
	margin-right: 20px;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .buttonPanel .editButton
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("edit.gif")%>) no-repeat 0 0;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .buttonPanel .deleteButton
{
	padding-left: 16px;
	background: transparent url(<%= this.GetIconURL("delete.gif")%>) no-repeat 0 0;
}

.gradebookPortlet .navBar #EvaluationDetailWindow ul.detailsPanel
{
	margin-top: 5px;
}

.gradebookPortlet .navBar #EvaluationDetailWindow ul.detailsPanel>li
{
	clear: both;
	padding-top: 5px;
}

.gradebookPortlet .navBar #EvaluationDetailWindow ul.detailsPanel>li>*
{
	display: inline-block;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .detailsPanel .label
{
	float: left;
	width: 80px;
	text-align: right;
	padding-right: 10px;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .detailsPanel .value
{
	width: 320px;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .detailsPanel>.name .value
{
	font-weight: bold;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .buttonPanel .deleteButton,
.gradebookPortlet .navBar.hideEvaluationDescription #EvaluationDetailWindow .detailsPanel>.description,
.gradebookPortlet .navBar #EvaluationDetailWindow .detailsPanel>.settings
{
	display: none;
}

.gradebookPortlet .navBar.showEvaluationDelete #EvaluationDetailWindow .buttonPanel .deleteButton
{
	display: inline;
}
.gradebookPortlet .navBar.showEvaluationSettings #EvaluationDetailWindow .detailsPanel>.settings
{
	display: block;
}

.gradebookPortlet .navBar #EvaluationDetailWindow .detailsPanel .points .value strong
{
	font-weight: normal;
}

.gradebookPortlet .navBar.showEvaluationSettings #EvaluationDetailWindow .detailsPanel>.settings,
.gradebookPortlet .navBar.showEvaluationSettings #EvaluationDetailWindow .detailsPanel>.settings ul.value
{
	padding-bottom: 0px;
	margin-bottom: 0px;
}

.gradebookPortlet .navBar.showEvaluationSettings #EvaluationDetailWindow .detailsPanel>.settings ul.value>li
{
	padding: 0px;
	margin-bottom: 10px;
}


/* Weighting List Control */

.gradebookPortlet .weightingListControl.groupedByOrganizationUnit .orgTypeText,
.gradebookPortlet .weightingListControl.groupedByOrganizationUnit.allowWeightEntry.missingWeight .orgTypeText,
.gradebookPortlet .weightingListControl.groupedByOrganizationUnit .assignmentText,
.gradebookPortlet .weightingListControl.groupedByOrganizationUnit.allowWeightEntry.missingWeight .assignmentText,
.gradebookPortlet .weightingListControl.groupedByOrganizationType .orgUnitText,
.gradebookPortlet .weightingListControl.groupedByOrganizationType.allowWeightEntry.missingWeight .orgUnitText,
.gradebookPortlet .weightingListControl.groupedByOrganizationType .assignmentText,
.gradebookPortlet .weightingListControl.groupedByOrganizationType.allowWeightEntry.missingWeight .assignmentText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments .orgHeaderText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments .orgTypeText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments .orgUnitText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments.allowWeightEntry.missingWeight .orgHeaderText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments.allowWeightEntry.missingWeight .orgTypeText,
.gradebookPortlet .weightingListControl.groupedByAllAssignments.allowWeightEntry.missingWeight .orgUnitText,
.gradebookPortlet .weightingListControl.groupedByAssignment .allAssignmentsText,
.gradebookPortlet .weightingListControl.groupedByAssignment.allowWeightEntry.missingWeight .allAssignmentsText,
.gradebookPortlet .weightingListControl.groupedByAssignment .orgHeaderText,
.gradebookPortlet .weightingListControl.groupedByAssignment.allowWeightEntry.missingWeight .orgHeaderText,
.gradebookPortlet .weightingListControl.hidePoints th.pointsColumn,
.gradebookPortlet .weightingListControl.hidePoints td.pointsColumn,
.gradebookPortlet .weightingListControl.hideFinalPercent th.finalPercentColumn,
.gradebookPortlet .weightingListControl.hideFinalPercent td.finalPercentColumn
{
	display: none;
}

.gradebookPortlet .weightingListControl .listWarnings .weightMissingDisplay.warningText,
.gradebookPortlet .weightingListControl .listWarnings .weightItemMissingDisplay.warningText
{
	padding: 10px 10px 10px 32px;
	border: solid 2px #0d004c;
	margin: 10px 0px;
	background: #ecf3ff url(<%= this.GetIconURL("16/chart_pie_error.png")%>) no-repeat 10px 10px;
	width: 100%;
}

.gradebookPortlet .weightingListControl table.itemWeightList>tbody img.weightMissingDisplay,
.gradebookPortlet .weightingListControl table.extraCreditList>tbody img.weightMissingDisplay
{
	padding-left: 10px;
}

.gradebookPortlet .weightingListControl table.itemWeightList,
.gradebookPortlet .weightingListControl table.extraCreditList
{
	width: 100%;
}

.gradebookPortlet .weightingListControl td.itemNameColumn
{
	width: 100%;
	padding: 5px 10px;
}

.gradebookPortlet .weightingListControl td.pointsColumn
{
	padding: 0px 10px;
}

.gradebookPortlet .weightingListControl .missingWeight
{
	background-color: #fff9ab;
}

.gradebookPortlet .weightingListControl tr.missingChildItemWeight>td.itemNameColumn
{
	background-color: #fff9ab;
}

.gradebookPortlet .weightingListControl tr.missingChildItemWeight>td.itemNameColumn>div
{
	background: transparent url(<%= this.GetIconURL("16/chart_pie_error.png")%>) no-repeat right 0;
	min-height: 15px;
}

.gradebookPortlet .weightingListControl table.itemWeightList>tfoot>tr>td
{
	height: 30px;
	padding: 10px;
}

.gradebookPortlet .weightingListControl table.itemWeightList>tfoot>tr>td.itemNameColumn,
.gradebookPortlet .weightingListControl td.weightColumn
{
	white-space: nowrap;
}

.gradebookPortlet .weightingListControl .itemWeightList>tfoot .introText,
.gradebookPortlet .weightingListControl .itemWeightList>tfoot .weightMissingText,
.gradebookPortlet .weightingListControl .itemWeightList>tfoot .invalidTotalText,
.gradebookPortlet .weightingListControl .extraCreditList>tfoot .introText
{
	font-style: italic;
}

.gradebookPortlet .weightingListControl .itemWeightList>tfoot .weightMissingDisplay.warningText
{
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL("16/chart_pie_error.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .weightingListControl .itemWeightList>tfoot .resetButton
{
	margin-left: 20px;
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/arrow_rotate_anticlockwise.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .weightingListControl table.itemWeightList>tfoot .saveButton
{
	display: inline;
	padding-left: 25px;
	background: transparent url(<%= this.GetIconURL("arrow-right-big.png")%>) no-repeat 0px 0px;
	padding-bottom: 10px;
}

/* Enable or disable weight entry/display fields. */
.gradebookPortlet .weightingListControl.allowWeightEntry td.weightColumn .weightDisplay,
.gradebookPortlet .weightingListControl input.weightEntry,
.gradebookPortlet .weightingListControl.allowWeightEntry .staticTotal,
.gradebookPortlet .weightingListControl .dynamicTotal
{
	display: none;
}
.gradebookPortlet .weightingListControl.allowWeightEntry input.weightEntry,
.gradebookPortlet .weightingListControl.allowWeightEntry .dynamicTotal
{
	display: inline;
}
.gradebookPortlet .weightingListControl table.itemWeightList td.weightColumn,
.gradebookPortlet .weightingListControl table.itemWeightList td.finalPercentColumn
{
	padding-left: 10px;
	padding-right: 10px;
}
.gradebookPortlet .weightingListControl.allowWeightEntry table.itemWeightList td.weightColumn
{
	padding-left: 5px;
	padding-right: 5px;
}
.gradebookPortlet .weightingListControl table.itemWeightList *.finalPercentColumn
{
	white-space: nowrap;
}

/* By default, only show certain elements. */
.gradebookPortlet .weightingListControl table.itemWeightList>tfoot .introText,
.gradebookPortlet .weightingListControl .invalidTotalDisplay,
.gradebookPortlet .weightingListControl .weightMissingDisplay,
.gradebookPortlet .weightingListControl .weightItemMissingDisplay,
.gradebookPortlet .weightingListControl.initialView table.itemWeightList>tfoot .saveButton,
.gradebookPortlet .weightingListControl.initialView table.itemWeightList>tfoot .resetButton
{
	display: none;
}
.gradebookPortlet .weightingListControl.initialView table.itemWeightList>tfoot .introText
{
	display: inline;
}

/* If a weight field is blank, show related messages, hide some buttons, and set warning background colors. */
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight table.itemWeightList>tbody .weightMissingDisplay,
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight table.itemWeightList>tfoot .introText,
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight table.itemWeightList .saveButton
{
	display: none;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight .weightMissingDisplay,
.gradebookPortlet .weightingListControl.missingItemWeight .weightItemMissingDisplay
{
	display: block;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight table.itemWeightList>tbody>tr.missingWeight .weightMissingDisplay,
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight table.itemWeightList>tfoot .weightMissingDisplay
{
	display: inline;
}
.gradebookPortlet .weightingListControl.allowWeightEntry .itemWeightList>tbody>tr.missingWeightRow .weightColumn,
.gradebookPortlet .weightingListControl.allowWeightEntry.missingWeight .itemWeightList>tfoot>tr
{
	background-color: #fff9ab;
}

/* If the values don't add up to 100% AND we're not already showing other messages, show the 100% message. */
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight table.itemWeightList>tfoot>tr
{
	background-color: #fff9ab;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight .invalidTotalDisplay
{
	display: inline;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight.missingWeight .invalidTotalDisplay,
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight table.itemWeightList>tfoot .introText,
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight table.itemWeightList>tfoot .saveButton
{
	display: none;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight table.itemWeightList>tfoot>tr>td.weightColumn
{
	color: #790000;
	font-weight: bold;
}
.gradebookPortlet .weightingListControl.allowWeightEntry.invalidTotalWeight.missingWeight table.itemWeightList>tfoot>tr>td.weightColumn
{
	color: black;
	font-weight: normal;
}

.gradebookPortlet .weightingListControl .extraCreditPanel .headerText
{
	font-size: 100%;
	padding: 5px 10px;
	background-color: #008700;
	color: #FFFFFF;
	font-weight: normal;
}

.gradebookPortlet .weightingListControl .extraCreditPanel
{
	border: solid 1px #006600;
}

.gradebookPortlet .weightingListControl table.itemWeightList td.extraCreditColumn,
.gradebookPortlet .weightingListControl table.itemWeightList th.extraCreditColumn
{
	display: none;
}
.gradebookPortlet .weightingListControl.allExtraCredit table.itemWeightList td.extraCreditColumn,
.gradebookPortlet .weightingListControl.allExtraCredit table.itemWeightList th.extraCreditColumn
{
	display: table-cell;
}
.gradebookPortlet .weightingListControl table.itemWeightList>tbody>tr>td.extraCreditColumn,
.gradebookPortlet .weightingListControl table.extraCreditList>tbody>tr>td.extraCreditColumn
{
	background-color: #f4ffcc;
}

.gradebookPortlet .weightingListControl .extraCreditList>tfoot>tr
{
	background-color: #f4ffcc;
}

.gradebookPortlet .weightingListControl .extraCreditList>tfoot #extraCreditTotal
{
	color: #006600;
	font-weight: bold;
}


/* Main Student List */

.gradebookPortlet .mainStudentListScreen .studentListColumn,
.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn
{
	vertical-align: top;
}

.gradebookPortlet .mainStudentListScreen .studentListColumn h4
{
	font-size: 120%;
	margin-bottom: 0px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.gradebookPortlet .mainStudentListScreen .studentListColumn .noStudentsText
{
	width: 400px;
	display: block;
	padding-top: 10px;
}

.gradebookPortlet .mainStudentListScreen .studentListColumn table
{
	width: 100%;
}

.gradebookPortlet .mainStudentListScreen .studentListColumn .studentNameColumn
{
	width: 100%;
}

.gradebookPortlet .mainStudentListScreen .studentListColumn .gradeColumn
{
	white-space: nowrap;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn
{
	width: 300px;
	padding: 0px 0px 0px 30px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .missingWeightsPanel
{
	margin-top: 5px;
	border: solid 2px #1851AD;
	background-color: #FFFFE4;
	padding: 8px 12px 10px 12px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .missingWeightsPanel .gbkHeader
{
	font-size: 110%;
	color: #A90000;
	font-weight: bold;
	display: block;
	padding-bottom: 10px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .missingWeightsPanel .missingWeight
{
	display: block;
	padding: 5px 0px 10px 35px;
	background: transparent url(<%= this.GetIconURL("16/chart_pie_error.png")%>) no-repeat 15px 5px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .fullGradebookLink
{
	display: block;
	font-weight: bold;
	border: solid 1px #0d004c;
	margin: 10px 0px;
	padding: 10px 10px 10px 35px;
	background: #ecf3ff url(<%= this.GetIconURL("16/book_open.png")%>) no-repeat 10px 10px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .editAllGradesLink
{
	display: block;
	font-weight: bold;
	border: solid 1px #0d004c;
	margin: 10px 0px;
	padding: 10px 10px 10px 35px;
	background: #ecf3ff url(<%= this.GetIconURL("16/calculator_edit.png")%>) no-repeat 10px 10px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel
{
	border: solid 1px black;
	display: block;
	width: 100%;
	background-color: #efefef;
	overflow: hidden;
	margin-top: 20px;
	margin-bottom: 20px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel>*
{
	display: block;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .messageText
{
	border-bottom: solid 1px black;
	padding: 10px 10px 10px 50px;
	background: #ecf3ff url(<%= this.GetIconURL("32/calendar.png")%>) no-repeat 10px 10px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .includeButton,
.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .doNotIncludeButton,
.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .helpLink
{
	float:left;
	border-right: solid 1px black;
	padding: 7px 20px 8px 30px;
	background-color: #ecf3ff;
	background-position: 10px 7px;
	background-repeat: no-repeat;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .includeButton
{
	color: #008700;
	font-weight: bold;
	text-decoration: none;
	background-image: url(<%= this.GetIconURL("16/tick.png")%>);
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .doNotIncludeButton
{
	color: #464646;
	font-weight: bold;
	text-decoration: none;
	background-image: url(<%= this.GetIconURL("16/cancel.png")%>);
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .attendancePanel .helpLink
{
	border-right: none;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .otherScreensHeader
{
	clear: both;
	display:block;
	padding: 5px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn>ul>li
{
	padding: 2px 5px 3px 20px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .weightingLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/chart_pie.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .evaluationsLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/medal_gold_1.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .letterGradingLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/font.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .mainStudentListScreen .otherFeaturesColumn .submitGradesLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/email_open.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .mainStudentListScreen .pageFooter
{
	height: 30px;
}


/* Weighting Admin Control */

.gradebookPortlet .weightingAdmin
{
	border-top: 1px solid #bbbbbb;
	border-bottom: 1px solid #bbbbbb;
	width: 650px; 
	margin-bottom: 10px;
	background-color: #f3f3f3;
}

.gradebookPortlet .weightingAdmin .selectPanel, 
.gradebookPortlet .weightingAdmin .inactivePanel, 
.gradebookPortlet .weightingAdmin .displayPanel 
{
    min-height: 32px;
	float:right;  
	width: 430px; 
	padding: 10px;
}

.gradebookPortlet .weightingAdmin .selectPanel
{
	background-color: #e6ecf7;
    border-left: 1px solid #376090;
}

.gradebookPortlet .weightingAdmin .selectPanel li a
{
	background-color: #ffffff;
	border: 1px solid #376090;
}

.gradebookPortlet .weightingAdmin .selectPanel li a:hover
{
	color: #003f00;
	border: 1px solid #003f00;
	background-color: #e5ffd4;
}

.gradebookPortlet .weightingAdmin .inactivePanel
{
	background-color: #f3f3f3;
    border-left: 1px solid #bbbbbb;
}

.gradebookPortlet .weightingAdmin .displayPanel
{
	color: #003f00;
	border-left: 1px solid #003f00;
	background-color: #e5ffd4;
}

.gradebookPortlet .weightingAdmin .displayPanel .answer
{
	font-size: 110%;
	margin-right: 20px;
}

.gradebookPortlet .weightingAdmin .summaryPanel
{
	width: 180px;
	padding: 10px;
}

.gradebookPortlet .weightingAdmin .optionNote
{
	padding: 10px;
	color: #545454;
}


/* Weighting Screens */

.gradebookPortlet .weightingSetupScreen,
.gradebookPortlet .customWeightingScreen
{
	max-width: 600px;
}

.gradebookPortlet .weightingSetupScreen .title,
.gradebookPortlet .customWeightingScreen .title
{
	background: transparent url(<%= this.GetIconURL("32/chart_pie.png")%>) no-repeat 0px 0px;
	padding-left: 40px;
	margin-bottom: 20px;
}

.gradebookPortlet .weightingSetupScreen .title .desc,
.gradebookPortlet .customWeightingScreen .title .desc
{
	display: block;
}

.gradebookPortlet .weightingSetupScreen .options
{
	padding-left: 37px;
}

.gradebookPortlet .weightingSetupScreen .optionItem,
.gradebookPortlet .weightingSetupScreen .optionItemSelected
{
	padding-top: 10px; 
    padding-bottom: 10px;
}

.gradebookPortlet .weightingSetupScreen tr.optionItemSelected>td
{
    background-color: #e5ffd4;
    border-top: 1px solid #9bb49c;
    border-bottom: 1px solid #9bb49c;
}

.gradebookPortlet .weightingSetupScreen .optionLink
{
    font-weight: bold;
}

.gradebookPortlet .weightingSetupScreen table.weightingList td
{
	padding: 12px 0px 12px 10px;
}

.gradebookPortlet .weightingSetupScreen table.weightingList td:first
{
	padding-right: 10px;
}

.gradebookPortlet .weightingSetupScreen .helpMessage
{
	display: block;
	padding: 10px;
}

.gradebookPortlet .weightingSetupScreen .helpMessage .noLink a
{
	color: black;
	text-decoration: none;
}

.gradebookPortlet .customWeightingScreen .savePanel
{
	padding: 10px 20px;
	background-color: #ecf3ff;
	border: solid 1px #0d004c;
	margin-top: 10px;
	margin-bottom: 10px;
}

.gradebookPortlet .customWeightingScreen .savePanel .saveMessage
{
	display: block;
}

.gradebookPortlet .customWeightingScreen .savePanel .weightDescription
{
	display: block;
	font-weight: bold;
	padding-top: 5px;
}

.gradebookPortlet .customWeightingScreen .savePanel .buttonBar
{
	background: transparent url(<%= this.GetIconURL("arrow-right-big.png")%>) no-repeat 0px 22px;
	padding: 20px 0px 0px 30px;
	border: none;
}

.gradebookPortlet .customWeightingScreen .savePanel .buttonBar .resetButton
{
	background: transparent url(<%= this.GetIconURL("16/arrow_rotate_anticlockwise.png")%>) no-repeat 20px 0px;
	padding-left: 40px;
}

.gradebookPortlet .customWeightingScreen .backButton
{
	background: transparent url(<%= this.GetIconURL("arrow-left.png")%>) no-repeat 0px 0px;
	padding-left: 20px;
}


/* Student Detail Screen */

.gradebookPortlet .studentDetailScreen.facultyView .introText,
.gradebookPortlet .studentDetailScreen.studentView .studentName,
.gradebookPortlet .studentDetailScreen.studentView .gradeItemGrid .dropGradeColumn,
.gradebookPortlet .studentDetailScreen.studentView .userPhotoColumn
{
	display: none;
}

.gradebookPortlet .studentDetailScreen .missingWeightsMessage
{
	background: transparent url(<%= this.GetIconURL("32/chart_pie_error.png")%>) no-repeat 0px 0px;
	padding-left: 38px;
	min-height: 30px;
	max-width: 1000px;
}

.gradebookPortlet .studentDetailScreen .attendanceFailureMessage
{
	display: none;
}

.gradebookPortlet .studentDetailScreen .studentName
{
	font-size: 200%;
}

.gradebookPortlet .studentDetailScreen .userPhotoColumn
{
	padding: 15px;
}

.gradebookPortlet .studentDetailScreen .userPhotoColumn .iconBar
{
	white-space:nowrap;
	text-align: center;
}

.gradebookPortlet .studentDetailScreen .userPhotoColumn .mailIcon
{
	display: inline-block;
	padding: 5px;
}

.gradebookPortlet .studentDetailScreen .userPhotoColumn .myInfoIcon
{
	display: inline-block;
	padding: 5px;
}

.gradebookPortlet .studentDetailScreen .userPhotoColumn .exportIcon
{
	display: inline-block;
	padding: 5px;
}

.gradebookPortlet .studentDetailScreen div.feedbackDisplayList
{
	padding-top: 20px;
}

.gradebookPortlet .studentDetailScreen div.facultyFeedbackLink
{
	margin-left: 0px;
}

.gradebookPortlet .studentDetailScreen .finalGradePanel
{
	color: #002469;
	background-color: #ECF4FC;
	border:solid 1px #849DCB;
	padding: 7px 20px 10px 20px;
	margin: 10px;
	width: 180px;
}

.gradebookPortlet .studentDetailScreen .finalGradePanel .finalGradeValue
{
	font-size: 200%;
}

.gradebookPortlet .studentDetailScreen .finalGradePanel .finalGradePoints
{
	font-size: 120%;
	padding-top: 5px;
}

.gradebookPortlet .studentDetailScreen .finalGradePanel .noGrade
{
	font-weight: bold;
	font-size: 75%;
	padding-top: 5px;
	padding-bottom: 5px;
	display:block;
}

.gradebookPortlet .studentDetailScreen .finalGradePanel .gradeLetter
{
	font-weight: bold;
}

.gradebookPortlet .studentDetailScreen.attendanceFailure .finalGradePanel
{
	color: #15489A;
	background-color: #FFF899;
	border-color: #15489A;
}

.gradebookPortlet .studentDetailScreen.attendanceFailure.facultyView .finalGradePanel
{
	background: #FFF899 url(<%= this.GetIconURL("gbk-attendance-failure.png")%>) no-repeat 8px 8px;
	padding: 5px 5px 10px 55px;
}

.gradebookPortlet .studentDetailScreen.attendanceFailure .attendanceFailureMessage
{
	display: block;
	max-width: 400px;
	padding-top: 10px;
}

.gradebookPortlet .studentDetailScreen.studentView .attendanceFailureMessage
{
	background: transparent url(<%= this.GetIconURL("16/error.png")%>) no-repeat 0px 10px;
	padding: 10px 10px 5px 22px;
}

.gradebookPortlet .studentDetailScreen.facultyView .attendanceFailureMessage span
{
	color: #545454;
	font-weight: bold;
}

.gradebookPortlet .studentDetailScreen.facultyView .gradeAccuracyStudentMessage,
.gradebookPortlet .studentDetailScreen.studentView .gradeAccuracyFacultyMessage
{
	display: none;
}

.gradebookPortlet .studentDetailScreen .gradeAccuracyStudentMessage
{
	padding: 10px 0px 5px 0px;
}

.gradebookPortlet .studentDetailScreen .gradeAccuracyFacultyMessage
{
	color: #545454;
	padding: 10px 0px 5px 0px;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage
{
	color: #545454;
	padding-top: 5px;
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/star.png")%>) no-repeat 0px 5px;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage>*
{
	padding-bottom: 5px;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage .modalDiv #modalHeading
{
	background-color: #008700;
	color: #FFFFFF;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage .modalDiv #innerModal
{
	background-color: #f4ffcc;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage .modalDiv .extraCreditAdmin
{
	padding: 5px 10px 5px 50px;
	background: transparent url(<%= this.GetIconURL("32/star.png")%>) no-repeat 5px 5px;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage .modalDiv .extraCreditAdmin>*
{
	padding-top: 5px;
	padding-bottom: 5px;
}

.gradebookPortlet .studentDetailScreen .extraCreditMessage .modalDiv #modalButtons
{
	padding-left: 45px;
}

.gradebookPortlet .studentDetailScreen .gbkSubheader
{
	font-size: 120%;
	font-weight: bold;
	width: 100%;
	border-bottom: solid 1px black;
	display:block;
	margin-bottom: 20px;
	margin-top: 30px;
	clear: both;
}

.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupName,
.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupGrade,
.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupPoints,
.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupBonus
{
	padding-bottom: 5px;
}

.gradebookPortlet .studentDetailScreen .extraCreditGroup .gradeGroupSidebar
{
	background-color: #f4ffcc;
}

.gradebookPortlet .studentDetailScreen .extraCreditGroup .gradeGroupSidebar .groupName
{
	color: #000000;
}

.gradebookPortlet .studentDetailScreen .extraCreditGroup .gradeGroupSidebar .groupBonus
{
	font-size: 120%;
}

.gradebookPortlet .studentDetailScreen .extraCreditGroup .gradeGroupSidebar .groupBonus .bonusValue
{
	font-weight: bold;
}

.gradebookPortlet .studentDetailScreen .gradeList
{
	margin: 10px 10px 40px 10px;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid .gradeNameColumn
{
	max-width: 250px;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid .gradeColumn
{
	white-space: nowrap;
}

.gradebookPortlet .studentDetailScreen .extraCreditGroup .gradeGroupSidebar .groupName,
.gradebookPortlet .studentDetailScreen .gradeItemGrid .gradeColumn .extraCreditText
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/star.png")%>) no-repeat 0 0;
}

.gradebookPortlet .studentDetailScreen .gradeGroupHeader
{
	padding: 0px 0px 3px 0px;
	color: #545454;
}

.gradebookPortlet .studentDetailScreen .gradeGroupHeader>table
{
	margin: 0px;
	padding: 0px;
	width: 100%;
}

.gradebookPortlet .studentDetailScreen .gradeGroupHeader .groupName
{
	font-size: 120%;
	font-weight: bold;
}

.gradebookPortlet .studentDetailScreen .gradeGroupHeader .groupStats
{
	padding-left: 50px;
}

.gradebookPortlet .studentDetailScreen .gradeGroupSidebar
{
	border: solid 1px #545454;
	border-right-width: 0px;
	width:125px;
	background-color: #EFEFEF;
	height: 100%;
	padding:5px;
}

.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupName
{
	color: #8C8C8C;
}

.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupGrade
{
	font-size: 120%;
}

.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupGrade .noGrade,
.gradebookPortlet .studentDetailScreen .gradeGroupSidebar .groupGrade .gradeLetter
{
	font-weight: bold;
}

.gradebookPortlet .studentDetailScreen .gradeGroupItemList
{
	height: 100%;
	border: solid 1px #545454;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid
{
	width: 100%;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid .droppedGrade
{
	color: #545454;
	font-style: italic;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid .droppedGradeMessage
{
	color: #545454;
	font-weight: bold;
	font-style: italic;
	padding-left: 5px;
}

.gradebookPortlet .studentDetailScreen.facultyView .gradeItemGrid .droppedGradeMessage
{
	display: none;
}

.gradebookPortlet .studentDetailScreen .gradeItemGrid .noGrade
{
	font-style: italic;
}

.gradebookPortlet .studentDetailScreen .noGradesMessage
{
	color: #545454;
	font-style: italic;
}

.gradebookPortlet .studentDetailScreen .noGradesMessage>td
{
	padding: 5px;
}

.gradebookPortlet .gradeList .offlineAssignment
{
	padding-left: 25px;
	background: transparent url(<%= this.GetIconURL(CourseworkImgUtil.FORMAT_OFFLINE)%>) no-repeat 0 0;
}

.gradebookPortlet .gradeList .onlineAssignment
{
	padding-left: 30px;
	background: transparent url(<%= this.GetIconURL(CourseworkImgUtil.FORMAT_ONLINE)%>) no-repeat 0 0;
}

.gradebookPortlet .gradeList .forumAssignment
{
	padding-left: 25px;
	background: transparent url(<%= this.GetIconURL(CourseworkImgUtil.FORMAT_FORUM)%>) no-repeat 0 0;
}

.gradebookPortlet .gradeList .uploadAssignment
{
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL(CourseworkImgUtil.FORMAT_UPLOAD)%>) no-repeat 0 0;
}

.gradebookPortlet .gradeList .gradedEvaluation
{
	padding-left: 25px;
	background: transparent url(<%= this.GetIconURL("16/medal_gold_1.png")%>) no-repeat 0 0;
}

.gradebookPortlet .gradeList .attendanceEvaluation
{
	padding-left: 28px;
	background: transparent url(<%= this.GetIconURL("16/calendar.png")%>) no-repeat 0 0;
}


/* Evaluations Main Screen */

.gradebookPortlet .evaluationsMainScreen .evaluationsIntro
{
	display: block;
	padding-left: 40px;
	background: transparent url(<%= this.GetIconURL("32/medal_gold_1.png")%>) no-repeat 0 0;
	padding-bottom: 30px;
	max-width: 600px;
}

.gradebookPortlet .evaluationsMainScreen .messageText
{
	display: block;
	padding-top: 5px;
	padding-bottom: 10px;
}

.gradebookPortlet .evaluationsMainScreen .addEvaluationLink
{
	display: block;
	margin-top: 10px;
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/medal_gold_add.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .evaluationsMainScreen .evaluationGrid
{
	margin-left: 40px;
}

.gradebookPortlet .evaluationsMainScreen .evaluationGrid .evaluationLink
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/medal_gold_1.png")%>) no-repeat 0 0;
}

.gradebookPortlet .evaluationsMainScreen .evaluationGrid .attendanceLink
{
	font-style: italic;
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL("16/calendar.png")%>) no-repeat 0 0;
}

.gradebookPortlet .evaluationsMainScreen .evaluationGrid .includedMessage
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/tick.png")%>) no-repeat 0 0;
}

.gradebookPortlet .evaluationsMainScreen .evaluationGrid .notIncludedMessage
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/cancel.png")%>) no-repeat 0 0;
}

.gradebookPortlet .evaluationsMainScreen .attendanceIntro
{
	display: block;
	padding-left: 45px;
	background: transparent url(<%= this.GetIconURL("32/calendar.png")%>) no-repeat 0 0;
	padding-bottom: 30px;
	max-width: 600px;
	margin-top: 30px;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar
{
	margin: 0px 10px 20px 40px;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar a
{
	color: black;
	text-decoration: none;
	border: solid 1px black;
	margin: 5px;
	padding: 10px 15px;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar a.includeButton
{
	border-color: #008700;
	background: #EFEFEF url(<%= this.GetIconURL("16/tick.png")%>) no-repeat 10px 10px;
	padding-left: 40px;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar a.includeButton strong
{
	color: #008700;
	font-weight: bold;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar a.doNotIncludeButton
{
	border-color: #464646;
	background: #EFEFEF url(<%= this.GetIconURL("16/cancel.png")%>) no-repeat 10px 10px;
	padding-left: 40px;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .gbkButtonBar a.doNotIncludeButton strong
{
	color: #464646;
	font-weight: bold;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .attendanceLink
{
	padding-top: 10px;
	margin: 20px 10px 10px 50px;
	display: block;
}

.gradebookPortlet .evaluationsMainScreen .attendancePanel .helpLink
{
	margin: 20px 10px 10px 50px;
	display: block;
}


/* Evaluation Admin Screen */

.gradebookPortlet .evaluationAdminScreen
{
	max-width: 600px;
}

.gradebookPortlet .evaluationAdminScreen .intro
{
	display: block;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields
{
	padding-top: 10px;
	padding-bottom: 10px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li
{
	padding: 5px;
	clear: both;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li .entryLabel
{
	float: left;
	width: 100px;
	text-align: right;
	padding-right: 20px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.nameEntryRow .entryLabel
{
	padding-top: 5px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.pointValueEntryRow .entryLabel
{
	padding-top: 5px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.extraCreditEntryRow>input
{
	float: left;
	margin-right: 10px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.hiddenEntryRow>input
{
	float: left;
	margin-right: 10px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.descriptionEntryRow>label
{
	display: block;
	padding-bottom: 5px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.descriptionEntryRow>.description
{
	padding-bottom: 10px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.descriptionEntryRow>.complexTextBox
{
	display: block;
	padding-left: 120px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.buttonsRow
{
	padding-left: 120px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li.buttonsRow .helpLink
{
	margin-left: 30px;
}

.gradebookPortlet .evaluationAdminScreen ul.entryFields>li ul.settingsOptions
{
	display:block;
	padding-left: 120px;
}


/* Evaluations Detail Screen */

.gradebookPortlet .evaluationDetailScreen
{
	max-width: 750px;
}

.gradebookPortlet .evaluationDetailScreen h4
{
	margin-bottom: 0px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin
{
	margin: 15px 5px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .instructions
{
	display: block;
	padding-bottom: 10px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .includeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .doNotIncludeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isIncludedText,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isNotIncludedText
{
	display: block;
	margin: 10px;
	padding: 10px 15px;
	float: left;
	color: black;
	text-decoration: none;
	border: solid 1px black;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .includeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isIncludedText
{
	padding-left: 30px;
	background: #EFEFEF url(<%= this.GetIconURL("16/tick.png")%>) no-repeat 10px 10px;
	border-color: #008700;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .includeButton strong,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isIncludedText strong
{
	color: #008700;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .doNotIncludeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isNotIncludedText
{
	padding-left: 30px;
	background: #EFEFEF url(<%= this.GetIconURL("16/cancel.png")%>) no-repeat 10px 10px;
	border-color: #464646;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .doNotIncludeButton strong,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .isNotIncludedText strong
{
	color: #464646;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .helpLink
{
	padding-top: 18px;
	display: inline-block;
	margin-left: 25px;
	background-position: 0px 18px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .addButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .removeButton
{
	display: block;
	clear: both;
	margin-left: 20px;
	margin-top: 25px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .addButton
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/tick.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin .removeButton
{
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/cancel.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceIncluded .instructions,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceIncluded .isNotIncludedText,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceIncluded .includeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceIncluded .doNotIncludeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceIncluded .addButton
{
	display: none;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotIncluded .instructions,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotIncluded .isIncludedText,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotIncluded .includeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotIncluded .doNotIncludeButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotIncluded .removeButton
{
	display: none;
}

.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotSet .isIncludedText,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotSet .isNotIncludedText,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotSet .addButton,
.gradebookPortlet .evaluationDetailScreen .attendanceAdmin.attendanceNotSet .removeButton
{
	display: none;
}

.gradebookPortlet .evaluationDetailScreen .pageColumn
{
	padding: 5px;
	vertical-align: top;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn
{
	max-width: 70%;
	float: left;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn .gradeColumn
{
	white-space: nowrap;
	vertical-align: middle;
	padding: 0px;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn .gradeDisplay
{
	display: inline-block;
	padding: 5px;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn .gradeInput
{
	display: inline-block;
	padding: 0px 0px 0px 5px;
	visibility: hidden;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn .noGradeRow .gradeInput
{
	visibility: visible;
	padding: 0px;
}

.gradebookPortlet .evaluationDetailScreen .gradeColumn:hover .gradeInput
{
	visibility: visible;
}

.gradebookPortlet .evaluationDetailScreen .infoColumn
{
	max-width: 25%;
	padding: 10px 10px 10px 20px;
	float: left;
}

.gradebookPortlet .evaluationDetailScreen .infoColumn .totalPoints
{
	display: block;
	padding-bottom: 12px;
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL("16/asterisk_yellow.png")%>) no-repeat 0 0;
}

.gradebookPortlet .evaluationDetailScreen .helpLink
{
	display: block;
}

.gradebookPortlet .evaluationDetailScreen .studentListColumn .tabularData,
.gradebookPortlet .evaluationDetailScreen .studentListColumn .studentColumn
{
	width: 100%;
}

.gradebookPortlet .evaluationDetailScreen .attendanceColumn,
.gradebookPortlet .evaluationDetailScreen .noGradeRow .gradeColumn .gradeDisplay,
.gradebookPortlet .evaluationDetailScreen .attendanceStudentList .noGradeRow .gradeColumn .gradeInput,
.gradebookPortlet .evaluationDetailScreen .attendanceStudentList .gradeInput
{
	display: none;
}

.gradebookPortlet .evaluationDetailScreen .attendanceStudentList .attendanceColumn
{
	display: table-cell;
}

.gradebookPortlet .evaluationDetailScreen .attendanceStudentList .noGradeRow .gradeColumn .gradeDisplay
{
	display: block;
}

.gradebookPortlet .evaluationDetailScreen .howToEnterGrades
{
	padding-left: 10px;
	padding-right: 10px;
}

.gradebookPortlet .evaluationDetailScreen .howToEnterGrades ul
{
	list-style: disc inside;
}

.gradebookPortlet .evaluationDetailScreen .howToEnterGrades ul>li
{
	list-style: disc inside;
	padding-left: 15px;
}

.gradebookPortlet .evaluationDetailScreen .pageFooter
{
	clear: both;
	height: 20px;
}


/* Weighting Setup Screen */

.gradebookPortlet .weightingSetupScreen .backButton
{
	display: block;
	clear: both;
	padding: 30px 0px 20px 25px;
	background: transparent url(<%= this.GetIconURL("arrow-left.png")%>) no-repeat 5px 30px;
}


/* Org Header Weighting Screen */

.gradebookPortlet .orgHeaderWeightingScreen.displayGroupingByOrganizationUnit .orgTypeText,
.gradebookPortlet .orgHeaderWeightingScreen.displayGroupingByOrganizationType .orgUnitText,
.gradebookPortlet .orgHeaderWeightingScreen.displayGroupingByOrganizationUnit .orgTypeText.messageText,
.gradebookPortlet .orgHeaderWeightingScreen.displayGroupingByOrganizationType .orgUnitText.messageText,
.gradebookPortlet .orgHeaderWeightingScreen.displayWeightingAutomatically .manualWeightingText,
.gradebookPortlet .orgHeaderWeightingScreen.displayWeightingManually .automaticWeightingText,
.gradebookPortlet .orgHeaderWeightingScreen.displayWeightingAutomatically .manualWeightingText.messageText,
.gradebookPortlet .orgHeaderWeightingScreen.displayWeightingManually .automaticWeightingText.messageText
{
	display: none;
}

.gradebookPortlet .orgHeaderWeightingScreen
{
	max-width: 600px;
}

.gradebookPortlet .orgHeaderWeightingScreen .introPanel
{
	padding-left: 40px;
	background: transparent url(<%= this.GetIconURL("32/chart_pie.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .orgHeaderWeightingScreen .introPanel .helpLink
{
	display: block;
	margin-top: 5px;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel
{
	padding: 10px;
	margin-top: 10px;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .headerText
{
	font-size: 100%;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .headerText,
.gradebookPortlet .orgHeaderWeightingScreen .dropPanel .headerText
{
	font-size: 100%;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .orgHeaderPanel
{
	margin-left: 10px;
	margin-right: 10px;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .messageText,
.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .generalWeightingLink
{
	display: block;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .messageText
{
	margin: 0px 10px 10px 10px;
}

.gradebookPortlet .orgHeaderWeightingScreen .breakdownPanel .generalWeightingLink
{
	margin: 10px 5px 5px 10px;
	padding-left: 20px;
	background: transparent url(<%= this.GetIconURL("16/chart_pie_edit.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .orgHeaderWeightingScreen .dropPanel
{
	padding: 10px;
}

.gradebookPortlet .orgHeaderWeightingScreen .dropPanel .dropAdmin
{
	padding-left: 20px;
}

.gradebookPortlet .orgHeaderWeightingScreen .dropPanel .footerNote
{
	margin: 10px;
}


/* Graded Item Weighting Screen */

.gradebookPortlet .gradedItemWeightingScreen.displayGroupingByOrganizationUnit .introPanel .orgTypeText,
.gradebookPortlet .gradedItemWeightingScreen.displayGroupingByOrganizationType .introPanel .orgUnitText,
.gradebookPortlet .gradedItemWeightingScreen.displayGroupingByOrganizationUnit .orgTypeText,
.gradebookPortlet .gradedItemWeightingScreen.displayGroupingByOrganizationType .orgUnitText,
.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupGradedItemsAllTogether .groupByOrgHeaderText,
.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupOrganizationWeights .groupTogetherText
{
	display: none;
}

.gradebookPortlet .gradedItemWeightingScreen
{
	max-width: 600px;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel .helpLink
{
	display: block;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel.groupTogetherText
{
	padding-left: 40px;
	background: transparent url(<%= this.GetIconURL("32/chart_pie.png")%>) no-repeat 0px 0px;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel .weightMethodDisplay,
.gradebookPortlet .gradedItemWeightingScreen .introPanel .weightDisplay
{
	display: block;
	margin: 2px 10px 3px 10px;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel .helpLink
{
	display: block;
	margin-top: 5px;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel.groupByOrgHeaderText
{
	margin: 15px 5px;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel.groupByOrgHeaderText .headerText
{
	font-size: 150%;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel .overrideLink
{
	display: block;
	margin: 0px 10px;
	font-style: italic;
}

.gradebookPortlet .gradedItemWeightingScreen .introPanel .overrideLink a
{
	text-decoration: underline;
	cursor: pointer;
}

.gradebookPortlet .gradedItemWeightingScreen .instructions
{
	display:block;
	margin: 20px 10px 10px 10px;
}

.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupOrganizationWeights.displayWeightingAutomatically .instructions,
.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupOrganizationWeights.displayWeightingByPoints .instructions
{
	display: none;
}

.gradebookPortlet .gradedItemWeightingScreen .breakdownPanel
{
	padding: 10px;
	margin-top: 10px;
}

.gradebookPortlet .gradedItemWeightingScreen.displayWeightingAutomatically .changeWeightsLink,
.gradebookPortlet .gradedItemWeightingScreen.displayWeightingByPoints .changeWeightsLink,
.gradebookPortlet .gradedItemWeightingScreen.displayWeightingManually .micromanageLink
{
	margin-top: 5px;
	float: right;
}
.gradebookPortlet .gradedItemWeightingScreen.displayWeightingManually .changeWeightsLink,
.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupGradedItemsAllTogether .changeWeightsLink,
.gradebookPortlet .gradedItemWeightingScreen.displayWeightingAutomatically .micromanageLink,
.gradebookPortlet .gradedItemWeightingScreen.displayWeightingByPoints .micromanageLink,
.gradebookPortlet .gradedItemWeightingScreen.displayGradingGroupGradedItemsAllTogether .micromanageLink
{
	display: none;
}

.gradebookPortlet .gradedItemWeightingScreen .dropPanel
{
	clear: both;
	padding: 10px;
}

.gradebookPortlet .gradedItemWeightingScreen .dropPanel .headerText
{
	font-size: 100%;
}

.gradebookPortlet .gradedItemWeightingScreen .dropPanel .dropAdmin
{
	padding-left: 20px;
}

.gradebookPortlet .gradedItemWeightingScreen .dropPanel .footerNote
{
	margin: 10px 10px 10px 45px;
}

.gradebookPortlet .gradedItemWeightingScreen .overrideGradingMethodList
{
	display: block;
	margin: 15px 20px;
}

.gradebookPortlet .gradedItemWeightingScreen .modalDiv ul
{
	list-style: disc inside;
}

.gradebookPortlet .gradedItemWeightingScreen .modalDiv ul>li
{
	list-style: disc inside;
	padding-left: 15px;
}

/* Letter Grade Screen */

.gradebookPortlet .letterGradeScreen div.LetterGradeListItem
{
    border-color: #BABABA;
    border-width: 1px;
    border-style: solid;
}

.gradebookPortlet .letterGradeScreen div.LetterGradeListItem.alt
{
    background-color: #EFEFEF;
}

.gradebookPortlet .letterGradeScreen div.LetterGradeListItem:hover{
    background-color: #E7F3FF;
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
    cursor: pointer;
}

.gradebookPortlet .letterGradeScreen div.LetterGradeList
{
    border-color: #BABABA;
    border-width: 1px;
    border-style: solid;
    width: 20%
    text-align: center;
}

.gradebookPortlet .letterGradeScreen .headerText {
    font-weight:bold;
}

.gradebookPortlet .letterGradeScreen .LetterConfigModalPopup {	
	background: white;	
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -100px;
	margin-top: -100px;
	padding: 5px 5px 5px 5px;
	border-color: #B5B2B5;
	border-width: 1px;
	border-style: solid;
}

.gradebookPortlet .letterGradeScreen .LetterConfigModalPopupHeader {
	background: #E7E3E7;
	padding: 5px 5px 5px 5px;
}

.gradebookPortlet .letterGradeScreen .LetterConfigModalPopupBody {
	background: #EFEFEF;
}

.gradebookPortlet .letterGradeScreen .LetterConfigLabelLink{
    text-decoration: underline;
    cursor: pointer;
    color: blue;
}

.gradebookPortlet .letterGradeScreen .divLetterGradeConfigAddGrade{
	background-color: #EFF3FF;
	padding: 10px 10px 10px 10px;
	border-color: #B5B2B5;
	border-style: solid;
	border-width: 1px;
	width: 20%;
}

.gradebookPortlet .buttonBar {
    background-color: #D6E2FB;
    border-color: #364F78;
    border-style: solid;
    border-width: 1px;
    padding: 10px;
}


/* Full Gradebook */

.gradebookPortlet .fullGradebookScreen .expandGroupsButton,
.gradebookPortlet .fullGradebookScreen .collapseGroupsButton,
.gradebookPortlet .fullGradebookScreen .exportButton,
.gradebookPortlet .fullGradebookScreen .expandAllButton
{
	margin-right: 15px;
	display: inline-block;
}

.gradebookPortlet .fullGradebookScreen .expandGroupsButton
{
	padding-left: 18px;
	background: transparent url(<%= this.GetIconURL("toggle-expand.png")%>) no-repeat 0px center;
}

.gradebookPortlet .fullGradebookScreen .collapseGroupsButton
{
	padding-left: 18px;
	background: transparent url(<%= this.GetIconURL("toggle-collapse.png")%>) no-repeat 0px center;
}

.gradebookPortlet .fullGradebookScreen .exportButton
{
	padding-left: 22px;
	background: transparent url(<%= this.GetIconURL("download-excel.png")%>) no-repeat 0px center;
}

.gradebookPortlet .fullGradebookScreen .expandAllButton
{
}

.gradebookPortlet .fullGradebookScreen .missingWeightsMessage
{
	background: transparent url(<%= this.GetIconURL("32/chart_pie_error.png")%>) no-repeat 0px 0px;
	padding-left: 38px;
	min-height: 30px;
	max-width: 1000px;
}

.gradebookPortlet .fullGradebookScreen .introPanel
{
	padding-left: 40px;
	background: transparent url(<%= this.GetIconURL("32/book_open.png")%>) no-repeat 0px 0px;
	margin-bottom: 20px;
	min-height: 32px;
}

.gradebookPortlet .fullGradebookScreen .studentFilterButtonBar a
{
	display: inline-block;
	margin-top: 20px;
	margin-right: 10px;
}

<%@ Page Language="C#" AutoEventWireup="true" EnableSessionState="true" CodeBehind="ExportGradesheet.aspx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Pages.ExportGradesheet" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<style>


	.studentInfoSuperheader,
	.groupSuperheader,
	.nameSuperheader,
	.finalGradeSuperheader,
	.groupGradeHeader,
	.itemSuperheader,
	.columnHeader,
	.finalGradeColumnHeader,
	.finalGradeColumn
	{
		border: .5pt solid #808080;
	}

	.studentInfoSuperheader,
	.groupSuperheader,
	.nameSuperheader,
	.finalGradeSuperheader,
	.groupGradeHeader,
	.itemSuperheader
	{
		text-align: center;
		vertical-align: middle;
	}

	.groupSuperheader
	{
		background-color: #CCFFFF;
	}

	.finalGradeColumnHeader,
	.finalGradeSuperheader,
	.finalGradeColumn
	{
		background-color: #CCFFCC;
	}

	.finalGradeSuperheader,
	.itemSuperheader,
	.groupGradeHeader
	{
		font-weight: bold;
	}

	.finalGradeSuperheader,
	.groupGradeHeader
	{
		font-style: italic;
	}

	.groupSeparator
	{
		background-color: #808080;
		width: 5px;
	}

	.itemSeparator
	{
		background-color: #C0C0C0;
		width: 2px;
	}
	
	.rowSeparator
	{
		background-color: #808080;
		height: 3px;
	}

	.droppedGrade
	{
		color: #808080;
		font-style: italic;
	}

</style>

<table id="GradesheetTable" runat="server">

<tr id="GroupHeaderRow" runat="server">
	<td id="StudentInfoHeader" colspan="7" class="studentInfoSuperheader" runat="server"><common:GlobalizedLabel TextKey="HDR_STUDENT_INFO" runat="server" /></td>
</tr>

<tr id="ItemHeaderRow" runat="server">
	<td class="nameSuperheader" colspan="3"><common:GlobalizedLabel TextKey="HDR_NAME" runat="server" /></td>
	<td id="FinalGradeItemHeader" colspan="4" class="finalGradeSuperheader" runat="server"><common:GlobalizedLabel TextKey="HDR_FINAL_GRADE" runat="server" /></td>
</tr>

<tr id="HeaderRow" runat="server">
	<td class="columnHeader"><common:GlobalizedLabel TextKey="HDR_ID" runat="server" /></td>
	<td class="columnHeader"><common:GlobalizedLabel TextKey="HDR_LAST_NAME" runat="server" /></td>
	<td class="columnHeader"><common:GlobalizedLabel TextKey="HDR_FIRST_NAME" runat="server" /></td>
	<td class="finalGradeColumnHeader"><common:GlobalizedLabel TextKey="HDR_%" runat="server" /></td>
	<td class="finalGradeColumnHeader"><common:GlobalizedLabel TextKey="HDR_LETTER" runat="server" /></td>
	<td id="PointsColumnHeader" class="finalGradeColumnHeader" runat="server"><common:GlobalizedLabel TextKey="HDR_POINTS" runat="server" /></td>
	<td id="TotalColumnHeader" class="finalGradeColumnHeader" runat="server"><common:GlobalizedLabel TextKey="HDR_TOTAL" runat="server" /></td>
</tr>

</table>

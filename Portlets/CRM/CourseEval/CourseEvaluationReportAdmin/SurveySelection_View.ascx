<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SurveySelection_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationReportsPortlet.SurveySelection_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<table>
		<tr>
			<td>
				<asp:Label ID="lblInstructions" Runat="server">Select an evaluation from the below dropdown.</asp:Label>
			</td>
		</tr>
		<tr>
			<td>
				<asp:DropDownList ID="ddlChooseSurveyRpts" Runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button ID="btnSelect" Runat="server" />
			</td>
		</tr>
	</table>
</div>

<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_SurveyReportLinks_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_SurveyReportLinks_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div id="SelectionScreen" class="pSection" runat="server">
	<table>
		<tr>
			<td>
				<asp:Label ID="lblInstructions" Runat="server" >Select a report type from the below dropdown.</asp:Label>
			</td>
		</tr>
		<tr>
			<td>
				<asp:DropDownList ID="ddlChooseRpts" Runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button ID="btnSelect" Runat="server" />
				&nbsp;
				<asp:Button ID="btnCancel" Runat="server" />
			</td>
		</tr>
	</table>
</div>

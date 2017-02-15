<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_ReportSection_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_ReportSection_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<input type="hidden" name="AllowPostback" value="true" />
<div class="pSection" id="reportControl" runat="server">
	<asp:LinkButton ID="lnkExportToRTF" Runat="server" />
	<br>
	<asp:LinkButton ID="lnkExportToCSV" Runat="server" />
	<br>
	<br>
	<b><asp:Label ID="lblReportTitle" Runat="server" /></b>
	<common:Hint ID="NoDataHint" TextKey="MSG_COURSEEVALPORTLET_REPORT_NODATA" visible="false" runat="server" />
	<table cellspacing="5" border="0" width="100%">
		<tr>
			<td><b><asp:Label ID="lblSectionName" Runat="server" /></b></td>
		</tr>
		<tr>
			<td><asp:Literal ID="litReport" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Literal ID="litCommentReport" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:LinkButton ID="lnkExportToRTF2" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:LinkButton ID="lnkExportToCSV2" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Button ID="btnBack" Runat="server" /></td>
		</tr>
	</table>
</div>

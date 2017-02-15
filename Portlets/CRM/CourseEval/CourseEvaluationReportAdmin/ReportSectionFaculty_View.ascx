<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReportSectionFaculty_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationReportsPortlet.ReportSectionFaculty_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<input type="hidden" name="AllowPostback" value="true" />
<div class="pSection" id="reportControl" runat="server">
	HUH???<br>
	<b><asp:Label ID="lblReportTitle" Runat="server" /></b>
	<table cellspacing="5" border="0" width="150%">
		<b><asp:Label ID="lblSectionName" Runat="server" /></b>
		<asp:Literal ID="litReport" Runat="server" />
		<br><br>
		<asp:Literal ID="litCommentReport" Runat="server" />
		<br><br>
		<asp:LinkButton ID="lnkExportToCSV" Runat="server" />
		<br>
		<asp:Button ID="btnBack" Runat="server" />
	</table>
</div>
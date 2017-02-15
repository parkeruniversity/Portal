<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_ReportSectionFaculty_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_ReportSectionFaculty_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection" id="reportControl" runat="server">
	<br>
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
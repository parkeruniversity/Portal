<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_ReportDepartment_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_ReportDepartment_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<input type="hidden" name="AllowPostback" value="true" />
<div class="pSection" id="reportControl" runat="server">
	<asp:LinkButton ID="lnkExportToRTF" Runat="server" />
	<br>
	<asp:LinkButton ID="lnkExportToCSV" Runat="server" />
	<br>
	<br>
	<b><asp:Label ID="lblReportTitle" Runat="server" /></b>
	<table cellspacing="5" border="0" width="150%">
		<asp:Literal ID="litReport" Runat="server" />
		<br>
		<br>
		<asp:Literal ID="litCommentReport" Runat="server" />
		<br>
		<br>
		<asp:LinkButton ID="lnkExportToRTF2" Runat="server" />
		<br>
		<asp:LinkButton ID="lnkExportToCSV2" Runat="server"/>
		<br>
		<br>
		<asp:Button ID="btnBack" Runat="server" />
	</table>
</div>

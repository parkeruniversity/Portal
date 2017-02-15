<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReportAllCollege_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationReportsPortlet.ReportAllCollege_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<input type="hidden" name="AllowPostback" value="true" />
<div class="pSection" id="reportControl" runat="server">
	<table cellspacing="5" border="0" width="150%">
		<asp:LinkButton ID="lnkExportToRTF" Runat="server" />
		<br>
		<asp:Literal ID="litReport" Runat="server" />
		<br>
		<br>
		<asp:Literal ID="litCommentReport" Runat="server" />
		<br>
		<br>
		<asp:LinkButton ID="lnkExportToRTF2" Runat="server" />
		<br>
		<asp:Button ID="btnBack" Runat="server" />
	</table>
</div>

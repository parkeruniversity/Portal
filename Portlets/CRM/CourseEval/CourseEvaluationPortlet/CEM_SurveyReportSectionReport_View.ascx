<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_SurveyReportSectionReport_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_SurveyReportSectionReport_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<b><asp:Label ID="lblSectionName" Runat="server" /></b>
	<table cellspacing="5" border="0" width="150%">
		<asp:Literal ID="litReport" Runat="server" />
		<br><br>
		<asp:Literal ID="litCommentReport" Runat="server" />
		<br><br>
		<asp:Button ID="btnBack" Runat="server" />
	</table>
</div>

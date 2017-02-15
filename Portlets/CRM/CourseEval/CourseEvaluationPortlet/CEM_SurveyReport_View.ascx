<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_SurveyReport_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CUS_SurveyReport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableviewstate="false" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<table style="width:100%"><tr>
	<td style="width:100%;background:#ccc;padding:.25em .5em"><b><%=this.Report.Name %></b></td>
	<td style="background:#ccc;padding:.25em 5em .25em .5em;white-space:nowrap"><common:GlobalizedLinkButton id="exitReportViewTop" textkey="CUS_TXT_EXIT_REPORT_VIEWER" runat="server"/></td>
	<td style="background:#ccc;padding:.25em 5em .25em .5em;white-space:nowrap"><a href="<%=ResolveUrl("Excel.aspx?SurveyID=" + this.Report.ID.ToString())%>" title="<%=Globalize("CUS_TXT_EXPORT_TO_EXCEL_TOOLTIP")%>"><%=Globalize("CUS_TXT_EXPORT_TO_EXCEL")%></a></td>
</tr></table>
<div class="pSection">
	<asp:PlaceHolder id="reportGoesHere" runat="server"/>
	<p><common:GlobalizedLinkButton id="exitReportView" TextKey="CUS_TXT_EXIT_REPORT_VIEWER" runat="server"/></p>
</div>

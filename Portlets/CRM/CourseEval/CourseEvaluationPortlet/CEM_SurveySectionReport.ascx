<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_SurveySectionReport.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CUS_SurveySectionReport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<common:groupedgrid id="reportGrid" runat="server" DataKeyField="ID" RenderTableHeaders="true">
<TableHeaderTemplate><%= DataBinder.Eval(this.DataSource, "Name") %></TableHeaderTemplate>
<columns>
<common:GlobalizedTemplateColumn headertextkey="CUS_TXT_QUESTIONS">
<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Name") %> <common:GlobalizedLinkButton runat="server" CommandName="showResponses" TextKey="TXT_SHOW_COMMENTS" visible='<%# (Container.DataItem is  CourseEvaluationPortlet.SurveyReportCommentQuestion ) %>'/></ItemTemplate>
</common:GlobalizedTemplateColumn>
<common:GlobalizedBoundColumn headertextkey="CUS_TXT_TOTAL" datafield="TotalResponses"/>
<common:GlobalizedBoundColumn headertextkey="CUS_TXT_MEAN" datafield="TotalResponses" Visible="false"/>
</columns>
</common:groupedgrid>

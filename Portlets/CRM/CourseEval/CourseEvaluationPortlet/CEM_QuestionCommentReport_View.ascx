<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_QuestionCommentReport_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_QuestionCommentReport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
<asp:Repeater id="commentReport" runat="server">
<ItemTemplate><p><%# DataBinder.Eval(Container.DataItem, "Comment") %></p></ItemTemplate>
<SeparatorTemplate><hr></SeparatorTemplate>
</asp:Repeater>
</div>
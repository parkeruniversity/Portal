<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserTargetedSurveyList.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationLoginPages.UserTargetedSurveyList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet"%>
<div class="pSection">
	<%= Globalize("CUS_MSG_SURVEY_INSTRUCTIONS") %>
	<p><%= Globalize("CUS_TXT_COMPLETE_FOLLOWING_SURVEYS") %></p>
		<ul>
			<asp:Repeater id="surveyList" runat="server">
				<ItemTemplate>
					<li>
						<asp:LinkButton ID="lnkButton" runat="server" commandname="showSurvey" commandargument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'></asp:LinkButton>
						(<%# Globalize(((SurveyRecipientFlat)Container.DataItem).Required ? "CUS_TXT_REQUIRED" : "CUS_TXT_OPTIONAL") %>) 
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	<p><common:GlobalizedButton id="done" runat="server" TextKey="CUS_TXT_DONE" /></p>
</div>
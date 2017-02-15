<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SurveyBuilderHeader.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.SurveyBuilderHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<table width="100%" class="ceSurveyBuilderHeader">
	<tr>
		<td width="600">
			<b><asp:Label ID="txtSurveyName" Runat="server" /></b>
		</td>
		<td>
			<asp:LinkButton ID="lnkEditThisSurvey" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<b><common:GlobalizedLabel TextKey="LBL_DESCRIPTION" Runat="server" ID="Globalizedlabel1"/>&nbsp;</b>
			<asp:Label ID="txtSurveyDesc" Runat="server" />
		</td>
	</tr>
	<tr>
		<td id="Category" runat="server">
			<b><common:GlobalizedLabel TextKey="LBL_CATEGORY" CssClass="cwkHeader" Runat="server" ID="Globalizedlabel2"/>&nbsp;</b>
			<asp:Label ID="txtCategory" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<b><common:GlobalizedLabel TextKey="LBL_TOTAL_QUESTIONS" CssClass="cwkHeader" Runat="server" ID="Globalizedlabel3"/>&nbsp;</b>
			<asp:Label ID="txtTotalQuestions" Runat="server" />
		</td>
	</tr>
</table>

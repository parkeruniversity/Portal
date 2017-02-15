<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrueFalseReview.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReviewDisplay.TrueFalseReview" %>
<asp:PlaceHolder ID="_phTbl" runat="server">
	<table class="tfReview" cellspacing="2">
		<tr>
			<td><img src="<%=GetSelectorUrl(true) %>" /> <asp:Literal ID="_litTrue" runat="server" /></td>
			<td class="<%=GetAnswerCss(true) %>"><asp:Literal ID="_litTrueAnswer" runat="server" /></td>
		</tr>
		<tr>
			<td><img src="<%=GetSelectorUrl(false) %>" /> <asp:Literal ID="_litFalse" runat="server" /></td>
			<td class="<%=GetAnswerCss(false) %>"><asp:Literal ID="_litFalseAnswer" runat="server" /></td>
		</tr>
	</table>
</asp:PlaceHolder>
<asp:Label id="_lblNoSelection" CssClass="studentNameDisplay" runat="server" />
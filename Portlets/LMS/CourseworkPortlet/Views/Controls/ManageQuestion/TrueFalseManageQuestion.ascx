<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrueFalseManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.TrueFalseManageQuestion" %>
<%@ Register Src="../../../../Common/Controls/FeedbackEditor.ascx"  TagName="Feedback" TagPrefix="cwk" %>

<table class="questionTable tfTable">
	<caption><asp:Literal ID="_litCaption" runat="server" /></caption>
	<tr>
		<th><asp:Literal ID="_litCorrect" runat="server" /></th>
	</tr>
	<tr>
		<td><asp:RadioButton ID="_radTrue" GroupName="tf" runat="server" /></td>
	</tr>
	<tr>
		<td><asp:RadioButton ID="_radFalse" GroupName="tf" runat="server" /></td>
	</tr>
</table>
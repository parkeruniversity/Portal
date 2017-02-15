<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShortAnswerDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.ShortAnswerDisplay" %>
<asp:Repeater ID="_rptFields" runat="server">
	<ItemTemplate>
		<div class="shortDisplay">
			<asp:Label ID="_lblLabel" runat="server" />
			<asp:TextBox ID="_txtInput" runat="server" Width="300px" MaxLength="200000" />
		</div>
	</ItemTemplate>
</asp:Repeater>
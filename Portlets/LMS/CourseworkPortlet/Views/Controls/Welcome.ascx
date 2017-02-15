<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Welcome.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.Welcome" %>
<%@ Register Assembly="System.Web.Extensions"Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel ID="_updatePanel" runat="server">
	<ContentTemplate>
		<div class="welcome">
			<asp:ImageButton class="welcomeClose" ID="_imgBtnExit" OnClick="imgBtnClick" runat="server" />
			<asp:Literal ID="_litWelcome"  runat="server"/>
		</div>
	</ContentTemplate>
</asp:UpdatePanel>

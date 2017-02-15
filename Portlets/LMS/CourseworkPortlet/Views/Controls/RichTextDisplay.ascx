<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RichTextDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.RichTextDisplay" %>
<div class="richText">
	<asp:Literal ID="_litText" runat="server" />
	<asp:Panel ID="_panImgGal" CssClass="imgGallery" runat="server">
		<asp:Label ID="_lblImgGal" runat="server" />
	</asp:Panel>
	<asp:Repeater ID="_rptEquations" runat="server" >
		<ItemTemplate>
		</ItemTemplate>
	</asp:Repeater>
</div>
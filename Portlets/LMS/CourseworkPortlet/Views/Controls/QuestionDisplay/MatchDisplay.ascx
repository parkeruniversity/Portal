<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MatchDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.MatchDisplay" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<asp:GridView ID="_gvMatching" ShowFooter="false" ShowHeader="false" GridLines="None" CssClass="matchDisplayTable" AutoGenerateColumns="false" runat="server">
	<Columns>
		<asp:TemplateField>
			<ItemTemplate>
				<cwk:RichText id="_rt" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField ItemStyle-CssClass="matchIcon">
			<ItemTemplate>
				<asp:DropDownList ID="_ddl" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OGSubmitted.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.OnlineGivingPortlet.OGSubmitted" %>
<asp:Table ID="tblThankYou" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trThankYou" Runat="server">
		<asp:TableCell ID="tcThankYou" HorizontalAlign="Left" Width="100%" Runat="server">
			<asp:Literal ID="litThankYouMsg" Runat="server"></asp:Literal>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="Table1" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="Tablerow1" Runat="server">
		<asp:TableCell ID="Tablecell6" HorizontalAlign="Left" Width="30%" Runat="server">
			<asp:Button id="btnContinue" Runat="server"></asp:Button>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblError" Visible="True" Width="100%" BorderStyle="None" Runat="server">
	<asp:TableRow ID="trError" Visible="False" Runat="server">
		<asp:TableCell>
			&nbsp;&nbsp;
<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label>
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.EXWebLinks.Web.Portlets.EXWebPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<asp:Table ID="tblError" Runat="server" Width="100%">
	<asp:TableRow>
		<asp:TableCell>
			<asp:Label ID="lblError" Runat="server" CssClass="PortletError" Visible="False" />
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblMain" Runat="server" Width="100%">
	<asp:TableRow>
		<asp:TableCell VerticalAlign="Top">
			<asp:PlaceHolder ID="plhEXWeb" Runat="server" />
		</asp:TableCell>
	</asp:TableRow>

</asp:Table>

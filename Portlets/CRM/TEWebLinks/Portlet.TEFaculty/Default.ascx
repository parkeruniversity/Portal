<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.TEWebLinks.Web.Portlets.TEFaculty.Default" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<asp:Table ID="tblError" Visible=False Runat="server" Width="100%">
	<asp:TableRow ID=trError Visible=False Runat=server>
		<asp:TableCell ID=tcError Visible=False Runat=server>
			<asp:Label ID="lblError" Visible=False Runat="server" CssClass="PortletError" />
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>
<asp:Table ID="tblMain" Runat="server" Width="100%">
	<asp:TableRow>
		<asp:TableCell VerticalAlign="Top">
			<asp:PlaceHolder ID="plhReg" Runat="server" />
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell VerticalAlign="Top">
			<asp:PlaceHolder ID="plhAdv" Runat="server" />
		</asp:TableCell>
	</asp:TableRow>
</asp:Table>

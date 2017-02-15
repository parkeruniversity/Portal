<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.PXWebLinks.Web.Portlets.PXFacultyPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection" id="divMain" runat="server">
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection"><asp:table id="tblError" Width="100%" Runat="server">
		<asp:TableRow>
			<asp:TableCell>
				<asp:Label ID="lblError" Runat="server" CssClass="PortletError" Visible="False" />
			</asp:TableCell>
		</asp:TableRow>
	</asp:table></div>
<div class="pSection">
	<asp:table id="tblMain" Width="100%" Runat="server">
		<asp:TableRow>
			<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Center">
				<asp:table id="tblLinks" Runat="server">
					<asp:TableRow>
						<asp:TableCell VerticalAlign="Top">
							<asp:PlaceHolder ID="plhFaculty" Runat="server" />
						</asp:TableCell>
					</asp:TableRow>
				</asp:table>
			</asp:TableCell>
		</asp:TableRow>
	</asp:table></div>
</div>
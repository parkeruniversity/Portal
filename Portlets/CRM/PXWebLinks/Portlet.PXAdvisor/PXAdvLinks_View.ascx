<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PXAdvLinks_View.ascx.cs" Inherits="Jenzabar.CRM.PXWebLinks.Web.Portlets.PXAdvisorPortlet.PXAdvLinks_View" %>
<div class="pSection" id="divMain" runat="server">
	<div class="pSection" id="divError" runat="server" visible="False"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
	<div class="pSection" id="divWarning" runat="server" visible="False">&nbsp;&nbsp;&nbsp;
		<asp:Label ID="lblWarning" CssClass="PortletError" Runat="server"></asp:Label></div>
	<div class="pSection" id="divMessage" runat="server" visible="False">&nbsp;&nbsp;&nbsp;
		<asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
	<div class="pSection" id="divResults" runat="server">
		<asp:table id="tblMain" Runat="server" Width="100%">
			<asp:TableRow>
				<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Center">
					<asp:table id="tblLinks" Runat="server">
						<asp:TableRow>
							<asp:TableCell VerticalAlign="Top">
								<asp:PlaceHolder ID="plhAdvisee" Runat="server" />
							</asp:TableCell>
						</asp:TableRow>
					</asp:table>
				</asp:TableCell>
			</asp:TableRow>
		</asp:table></div>
</div>

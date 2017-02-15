<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<div class="pSection">
<table height="40" cellSpacing="3" cellPadding="3">
	<tr>
		<td><asp:label id="lblMessage" runat="server" CssClass="PortletError"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblInstructions" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:table id="tblLinks" runat="server" Visible="true" BorderStyle="None"></asp:table></td>
	</tr>
	<tr>
		<td>
			<asp:Table id="tblIncompleteForm" runat="server">
				<asp:TableRow>
					<asp:TableCell>&nbsp;</asp:TableCell>
					<asp:TableCell>&nbsp;</asp:TableCell>
				</asp:TableRow>
			</asp:Table></td>
	</tr>
</table>
</div>
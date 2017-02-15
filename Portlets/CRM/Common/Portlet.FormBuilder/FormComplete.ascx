<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormComplete.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.FormComplete" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<table height="40" cellSpacing="3" cellPadding="3">
	<tr>
		<td><asp:label id="lblMessage" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>
			<asp:Button id="btnOk" runat="server"></asp:Button></td>
	</tr>
</table>

<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="IncompleteFormSave.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.IncompleteFormSave" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<table height="40" cellSpacing="3" cellPadding="3">
	<tr>
		<td colspan="2"><asp:label id="lblMessage" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td width="106">
			<asp:Label id="lblAppKey" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="txtAppKey" runat="server" ReadOnly="True"></asp:TextBox></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button id="btnOk" runat="server"></asp:Button></td>
	</tr>
</table>

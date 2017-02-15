<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddTabSetView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.AddTab" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table cellSpacing="0" cellPadding="2" width="100%" >
	<tr>
		<td align="right" width="15%"><asp:label id="lblTitle" Runat="server"></asp:label>:</td>
		<td width="85%"><asp:textbox id="txtTitle" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td align="right"><asp:label id="lblPosition" Runat="server"></asp:label>:</td>
		<td><asp:listbox id="lstPosition" Runat="server" Rows="1"></asp:listbox></td>
	</tr>
	<tr>
		<td align="right">&nbsp;</td>
	</tr>
	<tr>
		<td align="right" width='20%'><asp:button id="btnSave" Runat="server"></asp:button>&nbsp;</td>
		<td><asp:button id="btnCancel" Runat="server"></asp:button></td>
	</tr>
</table>

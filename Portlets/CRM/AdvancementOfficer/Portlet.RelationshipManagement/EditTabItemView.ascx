<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditTabItemView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.EditTabItem" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td width="15%" align="right"><asp:label id="lblTitle" Runat="server" />:</td>
		<td width="85%"><asp:TextBox ID="txtTitle" Runat="server" /></td>
	</tr>
	<tr>
		<td align="right"><asp:Label ID="lblTab" Runat="server" />:</td>
		<td><asp:ListBox ID="lstTab" Rows="1" Runat="server" /></td>
	</tr>
	<tr>
		<td align="right"><asp:Label ID="lblHide" Runat="server" />:</td>
		<td><asp:CheckBox ID="chkHide" Runat="server" /></td>
	</tr>
	<tr>
		<td align="right"><asp:Label ID="lblCategory" Runat="server" />:</td>
		<td><asp:ListBox ID="lstCategory" Rows="1" Runat="server" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="right"><asp:Button ID="btnSave" Runat="server" />&nbsp;</td>
		<td><asp:Button ID="btnCancel" Runat="server" /></td>
	</tr>
</table>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminUserInfo_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminUserInfo_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<style>
	.addSetButton { margin-left: 20px; }
</style>

<fieldset>
<table>
	<tr>
		<th><asp:label id="NameLabel" Runat="server"></asp:label></th>
		<td><asp:textbox id="Name" Runat="server" MaxLength="250" Columns="30"></asp:textbox></td>
	</tr>
	<tr>
		<th><asp:label id="InfoLabel" Runat="server"></asp:label></th>
	    <td><cmn:TextEditorControl id="Info" MaxLength="1000" runat="server" /></td>
	</tr>
	<tr>
		<th><asp:label id="SetLabel" Runat="server"></asp:label></th>
		<td>
			<asp:listbox id="Set" Runat="server" Rows="1" AutoPostBack="True" />
			<asp:linkbutton id="AddSet" CssClass="addSetButton" Runat="server" />
		</td>
	</tr>
	<tr id="ItemOrderRow" runat="server">
		<th><asp:label id="ItemOrderLabel" Runat="server"></asp:label></th>
		<td><asp:listbox id="ItemOrder" Runat="server" Rows="1" /></td>
	</tr>
	<tr>
		<th></th>
		<td>
			<asp:button id="SaveButton" Runat="server" />&nbsp;<asp:button id="DeleteButton" Visible="False" Runat="server" />&nbsp;<asp:button id="CancelButton" Runat="server" />
		</td>
	</tr>
</table>
</fieldset>
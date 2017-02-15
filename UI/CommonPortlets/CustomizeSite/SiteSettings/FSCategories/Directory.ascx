<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Directory.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Directory" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework.Configuration" %>
<tr>
	<th><%= Settings.LDAP_CONNECTION_STRING %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_CANT_EDIT") %></td>
</tr>

<tr>
	<th><%= Settings.SYSTEM_ACCOUNT_NAME %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_CANT_EDIT") %></td>
</tr>
<tr>
	<th><%= Settings.SYSTEM_ACCOUNT_PASSWORD %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_CANT_EDIT") %></td>
</tr>
<tr>
	<th><%= Settings.GUEST_ACCOUNT_NAME %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_CANT_EDIT") %></td>
</tr>
<tr>
	<th><%= Settings.GUEST_ACCOUNT_PASSWORD %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_CANT_EDIT") %></td>
</tr>
<tr>
	<th><%= Settings.ROOT_NODE_DN %>:</th>
	<td><asp:TextBox ID="txtRNDN" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ROOT_CONTEXT_NODE_NAME %>:</th>
	<td><asp:TextBox ID="txtRCNN" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ROOT_PORTAL_USERS_DN %>:</th>
	<td><asp:TextBox ID="txtRPUDN" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ROOT_MYPAGES_DN %>:</th>
	<td><asp:TextBox ID="txtRMDN" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ROOT_DATA_IMPORT_DN %>:</th>
	<td><asp:TextBox ID="txtRDIDN" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ROOT_CAMPUS_GROUPS_DN %>:</th>
	<td><asp:TextBox ID="txtRCGDN" Runat="server" Width="500" /></td>
</tr>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Globalization.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Globalization" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework.Configuration" %>
<tr>
	<th><%= Settings.LANGUAGE_CODE %>:</th>
	<td><asp:TextBox ID="txtLCode" Runat="server" Columns="10" /></td>
</tr>
<tr>
    <th><%= Settings.GLOBALIZATION_CONNECTION_STRING%>:</th>
    <td><asp:TextBox ID="tbGCS" runat="server" Columns="80" /></td>
</tr>
<tr>
	<th><%= Settings.RELOAD %>:</th>
	<td><asp:TextBox ID="txtReload" Runat="server" Columns="10" /></td>
</tr>
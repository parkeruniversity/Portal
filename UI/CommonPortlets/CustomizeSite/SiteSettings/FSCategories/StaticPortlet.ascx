<%@ Control Language="c#" AutoEventWireup="false" Codebehind="StaticPortlet.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.StaticPortlet" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>
<tr>
	<th><%= ConfigSettings.MY_INFO_PORTLET_NAME %>:</th>
	<td><asp:TextBox ID="txtMIPortletName" Runat="server" Width="500" /></td>
</tr>

<tr>
	<th><%= ConfigSettings.MY_INFO_PORTLET_PATH %>:</th>
	<td><asp:TextBox ID="txtMIPortletPath" Runat="server" Width="500" /></td>
</tr>
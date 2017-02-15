<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Location.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Location" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>

<tr>
	<th><%= ConfigSettings.ICS_FILESERVER_PATH %>:</th>
	<td><asp:TextBox ID="txtFSPath" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.COMMON_IMAGES_PATH %>:</th>
	<td><asp:TextBox ID="txtCommonIP" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.PORTLET_TITLE_BAR_IMAGES_PATH %>:</th>
	<td><asp:TextBox ID="txtPTitleBarIP" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.PORTLET_ICON_IMAGES_PATH %>:</th>
	<td><asp:TextBox ID="txtPIconIP" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.PORTLET_FOOTER_IMAGES_PATH %>:</th>
	<td><asp:TextBox ID="txtPFooterIP" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.CONTROL_IMAGES_PATH %>:</th>
	<td><asp:TextBox ID="txtControlIP" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= ConfigSettings.REPORTING_TOOL_URL %>:</th>
	<td><asp:TextBox ID="txtReportingToolUrl" Runat="server" Width="500" /></td>
</tr>
<tr>
    <th><%= ConfigSettings.UPLOAD_FILE_DIRECTORY%>:</th>
    <td><asp:TextBox ID="txtUploadFileDirectory" Runat="server" Width="500" /></td>
</tr>
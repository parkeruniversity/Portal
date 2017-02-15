<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Validation.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Validation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>
<tr>
	<th><%= ConfigSettings.EMAIL_REGULAR_EXPRESSION %>:</th>
	<td><asp:TextBox ID="txtEmailRegEx" Runat="server" Width="500" /></td>
</tr>

<tr>
	<th><%= ConfigSettings.URL_REGULAR_EXPRESSION %>:</th>
	<td><asp:TextBox ID="txtUrlRegEx" Runat="server" Width="500" /></td>
</tr>
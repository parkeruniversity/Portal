<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PortletSettings.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.PortletSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<tr>
    <td colspan="2">
        <%=Globalizer.GetGlobalizedString("MSG_FSC_PS_CCFD")%>
    </td>
</tr>
<tr>
	<th width="10%"><%= ConfigSettings.COPY_COURSE_FORUM_DEFAULT %>:</th>
	
	<td>
		<asp:DropDownList ID="ddlCCFD" Runat="server">
			<asp:ListItem Value="None">None</asp:ListItem>
			<asp:ListItem Value="Faculty" Selected="True">Faculty</asp:ListItem>
			<asp:ListItem Value="All">All</asp:ListItem>
		</asp:DropDownList>
	</td>
</tr>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
<tr>
    <td colspan="2">
        <%=Globalizer.GetGlobalizedString("MSG_FSC_PS_ASFT")%>
    </td>
</tr>
<tr>
    <th width="10%"><%= ConfigSettings.ALWAYS_SHOW_FEATURE_TITLE %>:</th>
	
	<td>
		<asp:DropDownList ID="ddlASFT" Runat="server">
            <asp:ListItem Value="true" Text="True" />
            <asp:ListItem Value="false" Text="False" Selected="True"  />
		</asp:DropDownList>
	</td>
</tr>

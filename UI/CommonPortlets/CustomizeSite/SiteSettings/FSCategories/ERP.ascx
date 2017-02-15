<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ERP.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.ERP" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework.Configuration" %>
<tr>
	<th><%= Settings.ERP_TYPE %>:</th>
	<td><asp:Literal ID="litERPType" Runat="server" /></td>
</tr>

<tr>
	<th><%= Settings.CONNECTION_PROFILE %>:</th>
	<td><asp:TextBox ID="txtConnProfile" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.LINKS_URL %>:</th>
	<td><asp:TextBox ID="txtLinksUrl" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_URL %>:</th>
	<td><asp:TextBox ID="txtWSUrl" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_AUTH %>:</th>
	<td>
	    <asp:DropDownList ID="ddlWSAuth" runat="server">
	        <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
	    </asp:DropDownList>
	</td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_AUTH_USER %>:</th>
	<td><asp:TextBox ID="txtWSAuthUser" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_AUTH_PASSWORD %>:</th>
	<td><%= Globalizer.GetGlobalizedString("MSG_FSC_HIDDEN_PASSWORD")%><br /><asp:TextBox ID="txtWSAuthPassword" Runat="server" Width="500" TextMode="Password" /></td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_DEBUG_XML %>:</th>
	<td>
	    <asp:DropDownList ID="ddlWSDebugXml" runat="server">
	        <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
	    </asp:DropDownList>
	</td>
</tr>
<tr>
	<th><%= Settings.ERP_WEBSERVICE_DEBUG_XML_OUTPUT_PATH %>:</th>
	<td><asp:TextBox ID="txtWSDebugXmlPath" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.PLUGIN_TRACE_CONFIG_FILE %>:</th>
	<td><asp:TextBox ID="txtPTConfigFile" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.AUTHORIZE_NET_URL %>:</th>
	<td><asp:TextBox ID="txtAuthNetUrl" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.SEND_INCOMPLETE_FORMS %>:</th>
	<td>
	    <asp:DropDownList ID="ddlSendIncForms" Runat="server">
	        <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
	    </asp:DropDownList>
    </td>
</tr>
<tr>
    <th><%= Settings.ALLOW_HTML %>:</th>
    <td>
        <asp:DropDownList ID="ddlAllowHTML" runat="server">
            <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
        </asp:DropDownList>
    </td>
</tr>
<asp:PlaceHolder ID="phEX" Runat="server">
    <tr>
	    <th><%= Settings.EX_DB_TYPE %>:</th>
	    <td><asp:TextBox ID="txtEXDBType" Runat="server" Width="500" /></td>
    </tr>
</asp:PlaceHolder>
<asp:PlaceHolder ID="phEXQX" Runat="server">
    <tr>
	    <th><%= Settings.EX_DB_SERVER_NAME %>:</th>
	    <td><asp:TextBox ID="txtEXDBServerName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.EX_DB_NAME %>:</th>
	    <td><asp:TextBox ID="txtEXDBName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.EX_DB_USER_NAME %>:</th>
	    <td><asp:TextBox ID="txtEXDBUserName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.EX_DB_PASSWORD %>:</th>
	    <td><%= Globalizer.GetGlobalizedString("MSG_FSC_HIDDEN_PASSWORD")%><br /><asp:TextBox ID="txtEXDBPassword" Runat="server" Width="500" TextMode="Password" /></td>
    </tr>
</asp:PlaceHolder>
<asp:PlaceHolder ID="phEX2" Runat="server">
    <tr>
	    <th><%= Settings.EX_DB_ADDITIONAL_INFO %>:</th>
	    <td><asp:TextBox ID="txtEXDBAddInfo" Runat="server" Width="500" /></td>
    </tr>
    <tr>
        <th>
            <%= Settings.EXI_API_ROOT %>:
        </th>
        <td>
            <asp:TextBox runat="server" ID="txtExWebApiRoot" Width="500" />
        </td>
    </tr>
</asp:PlaceHolder>
<asp:PlaceHolder ID="phQX" runat="server">
    <tr>
	    <th><%= Settings.F_AID_DB_SERVER_NAME %>:</th>
	    <td><asp:TextBox ID="txtFAidDBServerName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.F_AID_DB_NAME %>:</th>
	    <td><asp:TextBox ID="txtFAidDBName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.F_AID_DB_USER_NAME %>:</th>
	    <td><asp:TextBox ID="txtFAidDBUserName" Runat="server" Width="500" /></td>
    </tr>
    <tr>
	    <th><%= Settings.F_AID_DB_PASSWORD %>:</th>
	    <td><%= Globalizer.GetGlobalizedString("MSG_FSC_HIDDEN_PASSWORD")%><br /><asp:TextBox ID="txtFAidDBPassword" Runat="server" Width="500" TextMode="Password" /></td>
    </tr>
</asp:PlaceHolder>
<asp:PlaceHolder ID="phTE" Runat="server">
<tr>
	<th><%= Settings.TE_DB_CONNECTION  %>:</th>
	<td><asp:TextBox ID="txtTEDBConn" Runat="server" Width="500" /></td>
</tr>
</asp:PlaceHolder>
<tr>
	<th><%= Settings.MAX_GLACCTS_TO_DISPLAY  %>:</th>
	<td><asp:TextBox ID="txtMaxGLAcctsToDisp" Runat="server" Width="500" /></td>
</tr>
<tr>
	<th><%= Settings.MAX_GLACCTS_FOR_LIST_BOX  %>:</th>
	<td><asp:TextBox ID="txtMaxGLAcctsForListBox" Runat="server" Width="500" /></td>
</tr>

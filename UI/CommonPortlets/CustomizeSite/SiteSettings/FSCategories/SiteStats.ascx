<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteStats.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.SiteStats" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>

<tr><td>

    <h5><%= Globalizer.GetGlobalizedString("TXT_FSC_LOGGING_CONNECTION_STRING") %></h5>
    <div class="pSection">
        <%= Globalizer.GetGlobalizedString("MSG_FSC_LOGGING_CONNECTION_STRING") %>
    </div>
    <div class="pSection">
        <asp:TextBox ID="tbLCS" runat="server" Columns="100" />
    </div>
    
    <h5><%= Globalizer.GetGlobalizedString("TXT_FSC_LOG_SITE_STATS") %></h5>
    <div class="pSection">
        <%= Globalizer.GetGlobalizedString("MSG_FSC_LOG_SITE_STATS") %>
    </div>
    <div class="pSection">
        <asp:DropDownList ID="ddlLogSiteStats" Runat="server">
	        <asp:ListItem Value="true" Text="True" />
	        <asp:ListItem Value="false" Text="False" />
	    </asp:DropDownList>
    </div>

    <h5><%= Globalizer.GetGlobalizedString("TXT_FSC_REMOVE_STATS_AFTER_NUMBER_OF_DAYS") %></h5>
    <div class="pSection">
        <%= Globalizer.GetGlobalizedString("MSG_FSC_REMOVE_STATS_AFTER_NUMBER_OF_DAYS") %>
    </div>
    <div class="pSection">
        <asp:TextBox ID="txtRemoveStats" Runat="server" Width="50" />
        <span class="ValidationError">
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtRemoveStats" ErrorMessage="Must be a number." />
        </span>
    </div>

</td></tr>
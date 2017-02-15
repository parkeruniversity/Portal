<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminBar.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.AdminBar" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<asp:Panel id="menuAdmin" runat="server" CssClass="adminMenu">
    <div class="settingsMenu">
    </div>
    <div class="actionsMenu">
        <a id="editAdminLink" CausesValidation="false" Visible="False" runat="server">Edit Page (Legacy)</a>
        <a id="pageAccessLink" CausesValidation="false" runat="server"><%= Globalizer.GetGlobalizedString("TXT_ADMIN_PAGE_ACCESS") %></a>
        <a id="pageOptionsLink" CausesValidation="false" runat="server"><%= Globalizer.GetGlobalizedString("TXT_ADMIN_PAGE_OPTIONS") %></a>
        <a id="pageSettingLink"  CausesValidation="false" runat="server"><%= Globalizer.GetGlobalizedString("TXT_ADMIN_PAGE_SETTINGS") %></a>
        <a id="pageLayoutLink"  CausesValidation="false" runat="server">Layout</a>  
        <a id="pageRearangeLink" CausesValidation="false" runat="server"><%= Globalizer.GetGlobalizedString("TXT_ADMIN_PAGE_REARRANGE") %></a>   
        <a id="pageOpenMoxieManager" CausesValidation="false" runat="server" href="javascript:moxman.browse();"><%=Globalizer.GetString("LBL_MOXIE_MANAGER") %></a>
    </div>
</asp:Panel>
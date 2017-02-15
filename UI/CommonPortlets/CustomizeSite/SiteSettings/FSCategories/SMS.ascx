<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SMS.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.SMS" %>
<tr>
    <td></td>
    <td>
        <div id="divError" runat="server" class="ApplicationError"></div>
    </td>
</tr>
<tr>
    <th>
        <label id="accountIdLabel" runat="server">Account Sid:</label>
    </th>
    <td>
        <asp:TextBox ID="txtAccountSid" runat="server" Width="500" /></td>
</tr>
<tr>
    <th>
        <label id="authTokenLabel" runat="server">
            Authorization Token:    
        </label>
    </th>
    <td>
        <asp:TextBox ID="txtAuthToken" runat="server" Width="500" /></td>
</tr>
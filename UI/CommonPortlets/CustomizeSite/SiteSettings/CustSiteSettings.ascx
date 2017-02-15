<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="CustSiteSettings.ascx.cs"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustSiteSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
    <fieldset>
        <table>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblRedirectTo" runat="server" ForControl="lblRedirectPage"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:Label ID="lblRedirectPage" runat="server" />&nbsp;<asp:LinkButton ID="lnkEditRedirectTo"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblRedirectOutTo" runat="server" ForControl="lblRedirectPageOut"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:Label ID="lblRedirectPageOut" runat="server" />&nbsp;
                    <asp:LinkButton ID="lnkEditRedirectToOut" runat="server" />
                </td>
            </tr>
            <tr id="trThemes" runat="server">
                <th>
                    <cmn:FormLabel ID="lblThemes" runat="server" ForControl="lbThemes" TextKey="LBL_PORTAL_DESIGN_THEMES" />
                </th>
                <td class="text">
                    <asp:LinkButton ID="lbThemes" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblOperations" runat="server" ForControl="lnkEditOperations"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkEditOperations" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblSettings" runat="server" ForControl="lnkEditSettings"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkEditSettings" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblSync" runat="server" ForControl="lnkGroupMembership"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkGroupMembership" runat="server" />
                    &nbsp;
                    <asp:Label ID="lblGMComplete" CssClass="PortletError" runat="server" /><br>
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:GlobalizedLabel ID="lblClearCache" runat="server" TextKey="LBL_CLEAR_CACHE"></cmn:GlobalizedLabel>
                </th>
                <td class="text">
                    <cmn:GlobalizedLinkButton ID="lnkClearAppCache" runat="server" TextKey="TXT_APP_DATA" />
                    &nbsp;
                    <cmn:GlobalizedLinkButton ID="lnkClearGlobCache" runat="server" TextKey="TXT_GLOBAL_DATA" />
                    &nbsp;
                    <asp:Label ID="lblComplete" CssClass="PortletError" runat="server" />
                    <br>
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:FormLabel ID="lblAdvSettings" runat="server" ForControl="lnkAdvSettings"></cmn:FormLabel>
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkAdvSettings" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:GlobalizedLabel ID="lblFwkSettings" runat="server" TextKey="LBL_FWK_SETTINGS" />
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkFwkSettings" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:GlobalizedLabel ID="lblPortalAccountCreator" runat="server" TextKey="LBL_PORTAL-ONLY_ACCOUNT_CREATOR" />
                </th>
                <td class="text">
                    <asp:LinkButton ID="lnkPortalAccountCreator" runat="server" />
                    &nbsp;
                    <asp:Label ID="lblPortalAccountCreatorNotePt1" CssClass="PortletError" runat="server"></asp:Label>
                    <asp:LinkButton ID="lnkAdvanceSiteSettings" CssClass="PortletError" style="color:Blue" runat="server"></asp:LinkButton>
                    <asp:Label ID="lblPortalAccountCreatorNotePt2" CssClass="PortletError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>
                    <cmn:GlobalizedLabel ID="lblVersionInfo" runat="server" LabelKey="TXT_PORTAL_VERSION_INFO" />
                </th>
                <td class="text">
                    <asp:LinkButton ID="lbVersionInfo" runat="server" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<p>
    <asp:Label ID="lblDebug" runat="server" /></p>

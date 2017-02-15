<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="RegistrationHolds.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.RegistrationHolds" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divError" visible="False" runat="server">
    <cmn:ErrorDisplay ID="ctlError" runat="server">
    </cmn:ErrorDisplay>
</div>
<div class="pSection" id="divWarning" visible="False" runat="server">
    <asp:Label ID="lblWarning" runat="server" CssClass="PortletError"></asp:Label></div>
<div class="pSection" id="divMessage" visible="False" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label></div>
<h4>
    Registration Hold(s)</h4>
<div class="pSection" id="divMain" runat="server" visible="true">
    <table width="95%">
        <div id="divPersonalInfo" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5>
                        <cmn:GlobalizedLiteral ID="glitAddDropSettings" runat="server" TextKey="TXT_CS_RH_PERSONAL_INFO_VERIFICATION"></cmn:GlobalizedLiteral></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <cmn:Hint ID="hntPersonalInfoHint" TextKey="TXT_CS_RH_PERSONALINFO_UPDATE_HINT" runat="server"></cmn:Hint>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>

                <td colspan="2">
                    <asp:LinkButton runat="server" Text="Complete the Personal Info Update form" ID="lbPersonalInfoUpdate"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
        </div>
        <div id="divRegistrationAgreement" visible="True" runat="server">
            <tr>
                <td colspan="3">
                    <h5>
                        <cmn:GlobalizedLiteral ID="glitRegistrationAgreement" runat="server" TextKey="TXT_CS_RH_REGISTRATION_AGREEMENT"></cmn:GlobalizedLiteral></h5>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <cmn:Hint ID="Hint1" TextKey="TXT_CS_RH_REGISTRATION_AGREEMENT_HINT" runat="server"></cmn:Hint>
                </td>
            </tr>
            <tr>
                <td width="4%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:LinkButton ID="lbRegistrationAgreement" runat="server" Text="Read the Registration Agreement"></asp:LinkButton>
                </td>
            </tr>
        </div>
    </table>
</div>

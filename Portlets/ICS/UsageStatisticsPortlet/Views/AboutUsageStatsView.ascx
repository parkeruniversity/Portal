<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AboutUsageStatsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.AboutUsageStatsView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc1" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table cellpadding="3" class="USAboutUsageStats">
        <tr>
            <td rowspan="2" width="40">
                <asp:Image ID="imgIntro" runat="server" AlternateText="About Usage Statistics" />
            </td>
            <td class="BoldText">
                <common:GlobalizedLiteral ID="glitAboutIntroHeader" 
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hlIntroUsageMain" runat="server">Back to Usage Main Screen</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <common:GlobalizedLiteral ID="glitAboutIntroDescription" TextKey="TXT_USAGESTATS_INTRO_DESCRIPTION"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Image ID="imgActivityByUser" runat="server" AlternateText="Activity by Person" />
            </td>
            <td class="BoldText">
                <common:GlobalizedLiteral ID="GlobalizedLiteral1" TextKey="TXT_USAGESTATS_ACTIVITY_BYUSER_HEADER"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hlActivityByUser" runat="server">View Activity by Visitor</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <common:GlobalizedLiteral ID="GlobalizedLiteral2" TextKey="TXT_USAGESTATS_ACTIVITY_BYUSER_DESCRIPTION"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Image ID="imgActivityByPage" runat="server" AlternateText="Activity by Page" />
            </td>
            <td class="BoldText">
                <common:GlobalizedLiteral ID="GlobalizedLiteral3" TextKey="TXT_USAGESTATS_ACTIVITY_BYPAGE_HEADER"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hlActivityByPage" runat="server">View Activity by Page</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <common:GlobalizedLiteral ID="GlobalizedLiteral4" TextKey="TXT_USAGESTATS_ACTIVITY_BYPAGE_DESCRIPTION"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
       
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Image ID="imgFullReport" runat="server" AlternateText="Full Report" />
            </td>
            <td class="BoldText">
                <common:GlobalizedLiteral ID="GlobalizedLiteral7" TextKey="TXT_USAGESTATS_FULL_REPORT_HEADER"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hlFullReport" runat="server">View Full Report</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <common:GlobalizedLiteral ID="GlobalizedLiteral8" TextKey="TXT_USAGESTATS_FULL_REPORT_DESCRIPTION"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:BackToContextLink ID="BackToContextLink" runat="server" />
            </td>
        </tr>
    </table>

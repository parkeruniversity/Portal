<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.MainView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="../UserControls/BackToContextLink.ascx" TagName="BackToContextLink"
    TagPrefix="uc1" %>
<div class="pSection">
    <asp:Label ID="lblActivitySummary" runat="server" CssClass="BoldText" />
    <br />
    <br />
    <table cellpadding="7">
        <tr>
            <td align="right">
                <asp:Label ID="lblTotalPageViews" runat="server" />
            </td>
            <td colspan="2">
                <asp:Label ID="lblTotalPageViewsValue" runat="server" CssClass="BoldText" />
            </td>
            <td align="right">
                <asp:Label ID="lblMostPopularPages" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblMostPopularPageOneRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostPopularPageOne" runat="server">
                    <asp:Label ID="lblMostPopularPageOne" runat="server" />
                </a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblUniqueVisitors" runat="server" />
            </td>
            <td colspan="2">
                <asp:Label ID="lblUniqueVisitorsValue" runat="server" CssClass="BoldText" />
            </td>
            <td>
            </td>
            <td>
                <asp:Label ID="lblMostPopularPageTwoRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostPopularPageTwo" runat="server">
                    <asp:Label ID="lblMostPopularPageTwo" runat="server" />
                </a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblAverageViewsPerVisitor" runat="server" />
            </td>
            <td colspan="2">
                <asp:Label ID="lblAverageViewsPerVisitorValue" runat="server" CssClass="BoldText" />
            </td>
            <td align="right">
                <asp:Label ID="lblMostPopularPortlets" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblMostPopularPortletOneRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostPopularPortletOne" runat="server">
                    <asp:Label ID="lblMostPopularPortletOne" runat="server" /></a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblDaysActive" runat="server" />
            </td>
            <td colspan="2">
                <asp:Label ID="lblDaysActiveValue" runat="server" CssClass="BoldText" />
                <asp:Label ID="lblOldestActivityDate" runat="server" />
            </td>
            <td>
            </td>
            <td>
                <asp:Label ID="lblMostPopularPortletTwoRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostPopularPortletTwo" runat="server">
                    <asp:Label ID="lblMostPopularPortletTwo" runat="server" />
                </a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblAverageViewsPerDay" runat="server" />
            </td>
            <td colspan="2">
                <asp:Label ID="lblAverageViewsPerDayValue" runat="server" CssClass="BoldText" />
            </td>
            <td align="right">
                <asp:Label ID="lblLeastPopularPages" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblLeastPopularPageOneRating" runat="server" />
            </td>
            <td>
                <a id="lnkLeastPopularPageOne" runat="server">
                    <asp:Label ID="lblLeastPopularPageOne" runat="server" /></a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblMostActiveVistors" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblMostActiveVistorOneRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostActiveVistorOne" runat="server">
                    <asp:Label ID="lblMostActiveVistorOne" runat="server" /></a>
            </td>
            <td>
            </td>
            <td>
                <asp:Label ID="lblLeastPopularPageTwoRating" runat="server" />
            </td>
            <td>
                <a id="lnkLeastPopularPageTwo" runat="server">
                    <asp:Label ID="lblLeastPopularPageTwo" runat="server" /></a>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblMostActiveVisitorTwoRating" runat="server" />
            </td>
            <td>
                <a id="lnkMostActiveVistorTwo" runat="server">
                    <asp:Label ID="lblMostActiveVistorTwo" runat="server" /></a>
            </td>
            <td align="right">
                <asp:Label ID="lblLeastPopularPortlets" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblLeastPopularPortletOneRating" runat="server" />
            </td>
            <td>
                <a id="lnkLeastPopularPortletOne" runat="server">
                    <asp:Label ID="lblLeastPopularPortletOne" runat="server" />
                </a>
            </td>
        </tr>
        <tr>
            <td colspan="4">
            </td>
            <td>
                <asp:Label ID="lblLeastPopularPortletTwoRating" runat="server" />
            </td>
            <td>
                <a id="lnkLeastPopularPortletTwo" runat="server">
                    <asp:Label ID="lblLeastPopularPortletTwo" runat="server" />
                </a>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:Label ID="lblViewMoreUsageStats" runat="server" CssClass="BoldText" />
    <br />
    <table cellpadding="10">
        <tr>
            <td style="vertical-align: top;">
                <img src="ui/common/images/PortletImages/Icons/icon_users_32.gif" alt="Activity By User" />
            </td>
            <td>
                <a id="lnkActivityByVisitor" runat="server">
                    <asp:Label ID="lblActivityByVisitor" runat="server" />
                </a>
                <br />
                <br />
                <asp:Label ID="lblActivityByVisitorDescription" runat="server" />
            </td>
            <td style="vertical-align: top">
                <img src="ui/common/images/PortletImages/Icons/icon_pages_32.gif" alt="Activity By Page" />
            </td>
            <td>
                <a id="lnkActivityByPage" runat="server">
                    <asp:Label ID="lblActivityByPage" runat="server" /></a>
                <br />
                <br />
                <asp:Label ID="lblActivityByPageDescription" runat="server" />
                <br />
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                <img src="ui/common/images/PortletImages/Icons/icon_report_32.gif" alt="Full Report" />
            </td>
            <td>
                <a id="lnkFullReport" runat="server">
                    <asp:Label ID="lblFullReport" runat="server" /></a>
                <br />
                <br />
                <asp:Label ID="lblFullReportDescription" runat="server" />
                <br />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="USAboutUsageStatsTable" cellpadding="5" width="75%" >
        <tr>
            <td rowspan="2" align="right" valign="top">
                <img src="ui/common/images/PortletImages/Icons/icon_help_32.gif" alt="About Usage Statistics" />
            </td>
            <td align="left">
                <asp:HyperLink ID="hlAboutUsageStats" runat="server">
                    <asp:Label ID="lblAboutUsageStats" runat="server" />
                </asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <common:GlobalizedLiteral ID="GlobalizedLiteral7" TextKey="TXT_USAGESTATS_MAIN_PAGE_ABOUT"
                    runat="server"></common:GlobalizedLiteral>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <uc1:BackToContextLink ID="BackToContextLink" runat="server" /></div>

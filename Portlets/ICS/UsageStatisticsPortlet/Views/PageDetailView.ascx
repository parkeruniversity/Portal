<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageDetailView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PageDetailView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../UserControls/ActivityRatingPopup.ascx" TagName="ActivityRatingPopup" TagPrefix="uc1" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet" %>
<%@ Register src="../UserControls/EmptyGridViewDisplay.ascx" tagname="EmptyGridViewDisplay" tagprefix="uc2" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table width="100%" cellpadding="20">
        <tr>
            <td valign="top" style="width: 75%;">
                <table cellpadding="5">
                    <tr>
                        <td valign="top">
                            <img src="ui/common/images/PortletImages/Icons/icon_page_byport_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblPageName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblActivity" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblByPortlet" runat="server" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="5">
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblTotalPageViews" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblTotalPageViewsValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblUniqueVisitors" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblUniqueVisitorsValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblMostActivePortlet" runat="server" />
                        </td>
                        <td class="BoldText">
                            <a id="lnkMostActivePortlet" runat="server">
                                <asp:Label ID="lblMostActivePortletValue" runat="server" CssClass="BoldText" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblMostActiveRole" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblMostActiveRoleValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAverageViewsPerDay" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblAverageViewsPerDayValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAverageTimePerVisit" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblAverageTimePerVisitValue" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblMinutes" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                </table>
                <br />
                <div id="divGridView" runat="server">
                <asp:UpdatePanel ID="upPortlets" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdPortlets" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowSorting="true" Width="100%" BorderColor="#dcdcdc"
                            BorderStyle="Solid" BorderWidth="1px" ShowFooter="True">
                            <RowStyle BackColor="white" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <img src="ui/common/images/PortletImages/Icons/icon_portlet_16.gif" />
                                        <a id="lnkPortlet" runat="server">
                                            <%# Eval("PortletName") %>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Views" SortExpression="Views">
                                    <ItemTemplate>
                                        <asp:Label ID="lblViews" runat="server" CssClass="BoldText" />
                                        <asp:Label ID="lblViewsPercentage" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rating" SortExpression="Views">
                                    <ItemTemplate>
                                        <%# ((Rating)Eval("Rating")).ImageHtml %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#DFDFDF" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="#efefef" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div style="float: right">
                    <uc1:ActivityRatingPopup ID="ActivityRatingPopup" runat="server" ActivityType="User" />
                </div>
                </div>
                <uc2:EmptyGridViewDisplay ID="EmptyGridViewDisplay" runat="server" Visible="false" />
            </td>
            <td valign="top" style="width: 25%;">
                <table id="NavigationTable" class="NavigationTable" cellspacing="0">
                    <tr>
                        <td colspan="2" class="NavigationTableHeaderCell">
                            <asp:Label ID="lblNumberOfVisitors" runat="server" CssClass="NumberOfVisitorsText" />
                            <asp:Label ID="lblVisitors" runat="server" CssClass="NumberOfVisitorsText" />
                            <br />
                            <asp:Label ID="lblHaveViewedPagesHere" runat="server" CssClass="HaveViewedPagesHereText" />
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_page_byuser_32.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkPageDetailByUser" runat="server">
                                <asp:Label ID="lblPageDetailByUser" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_report_32.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewPageReport" runat="server">
                                <asp:Label ID="lblViewPageReport" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_pages_16.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkActivityByPage" runat="server">
                                <asp:Label ID="lblActivityByPage" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_graph_16.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkMainScreen" runat="server">
                                <asp:Label ID="lblMainScreen" runat="server" />
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <uc3:BackToContextLink ID="BackToContextLink" runat="server" />
    
</div>

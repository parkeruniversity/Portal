<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PortletDetailView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PortletDetailView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../UserControls/ActivityRatingPopup.ascx" TagName="ActivityRatingPopup"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet" %>
<%@ Register Src="../UserControls/EmptyGridViewDisplay.ascx" TagName="EmptyGridViewDisplay"
    TagPrefix="uc2" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table cellpadding="15">
        <tr>
            <td valign="top" style="width: 75%;">
                <table cellpadding="5">
                    <tr>
                        <td valign="top">
                            <img src="ui/common/images/PortletImages/Icons/icon_portletuser_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblPortletName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblPortletActivity" runat="server" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="5">
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblTotalPortletActions" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblTotalPortletActionsValue" runat="server" CssClass="BoldText" />
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
                            <asp:Label ID="lblMostActiveVisitor" runat="server" />
                        </td>
                        <td class="BoldText">
                            <a id="lnkMostActiveVisitor" runat="server">
                                <asp:Label ID="lblMostActiveVisitorValue" runat="server" CssClass="BoldText" />
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
                            <asp:Label ID="lblAvgViewsPerDay" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblAvgViewsPerDayValue" runat="server" CssClass="BoldText" />
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
                    <asp:UpdatePanel ID="upUsers" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AllowSorting="True" BorderColor="#dcdcdc"
                                BorderStyle="Solid" BorderWidth="1px" Width="100%">
                                <RowStyle BackColor="white" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <img src="ui/common/images/PortletImages/Icons/icon_user_16.gif" />
                                            <a id="lnkVisitor" runat="server">
                                                <%# Eval("UserName") %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RoleDisplay" HeaderText="Role"  />
                                    <asp:BoundField DataField="Views" HeaderText="Views" SortExpression="Views" />
                                    <asp:TemplateField HeaderText="Rating" SortExpression="Views">
                                        <ItemTemplate>
                                            <%# ((Rating)Eval("Rating")).ImageHtml %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
                            <asp:Label ID="lblOfVisitors" runat="server" CssClass="NumberOfVisitorsText" />
                            <br />
                            <asp:Label ID="lblHaveViewedPagesHere" runat="server" CssClass="HaveViewedPagesHereText" />
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_report_32.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewPortletReport" runat="server">
                                <asp:Label ID="lblViewPortletReport" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_page_16.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewPageActivity" runat="server">
                                <asp:Label ID="lblViewPageActivity" runat="server" />
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
    <br />
</div>
<uc3:BackToContextLink ID="BackToContextLink" runat="server" />


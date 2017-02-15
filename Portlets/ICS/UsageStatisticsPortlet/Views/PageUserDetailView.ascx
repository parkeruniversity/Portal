<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageUserDetailView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PageUserDetailView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../UserControls/USUserDisplay.ascx" TagName="USUserDisplay" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/ActivityRatingPopup.ascx" TagName="ActivityRatingPopup"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
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
                            <img src="ui/common/images/PortletImages/Icons/icon_page_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblPageName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblPageActivity" runat="server" CssClass="BoldText" />
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
                            <asp:Label ID="lblMostViewedPortlet" runat="server" />
                        </td>
                        <td>
                            <a id="lnkMostViewedPortlet" runat="server">
                                <asp:Label ID="lblMostViewedPortletValue" runat="server" CssClass="BoldText" />
                            </a>
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
                            <asp:Label ID="lblMostRecentVisit" runat="server" />
                        </td>
                        <td>
                            <a id="lnkMostRecentVisit" runat="server">
                                <asp:Label ID="lblMostRecentVisitValue" runat="server" CssClass="BoldText" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAverageTimePerVisit" runat="server" />
                        </td>
                        <td class="BoldText">
                            <asp:Label ID="lblAverageTimePerVisitValue" runat="server" CssClass="BoldText" />
                            &nbsp;
                            <asp:Label ID="lblMinutes" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <div id="divGridView" runat="server">
                    <asp:UpdatePanel ID="upPortlets" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdPortlets" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AllowSorting="true" Width="100%" BorderColor="#dcdcdc"
                                BorderStyle="Solid" BorderWidth="1px">
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
                                    <asp:BoundField DataField="Views" HeaderText="Views" SortExpression="Views" />
                                    <asp:TemplateField HeaderText="Rating" SortExpression="Views">
                                        <ItemTemplate>
                                            <asp:Literal ID="litRating" runat="server" />
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
                <uc1:USUserDisplay ID="userDisplay" runat="server" />                
            </td>
        </tr>
    </table>
    <br />
    <br />
    <uc3:BackToContextLink ID="BackToContextLink" runat="server" />
    <br />
</div>

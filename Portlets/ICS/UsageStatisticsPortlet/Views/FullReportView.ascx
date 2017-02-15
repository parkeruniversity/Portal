<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FullReportView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.FullReportView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portal" Assembly="Jenzabar.Portal.Web" Namespace="Jenzabar.Portal.Web.UI.Controls" %>
<%@ Register Src="../UserControls/USReportOptions.ascx" TagName="USReportOptions"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControls/EmptyGridViewDisplay.ascx" TagName="EmptyGridViewDisplay"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControls/BackToContextLink.ascx" TagName="BackToContextLink"
    TagPrefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection" style="width: 100%">
    <table cellpadding="15" width="100%">
        <tr>
            <td valign="top" style="width: 75%;">
                <table cellpadding="5" width="100%">
                    <tr>
                        <td valign="top">
                            <img src="ui/common/images/PortletImages/Icons/icon_report_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblContextName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblActivityReport" runat="server" CssClass="BoldText" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
                            <br />
                            <br />
                            <asp:Label ID="lblReportOptions" runat="server" />
                            <uc1:USReportOptions ID="editReportOptions" runat="server" IsPopup="true" HideImage="true" />
                            <br />
                        </td>
                    </tr>
                </table>
                <common:Mirror ControlID="paging" runat="server" />
                <div id="divGridView" runat="server">
                    <asp:GridView ID="grdVisits" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="Both" Width="100%" CellSpacing="2" BorderColor="#dcdcdc"
                        BorderStyle="Solid" BorderWidth="1px">
                        <RowStyle BackColor="white" />
                        <Columns>
                            <asp:TemplateField HeaderText="Date/Time">
                                <ItemTemplate>
                                    <%# Eval("Time") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Visitor">
                                <ItemTemplate>
                                    <a id="lnkUser" runat="server">
                                        <asp:Label ID="lblUser" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <%# Eval("Action") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IP Address">
                                <ItemTemplate>
                                    <%# Eval("IpAddress") %>
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
                    <portal:Paging ID="paging" runat="server" />
                </div>
                <uc2:EmptyGridViewDisplay ID="EmptyGridViewDisplay" runat="server" Visible="false" />
                <br />
            </td>
            <td valign="top" style="width: 25%;">
                <table id="NavigationTable" class="NavigationTable" cellspacing="0" width="100%">
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_report_options_32.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <uc1:USReportOptions ID="reportOptions" runat="server" IsPopup="true" HideImage="true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_users_32.gif" alt="View Activity by User" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewActivityByUser" runat="server">
                                <asp:Label ID="lblViewActivityByUser" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_pages_32.gif" alt="View Activity by Page" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewActivityByPage" runat="server">
                                <asp:Label ID="lblViewActivityByPage" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_graph_16.gif" alt="Back to Main View" />
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
    <br />
</div>

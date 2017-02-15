<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageDetailReportView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PageDetailReportView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="../UserControls/USReportOptions.ascx" TagName="USReportOptions"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="portal" Assembly="Jenzabar.Portal.Web" Namespace="Jenzabar.Portal.Web.UI.Controls" %>
<%@ Register Src="../UserControls/EmptyGridViewDisplay.ascx" TagName="EmptyGridViewDisplay"
    TagPrefix="uc2" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table cellpadding="15" width="100%">
        <tr>
            <td valign="top" style="width: 75%;">
                <table cellpadding="5" width="100%">
                    <tr>
                        <td valign="top">
                            <img src="ui/common/images/PortletImages/Icons/icon_page_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblPageName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblActivityReport" runat="server" CssClass="BoldText" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
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
            </td>
            <td valign="top" style="width: 25%;">
                <table id="NavigationTable" class="NavigationTable" cellspacing="0">
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
                            <img src="ui/common/images/PortletImages/Icons/icon_page_16.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkPageDetail" runat="server">
                                <asp:Label ID="lblPageDetail" runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="NavigationTableBodyCell">
                            <img src="ui/common/images/PortletImages/Icons/icon_pages_16.gif" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewActivityByPage" runat="server">
                                <asp:Label ID="lblViewActivityByPage" runat="server" />
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
    <br />
</div>

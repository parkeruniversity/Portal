<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserActivityHistoryView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.UserActivityHistoryView" %>
<%@ Register Src="../UserControls/USUserDisplay.ascx" TagName="USUserDisplay" TagPrefix="uc1" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="portal" Assembly="Jenzabar.Portal.Web" Namespace="Jenzabar.Portal.Web.UI.Controls" %>
<%@ Register Src="../UserControls/EmptyGridViewDisplay.ascx" TagName="EmptyGridViewDisplay"
    TagPrefix="uc2" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table width="100%" cellpadding="20">
        <tr>
            <td valign="top" style="width: 75%;">
                <table cellpadding="5">
                    <tr>
                        <td valign="top">
                            <img src="ui/common/images/PortletImages/Icons/icon_userhistory_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblActivityHistory" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblFor" runat="server" />
                            <asp:Label ID="lblName" runat="server" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
                        </td>
                    </tr>
                </table>
                <common:Mirror ControlID="paging" runat="server" />
                <div id="divGridView" runat="server">
                    <asp:UpdatePanel ID="upSessions" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdSessions" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AllowSorting="True" Width="100%" BorderColor="#dcdcdc"
                                BorderStyle="Solid" BorderWidth="1px">
                                <RowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Visits" SortExpression="Visits">
                                        <ItemTemplate>
                                            <img src="ui/common/images/PortletImages/Icons/icon_usersession_16.gif" />
                                            <a id="lnkSession" runat="server">
                                                <%# Eval("StartTime") %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                                        <ItemTemplate>
                                            <%# Eval("DurationInMinutes") %>
                                            <asp:Label ID="lblMinutes" runat="server" />
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
                    <portal:Paging ID="paging" runat="server" />
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
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PortletUserDetailView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PortletUserDetailView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="../UserControls/USUserDisplay.ascx" TagName="USUserDisplay" TagPrefix="uc1" %>
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
                            <img src="ui/common/images/PortletImages/Icons/icon_portlet_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblPortletName" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblPortletActivity" runat="server" CssClass="BoldText" />
                            <br />
                            <asp:Label ID="lblDescription" runat="server" />
                        </td>
                    </tr>
                </table>
                <div id="divGridView" runat="server">
                    <asp:GridView ID="grdVisits" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="Both" Width="100%" BorderColor="#dcdcdc" BorderStyle="Solid"
                        BorderWidth="1px">
                        <RowStyle BackColor="white" />
                        <Columns>
                            <asp:TemplateField HeaderText="Visits">
                                <ItemTemplate>
                                    <a id="lnkDate" runat="server">
                                        <asp:Label ID="lblVisit" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblTime" runat="server" />
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
                <br />
                <img src="ui/common/images/PortletImages/Icons/icon_portlet_16.gif" />
                <a id="lnkPortletDetailView" runat="server">
                    <asp:Label ID="lblViewPortletDetailView" runat="server" />
                </a>
            </td>
            <td valign="top" style="width: 25%;">
                <uc1:USUserDisplay ID="userDisplay" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</div>
<uc3:BackToContextLink ID="BackToContextLink" runat="server" />


<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageUserDetailReportView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.PageUserDetailReportView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../UserControls/USUserDisplay.ascx" TagName="USUserDisplay" TagPrefix="uc1" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="portal" Assembly="Jenzabar.Portal.Web" Namespace="Jenzabar.Portal.Web.UI.Controls" %>
<%@ Register Src="../UserControls/EmptyGridViewDisplay.ascx" TagName="EmptyGridViewDisplay"
    TagPrefix="uc2" %>
<%@ Register src="../UserControls/BackToContextLink.ascx" tagname="BackToContextLink" tagprefix="uc3" %>
<common:Subheader ID="subHeader" runat="server" />
<div class="pSection">
    <table width="100%" cellpadding="20">
        <tr>
            <td valign="top" style="width: 75%;">
                <asp:Image ID="imgHeader" runat="server" />
                <asp:Label ID="lblUsageDetail" runat="server" CssClass="BoldText" />
                <asp:Label ID="lblForUser" runat="server" />
                <br />
                <asp:Label ID="lblUsageDetailDescription" runat="server" />
                <br />
                <br />
                <common:Mirror ControlID="paging" runat="server" />
                <div id="divGridView" runat="server">
                    <asp:UpdatePanel ID="upPortlets" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdPortlets" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="Both" AllowSorting="false" BorderColor="#dcdcdc"
                                BorderStyle="Solid" BorderWidth="1px" Width="100%">
                                <RowStyle BackColor="white" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <a id="lnkDate" runat="server">
                                                <asp:Literal ID="litDate" runat="server"></asp:Literal>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <asp:Literal ID="litTime" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Literal ID="litAction" runat="server"></asp:Literal>
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
                <br />
                <img src="ui/common/images/PortletImages/Icons/icon_page_16.gif" />
                <a id="lnkPageDetailView" runat="server">
                    <asp:Label ID="lblViewPageDetailView" runat="server" />
                </a>
            </td>
            <td valign="top" style="width: 25%;">
                <uc1:USUserDisplay ID="userDisplay" runat="server" />
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <br />
    <uc3:BackToContextLink ID="BackToContextLink" runat="server" />
    <br />
</div>

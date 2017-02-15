<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivityByUserView.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.Views.ActivityByUserView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet" %>
<%@ Register Src="../UserControls/ActivityRatingPopup.ascx" TagName="ActivityRatingPopup"
    TagPrefix="uc1" %>
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
                            <img src="ui/common/images/PortletImages/Icons/icon_users_32.gif" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="lblAllActivityByPerson" runat="server" CssClass="BoldText" /><br />
                            <asp:Label ID="lblAllActivityByPersonDescription" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="5">
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblTotalPageViews" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblTotalPageViewsValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblUniqueVisitors" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblUniqueVisitorsValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblMostActiveVisitor" runat="server" />
                        </td>
                        <td>
                            <a id="lnkMostActiveUser" runat="server">
                                <asp:Label ID="lblMostActiveVisitorValue" runat="server" CssClass="BoldText" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblMostActiveRole" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblMostActiveRoleValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAverageViewsPerDay" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblAverageViewsPerDayValue" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAverageTimePerVisit" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblAverageTimePerVisitValue" runat="server" CssClass="BoldText" />
                            <asp:Label ID="lblMinutes" runat="server" CssClass="BoldText" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <div id="divGridView" runat="server">
                    <asp:UpdatePanel ID="upUsers" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AllowSorting="True" Width="100%" BorderColor="#dcdcdc"
                                BorderStyle="Solid" BorderWidth="1px">
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
                                    <asp:BoundField DataField="RoleDisplay" HeaderText="Role" SortExpression="Role" />
                                    <asp:BoundField DataField="Views" HeaderText="Views" SortExpression="Views" />
                                    <asp:TemplateField HeaderText="Rating" SortExpression="Rating">
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
                            <br />
                            <div style="float: right">
                                <uc1:ActivityRatingPopup ID="ActivityRatingPopup" runat="server" ActivityType="User" />
                            </div>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
                            <img src="ui/common/images/PortletImages/Icons/icon_report_32.gif" alt="View Full Report" />
                        </td>
                        <td class="NavigationTableBodyCell">
                            <a id="lnkViewFullReport" runat="server">
                                <asp:Label ID="lblViewFullReport" runat="server" />
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
    
    <div id="divMissingUsers" runat="server">
      <img src="ui/common/images/PortletImages/Icons/x_icon.gif" />
      <asp:Label ID="lblMissing" runat="server" CssClass="BoldText" />
      <br />
      <asp:Label ID="lblMissingDescription" runat="server" />
      <br />
      <div class="divMissingStudents">
      <asp:Repeater ID="rptMissingUsers" runat="server">
        <ItemTemplate>
          <a id="lnkUser" runat="server">
            <asp:Label ID="lblMissingUser" runat="server" />          
          </a>
          <asp:Label ID="lblCommaPlaceHolder" runat="server" />
          <asp:Label ID="lblMissingUsersGroups" runat="server" />
          <br />
        </ItemTemplate>
      
      </asp:Repeater>
      </div>
    </div>
    <br />
    <br />
      
    
    <uc3:BackToContextLink ID="BackToContextLink" runat="server" />
    
    <br />
</div>

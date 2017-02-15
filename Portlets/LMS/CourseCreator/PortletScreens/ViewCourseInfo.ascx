<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ViewCourseInfo.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.ViewCourseInfo" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="menu" TagName="SectionMenuPopup" Src="UserControls/SectionMenuPopup.ascx" %>
<common:Subheader ID="hdrCourseInfo" runat="server" />
<div class="pSection">
    <!-- Begin Intro Table -->
    <table cellpadding="10" cellspacing="0" width="100%">
        <tr>
            <td colspan="3" class="ViewDepartmentIntroTableTopRowCell">
                <asp:Label ID="lblCourseName" runat="server" CssClass="BoldText" />
            </td>
        </tr>
        <tr>
            <td class="ViewDepartmentIntroTableBottomRowLeftCell">
                <table cellpadding="5">
                    <tr>
                        <td>
                            <img id="imgAddNewCourse" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                        </td>
                        <td style="text-align: left;">
                            <a id="lnkAddNewSection" runat="server">
                                <asp:Label ID="lblAddNewSectionOne" runat="server" CssClass="BoldText" />
                                <br />
                                <asp:Label ID="lblAddNewSectionTwo" runat="server" />
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="ViewDepartmentIntroTableBottomRowRightCell">
                <div id="divManageCourse" runat="server">
                    <img src="ui/common/images/PortletImages/Icons/edit.gif" />
                    <a id="lnkEditCourse" runat="server">
                        <asp:Label ID="lblEditCourse" runat="server" />
                    </a>
                    <br />
                    <img src="ui/common/images/PortletImages/Icons/delete.gif" />
                    <asp:LinkButton ID="lnkDeleteCourse" runat="server">
                        <asp:Label ID="lblDeleteCourse" runat="server" />
                    </asp:LinkButton>
                    <br />
                </div>
            </td>
        </tr>
    </table>
    <!-- End Intro Table -->
    <asp:Repeater ID="rptTerms" runat="server">
        <ItemTemplate>
            <asp:Label ID="lblTerm" runat="server" CssClass="ViewCourseInfoTerm">
      <%# ((Term)Container.DataItem).Name %>
            </asp:Label>
            <br />
            <br />
            <div class="ViewCourseInfoCourse">
                <%= GetCourseDisplay() %>
            </div>
            <br />
            <table>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblPortalOnlySections" runat="server" />
                    </td>
                    <td valign="top">
                        <asp:Repeater ID="rptSections" runat="server">
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td valign="top" style="text-align: left;">
                                            <a id="lnkEditSection" runat="server">
                                                <%# ((Section)Container.DataItem).Course.CourseCode %>
                                                &nbsp;
                                                <%# ((Section)Container.DataItem).Name%>
                                            </a>
                                        </td>
                                        <td>
                                            <menu:sectionmenupopup id="sectionMenu" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />
                    </td>
                </tr>
            </table>
            <div class="ViewCourseInfoTermDivider">
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <br />
    <table width="100%" cellpadding="8">
        <tr>
            <td align="left">
                <a id="lnkMainScreen" runat="server">
                    <asp:Label ID="lblBackToMainScreen" runat="server" />
                </a>
            </td>
            <td align="right">
                <a id="lnkShowPastSections" runat="server">
                    <asp:Label ID="lblShowPastSections" runat="server" />
                </a>
            </td>
        </tr>
    </table>
</div>

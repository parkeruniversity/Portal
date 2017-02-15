<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ViewDepartmentInfo.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.ViewDepartmentInfo" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="menu" TagName="SectionMenuPopup" Src="UserControls/SectionMenuPopup.ascx" %>
<%@ Register TagPrefix="menu" TagName="CourseMenuPopup" Src="UserControls/CourseMenuPopup.ascx" %>

<script language="javascript" type="text/javascript">
    function ConfirmDepartmentDelete() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_DEPARTMENT") %>");                
    }
</script>

<common:Subheader ID="hdrDepartmentInfo" runat="server" />
<div class="pSection">
    <!-- Begin Intro Table -->
    <table cellpadding="10" cellspacing="0" width="100%">
        <tr>
            <td colspan="3" class="ViewDepartmentIntroTableTopRowCell">
                <asp:Label ID="lblDepartmentName" runat="server" CssClass="BoldText" />
            </td>
        </tr>
        <tr>
            <td align="center" class="ViewDepartmentIntroTableBottomRowLeftCell">
                <table cellpadding="5">
                    <tr>
                        <td>
                            <img id="imgAddNewCourse" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                        </td>
                        <td style="text-align: left;">
                            <a id="lnkAddNewCourse" runat="server">
                                <asp:Label ID="lblAddNewCourseOne" runat="server" CssClass="BoldText" />
                                <br />
                                <asp:Label ID="lblAddNewCourseTwo" runat="server" />
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="ViewDepartmentIntroTableBottomRowRightCell">
                <img src="ui/common/images/PortletImages/Icons/edit.gif" />
                <a id="lnkEditDepartment" runat="server">
                    <asp:Label ID="lblEditDepartment" runat="server" />
                </a>
                <br />
                <img src="ui/common/images/PortletImages/Icons/delete.gif" />
                <asp:LinkButton ID="lnkDeleteDepartment" runat="server" OnClientClick="return ConfirmDepartmentDelete()" >
                    <asp:Label ID="lblDeleteDepartment" runat="server" />
                </asp:LinkButton>
                <br />
            </td>
        </tr>
    </table>
    <!-- End Intro Table -->
    <br />
    <br />
    <asp:Repeater ID="rptTerms" runat="server">
        <ItemTemplate>
            <asp:Label ID="lblTerm" runat="server" CssClass="ViewDepartmentTerm" />
            <br />
            <br />
            <!-- Begin Courses Repeater -->
            <asp:Repeater ID="rptCourses" runat="server">
                <ItemTemplate>
                    <asp:Label ID="lblCourse" runat="server" CssClass="BoldText" />
                    <br />
                    <br />
                    <table>
                        <tr align="right">
                            <td valign="top">
                                <asp:Label ID="lblPortalOnlySections" runat="server" />
                            </td>
                            <td valign="top">
                                <!-- Start of PortalOnly Sections Repeater -->
                                <asp:Repeater ID="rptSectionsPortalOnly" runat="server">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td valign="top">
                                                    <a id="lnkEditSection" runat="server">
                                                        <%# ((Section)Container.DataItem).Course.CourseCode %>
                                                        &nbsp;
                                                        <%# ((Section)Container.DataItem).Name%>
                                                    </a>
                                                </td>
                                                <td>
                                                    <menu:SectionMenuPopup ID="sectionMenu" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <!-- End of PortalOnly Sections Repeater -->
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <!-- End Courses Repeater -->
            <br />
            <div class="ViewDepartmentTermDivider">
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

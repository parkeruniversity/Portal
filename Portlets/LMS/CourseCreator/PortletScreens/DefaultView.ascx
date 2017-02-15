<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="DefaultView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.DefaultView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
    <div id="divContent" runat="server">
        <table class="DefaultScreenIntroTable">
            <tr>
                <td class="DefaultScreenIntroTableCell">
                    <asp:Label ID="lblIntro" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" class="DefaultScreenIntroTableMiddleCell">
                    <table cellpadding="5">
                        <tr>
                            <td>
                                <a id="lnkAddNewCourseImage" runat="server" style="text-decoration: none;">
                                    <img id="imgAddNewCourse" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                                </a>
                            </td>
                            <td>
                                <a id="lnkAddNewCourse" runat="server">
                                    <asp:Label ID="lblAddNewCourse" runat="server" CssClass="BoldText" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" class="DefaultScreenIntroTableMiddleCell">
                    <table cellpadding="5">
                        <tr>
                            <td>
                                <a id="lnkAddNewSectionImage" runat="server" style="text-decoration: none;">
                                    <img id="imgAddNewSection" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                                </a>
                            </td>
                            <td>
                                <a id="lnkAddNewSection" runat="server">
                                    <asp:Label ID="lblAddNewSectionOne" runat="server" CssClass="BoldText" />
                                    <br />
                                    <asp:Label ID="lblAddNewSectionTwo" runat="server" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="DefaultScreenIntroTableBottomCell" colspan="2">
                    <a id="lnkViewCurrentCourses" runat="server">
                        <asp:Label ID="lblViewCurrentCourses" runat="server" />
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div id="divNoPermissions" runat="server">
        <asp:Label ID="lblNoPermissions" runat="server" />
    </div>
</div>

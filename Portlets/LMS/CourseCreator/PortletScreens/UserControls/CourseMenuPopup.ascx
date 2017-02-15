<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="CourseMenuPopup.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.CourseMenuPopup" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<script language="javascript" type="text/javascript">

    function ShowCourseMenuBody(iconID, menuBodyID) {
        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "none";
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "block";
        menuBody.style.position = "absolute";
    }

    function CloseCourseMenuBody(menuBodyID, iconID) {
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "none";

        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "block";
    }

    function DeleteCourse() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_COURSE") %>");
    }

</script>

<div>
    <div id="menuIcon" runat="server">
        <img src="ui/common/images/PortletImages/Icons/menu_button.gif" onclick="ShowCourseMenuBody('<%= FindControl("menuIcon").ClientID %>', '<%= FindControl("menuBody").ClientID %>')" />
    </div>
    <div id="menuBody" runat="server" style="display: none;">
        <div class="MainScreenMenuPopup">
            <table>
                <tr>
                    <td valign="top">
                        <img src="ui/common/images/PortletImages/Icons/menu_button.gif" />
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/view_section.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <a id="lnkMoreInfo" href='<%= GetMoreInfoURL() %>'>
                            <asp:Label ID="lblMoreInfo" runat="server" />
                        </a>
                    </td>
                    <td valign="top" style="text-align: left;">
                        <img src="ui/common/images/PortletImages/Icons/icon-close_me.gif" id="menuBodyExitIcon"
                            onclick="CloseCourseMenuBody('<%= FindControl("menuBody").ClientID %>', '<%= FindControl("menuIcon").ClientID %>')" />
                    </td>
                </tr>
                <tr id="tableRowEdit" runat="server">
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/edit.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <a href='<%= GetEditCourseURL() %>'>
                            <asp:Label ID="lblEditCourse" runat="server" />
                        </a>
                    </td>
                     <td valign="top">
                    </td>
                </tr>
                <tr id="tableRowDelete" runat="server">
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/delete.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <asp:LinkButton ID="lnkDeleteCourse" runat="server" OnClientClick="return DeleteCourse();">
                            <asp:Label ID="lblDeleteCourse" runat="server" />
                        </asp:LinkButton>
                    </td>
                     <td valign="top">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

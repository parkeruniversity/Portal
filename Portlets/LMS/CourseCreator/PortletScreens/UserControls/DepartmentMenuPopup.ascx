<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="DepartmentMenuPopup.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.DepartmentMenuPopup" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<script language="javascript" type="text/javascript">

    function ShowDepartmentMenuBody(iconID, menuBodyID) {
        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "none";
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "block";
        menuBody.style.position = "absolute";
    }

    function CloseDepartmentMenuBody(menuBodyID, iconID) {
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "none";

        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "block";
    }

    function DeleteDepartment() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_DEPARTMENT") %>");
    }

</script>

<div>
    <div id="menuIcon" runat="server">
        <img src="ui/common/images/PortletImages/Icons/menu_button.gif" onclick="ShowDepartmentMenuBody('<%= FindControl("menuIcon").ClientID %>', '<%= FindControl("menuBody").ClientID %>')" />
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
                            onclick="CloseDepartmentMenuBody('<%= FindControl("menuBody").ClientID %>', '<%= FindControl("menuIcon").ClientID %>')" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/edit.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <a href='<%= GetEditDepartmentURL() %>'>
                            <asp:Label ID="lblEditDepartment" runat="server" />
                        </a>
                    </td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/delete.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <asp:LinkButton ID="lnkDeleteDepartment" runat="server" OnClientClick="return DeleteDepartment();">
                            <asp:Label ID="lblDeleteDepartment" runat="server" />
                        </asp:LinkButton>
                    </td>
                    <td valign="top">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

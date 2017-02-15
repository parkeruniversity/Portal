<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="SectionMenuPopup.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.SectionMenuPopup" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<script language="javascript" type="text/javascript">

    function ShowSectionMenuBody(iconID, menuBodyID) {
        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "none";
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "block";
        menuBody.style.position = "absolute";
    }

    function CloseSectionMenuBody(menuBodyID, iconID) {
        var menuBody = document.getElementById(menuBodyID);
        menuBody.style.display = "none";

        var menuIcon = document.getElementById(iconID);
        menuIcon.style.display = "block";
    }

    function DeleteSection() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_SECTION") %>");
    }

</script>

<div>
    <div id="menuIcon" runat="server" style="vertical-align: top; text-align: left;">
        <img src="ui/common/images/PortletImages/Icons/menu_button.gif" onclick="ShowSectionMenuBody('<%= FindControl("menuIcon").ClientID %>', '<%= FindControl("menuBody").ClientID %>')" />
    </div>
    <div id="menuBody" runat="server" style="display: none; vertical-align: top; text-align: left;">
        <div class="MainScreenMenuPopup">
            <table>
                <tr>
                    <td valign="top">
                        <img src="ui/common/images/PortletImages/Icons/menu_button.gif" />
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/edit.gif" />
                    </td>
                    <td style="text-align: left;" valign="top">
                        <a href='<%= GetEditSectionURL() %>'>
                            <asp:Label ID="lblEditSection" runat="server" />
                        </a>
                    </td>
                    <td valign="top" style="text-align: left;">
                        <img src="ui/common/images/PortletImages/Icons/icon-close_me.gif" id="menuBodyExitIcon"
                            onclick="CloseSectionMenuBody('<%= FindControl("menuBody").ClientID %>', '<%= FindControl("menuIcon").ClientID %>')" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right">
                        <img src="ui/common/images/PortletImages/Icons/delete.gif" />
                    </td>
                    <td valign="top" style="text-align: left">
                        <asp:LinkButton ID="lnkDeleteSection" runat="server" OnClientClick="return DeleteSection();">
                            <asp:Label ID="lblDeleteSection" runat="server" />
                        </asp:LinkButton>
                    </td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top" style="text-align: right;">
                        <img src="ui/common/images/PortletImages/Icons/view_section.gif" />
                    </td>
                    <td valign="top" style="text-align: left;">
                        <a id="lnkViewSection" href='<%= GetViewSectionURL() %>'>
                            <asp:Label ID="lblViewSection" runat="server" />
                        </a>
                    </td>
                     <td valign="top">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.MainView" %>
<%@ Import Namespace="Jenzabar.LMS" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="menu" TagName="SectionMenuPopup" Src="UserControls/SectionMenuPopup.ascx" %>
<%@ Register TagPrefix="menu" TagName="CourseMenuPopup" Src="UserControls/CourseMenuPopup.ascx" %>
<%@ Register TagPrefix="menu" TagName="DepartmentMenuPopup" Src="UserControls/DepartmentMenuPopup.ascx" %>
<div class="pSection">
    <table class="MainScreenIntroTable">
        <tr>
            <td colspan="2" class="MainScreenIntroTableTopCell">
                <asp:Label ID="lblIntro" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="MainScreenIntroTableLeftCell" align="center">
                <table cellpadding="5">
                    <tr>
                        <td>
                            <img id="imgAddNewCourse" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                        </td>
                        <td>
                            <a id="lnkAddNewCourse" runat="server">
                                <asp:Label ID="lblAddNewCourse" runat="server" CssClass="BoldText" /></a>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="MainScreenIntroTableRightCell" align="center">
                <table cellpadding="5">
                    <tr>
                        <td>
                            <img id="imgAddNewSection" src="ui/common/images/PortletImages/Icons/fb_big_add.gif" />
                        </td>
                        <td style="text-align: left">
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
    </table>
    <h5>
        <table width="100%">
            <tr>
                <td >
                <br />
                    <asp:Label ID="lblPortalOnlySectionsHeader" runat="server" />
                </td>
                <td align="right">
                
                    <table cellspacing="0">
                        <tr>
                            <td class="MainScreenManageCell">
                                <asp:Label ID="lblManage" runat="server" />
                            </td>
                            <td class="MainScreenAddTermCell">
                                <img id="imgEditTerms" src="ui/common/images/PortletImages/Icons/edit.gif" />
                                <a id="lnkAddTerm" runat="server">
                                    <asp:Label ID="lblTerms" runat="server" />
                                </a>
                            </td>
                            <td class="MainScreenAddDepartmentCell">
                                <img id="imgEditDepartments" src="ui/common/images/PortletImages/Icons/edit.gif" />
                                <a id="lnkAddDepartment" runat="server">
                                    <asp:Label ID="lblDepartments" runat="server" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </h5>
    <br />
    <div id="divContent" runat="server">
        <asp:UpdatePanel ID="upMainView" runat="server">
            <ContentTemplate>
                <table cellpadding="10" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblSelectTerm" runat="server" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTerms" runat="server" AutoPostBack="true" />
                        </td>
                        <td style="width: 50%;">
                        </td>
                    </tr>
                </table>
                <!-- Start of Departments Repeater -->
                <asp:Repeater ID="rptDepartments" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <div class="MainViewDepartment">
                                        <%# ((Organization)Container.DataItem).Name%>
                                        <asp:Label ID="lblDepartment" runat="server" />
                                    </div>
                                </td>
                                <td>
                                    <menu:DepartmentMenuPopup ID="departmentMenu" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <div id="divNoCourses" runat="server" visible="false">
                            <!-- Label to display if the courses repeater is going to be empty -->
                            <asp:Label ID="lblNoCourses" runat="server" />
                            <br />
                            <br />
                        </div>
                        <!-- Start of Courses Repeater -->
                        <asp:Repeater ID="rptCourses" runat="server">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td valign="top">
                                            <div class="MainViewCourseDisplay">
                                                &nbsp;&nbsp;<%# ((Course)Container.DataItem).CourseCode %>
                                                -
                                                <%# ((Course)Container.DataItem).Title %>
                                            </div>
                                        </td>
                                        <td>
                                            <menu:CourseMenuPopup ID="courseMenu" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <div id="divCourseRepeaterRegularSections" runat="server">
                                        <tr align="right">
                                            <td valign="top">
                                                <asp:Label ID="lblRegularSections" runat="server" />
                                            </td>
                                            <td>
                                                <!-- Start of Regular Sections Repeater -->
                                                <asp:Repeater ID="rptSectionsRegular" runat="server">
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <%# ((Section)Container.DataItem).Course.CourseCode %>
                                                                    <%# ((Section)Container.DataItem).Name %>
                                                                    *
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <!-- End of Regular Sections Repeater -->
                                            </td>
                                        </tr>
                                    </div>
                                    <tr align="right">
                                        <td valign="top">
                                            <asp:Label ID="lblPortalOnlySections" runat="server" />
                                        </td>
                                        <td valign="top">
                                            <!-- Start of PortalOnly Sections Repeater -->
                                            <asp:Repeater ID="rptSectionsPortalOnly" runat="server">
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
                        <!-- End of Course Repeater -->
                        <div class="MainViewDeptDivider">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <!-- End of Departments Repeater -->
                <br />
                <asp:Label ID="lblFooterInfo" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <div id="divNoContent" runat="server" class="MainScreenNoContent">
        <asp:Label ID="lblNoContent" runat="server" />        
    </div>
    <br />
        <br />
        <br />
</div>

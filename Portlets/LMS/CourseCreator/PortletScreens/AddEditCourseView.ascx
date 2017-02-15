<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AddEditCourseView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.AddEditCourseView" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<script type="text/javascript" language="javascript">  
    function btnSaveDeptClick() {

        var deptCode = document.getElementById("txtDeptCode").value;
        var deptName = document.getElementById("txtDeptName").value;
        
        var url = "Portlets/LMS/Portlet.CourseCreator/Services/SaveDepartment.aspx?DeptCode=" + deptCode + "&DeptName=" + deptName;
        xmlHttp = GetXmlHttpObject();
        xmlHttp.onreadystatechange = SaveDeptFinished;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
        // Clear the values
        document.getElementById("txtDeptCode").value = "";
        document.getElementById("txtDeptName").value = "";        
    }    
    
    function btnSaveDeptCancelClick() {
        // Clear the values
        document.getElementById("<%= this.FindControl("txtDeptCode").ClientID %>").value = "";
        document.getElementById("<%= this.FindControl("txtDeptName").ClientID %>").value = ""; 
        HideAddDeptDivPopup();
    }

    function HideAddDeptDivPopup() {
        var divAddDepartmentPopup = document.getElementById("<%= this.FindControl("divAddDepartmentPopup").ClientID %>");
        divAddDepartmentPopup.style.display = "none";
    }

    function lnkAddDeptClick() {
        ShowAddDeptDivPopup();
    }

    function ShowAddDeptDivPopup() {
        var divAddDepartmentPopup = document.getElementById("<%= this.FindControl("divAddDepartmentPopup").ClientID %>");
        divAddDepartmentPopup.style.display = "block";
        divAddDepartmentPopup.style.position = "absolute";
    } 
</script>

<common:Subheader ID="hdrAddNewCourse" runat="server" />
<div class="pSection">
    <asp:UpdatePanel ID="updateDepartments" runat="server">
        <ContentTemplate>
            <div id="divError" runat="server" visible="false" class="feedbackError">
                <asp:Label ID="lblError" runat="server" />
            </div>
            <br />
            <div>
                <table class="AddCourseScreenTable" cellspacing="0" cellpadding="10" width="100%">
                    <tr>
                        <td valign="top" style="text-align: right">
                            <asp:Label ID="lblCourseTitle" runat="server" />
                        </td>
                        <td style="border-right: solid 2px #CCCCCC;">
                            <asp:TextBox ID="txtCourseTitle" runat="server" Width="300" />
                            <asp:RequiredFieldValidator ID="rfvCourseTitle" runat="server" ControlToValidate="txtCourseTitle"
                                EnableClientScript="False" />
                        </td>
                        <td rowspan="2" valign="top" style="width: 40%">
                            <asp:Label ID="lblIntro" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="text-align: right">
                            <asp:Label ID="lblCourseCode" runat="server" />
                        </td>
                        <td style="border-right: solid 2px #CCCCCC;">
                            <asp:TextBox ID="txtCourseCode" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvCourseCode" runat="server" ControlToValidate="txtCourseCode"
                                EnableClientScript="False" />
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <table>
                <tr>
                    <td class="AddCourseScreenMiddleTableCell" valign="top">
                        <asp:Label ID="lblDepartment" runat="server" />
                    </td>
                    <td valign="top" style="padding: 10px;">
                        <asp:DropDownList ID="ddlDepartments" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvDepartments" runat="server" ControlToValidate="ddlDepartments"
                            InitialValue="SELECTDEPARTMENT" EnableClientScript="false" />
                    </td>
                    <td valign="top" style="padding: 10px;">
                        <asp:UpdateProgress ID="progressDepartments" runat="server" AssociatedUpdatePanelID="updateDepartments">
                            <ProgressTemplate>
                                <img id="imgAjaxLoading" src="ui/common/images/PortletImages/Icons/ajax_loader_small.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                    <td valign="top" style="padding: 10px;">
                        <div id="divAddDepartment" runat="server">
                            <img id="imgAddNewDepartment" src="ui/common/images/PortletImages/Icons/add.gif" />
                            <a id="lnkAddDept" runat="server" onclick="lnkAddDeptClick()" style="text-decoration: underline;
                                cursor: pointer;">
                                <asp:Label ID="lblAddDept" runat="server" />
                            </a>
                            <br />
                            <br />
                            <div id="divAddDepartmentPopup" runat="server" style="display: none;">
                                <table cellspacing="0">
                                    <tr>
                                        <td class="AddCourseScreenDepartmentPopupHeaderLeftCell">
                                            <asp:Label ID="lblAddDepartmentHeader" runat="server" />
                                        </td>
                                        <td class="AddCourseScreenDepartmentPopupHeaderRightCell">
                                            <img src="ui/common/images/PortletImages/Icons/close_me.gif" onclick="btnSaveDeptCancelClick()" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentNameLeftCell">
                                            <asp:Label ID="lblDeptName" runat="server" />
                                        </td>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentNameRightCell">
                                            <asp:TextBox ID="txtDeptName" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentCodeLeftCell">
                                            <asp:Label ID="lblDeptCode" runat="server" />
                                        </td>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentCodeRightCell">
                                            <asp:TextBox ID="txtDeptCode" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentButtonLeftCell">
                                            <asp:Button ID="btnSaveDeptartment" runat="server" CausesValidation="false" />
                                        </td>
                                        <td class="AddCourseScreenDepartmentPopupDepartmentButtonRightCell">
                                            <input type="button" id="btnCancelDepartment" onclick="btnSaveDeptCancelClick()"
                                                runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="AddCourseScreenMiddleTableCell" valign="top">
                        <asp:Label ID="lblDescription" runat="server" />
                    </td>
                    <td colspan="3" valign="top">
                        <common:TextBoxEditor ID="tbeDescription" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div>
                <table cellspacing="0" width="100%">
                    <tr>
                        <td class="ButtonTableSaveCell" valign="top">
                            <asp:Button ID="btnSave" runat="server" />
                        </td>
                        <td class="ButtonTableCancelCell" valign="top">
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="font-style: italic;">
                <asp:Label ID="lblButtonMessage" runat="server" />
            </div>
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

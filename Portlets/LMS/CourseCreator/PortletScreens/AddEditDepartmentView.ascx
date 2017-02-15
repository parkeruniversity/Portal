<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEditDepartmentView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.AddEditDepartmentView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<common:Subheader ID="hdrAddEditDepartment" runat="server" />
<div class="pSection">
    <br />
    <table cellpadding="8">
        <tr>
            <td>
                <asp:Label ID="lblDeptName" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtDeptName" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDeptName" ControlToValidate="txtDeptName" runat="server"
                    EnableClientScript="false" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblDeptCode" runat="server" />
            </td>
            <td style="text-align: right;">
                <asp:TextBox ID="txtDeptCode" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDeptCode" ControlToValidate="txtDeptCode" runat="server"
                    EnableClientScript="false" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table cellspacing="0" width="100%">
        <tr>
            <td class="ButtonTableSaveCell">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" />
            </td>
            <td class="ButtonTableCancelCell">
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</div>

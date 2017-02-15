<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEditTermView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.AddEditTermView" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
    <table cellpadding="8">
        <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblTermName" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtTermName" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTermName" runat="server" EnableClientScript="False"
                    ControlToValidate="txtTermName" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblTermCode" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtTermCode" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTermCode" runat="server" EnableClientScript="False"
                    ControlToValidate="txtTermCode" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblStartDate" runat="server" />
            </td>
            <td style="text-align: right;">
                <jenzabar:DatePicker ID="dpStartDate" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblEndDate" runat="server" />
            </td>
            <td>
                <jenzabar:DatePicker ID="dpEndDate" runat="server" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <table width="100%" cellspacing="0">
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

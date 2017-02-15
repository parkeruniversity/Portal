<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddOrganizationalUnitPopup.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.AddOrganizationalUnitPopup" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<script type="text/javascript" language="javascript">
    function clearUnitFields<%= ClientID %>() {
        $('#<%= NameClientID %>').val("");
        PopulateTextBoxEditor('<%= DescriptionClientID %>', "");
        $('#<%= StartDateClientID %>').val("");
        $('#<%= EndDateClientID %>').val("");
    }
</script>
<div id="<%= ClientID %>" class="addUnitOrTypePopup">
<table>
    <tr id="HeaderRow" runat="server">
        <td colspan="3"><common:GlobalizedLabel ID="lblAddUnit" TextKey="TXT_ADD_A_UNIT" runat="server" /></td>
    </tr>
    <tr>
        <td colspan="3"><asp:Label ID="labErrorMsg" runat="server" Visible="false" CssClass="ValidationError" />&nbsp;</td>
    </tr>
    <tr>
        <td><common:GlobalizedLabel ID="lblUnitName" LabelKey="TXT_UNIT_NAME" runat="server" /></td>
        <td colspan="2"><asp:TextBox ID="txtUnitName" Columns="30" MaxLength="255" runat="server" /></td>
    </tr>
    <tr>
        <td nowrap><common:GlobalizedLabel ID="lblDateRange" LabelKey="TXT_DATE_RANGE" runat="server" /></td>
        <td width="280">
            <common:DatePicker ID="dpFromDate" Size="10" runat="server" />
            <common:GlobalizedLabel ID="lblTo" TextKey="MSG_TO" runat="server" />
            <common:DatePicker ID="dpToDate" Size="10" runat="server" />
        </td>
        <td><span class="optionalHint"><common:GlobalizedLabel ID="lblOptionalDateRange" TextKey="MSG_CWK_OPTIONAL_ENTER_DATE_RANGE" runat="server" /></span></td>
    </tr>
    <tr>
        <td valign="top">
            <common:GlobalizedLabel ID="lblDescription" LabelKey="TXT_DESCRIPTION" runat="server" /><br /><span class="optionalHint"><common:GlobalizedLabel ID="lblOptionalDesc" TextKey="TXT_OPTIONAL" runat="server" /></span>
        </td>
        <td colspan="2">
            <common:TextBoxEditor ID="tbeDescription" MaxLength="3000" AutoSetFocus="false" runat="server" />
        </td>
    </tr>
    <tr id="ButtonRow" runat="server">
        <td></td>
        <td colspan="2">
            <common:GlobalizedButton ID="btnSave" TextKey="TXT_ADD_UNIT" runat="server" />
            <common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" runat="server" />
        </td>
    </tr>
</table>
</div>
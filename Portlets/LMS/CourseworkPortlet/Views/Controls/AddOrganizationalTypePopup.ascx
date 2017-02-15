<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddOrganizationalTypePopup.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.AddOrganizationalTypePopup" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<script type="text/javascript" language="javascript">
    function clearTypeFields<%= ClientID %>() {
        $('#<%= txtTypeName.ClientID %>').val("");
    }
</script>
<div id="<%= ClientID %>" class="addUnitOrTypePopup">
    <table>
        <tr id="HeaderRow" runat="server">
            <td>
                <common:GlobalizedLabel ID="lblAddType" TextKey="HDR_ADD_A_TYPE" runat="server" />                
            </td>
        </tr>
    </table>
    <div><asp:Label ID="labErrorMsg" runat="server" Visible="false" CssClass="ValidationError" /></div>
    <div>
        <common:GlobalizedLabel ID="lblTypeName" LabelKey="TXT_TYPE_NAME" runat="server" />
        <asp:TextBox ID="txtTypeName" Columns="30" MaxLength="255" runat="server" />
    </div>    
    <table>
        <tr id="ButtonRow" runat="server">
            <td>
                <common:GlobalizedButton ID="btnSaveType" TextKey="TXT_ADD_TYPE" runat="server" />
                <common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" runat="server" CausesValidation="false" />
            </td>
        </tr>
    </table>
</div>

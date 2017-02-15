<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ValidationBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.ValidationBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<cc1:Hint runat="server">
    Validations can be used to make sure data entered into the form is the intended format for use at a later time. You can define new validations as a regular expression beginning and ending with "/", or you can create a mask pattern that will prevent data from being entered in any other format.
</cc1:Hint><br/>
<cc1:ErrorDisplay runat="server" ID="errDisplay"></cc1:ErrorDisplay>
    <table class="jcf-validation-table">
        <tr>
            <td>Validations:</td>
            <td>
                <asp:DropDownList runat="server" ID="_drpValidations" AutoPostBack="True" 
                    onselectedindexchanged="_drpValidations_SelectedIndexChanged"/>
                <asp:ImageButton runat="server" ID="_imgAddValidation" 
                    onclick="_imgAddValidation_Click"/>
            </td>
        </tr>
        <asp:Panel runat="server" ID="_defPanel" Enabled="False">
        <tr>
            <td>Name:</td>
            <td><asp:TextBox runat="server" ID="_tbxName"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Is Mask:</td>
            <td><asp:CheckBox runat="server" onclick="$(this).is(':checked') ? $('.jcf-validation-msg-def').hide() : $('.jcf-validation-msg-def').show();" ID="_cbxIsMask"/></td>
        </tr>
        <tr>
            <td>Pattern:</td>
            <td><asp:TextBox runat="server" ID="_tbxRegEx"></asp:TextBox></td>
        </tr>
        <tr class="jcf-validation-msg-def">
            <td>Invalid Message:</td>
            <td><asp:TextBox runat="server" ID="_tbxMsg"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;"><asp:Button runat="server" 
                    ID="_btnSave" Text="Save Validation" onclick="_btnSave_Click"/>
                <asp:Button runat="server" ID="_btnDelete" Text="Delete" 
                    onclick="_btnDelete_Click"/>
                <asp:Button runat="server" ID="_btnCancel" Text="Cancel" 
                    onclick="_btnCancel_Click"/></td>
        </tr>
        </asp:Panel>
    </table>
    
<center><asp:Button runat="server" ID="_btnDone" Text="Done" 
        onclick="_btnDone_Click"/></center>
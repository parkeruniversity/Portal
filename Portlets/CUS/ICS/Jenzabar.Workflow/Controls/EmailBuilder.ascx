<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailBuilder.ascx.cs" Inherits="Jenzabar.Workflow.Controls.EmailBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<%@ Register assembly="CuteEditor" namespace="CuteEditor" tagprefix="CE" %>
<asp:HiddenField ID="emlID" runat="server" />
<table class="jwf-email-panel">
    <tr>
        <td>On Event:</td>
        <td><asp:DropDownList runat="server" ID="drpEvents" onchange="JWF.emailBuilder.emailEventChanged();"></asp:DropDownList></td>
    </tr>
    <tr class="jwf-scheduled-email" style="display:none;">
        <td colspan="2">
            <table>
                <tr>
                    <td>Send when no response for <asp:TextBox runat="server" ID="emlNoResp"></asp:TextBox> day(s).</td>
                    <td>Resend every <asp:TextBox runat="server" ID="emlResend"></asp:TextBox> day(s).</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>Email From:</td>
        <td><asp:TextBox ID="emlEmailFrom" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email To:</td>
        <td><asp:TextBox ID="emlEmailTo" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:CheckBox runat="server" ID="cbxSendToApprover" Text="Send To Approver" /></td>
        <td><asp:CheckBox runat="server" ID="cbxSendToSubmitter" Text="Send To Submitter" /></td>
    </tr>
    <tr>
        <td>Subject:</td>
        <td><asp:TextBox ID="emlSubject" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="2">
            Message:<br />
            <cc1:TextBoxEditor ID="emlMessage" runat="server">
            </cc1:TextBoxEditor>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center><asp:Button ID="emlSaveButton" runat="server" Text="Save" OnClick="emlSaveButton_Click" /><asp:Button ID="emlCancelButton" runat="server" Text="Cancel" OnClick="emlCancelButton_Click" /></center>
        </td>
    </tr>
</table>
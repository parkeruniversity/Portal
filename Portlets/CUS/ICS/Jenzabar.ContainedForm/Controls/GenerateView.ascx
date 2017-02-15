<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GenerateView.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.GenerateView" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<cc1:Hint runat="server">
    This tool can be used to create a flattened view of this form in the ICS_NET database. The view is generated based on the current configurations of the form. If the form changes, the view may need to be re-generated to get valid data. SA credentials are REQUIRED to generate the view.
</cc1:Hint>
<br/>
<table width="100%">
    <tr>
        <td width="30%">
            View Name:
        </td>
        <td>
            CUS_CF_<asp:TextBox runat="server" ID="tbxViewName"></asp:TextBox>_View
        </td>
    </tr>
    <tr>
        <td>
            Username:
        </td>
        <td><asp:TextBox runat="server" ID="tbxUsername"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Password:</td>
        <td><asp:TextBox runat="server" ID="tbxPassword" TextMode="Password"></asp:TextBox></td>
    </tr>
</table>
<center><asp:Button runat="server" ID="btnGenerateView" Text="Generate View" 
        onclick="btnGenerateView_Click"/></center>
<center><asp:Button runat="server" ID="btnDone" onclick="btnDone_Click" 
        Text="Done"/></center>
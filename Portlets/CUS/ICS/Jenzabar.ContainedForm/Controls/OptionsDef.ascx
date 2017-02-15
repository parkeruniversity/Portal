<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OptionsDef.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.OptionsDef" %>
<asp:HiddenField ID="_optID" runat="server" />
<table>
    <tr>
        <td>Dbl Val</td>
        <td>Value</td>
        <td>Text</td>
        <td>Selected</td>
    </tr>
    <tr>
        <td><asp:TextBox ID="dbValTbx" runat="server" style="width:60px;"></asp:TextBox></td>
        <td><asp:TextBox ID="TextBox1" runat="server" MaxLength="255"></asp:TextBox></td>
        <td><asp:TextBox ID="TextBox2" runat="server" MaxLength="255"></asp:TextBox></td>
        <td>
            <asp:CheckBox ID="OptionSelectCbx" CssClass="OptionSelectCbx" runat="server" />
        </td>
    </tr>
</table>


<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ForgotPassword_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LoginPortlet.ForgotPassword_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
    <br />
    <asp:Label ID="lblUsername" runat="server" Font-Bold="true" />
    <asp:Label ID="lblUsernameValue" runat="server" />
    <br />
    <br />
    <common:Hint ID="hint" runat="server" />
    <asp:ValidationSummary ID="Summary" DisplayMode="List" runat="server" />
    <p class="PortletError">
        <asp:Label ID="lblLoginMessage" runat="server" Visible="False"></asp:Label>
    </p>
    <fieldset>
        <table cellpadding="2">
            <asp:PlaceHolder ID="phQuestion" runat="server">
                <tr>
                    <td colspan="2">
                        <b>
                            <asp:Literal ID="lblQuestion" runat="server" /></b>
                    </td>
                </tr>
                <tr>
                    <th>
                        <common:FormLabel ID="lblAnswer" runat="server" ForControl="txtAnswer" CausesValidation="false"></common:FormLabel>
                    </th>
                    <td>
                        <asp:TextBox ID="txtAnswer" runat="server" MaxLength="255" Columns="40" />&nbsp;
                        <asp:RequiredFieldValidator ID="AnswerRequired" ControlToValidate="txtAnswer" Text="*"
                            Display="Dynamic" runat="server" />
                    </td>
                </tr>
            </asp:PlaceHolder>
            <tr>
                <th>
                </th>
                <td>
                    <asp:Button ID="btnSave" runat="server" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.Setup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>

<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>

<div class="pSection">
    <table>
        <tr>
            <td>
                <cmn:Subheader ID="shPageTitle" runat="server">
                </cmn:Subheader>
            </td>
        </tr>
        <tr>
            <td>
                    <table>
                        <tr>
                            <td colspan="2">
                                <h5><asp:Label ID="lblHeaderHeader" runat="server" /></h5>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblInstructions" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <jics:TextEditor ID="tbx" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Images:<br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:PlaceHolder ID="phImage" runat="server"></asp:PlaceHolder>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click"></asp:Button>&nbsp;<asp:Button ID="btnCancel"
                                    runat="server" OnClick="btnCancel_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</div>

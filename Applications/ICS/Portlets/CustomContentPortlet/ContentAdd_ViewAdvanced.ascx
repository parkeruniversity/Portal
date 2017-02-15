<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ContentAdd_ViewAdvanced.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.ContentAdd_ViewAdvanced"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie5"
     %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>

<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>

<script language="javascript">
<!--
    function toggleCheckbox(chkToToggle) {
        var relatedCheckbox = document.getElementById(chkToToggle);
        relatedCheckbox.checked = true;
    }

    function validateTextBox(txtBox, chkToToggle) {
        var relatedCheckbox = document.getElementById(chkToToggle);
        if (txtBox.value == '') {
            relatedCheckbox.checked = false;
        }
    }
	

	

//-->
</script>

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
                                <cmn:Hint ID="hntInstructions" runat="server"></cmn:Hint>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h5>
                                    <asp:Label ID="lblHeaderHeader" runat="server"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbShowHeader" runat="server" TextAlign="Right"></asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <cmn:FormLabel ID="flHeaderText" runat="server" ForControl="txtHeaderText"></cmn:FormLabel>&nbsp;
                                            <asp:TextBox ID="txtHeaderText" runat="server" Size="35" MaxLength="255"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h5>
                                    <asp:Label ID="lblImageHeader" runat="server"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Text<br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <jics:TextEditor id="Editor" runat="server" />
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
                                <asp:Button ID="btnSave" runat="server"></asp:Button>&nbsp;<asp:Button ID="btnCancel"
                                    runat="server"></asp:Button>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</div>

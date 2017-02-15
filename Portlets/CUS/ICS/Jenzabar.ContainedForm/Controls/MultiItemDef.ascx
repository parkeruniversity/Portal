<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiItemDef.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.MultiItemDef" %>
<script>
    jQuery(document).ready(function () {
        multiItemTypeChange('div<%= this.ID.ToString() %>');
    });
</script>
<style>
    .itmDrp
    {
        max-width:150px;
    }
</style>
<div id='div<%= this.ID.ToString() %>' class="midItem">
    <asp:HiddenField runat="server" ID="hdnID" />
    <table>
        <thead>
            <tr>
                <th></th>
                <th>Type</th>
                <th>Name</th>
                <th class="itmTbx">Validations</th>
                <th class="itmDrp">Datasources</th>
                <th class="itmTbx itmDrp">Add To Balance</th>
                <th class="itmTbx itmDrp">Mult By Balance</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><asp:ImageButton runat="server" ID="img_delete" OnClick="img_delete_Click"/></td>
                <td>
                    <asp:DropDownList runat="server" ID="drpType" onchange="multiItemTypeChange(jQuery(this).closest('div').attr('id'));">
                        <asp:ListItem Text="Textbox" Value="Textbox"></asp:ListItem>
                        <asp:ListItem Text="DropDown" Value="DropDown"></asp:ListItem>
                        <asp:ListItem Text="CheckBox" Value="CheckBox"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="tbxName"></asp:TextBox>
                </td>
                <td class="itmTbx">
                    <asp:DropDownList runat="server" ID="drpValidations" CssClass="itmTbx"></asp:DropDownList>
                </td>
                <td class="itmDrp">
                    <asp:DropDownList runat="server" ID="drpDataSources" CssClass="itmDrp"></asp:DropDownList>
                </td>
                <td class="itmTbx itmDrp">
                    <asp:CheckBox runat="server" ID="cbxAddTo" CssClass="itmTbx itmDrp" />
                </td>
                <td class="itmTbx itmDrp">
                    <asp:CheckBox runat="server" ID="cbxMultBy" CssClass="itmTbx itmDrp" />
                </td>
            </tr>
        </tbody>
    </table>
</div>
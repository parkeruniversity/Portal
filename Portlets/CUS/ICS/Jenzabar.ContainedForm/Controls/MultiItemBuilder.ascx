<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiItemBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.MultiItemBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<script>
    function multiItemTypeChange(strID) {
        jQuery('.itmTbx', '[id*=' + strID + ']').hide();
        jQuery('.itmDrp', '[id*=' + strID + ']').hide();
        switch (jQuery('[id*=drpType]', '[id*=' + strID + ']').val()) {
            case "Textbox":
                jQuery('.itmTbx', '[id*=' + strID + ']').show();
                break;
            case "DropDown":
                jQuery('.itmDrp', '[id*=' + strID + ']').show();
                break;
            case "CheckBox":
                break;
        }
    }
</script>
<style>
    .midItem th
    {
        text-align: left;
        vertical-align: bottom;
        font-size: smaller;
        font-weight: normal;
        font-style: italic;
    }
</style>
<cc1:AddImageAndTextButton runat="server" ID="lnkAddMItem" Text="Add Item" OnClick="lnkAddMItem_Click"></cc1:AddImageAndTextButton>

<asp:Panel runat="server" ID="pnlItems">

</asp:Panel>
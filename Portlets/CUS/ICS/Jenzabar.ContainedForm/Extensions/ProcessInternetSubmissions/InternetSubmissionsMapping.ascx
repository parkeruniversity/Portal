<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InternetSubmissionsMapping.ascx.cs" Inherits="Jenzabar.ContainedForm.EX.ProcessInternetSubmissions.InternetSubmissionsMapping" %>
<%@ Import Namespace="Jenzabar.ContainedForm.EX.ProcessInternetSubmissions" %>
<%@ Import Namespace="Jenzabar.ContainedForm.EX.ProcessInternetSubmissions.EXObjects" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<script>
    Jcf.Pis = {
        lastSelectedFormType: '590',
        ui: {
            setSaveEnabled: function() {
                if ($('.jcf-tools [id*=drpItemList] option:selected:not([value=DNU])').length == 0)
                    $('.jcf-pis-save').attr('disabled', 'disabled');
                else
                    $('.jcf-pis-save').removeAttr('disabled');
            }  
        },
        events: {
            onMapItemChanged: function(drp) {
                if ($(drp).val() == "@Custom") {
                    $(drp).parent().next('td').find('input').show();
                } else {
                    $(drp).parent().next('td').find('input').hide();
                }
                Jcf.Pis.ui.setSaveEnabled();
            },
            onFormTypeFocused: function(drp) {
                Jcf.Pis.lastSelectedFormType = $(drp).val();
            },
            onFormTypeChanged: function (drp) {
                var rows = $('[id*=tbRows] tr').length;
                if (rows == 0 || confirm('Are you sure you want to change the form type? All mappings will be removed and will need to be rebuilt.')) {
                    return false;
                }
                $(drp).val(Jcf.Pis.lastSelectedFormType);
                return true;
            },
            onMappingDeleteClicked: function(drp) {
                if (confirm('Are you sure you want to delete this mapping?')) {
                    return false;
                }
                return true;
            },
            onLoad: function() {
                Jcf.Pis.ui.setSaveEnabled();
            }
        }
    };
    $(document).ready(Jcf.Pis.events.onLoad);
</script>
<h4>Internet Submissions Mapping</h4>
<cc1:Hint runat="server">
    Each row below will be executed once per submission by default. If you map a multi response question (i.e. Collection Grid, Checkbox) to a column, the row will be executed once for each response.
</cc1:Hint>
<asp:HiddenField runat="server" ID="hdnCurrentRow"/>
<table class="jcf-map-table">
    <thead>
        <tr id="trFormType" runat="server">
            <td colspan="3">Form Type: <asp:DropDownList runat="server" ID="drpFormType" AutoPostBack="True" OnSelectedIndexChanged="drpFormType_OnSelectedIndexChanged" onclick="Jcf.Pis.events.onFormTypeFocused(this);" onchange="if(Jcf.Pis.events.onFormTypeChanged(this)){return false;}"/></td>
        </tr>
        <tr>
            <td colspan="3"><asp:DropDownList runat="server" ID="drpMapTables"/>&nbsp;<asp:LinkButton runat="server" ID="lnkAddRow" OnClick="lnkAddRow_OnClick">Add New Row</asp:LinkButton></td>
        </tr>
    </thead>
    <tbody runat="server" id="tbRows">
        <asp:Repeater runat="server" ID="rptRows"> 
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:LinkButton runat="server" ID="lnkEdit" OnClick="lnkEdit_OnClick" CommandName='<%# DataBinder.Eval(Container.DataItem, "TableText") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RowID") %>' Text="Edit"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="lnkDelete" OnClientClick="if(Jcf.Pis.events.onMappingDeleteClicked(this)) {return false;}" OnClick="lnkDelete_OnClick" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RowID") %>' Text="Delete"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblMapColumnName" Text='<%# DataBinder.Eval(Container.DataItem, "TableText") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblRowDescription" Text='<%# DataBinder.Eval(Container.DataItem, "RowName") %>'></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
    <tbody runat="server" id="tbColumns" Visible="False">
    <tr>
        <td>Row Description:</td>
        <td><asp:TextBox runat="server" ID="tbxRowName"></asp:TextBox></td>
    </tr>
    <asp:Repeater runat="server" ID="rptColumns" OnItemDataBound="rptColumns_OnItemDataBound">
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HiddenField runat="server" ID="hdnMapColumnID" Value="<%# ((MapColumn)Container.DataItem).MapColumnID %>"></asp:HiddenField>
                    <asp:Label runat="server" ID="lblMapColumnName" Text="<%# ((MapColumn)Container.DataItem).MapColumnName %>"></asp:Label>
                    <asp:Literal runat="server" ID="lblHint"></asp:Literal>
                </td>
                <td><asp:DropDownList runat="server" ID="drpItemList" onchange="Jcf.Pis.events.onMapItemChanged(this);"/></td>
                <td><asp:TextBox runat="server" ID="tbxCustomValue"></asp:TextBox></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    </tbody>
</table>
<center>
    <asp:Button runat="server" ID="btnSave" CssClass="jcf-pis-save" OnClick="btnSave_OnClick" Text="Save" Visible="False"/>
    <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_OnClick" Visible="False"/>
</center>
<center>
    <asp:Button runat="server" ID="btnDone" OnClick="btnDone_OnClick" Text="Done"/>
</center>
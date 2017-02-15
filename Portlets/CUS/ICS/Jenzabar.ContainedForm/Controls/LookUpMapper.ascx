<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LookUpMapper.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.LookUpMapper" %>
<table class="jcf-lookup-mappings">
    <tr>
        <td>
            Look Up DataSource:
        </td>
        <td>
            <asp:DropDownList runat="server" ID="itmLookUpDataSource" onchange="Jcf.func.updateFormItemLookupMapping();" data-populate="Datasources"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Execute On Load:
        </td>
        <td>
            <asp:CheckBox runat="server" ID="itmExecuteLookupOnLoad" Checked="true" />
        </td>
        <td>
            Trigger After Set:
        </td>
        <td>
            <asp:CheckBox runat="server" ID="itmTriggerAfterSet" Checked="true" />
        </td>
    </tr>
    <asp:Panel runat="server" ID="rptColumns">
        <tr class="jcf-lookup-map">
            <td>
                <asp:Label runat="server" ID="lblCol" Text="" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="drpItems"></asp:DropDownList>
            </td>
        </tr>
    </asp:Panel>
</table>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApproverBuilder.ascx.cs" Inherits="Jenzabar.Workflow.Controls.ApproverBuilder" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<cc1:Hint runat="server" ID="Hint1">
    There are two types of approvers that can be added to a stage: <i>Static</i> and <i>Dynamic.</i><br />
    <b>Static</b> approvers are always the same regardless of who submitted the document and are added to the track by ID number.<br />
    <b>Dynamic</b> approvers may be different depending on who submitted the document and are identified by executing a pre-defined SQL query.<br/>
    *Required/Authoritative - only approvals by approvers with this box checked are considered authoritative for moving a submission out of this stage. If unchecked, any approval is treated as a review and no action is triggered.
</cc1:Hint>
<table width="100%">
    <tr>
        <td>Approver Type</td>
        <td>
            <asp:RadioButtonList runat="server" ID="rdoApproverType" CssClass="jwf-approver-type" RepeatDirection="Horizontal">
                <asp:ListItem Text="Static" Value="static" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Dynamic" Value="dynamic"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td></td>
    </tr>
    <tr>
        <td>Approver</td>
        <td>
            <asp:TextBox runat="server" ID="tbxStaticApprover" CssClass="jwf-static-settings tbxLookup"></asp:TextBox>
            <asp:DropDownList runat="server" ID="drpDynamicApprover" CssClass="jwf-dynamic-settings"></asp:DropDownList>
        </td>
        <td rowspan="2">
            <asp:CheckBox runat="server" ID="cbxRequired" /><label> Required/Authoritative</label><br />
            <asp:CheckBox runat="server" ID="cbxEdit" /><label> Allow Edit</label><br />
            <asp:CheckBox runat="server" ID="cbxReroute" /><label> Allow Reroute</label>
        </td>
    </tr>
    <tr>
        <td>Can Approve For</td>
        <td>
            <asp:DropDownList runat="server" ID="drpAltApprovers"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align:center;">
            <asp:Button runat="server" ID="btnAddApprover" Text="Add" OnClientClick="JWF.approverBuilder.approverAddClicked(); return false;" />
        </td>
    </tr>
</table>
<asp:HiddenField runat="server" ID="hdnApproverList" />
<table width="100%" class="jwf-approver-list">
    <thead>
        <tr>
            <th>Approver</th>
            <th>Alternate For</th>
            <th>Req.</th>
            <th>Edt.</th>
            <th>Rte.</th>
            <th></th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
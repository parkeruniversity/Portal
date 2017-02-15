<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentApproverInfo.ascx.cs" Inherits="Jenzabar.Workflow.Controls.DocumentApproverInfo" %>
<%@ Import Namespace="Jenzabar.Workflow.Entities" %>
<%@ Import Namespace="Jenzabar.Workflow.Services" %>
<h3>Approvers in this Stage</h3>
<h4>Static Approvers</h4>
<ul>
<asp:Repeater runat="server" ID="rptStatic">
    <ItemTemplate>
        <li><label><%# ((Approver)Container.DataItem).DisplayName %></label></li>
    </ItemTemplate>
</asp:Repeater>
</ul>
<h4>Dynamic Approvers</h4>
<ul>
<asp:Repeater runat="server" ID="rptDynamic">
    <ItemTemplate>
        <li>
            <label><%# ((Approver)Container.DataItem).DisplayName %></label>
            <span class="jwf-dyn-query">
                <%# DocumentService.GetApproverQuery(this.Document, ((Approver)Container.DataItem).DynamicApprover) %>
            </span>
        </li>
    </ItemTemplate>
</asp:Repeater>
</ul>
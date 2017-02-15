<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentVersionView.ascx.cs" Inherits="Jenzabar.Workflow.Views.Controls.DocumentVersionView" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Jenzabar.Workflow.Entities" %>
<%@ Import Namespace="Jenzabar.Workflow.Helpers" %>
<table class="jwf-document-version-view">
    <thead>
        <tr>
            <th>File</th>
            <th>Version</th>
            <th>Uploaded By</th>
            <th>Uploaded Date</th>
        </tr>
    </thead>
    <tbody>
    <asp:Repeater runat="server" ID="rptDocumentView">
        <ItemTemplate>
            <tr>
                <td><a href='<%# WorkflowHelper.ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.Workflow/Services/FileHandler.asmx/GetDocumentVersion?VersionID=" + ((DocumentVersion)Container.DataItem).VersionID) %>' target="_blank"><%# Path.GetFileName(((DocumentVersion)Container.DataItem).FilePath) %></a></td>
                <td><%# ((DocumentVersion)Container.DataItem).VersionNum %></td>
                <td><%# ((DocumentVersion)Container.DataItem).User.GetPortalUser().DisplayName %></td>
                <td><%# ((DocumentVersion)Container.DataItem).UploadDate.ToString() %></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    </tbody>
</table>
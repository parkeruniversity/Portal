<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.Workflow.Admin_Main" %>
<script src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.Workflow/Scripts/workflowScripts.js") %>'></script>
<div class="pSection">
    <center>
        <asp:Panel ID="pnlAdminLinks" runat="server"  CssClass="AdminLinks">
            <asp:LinkButton ID="lnkAdminPortlet" runat="server" 
                onclick="lnkAdminPortlet_Click">Admin this portlet</asp:LinkButton>
        </asp:Panel>
    </center>
    <p>
        You have
        <asp:LinkButton ID="lnkApprove" runat="server" onclick="lnkApprove_Click"></asp:LinkButton>
    &nbsp;to review.<br />
    </p>
    <asp:Panel runat="server" ID="pnlUpload">
        <label>Choose a document to upload:</label><span><asp:DropDownList runat="server" ID="drpDocTypes" OnSelectedIndexChanged="drpDocTypes_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></span>
        <asp:Panel runat="server" ID="pnlUploadFile" Visible="false">
            <label>Upload Document:</label><span><asp:FileUpload runat="server" ID="fuFile" /><asp:DropDownList runat="server" ID="drpTrack"></asp:DropDownList><asp:Button runat="server" ID="btnUploadFile" Text="Upload" OnClick="btnUploadFile_Click" /></span>
        </asp:Panel>
    </asp:Panel>
</div>





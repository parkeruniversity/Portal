<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEditCategory.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.Controls.AddEditCategory" %>
<asp:HiddenField ID="_hfEditCategoryID" runat="server" />
<div class="modalAddEdit">
    <div class="ValidationError">
        <asp:Label ID="_lblValidationMsg" runat="server" />
    </div>
    <asp:Label ID="_lblName" runat="server" /> <asp:TextBox ID="_tbName" runat="server" />
</div>
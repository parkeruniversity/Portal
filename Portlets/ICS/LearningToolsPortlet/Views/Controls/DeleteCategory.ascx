<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeleteCategory.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.Controls.DeleteCategory" %>
<asp:HiddenField ID="_hfDeleteCategoryId" runat="server" />
<asp:HiddenField ID="_hfDeleteCategoryName" runat="server" />
<div class="modalAddEdit">
    <asp:Label ID="_lblInstrux" runat="server" />
    <br /><br />
    <asp:RadioButton ID="_radConvert" runat="server" Checked="true" GroupName="convertOrDelete" /> <asp:Label ID="_lblConvertTxt" runat="server" /> <asp:DropDownList ID="_ddlOtherCategories" runat="server" />
    <br /><br />
    <asp:RadioButton ID="_radDelete" runat="server" GroupName="convertOrDelete" /> <asp:Label ID="_lblDeleteTools" runat="server" />
</div>
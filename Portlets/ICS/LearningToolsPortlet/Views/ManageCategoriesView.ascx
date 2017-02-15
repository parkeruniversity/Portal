<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCategoriesView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.ManageCategoriesView" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<%@ Register Src="Controls/DeleteCategory.ascx" TagName="DeleteCategory" TagPrefix="JICS" %>
<%@ Register Src="Controls/AddEditCategory.ascx" TagName="AddEditCategory" TagPrefix="JICS" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="_up" runat="server">
    <ContentTemplate>
<div class="pSection">
    <asp:Label ID="CategoriesLabel" runat="server" CssClass="headerText" />    
    <div>
        <asp:Label ID="CategoriesDescriptionLabel" runat="server" />
    </div>    
    <div>
        <table cellpadding="10">
            <tr>
                <td valign="top">
                    <asp:GridView ID="_gvCategories" runat="server" AutoGenerateColumns="false" CssClass="assignmentGrid itemHover" ShowHeader="false" GridLines="None" AlternatingRowStyle-CssClass="alt">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="_lblName" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="_lblToolCount" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="_lbtnEdit" runat="server"><asp:Image ID="_imgEdit" runat="server" /></asp:LinkButton> &nbsp; 
                                    <asp:LinkButton ID="_lbtnDelete" runat="server"><asp:Image ID="_imgDelete" runat="server" /></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td valign="top">
                    <asp:Image ID="_imgAdd" runat="server" /> <asp:LinkButton ID="_lbtnOpenModalAdd" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div class="backToMainScreenLinkContainer">
        <asp:HyperLink ID="_backToAdminScreenLink" runat="server" CssClass="backLink" />
    </div>
</div>
<asp:Hyperlink ID="_hypModal" runat="server" style="display: none;" />
<fwk:Modal ID="_modalDelete" runat="server" TargetControlID="_hypModal">
    <ContentArea>
        <JICS:DeleteCategory ID="_deleteCategoryView" runat="server" />
    </ContentArea>
</fwk:Modal>

<asp:HyperLink ID="_hypModalAddEdit" runat="server" style="display:none;" />
<fwk:Modal ID="_modalAddEdit" runat="server" TargetControlID="_hypModalAddEdit">
    <ContentArea>
        <JICS:AddEditCategory ID="_addEditCategoryView" runat="server" />
    </ContentArea>
</fwk:Modal>
    </ContentTemplate>
</asp:UpdatePanel>
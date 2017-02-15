<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminLearningToolsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.AdminLearningToolsView" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<div class="pSection">
    <div id="Introduction" class="learningToolScreenHeaderContainer">
        <div class="learningToolsIconContainer"></div>
        <div>
            <asp:Label ID="SharedLearningToolsLabel" runat="server" CssClass="headerText" />
            <div>
                <asp:Label ID="SharedLearningToolsDescriptionLabel" runat="server" CssClass="descriptiveText" />
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="AdminToolsUpdatePanel" runat="server">
        <ContentTemplate>
    <div>
        <div class="controlContainer">
            <asp:Label ID="ShowLabel" runat="server" />
            <asp:DropDownList ID="TypesDropDownList" runat="server" AutoPostBack="True" />
            <asp:DropDownList ID="CategoriesDropDownList" runat="server" AutoPostBack="True" />
            <asp:DropDownList ID="CreatorsDropDownList" runat="server" AutoPostBack="True" />
        </div>
        <div>
            <asp:GridView ID="ToolsGridView" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="alt">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div id="IconContainer" runat="server">
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="ToolDetailsLink" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreatorName" HeaderText="Creator" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="InUseDisplay" HeaderText="In Use" HtmlEncode="false" />
                    <asp:BoundField DataField="DateAdded" HeaderText="Date Added" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
        </div>    
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <div id="AddToolLinkContainer" class="addToolLinkContainer" runat="server">
            <asp:HyperLink ID="AddNewToolLink" runat="server" CssClass="addLink" />
        </div>
        <div class="linkContainer">
            <asp:HyperLink ID="ManageCategoriesLink" runat="server" />
        </div>
    </div>
    <div class="backToMainScreenLinkContainer">
        <asp:HyperLink ID="BackToMainScreenLink" runat="server" CssClass="backLink" />
    </div>
</div>
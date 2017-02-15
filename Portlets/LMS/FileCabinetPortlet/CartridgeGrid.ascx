<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartridgeGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CartridgeGrid" %>

<div>
    <asp:GridView runat="server" id="ggMain" CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input type="checkbox" id="chkSelectAll" />
                </HeaderTemplate>
                <ItemTemplate>
                    <input type="checkbox" id="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# this.GetFolderNameOrEvaluateField(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>        
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetEmptyStringOrEvaluateField(Container.DataItem, "Properties[\"DateImported\"]", "{0:G}", typeof(DateTime)) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetEmptyStringOrEvaluateField(Container.DataItem, "Properties[\"Type\"]", "{0}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetEmptyStringOrEvaluateField(Container.DataItem, "Properties[\"Version\"]", "{0}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
    				<%# this.GetEmptyStringOrCartridgeSize(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# this.GetEditMarkupFolderOnly(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetDeleteMarkup(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div style="margin:20px;">
                <div>There are no course cartridges in this folder.</div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>

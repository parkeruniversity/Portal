<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReadingGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.ReadingGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>

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
                    <%# this.GetFolderNameOrEvaluateField(Container.DataItem, "Properties[\"Title\"]", "{0}") %>
                </ItemTemplate>
            </asp:TemplateField>        
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetEmptyStringOrEvaluateField(Container.DataItem, "Properties[\"Author\"]", "{0}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
				    <%# ((IFileCabinetObject)Container.DataItem).Created.ToString() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
				    <%# this.GetEditMarkup(Container.DataItem) %>
                    <%# this.GetDeleteMarkup(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div style="margin:20px;">
                <div>There are no readings in this folder.</div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>

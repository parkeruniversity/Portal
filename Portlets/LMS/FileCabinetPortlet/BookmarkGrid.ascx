<%@ Control Language="c#" AutoEventWireup="false" Codebehind="BookmarkGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.BookmarkGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

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
                    <%# this.GetNameMarkup(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>        
            <asp:TemplateField>
                <ItemTemplate>
                    <%# this.GetEmptyStringOrEvaluateField(Container.DataItem, "Created", "{0:d}") %>
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
                <div>There are no handouts in this folder.</div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>

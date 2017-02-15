<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseworkQuestionGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkQuestionGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fc" Namespace="Jenzabar.LMS.Portlets.FileCabinetPortlet" Assembly="Jenzabar.LMS.Portlets" %>

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
                    <%# this.GetItemMarkup(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# this.GetQuestionType(Container.DataItem)%>
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
                <div>There are no assignments in this folder.</div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>
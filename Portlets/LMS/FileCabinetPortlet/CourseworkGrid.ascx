<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseworkGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/FCViewHeader.ascx" tagname="FCViewHeader" tagprefix="FC" %>

<FC:FCViewHeader ID="FCViewHeader1" runat="server" />
<div id="divFolderInfo" runat="server"></div>
<div id="divNewFolder"></div>
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
                <%# this.GetFolderNameOrItemMarkup(Container.DataItem) %>
            </ItemTemplate>
        </asp:TemplateField>        
        <asp:TemplateField>
            <ItemTemplate>
                <%# this.GetEmptyStringOrFormatImageMarkup(Container.DataItem) %>
                <%# this.GetEmptyStringOrHeaderName(Container.DataItem) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <%# GetCreateDateOrAssignmentCount(Container.DataItem) %>
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

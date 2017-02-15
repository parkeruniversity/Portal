<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseworkSectionGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkSectionGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="Controls/FCViewHeader.ascx" tagname="FCViewHeader" tagprefix="uc1" %>

<uc1:FCViewHeader ID="FCViewHeader1" runat="server" />

<div id="divFolderInfo" runat="server" style="margin-top:10px;"></div>

<table id="tblOnline" runat="server" visible="false" cellspacing="5">
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td></td>
    </tr>
</table>

<table id="tblOffline" runat="server" visible="false" cellspacing="5">
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td></td>
    </tr>
</table>

<table id="tblUpload" runat="server" visible="false" cellspacing="5">
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td class="filecabinet assignmentInfoBoldValue"></td>
    </tr>
    <tr>
        <td class="filecabinet assignmentInfoLabel"></td>
        <td></td>
    </tr>
</table>

<div id="divGroupedGrid" runat="server" style="margin-left:20px;">
    <div id="divContentsLabel" runat="server"></div>
    <asp:GridView runat="server" id="ggMain" CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid" CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" >
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
                    <%# this.GetGroupType(Container.DataItem) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# this.GetQuestionCount(Container.DataItem) %>
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
                <div>There are no sections in this folder.</div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>


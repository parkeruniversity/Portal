<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExistingAssignmentGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.FileCabinet.ExistingAssignmentGrid" %>

<asp:GridView runat="server" id="grdMain" Width="100%" CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" EnableViewState="false" >
    <Columns>
        <asp:TemplateField>
            <HeaderStyle Width="1px" />
            <HeaderTemplate>
                <input type="checkbox" id="chkSelectAll" onclick="SelectAllCheckBoxes('chkSelectAll','<%=grdMain.ClientID %>');" />
            </HeaderTemplate>
            <ItemTemplate>
                <input type="checkbox" id="chkSelect" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton id="lnkAssignment" runat="server"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>        
        <asp:TemplateField>
            <ItemTemplate></ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate></ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        <div style="margin:10px;">
            <%=GetEmptyGridText() %>
        </div>
    </EmptyDataTemplate>
</asp:GridView>
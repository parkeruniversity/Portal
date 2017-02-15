<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FacultyAssignmentBody.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.FacultyAssignmentBody" %>
<asp:GridView id="_gvAssignments" runat="server" Width="100%"  CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" HeaderStyle-CssClass="headerAssignmentGrid"  CellPadding="0" CellSpacing="0"
            AutoGenerateColumns="False" EnableViewState="false">
    <Columns>
        <asp:TemplateField  HeaderStyle-Width="30%">
            <ItemTemplate>
				<asp:Panel id="_panNotify" CssClass="assignmentNotify" runat="server">
                    <asp:ImageButton id="_ibtnActivity" runat="server" />
                </asp:Panel>
				<asp:HyperLink ID="_hypAssign" runat="server"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                       
            </ItemTemplate>
        </asp:TemplateField>
		<asp:TemplateField>
			<ItemTemplate>
				
			</ItemTemplate>
		</asp:TemplateField>
        <asp:TemplateField HeaderStyle-Width="25%">
            <ItemTemplate>
				<asp:Label ID="_lblType" runat="server" />
                <asp:Label ID="_lblRequired" runat="server" ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-Width="20%">
            <ItemTemplate>
                       
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-Width="20px" >
            <ItemTemplate>
				<asp:HyperLink ID="_hypEdit" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
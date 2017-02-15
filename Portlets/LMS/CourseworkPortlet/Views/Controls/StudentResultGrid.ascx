<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentResultGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentResultGrid" %>
<%@ Register Src="../../../Common/Controls/GradeInput.ascx" TagName="GradeInput" TagPrefix="lms" %>
<asp:Label ID="lblErrGeneral" runat="server" CssClass="FormTxtErr" />
<asp:GridView ID="_gvResults" EnableViewState='false' CssClass="assignmentGrid itemHover" AlternatingRowStyle-CssClass="altAssignmentGrid" 
    HeaderStyle-CssClass="headerAssignmentGrid" CellPadding="0" CellSpacing="0" AutoGenerateColumns="False" runat="server">
	<Columns>
	    <asp:TemplateField ItemStyle-Width="15px">
            <ItemTemplate></ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ItemStyle-CssClass="gridStudentColumn" >
            <ItemTemplate>
                    <asp:Panel id="_panNotify" CssClass="assignmentNotify" runat="server" />
                    <asp:HyperLink ID="_hypStudent" runat="server" />                    
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                     <asp:Literal ID="_litFiles" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ItemStyle-CssClass="gridGradeColumn">
            <ItemTemplate>
                       <asp:Label ID="_lblGrade" runat="server" CssClass="resultGrade" />
					   <lms:GradeInput ID="_gradeInput" EnableViewState="false" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                       <asp:Literal ID="_litComplete" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                       <asp:Literal ID="_litTimeSpent" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                       <asp:TextBox ID="_txtGrade" runat="server" Width="50px" />
            </ItemTemplate>
        </asp:TemplateField>
		<asp:TemplateField>
            <ItemTemplate>
                       <asp:Label ID="_lblPosts" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                       <asp:Label ID="_lblReplies" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
	</Columns>
</asp:GridView>
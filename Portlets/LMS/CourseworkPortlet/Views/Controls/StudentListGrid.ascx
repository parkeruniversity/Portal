<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentListGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentListGrid" %>
<asp:GridView ID="gvStudentList" AutoGenerateColumns="false" UseAccessibleHeader="true" CssClass="groupedGrid cwkTableDisplay itemHover" AlternatingRowStyle-CssClass="alt" runat="server">
    <Columns>
        <asp:TemplateField>
		    <HeaderTemplate><%= Globalizer.GetString("HDR_STUDENT") %></HeaderTemplate>
		    <ItemTemplate>
                <asp:Literal ID="litStudentDetailLink" runat="server" /><div id="divAlerts" runat="server" class="alerts"></div>
		    </ItemTemplate>
	    </asp:TemplateField>
        <asp:TemplateField>
		    <HeaderTemplate><%= Globalizer.GetString("HDR_COMPLETED") %></HeaderTemplate>
		    <ItemTemplate>
		        <%# Eval("CompletedAssignments") %>/<%# Eval("TotalAssignments") %>
		    </ItemTemplate>
	    </asp:TemplateField>
        <asp:TemplateField>
		    <HeaderTemplate><%= Globalizer.GetString("HDR_MOST_RECENT_SUBMISSION") %></HeaderTemplate>
		    <ItemTemplate>
                <asp:Literal ID="litStudentAssignmentDetailLink" runat="server" />
		    </ItemTemplate>
	    </asp:TemplateField>
    </Columns>
</asp:GridView>
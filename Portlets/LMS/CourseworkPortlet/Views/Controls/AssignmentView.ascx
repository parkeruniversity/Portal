<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignmentView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.AssignmentView" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register src="FacultyAssignmentBody.ascx" tagname="FacultyAssignmentBody" tagprefix="JICS" %>
<%@ Register src="StudentAssignmentBody.ascx" tagname="StudentAssignmentBody" tagprefix="JICS" %>
<%@ Register src="AssignmentBatchDateEdit.ascx" tagname="BatchDateEdit" tagprefix="JICS" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel ID="_updatePanel" runat="server">
    <ContentTemplate>
            <asp:Repeater ID="_rptAssignments" runat="server" EnableViewState="false">
	        <ItemTemplate>
		        <asp:Panel ID="_panTitle" CssClass="assignmentTitle" runat="server">
			        <asp:Label ID="_lblUnitName" CssClass="unitName" runat="server" />
			        <asp:Label ID="_lblStatus" CssClass="unitStatus" Visible="false" runat="server" />
			        <asp:Label ID="_lblShowHide" CssClass="unitCollapse" Visible="false" runat="server" />
		        </asp:Panel>
		        <asp:Panel ID="_panAssignments" CssClass="assignmentView" runat="server" >
			        <div>
				        <asp:Panel id="_panAction" runat="server" CssClass="unitAssignmentActions">
					        <cmn:ImageAndTextLink ID="_itlAddAssignment" runat="server" />
                            <cmn:ImageAndTextButton ID="_itbEditDates" runat="server" />
				        </asp:Panel>
				        <asp:Literal ID="_litDateRange" runat="server" />
			        </div>
			        <div class="unitAssignmentDescription">
				        <asp:Literal ID="_litDescription" runat="server" />
			        </div>
			        <asp:Panel ID="_panNoAssignments" CssClass="noAssignments" runat="server">
				        <asp:Label ID="_lblNoAssignments" runat="server" />
				        <cmn:ImageAndTextLink ID="_itlNoAssignments" runat="server" />
			        </asp:Panel>
                    <asp:Panel ID="_panEditMessage" runat="server" />
			        <JICS:FacultyAssignmentBody ID="_assignGrid" runat="server" />
			        <JICS:StudentAssignmentBody ID="_studentAssignBody" runat="server" />
		        </asp:Panel>
                <JICS:BatchDateEdit ID="_batchEdit" runat="server" />		
	        </ItemTemplate>
        </asp:Repeater>
        <asp:HiddenField runat="server" ID="_hfEditId"/>
    </ContentTemplate>
</asp:UpdatePanel>
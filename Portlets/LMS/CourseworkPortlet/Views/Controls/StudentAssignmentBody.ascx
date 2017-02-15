<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAssignmentBody.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentBody" %>
<asp:Repeater ID="_rptAssignments"  runat="server" EnableViewState="false">
	<ItemTemplate>
		<asp:Panel ID="_panDisplay" CssClass="assignmentDisplay" runat="server">
                <div style="float:left;">
				    <div class="assignmentText">
                    <asp:HyperLink ID="_hypAssign" runat="server" />
				    <asp:Label ID="_lblInfo" CssClass="assignmentStatusDisplay" runat="server" />
                    </div>
                    <asp:Panel id="_panNotify" CssClass="assignmentNotify" runat="server" />
                </div>
				<div class="assignmentDue">
					<asp:Literal ID="_litDueDate" runat="server" />
					<asp:Literal ID="_litRequired" runat="server" />
				</div>
				<div class="assignmentDescription">
					<asp:Literal ID="_litDescription" runat="server" />
				</div>
		</asp:Panel>
	</ItemTemplate>
</asp:Repeater>
<div style="clear:both;"></div>
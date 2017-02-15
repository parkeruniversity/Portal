<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralAssignmentInfo.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.GeneralAssignmentInfo" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<div>
	<asp:Panel ID="_panAssignment" runat="server">
		<asp:Panel ID="_panGradeSoFar" CssClass="gradeSoFar" runat="server">
			<asp:Label ID="_lblGradeSoFar" CssClass="assignmentStatus" runat="server" />
			<asp:Label ID="_lblGradeSoFarGrade" CssClass="assignmentGrade" runat="server" />
		</asp:Panel>
		<asp:Panel ID="_panType" CssClass="statusDisplay" runat="server">
			<asp:Label runat="server" CssClass="assignmentStatus" ID="lblAssignmentInfo" />
            <asp:Panel ID="_panOnlineInProgress" runat="server">
				<div>
					<asp:Literal ID="_litOnlineTime" runat="server" />
				</div>
				<div>
					<asp:Literal ID="_litOnlineTimeInfo" runat="server" />
				</div>
				<div>
					<asp:Button id="_btnSubmit" runat="server" />
				</div>
                <br/>
			</asp:Panel>

			 <asp:Label runat="server" ID="lblGrade" CssClass="assignmentGrade" />
			<asp:Label runat="server" CssClass="startDate" ID="lblOpenDate" />
			<asp:Panel ID="_panOverrideStart" CssClass="overrideStart" runat="server">
				<asp:Label ID="_lblOverrideStart" runat="server" />
				<asp:HyperLink ID="_hypOverrideStart" runat="server" />
			</asp:Panel>
			<asp:Label runat="server" CssClass="dueDate" ID="lblDueDate" />
			<asp:Label runat="server" CssClass="dueDate" ID="_lblDueFinal" />
			<asp:Panel ID="_panOverrideDue" CssClass="overrideDue" runat="server">
				<asp:Label ID="_lblOverrideDue" runat="server" />
				<asp:HyperLink ID="_hypOverrideDue" runat="server" />
			</asp:Panel>
			<asp:Label runat="server" ID="lblUploadedAssignmentWarning" />

		</asp:Panel>
	</asp:Panel>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadAssignmentDetails.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.UploadAssignmentDetails" %>
<%@ Register Src="../AssignmentFileUploader.ascx" TagName="AssignmentFileUploader" TagPrefix="JICS" %>
<asp:Panel runat="server" ID="pnlAssignmentUploader">
        <asp:Panel runat="server" ID="pnlUploadAssignmentDetails" CssClass="uploadAssignmentInfo">
				<asp:Label id="_lblCurrentCount" runat="server" />
				<asp:Label id="_lblRemainingCount" runat="server" />
				<asp:Label id="_lblFinished" runat="server" />
        </asp:Panel>
		<div class="facAssignmentDetailSection">
			<asp:Label ID="_lblYourFiles" runat="server" />
		</div>
		<asp:Panel ID="_panFileContainer" runat="server">
			<JICS:AssignmentFileUploader ID="AssignmentFileUploader" runat="server" />
		</asp:Panel>
		<div>
			<asp:HyperLink runat="server" ID="_hypUploadFile" CssClass="uploadFile" />
			<asp:LinkButton runat="server" ID="_lbtnTurnIn" CssClass="turnInAssignment" />
        </div>
				<br style="clear:both;" />
		<asp:Label ID="_lblFileInfo" CssClass="maxUpload" runat="server"/>
</asp:Panel>
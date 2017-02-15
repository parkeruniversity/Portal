<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmissionNotes.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.SubmissionNotes" %>
<div class="facAssignmentDetailSection">
	<asp:Label ID="_lblNotes" CssClass="notes" runat="server" />
	<asp:Panel ID="_panAbout" runat="server" CssClass="aboutGrade">
		<asp:Label ID="_lblAboutGrade" runat="server" />
	</asp:Panel>
	<asp:Panel ID="_panSubmitInfo"  runat="server">
		<asp:Literal ID="_litSubmitStatus" runat="server" />
		<asp:Panel ID="_panLate" CssClass="lateNotes" runat="server">
			<asp:Literal ID="_litIncurred" runat="server" />
			<ul>
				<li id="_liOne" runat="server"><asp:Literal ID="_litOne" runat="server" /></li>
				<li id="_liTwo" runat="server"><asp:Literal ID="_litTwo" runat="server" /></li>
				<li id="_liThree" runat="server">
					<asp:Literal ID="_litForgivePre" runat="server" />
					<asp:LinkButton ID="_lbtnForgive" runat="server" />
					<asp:Literal ID="_litForgivePost" runat="server" />
				</li>
			</ul>
		</asp:Panel>
	</asp:Panel>

	<asp:Panel ID="_panFinal" CssClass="overrideDisplay overrideFinal" runat="server">
		<asp:Label ID="_lblFinal" runat="server" />
		<asp:HyperLink ID="_hypFinal" runat="server" />
		<asp:Label ID="_lblFinalEnd" runat="server" />
	</asp:Panel>
    <asp:Panel ID="_panFinalManual" CssClass="manualGradeFinal" runat="server">
    &nbsp;
    </asp:Panel>
    <asp:Panel ID="_panBonus" runat="server" class="overrideDisplay bonusContainer">
        <asp:Label ID="_lblBonus" runat="server" />
    </asp:Panel>

</div>
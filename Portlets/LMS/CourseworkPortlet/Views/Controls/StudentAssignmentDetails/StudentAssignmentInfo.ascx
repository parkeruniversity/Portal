<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAssignmentInfo.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.StudentAssignmentInfo" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../../../Common/Controls/Modal.ascx" %>

<asp:Panel ID="_panOverride" CssClass="overrideDisplay overrideInstructions" runat="server">
	<asp:Label id="_lblShow" runat="server" />
	<asp:HyperLink ID="_hypShow" runat="server" />
	<lms:Modal id="_modal" runat="server">
		<ContentArea>
			<asp:PlaceHolder ID="_phModalContent" runat="server" />
		</ContentArea>
	</lms:Modal>
</asp:Panel>
<asp:Panel ID="_panInfo" CssClass="studentAssignmentInfo" runat="server">
	<div class="studentAssignStatus">
		<asp:Literal ID="_litStatus" runat="server" />
	</div>
	<div>
		<asp:Literal ID="_litType" runat="server" />
	</div>
	<div>
		<asp:Literal ID="_litDescription" runat="server" />
	</div>
	<div>
		<asp:Label id="_lblInstructions" CssClass="stuStrong" runat="server" />
		<asp:Literal ID="_litInstructions" runat="server" />
        
	</div>
	<div>
		<asp:Label id="_lblFiles" CssClass="stuStrong" runat="server" />
		<asp:Repeater ID="_rptFiles" runat="server">
			<ItemTemplate>
				<div  class="fileDisplay">
					<asp:HyperLink ID="_hyp" runat="server" /> (<asp:Literal ID="_lit" runat="server" />)
					<div>
						<asp:Literal ID="_litDescrip" runat="server" />
					</div>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>    
</asp:Panel>
<div id="_divToolLaunch" runat="server" class="toolLaunchContainer">
    <asp:LinkButton ID="_lbtnLaunchLearningTool" runat="server" />
    <a id="_aLaunchLearningTool" runat="server" />
</div>
<iframe id="_learningToolFrame" runat="server" scrolling="yes" width="100%" height="800px" />
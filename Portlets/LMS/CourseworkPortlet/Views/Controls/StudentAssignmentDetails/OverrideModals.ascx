<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverrideModals.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.OverrideModals" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<lms:Modal id="_modalStart" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litStart" runat="server" />
			</div>
			<div>
				<asp:Literal ID="_litUser" runat="server" />
				<table>
                    <tr>
                        <td>
                            <asp:Label ID="_lblErrModalStart" runat="server" />
                        </td>
                    </tr>
					<tr>
                        <td>
                            <cmn:DatePicker ID="_dpStart" runat="server" />
                        </td>
                    </tr>
				</table>
			</div>
			<div>
				<framework:PortalImageAndTextButton id="_pitbRemove" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalDue" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litDue" runat="server" />
			</div>
            <div>
                <asp:Label ID="_lblModalDueErr" runat="server" />
            </div>
			<div>
				<asp:Literal ID="_litUserDue" runat="server" />
				<table>
					<tr><td><cmn:DatePicker ID="_dpDue" runat="server" /></td></tr>
				</table>
			</div>
			<div>
				<framework:PortalImageAndTextButton id="_pitbRemoveDue" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalTime" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litTime" runat="server" />
			</div>
			<div>
				<asp:Label ID="_lblInput" AssociatedControlID="_txtTime" runat="server" />
				<asp:TextBox ID="_txtTime" runat="server" MaxLength="3" Width="40px" />
				<asp:DropDownList ID="_ddlTime" runat="server" />
			</div>
			<div>
				<framework:PortalImageAndTextButton id="_pitbRemoveTime" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalReOpen" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litReopen" runat="server" />
			</div>
			<asp:Panel ID="_panAttempts" CssClass="overrideSpacer" runat="server">
				<asp:Label ID="_lblAttempts" runat="server" />
				<br />
				<asp:DropDownList ID="_ddlAttempts" runat="server" />
			</asp:Panel>
			<div>
				<asp:Literal ID="_litReopenDue" runat="server" />
				<div style="margin-left:30px;">
					<table>
                        <tr>
                            <td colspan="2"><asp:Label ID="lblReopenErrMsg" runat="server" CssClass="FormTxtErr" /></td>
                        </tr>
						<tr>
							<td><asp:RadioButton ID="_radUnchanged" runat="server" GroupName="reOpen" /></td>
							<td><asp:Literal id="_litUnchanged" runat="server" /></td>
						</tr>
						<tr>
							<td><asp:RadioButton ID="_radNewDate" runat="server" GroupName="reOpen" /></td>
							<td><cmn:DatePicker ID="_dpReopen" runat="server" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div  class="overrideSpacer">
				<asp:Label id="_lblNote" runat="server"  AssociatedControlID="_txtNote"/>
				<asp:TextBox ID="_txtNote" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalReOpenAssignment" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litReopenAssignment" runat="server" />
			</div>
			<div>
				<asp:Literal ID="_litReopenDueAssignment" runat="server" />
				<div style="margin-left:30px;">
					<table>
                        <tr>
	                        <td colspan="2"><asp:Label ID="_lblReOpenAssignmentErrMsg" runat="server" CssClass="FormTxtErr" /></td>
                        </tr>
						<tr>
							<td><asp:RadioButton ID="_radUnchangedAssignment" runat="server" GroupName="reOpenAssignment" /></td>
							<td><asp:Literal id="_litUnchangedAssignment" runat="server" /></td>
						</tr>
						<tr>
							<td><asp:RadioButton ID="_radNewDateAssignment" runat="server" GroupName="reOpenAssignment" /></td>
							<td><cmn:DatePicker ID="_dpReopenAssignment" runat="server" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div  class="overrideSpacer">
				<asp:Label id="_lblNoteAssignment" runat="server"  AssociatedControlID="_txtNoteAssignment"/>
				<asp:TextBox ID="_txtNoteAssignment" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalRetake" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<asp:Label ID="_lblRetakeWarning" runat="server" />
			<div class="overrideSpacer">
				<asp:Literal ID="_litRetake" runat="server" />
			</div>
			<div>
				<asp:Literal ID="_litRetakeDate" runat="server" />
				<div style="margin-left:30px;">
					<table>
                        <tr>
	                        <td colspan="2"><asp:Label ID="lblRetakeErrMsg" runat="server" CssClass="FormTxtErr" /></td>
                        </tr>
						<tr>
							<td><asp:RadioButton ID="_radRetakeUnchanged" runat="server" GroupName="retake" /></td>
							<td><asp:Literal id="_litRetakeUnchanged" runat="server" /></td>
						</tr>
						<tr>
							<td><asp:RadioButton ID="_radRetakeDate" runat="server" GroupName="retake" /></td>
							<td><cmn:DatePicker ID="_dpRetake" runat="server" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<asp:Literal ID="_litRetakeGrading" runat="server" />
				<div style="margin-left:30px;">
					<asp:RadioButtonList ID="_rblGrading" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" />
				</div>
			</div>
			<div>
				<asp:Literal id="_litWait" runat="server" />
				<div style="margin-left:30px;">
					<div style="display:inline;">
						<asp:TextBox ID="_txtWait" MaxLength="3" Width="40px" runat="server" />
						<asp:DropDownList ID="_ddlWait" runat="server" />
					</div>
					<div style="display:inline;">
						<asp:Literal ID="_litWaitInfo" runat="server" />
					</div>
				</div>
			</div>
			<div  class="overrideSpacer">
				<asp:Label id="_lblRetakeNote" runat="server"  AssociatedControlID="_txtRetakeNote"/>
				<asp:TextBox ID="_txtRetakeNote" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>

<lms:Modal id="_modalFinal" runat="server">
	<ContentArea>
		<div class="overrideContainer">
			<div class="overrideSpacer">
				<asp:Literal ID="_litFinal" runat="server" />
                <div><asp:Label ID="lblFinalInvalidMsg" runat="server" CssClass="FormTxtErr" /></div>
			</div>
			<div>
				<asp:RadioButtonList ID="_rblFinal" runat="server" RepeatDirection="Vertical"  RepeatLayout="Flow"/>
				<br />
				<asp:RadioButton ID="_rbManual" runat="server" />
				<asp:TextBox ID="_txtManual"  Width="40px" runat="server" />
				<asp:Label ID="_lblManual" runat="server" />
			</div>
			<div class="overrideSpacer" id="_divFinalAdjust">
                <div><asp:Label ID="_lblGradeAdjustmentInvalidMsg" runat="server" CssClass="FormTxtErr" /></div>
				<asp:CheckBox ID="_cbxFinal" runat="server" />
				<asp:TextBox ID="_txtFinalPoints" Width="40px" runat="server" />
				<asp:Literal ID="_litFinalPoints" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>
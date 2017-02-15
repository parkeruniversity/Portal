<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentDetailView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.StudentDetailView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>
<%@ Register TagPrefix="lms" TagName="PagingDropdown" Src="../../Common/Controls/PagingDropdown.ascx" %>
<%@ Register TagPrefix="jics" TagName="FeedbackDisplay" Src="../../Common/Controls/FeedbackDisplay.ascx" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<script language="javascript" type="text/javascript">
	var previousExtraCredit;

	$(document).ready(function () {
		previousExtraCredit = $('#<%= this.ExtraCreditAdminInput.Control.ClientID %>').val();
	});

	function clearFinalExtraCredit() {
		$('#<%= this.ExtraCreditAdminInput.Control.ClientID %>').val(previousExtraCredit);
	}
</script>

<div class="studentDetailScreen">
	<portlet:NavBar ID="NavBar" AreCustomDetailsVisible="false" runat="server">
	<TopNavBarContent>
		<lms:PagingDropdown ID="StudentPaging" DropdownTextKey="TXT_OTHER_STUDENTS" TopMoreWindowOffset="1" runat="server" />
	</TopNavBarContent>
	<CustomDetailsContent>
		<div id="MissingWeightsMessage" class="missingWeightsMessage" runat="server"></div>
	</CustomDetailsContent>
	</portlet:NavBar>
</div>

<div id="PortletScreen" class="studentDetailScreen portletScreen" runat="server">

<div id="GradesheetIntro" class="introText" runat="server"></div>
<div id="StudentName" class="studentName" runat="server"></div>

<table>
<tr>
	<td rowspan="2" class="userPhotoColumn" valign="top">
		<asp:Image ID="PhotoImage" CssClass="userPhoto" runat="server" />
		<div class="iconBar">
			<div class="mailIcon">
				<asp:HyperLink ID="MailLink" runat="server">
					<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/email.png" AlternateTextKey="TXT_EMAIL" runat="server" />
				</asp:HyperLink>
			</div>
			<div class="myInfoIcon">
				<framework:MyInfoPopup ID="InfoPopup" HideUserName="true" runat="server" />
			</div>
			<div class="exportIcon">
				<asp:HyperLink ID="ExportLink" runat="server">
					<framework:PortalImage ImageCategory="PortletIcon" ImageUrl="download-excel.png" AlternateTextKey="TXT_EXPORT_TO_EXCEL" runat="server" />
				</asp:HyperLink>
			</div>
		</div>
	</td>
	<td class="finalGradeColumn" valign="top">
		<div class="finalGradePanel">
			<div id="FinalGradeText" class="finalGradeValue" runat="server"></div>
			<div id="FinalGradePoints" class="finalGradePoints" Visible="false" runat="server"></div>
		</div>
	</td>
	<td class="gradeMessageColumn" valign="top">
		<div class="gradeAccuracyStudentMessage">
			<common:GlobalizedLabel ID="GradeAccuracyStudentMessage" runat="server" />
		</div>

		<div class="attendanceFailureMessage">
			<common:GlobalizedLabel ID="StudentAttendanceFailureMessage" TextKey="MSG_GBK_ATTENDANCE_FAILURE_STUDENT_MESSAGE" Visible="false" runat="server" />
			<common:GlobalizedLabel ID="FacultyAttendanceFailureMessage" runat="server" />
			<common:GlobalizedHyperLink ID="FacultyAttendanceFailureLink" TextKey="MSG_GBK_VIEW_ATTENDANCE_FAILURE_SETTINGS" runat="server" />
		</div>

		<div class="gradeAccuracyFacultyMessage">
			<common:GlobalizedLabel ID="GradeAccuracyFacultyMessage" runat="server" />
		</div>

		<div id="ExtraCreditDisplay" class="extraCreditMessage" visible="false" runat="server">
			<div ID="ExtraCreditDescription" runat="server"></div>
			<asp:HyperLink ID="AdminExtraCreditLink" NavigateUrl="javascript:" runat="server" />
			<lms:Modal ID="ExtraCreditPopup" TargetControlID="AdminExtraCreditLink" CancelButtonClientClick="clearFinalExtraCredit();" runat="server">
				<ContentArea>
					<div class="extraCreditAdmin">
						<div id="ExtraCreditAdminIntro" runat="server"></div>
						<div>
							<common:NumberValidator ControlToValidate="ExtraCreditAdminInput" AllowNegative="true" DecimalPlaces="2" runat="server" />
							<span id="ExtraCreditAdminText1" runat="server"></span><!--
							--><asp:TextBox ID="ExtraCreditAdminInput" Columns="4" MaxLength="10" runat="server" /><!--
							--><span id="ExtraCreditAdminText2" runat="server"></span>
						</div>
					</div>
				</ContentArea>
			</lms:Modal>
		</div>
	</td>
</tr>
<tr>
	<td colspan="2">
		<jics:FeedbackDisplay ID="FeedbackDisplay" runat="server" />
	</td>
</tr>
</table>

<common:GlobalizedLabel ID="AssignmentGradesHeader" TextKey="HDR_ASSIGNMENT_GRADES" CssClass="gbkSubheader" runat="server" />

<asp:Repeater ID="GradeGroupRepeater" runat="server">
<ItemTemplate>
<table class="gradeList" cellpadding="0" cellspacing="0">
	<tr id="GradeGroupHeader" runat="server">
		<td colspan="2" class="gradeGroupHeader" valign="bottom">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td align="left" valign="bottom">
						<div id="GradeGroupName" class="groupName" runat="server" />
					</td>
					<td align="right" valign="bottom">
						<div id="GradeGroupStats" class="groupStats" runat="server" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr id="GradeGroupDataRow" runat="server">
		<td id="GradeGroupInfoPanel" class="gradeGroupSidebar" valign="top" runat="server">
			<div id="GradeGroupGradeLabel" class="groupName" runat="server"></div>
			<div id="GradeGroupGrade" class="groupGrade" runat="server"></div>
			<div id="GradeGroupPoints" class="groupPoints" visible="false" runat="server"></div>
			<div id="GradeGroupBonus" class="groupBonus" visible="false" runat="server"></div>
		</td>
		<td class="gradeGroupItemList" valign="top">
			<common:StyledGridView ID="GradeItemGrid" ShowHeader="false" CssClass="gradeItemGrid" runat="server">
				<Columns>
					<asp:TemplateField>
						<ItemStyle CssClass="gradeNameColumn" />
						<ItemTemplate>
							<asp:Hyperlink ID="GradeItemName" runat="server" />

							<lms:Modal ID="GradeItemPopup" TargetControlID="GradeItemName" Visible="false" runat="server">
								<ContentArea><div id="GradeItemDescription" class="pSection" runat="server"></div></ContentArea>
							</lms:Modal>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField>
						<ItemStyle CssClass="gradeColumn" />
						<ItemTemplate>
							<span id="GradeItemGrade" runat="server"></span>
							<span id="ExtraCreditLabel" visible="false" runat="server">
								(<common:GlobalizedLabel TextKey="TXT_EXTRA_CREDIT" CssClass="extraCreditText" runat="server" />)
							</span>
							<common:GlobalizedLabel ID="GradeItemDroppedMessage" TextKey="TXT_THIS_GRADE_WAS_DROPPED"
									CssClass="droppedGradeMessage" runat="server" />
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField>
						<ItemStyle CssClass="dropGradeColumn" />
						<ItemTemplate>
							<common:GlobalizedLinkButton ID="DropGradeButton" TextKey="TXT_DROP_THIS_GRADE" runat="server" />
							<common:GlobalizedLabel ID="AutoDroppedDisplay" TextKey="TXT_AUTOMATICALLY_DROPPED" Visible="false" runat="server" />
							<common:EmbeddedLinkButton ID="GradeDroppedButton"
									OuterTextKey="MSG_FORMAT_GBK_DROPPED_WITH_PARENS" TextKey="TXT_REINSTATE" Visible="false" runat="server" />
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</common:StyledGridView>
		</td>
	</tr>
	<tr id="NoGradesRow" class="noGradesMessage" runat="server">
		<td colspan="2">
			<div ID="NoGradesMessage" runat="server" />
		</td>
	</tr>
</table>
</ItemTemplate>
</asp:Repeater>

</div>
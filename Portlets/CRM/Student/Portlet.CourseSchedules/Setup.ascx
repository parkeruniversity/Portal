<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.Setup" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div id="divError" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<h4><cmn:globalizedliteral id="glitPageSettings" runat="server" TextKey="TXT_PAGE_SETTINGS"></cmn:globalizedliteral></h4>
<div class="pSection" id="divMain">
	<jenzabar:hint id="lblPageSettingsHint" Visible="True" runat="server" TextKey="TXT_PAGE_SETTINGS_HINT"></jenzabar:hint>
	<table cellPadding="3" width="100%">
		<tr>
			<th noWrap width="10%">
				<cmn:globalizedliteral id="glitLoginRequestForm" runat="server" TextKey="TXT_FAA_LOGIN_REQUEST_FORM"></cmn:globalizedliteral>
			</th>
			<td>
				<asp:DropDownList ID="ddlLoginRequestForm" Runat="server"></asp:DropDownList>
			</td>
		</tr>
	</table>
</div>
<h4><cmn:globalizedliteral id="glitPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS"></cmn:globalizedliteral></h4>
<div class="pSection">
	<jenzabar:hint id="lblPortalSettingsHint" Visible="True" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>
	<table cellPadding="3" width="100%">
		<!--<tr>
			<td noWrap>
				<h5><cmn:globalizedliteral id="glitDisplayOptions" runat="server" TextKey="TXT_COURSE_DETAILS_DISP_OPT_FOR_RSLT_SRN"></cmn:globalizedliteral></h5>
			</td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseReferenceNumber" TextKey="CS_SETTINGS_DISPLAY_COURSE_REFERENCE_NUMBER_TAB"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>-->

		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseMethod" TextKey="CS_SETTINGS_DISPLAY_COURSE_METHOD_COLUMN" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<!--<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseTextBook" TextKey="CS_SETTINGS_DISPLAY_COURSE_TEXT_BOOK_COLUMN" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseNotes" TextKey="CS_SETTINGS_DISPLAY_COURSE_NOTE_COLUMN" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseRequisites" TextKey="CS_SETTINGS_DISPLAY_COURSE_REQUISITES_COLUMN"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>-->
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxDisplayAllCourses" TextKey="CS_SETTINGS_DISPLAY_ALL_COURSES" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>

		
		<!--<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td noWrap>
				<h5><cmn:globalizedliteral id="glitOtherOptions" runat="server" TextKey="TXT_COURSE_DETAILS_OTHER_DISP_OPTIONS"></cmn:globalizedliteral></h5>
			</td>
		</tr>
		<tr>-->
			<td noWrap><cmn:globalizedcheckbox id="gcbxDisplayCatalogURL" TextKey="CS_SETTINGS_DISPLAY_CATALOG_URL" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxTextBookPrices" TextKey="CS_SETTINGS_DISPLAY_TEXT_BOOK_PRICES" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td noWrap>
				<h5><cmn:globalizedliteral id="glitAddDropSettings" runat="server" TextKey="TXT_COURSE_DETAILS_ADD_DROP_SETTINGS"></cmn:globalizedliteral></h5>
			</td>
		</tr>
						<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxAddByCourseCodeTab" TextKey="CS_SETTINGS_DISPLAY_ADD_BY_COURSE_CODE_TAB"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxCourseReferenceTab" TextKey="CS_SETTINGS_DISPLAY_COURSE_REFERENCE_NUMBER_TAB"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>

		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxTabDisplay" TextKey="CS_SETTINGS_TAB_DISPLAY" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		
		<tr>
		
			<td noWrap><cmn:globalizedcheckbox id="gcbxAdvisorApprovalProcess" TextKey="CS_SETTINGS_ADD_DROP_USES_ADVISOR_APPROVAL"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxAdvisorClearanceProcess" TextKey="CS_SETTINGS_ADD_DROP_USES_ADVISOR_CLEARANCE"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxMustPayCourses" TextKey="CS_SETTINGS_ADD_DROP_MUST_PAY_COURSE_PROCESS_FOR_SELECTED_COURSE"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxPublicReg" TextKey="CS_SETTINGS_ALLOW_PUBLIC_REGISTRATION" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxEditCreditHoursColumn" TextKey="CS_SETTINGS_ADD_DROP_ALLOW_EDIT_CREDIT_HOURS_COLUMN_FOR_VARIABLE_CREDIT"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxStudentWaitlistThemselves" TextKey="CS_SETTINGS_ADD_DROP_ALLOW_STUDENTS_TO_WAITLIST_THEMSELVES"
					Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
		<tr>
			<td noWrap><cmn:globalizedcheckbox id="gcbxDisableAddButton" TextKey="CS_SETTINGS_DISABLE_ADD_BUTTON" Runat="server"></cmn:globalizedcheckbox></td>
		</tr>
	</table>
	<!--<table cellPadding="3">
		<tr>
			<th noWrap valign="top">
				<cmn:GlobalizedLiteral ID="glitRegClearanceMessage" Runat="server" TextKey="CS_SETTINGS_ADD_DROP_REG_CLEARANCE_MESSAGE"></cmn:GlobalizedLiteral>
			</th>
			<td noWrap>
				<asp:TextBox ID="tbRegClearanceMessage" Runat="server" Rows="6" Columns="50" TextMode="MultiLine"
					MaxLength="512" Wrap="True"></asp:TextBox>
			</td>
		</tr>
	</table>-->
	<br>
	<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE"></cmn:GlobalizedButton>
	&nbsp;&nbsp;
	<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL"></cmn:GlobalizedButton></div>

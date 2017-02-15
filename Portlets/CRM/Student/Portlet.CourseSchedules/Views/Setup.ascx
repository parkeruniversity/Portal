<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.Setup" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div id="divError" runat="server">
    <cmn:ErrorDisplay ID="ctlError" runat="server" />
</div>
<h4 id="h4PageSettings" runat="server"><cmn:GlobalizedLiteral ID="glitPageSettings" runat="server" TextKey="TXT_PAGE_SETTINGS" /></h4>
<div class="pSection" id="divMain" runat="server">
    <jenzabar:Hint ID="lblPageSettingsHint" Visible="True" runat="server" TextKey="TXT_PAGE_SETTINGS_HINT" />
    <table cellpadding="3" width="100%">
        <tr>
            <th nowrap width="10%">
                <cmn:GlobalizedLiteral ID="glitLoginRequestForm" runat="server" TextKey="TXT_FAA_LOGIN_REQUEST_FORM" />
            </th>
            <td>
                <asp:DropDownList ID="ddlLoginRequestForm" runat="server" />
            </td>
        </tr>
    </table>
</div>
<h4 id="h4PortalSettings" runat="server"><cmn:GlobalizedLiteral ID="glitPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS" /></h4>
<div class="pSection">
    <jenzabar:Hint ID="lblPortalSettingsHint" Visible="True" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT" />
    <table cellpadding="3" width="100%" id="tblPortletSettings" runat="server">
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxCourseMethod" TextKey="CS_SETTINGS_DISPLAY_COURSE_METHOD_COLUMN" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxDisplayAllCourses" TextKey="CS_SETTINGS_DISPLAY_ALL_COURSES" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxDisplayCatalogURL" TextKey="CS_SETTINGS_DISPLAY_CATALOG_URL" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <h5><cmn:GlobalizedLiteral ID="glitAddDropSettings" runat="server" TextKey="TXT_COURSE_DETAILS_ADD_DROP_SETTINGS" /></h5>
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAddByCourseCodeTab" TextKey="CS_SETTINGS_DISPLAY_ADD_BY_COURSE_CODE_TAB" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxCourseReferenceTab" TextKey="CS_SETTINGS_DISPLAY_COURSE_REFERENCE_NUMBER_TAB" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxTabDisplay" TextKey="CS_SETTINGS_TAB_DISPLAY" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAdvisorApprovalProcess" TextKey="CS_SETTINGS_ADD_DROP_USES_ADVISOR_APPROVAL" runat="server" />
            </td>
        </tr>
                <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAdvisorApprovalEmailLink" TextKey="CS_SETTINGS_ADD_DROP_SHOW_EMAIL_ADVISOR_LINK" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAdvisorClearanceProcess" TextKey="CS_SETTINGS_ADD_DROP_USES_ADVISOR_CLEARANCE" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxMustPayCourses" TextKey="CS_SETTINGS_ADD_DROP_MUST_PAY_COURSE_PROCESS_FOR_SELECTED_COURSE" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxPublicReg" TextKey="CS_SETTINGS_ALLOW_PUBLIC_REGISTRATION" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxEditCreditHoursColumn" TextKey="CS_SETTINGS_ADD_DROP_ALLOW_EDIT_CREDIT_HOURS_COLUMN_FOR_VARIABLE_CREDIT" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxEditVariableGradingType" TextKey="CS_SETTINGS_EDIT_VARIABLE_GRADING_TYPE" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxStudentWaitlistThemselves" TextKey="CS_SETTINGS_ADD_DROP_ALLOW_STUDENTS_TO_WAITLIST_THEMSELVES" runat="server" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxDisableAddButton" TextKey="CS_SETTINGS_DISABLE_ADD_BUTTON" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <table cellpadding="3" width="100%">
        <tr>
            <td nowrap>
                <h5><cmn:GlobalizedLiteral ID="glitAdvisorClearance" runat="server" TextKey="LBL_CS_SETTINGS_PERSONAL_INFO_UPDATE" /></h5>
            </td>
        </tr>
        <tr>
            <td nowrap>
                <jenzabar:Hint ID="Hint1" Visible="True" runat="server" TextKey="TXT_CS_SETTINGS_PERSONAL_INFO_UPDATE_HINT" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <a runat="server" id="hlEditPersonalInfoUpdate"><cmn:GlobalizedLiteral ID="GlobalizedLiteral1" runat="server" TextKey="TXT_CS_SETTINGS_EDIT_PERSONAL_INFO_UPDATE_FORM" /></a>
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAdvisorPersonalInformationUpdate" TextKey="CS_SETTINGS_ADVISOR_PERSONAL_INFORMATION_UPDATE" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td nowrap>
                <h5><cmn:GlobalizedLiteral ID="glitRegistrationAgreement" runat="server" TextKey="CS_SETTINGS_REGISTRATION_CLEARANCE" /></h5>
            </td>
        </tr>
        <tr>
            <td nowrap>
                <jenzabar:Hint ID="hntRegistrationAgreement" Visible="True" runat="server" TextKey="CS_SETTINGS_REGISTRATION_AGREEMENT_HINT" />
            </td>
        </tr>
        <tr>
            <td nowrap>
                <a runat="server" id="hlEditRegAgreement"><cmn:GlobalizedLiteral ID="GlobalizedLiteral2" runat="server" TextKey="TXT_CS_SETTINGS_EDIT_REGISTRATION_AGREEMENT_FORM" /></a>
            </td>
        </tr>
        <tr>
            <td nowrap>
                <cmn:GlobalizedCheckBox ID="gcbxAllowAdvisorRegistrationAgreement" TextKey="CS_SETTINGS_ADVISOR_REGISTRATION_AGREEMENT" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <cmn:GlobalizedButton ID="btnSave" runat="server" TextKey="TXT_SAVE" />
    &nbsp;&nbsp;
    <cmn:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" /></div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="BCProxyLogin.MainView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<div class="ArrowTabBar" id="bcPLTabBar" style="display: none;">
    <ul>
        <li class="tabSelected" data-view="Default"><%=Globalizer.GetGlobalizedString("CUS_BC_PL_DEFAULT")%></li>
        <li data-view="Configure"><%=Globalizer.GetGlobalizedString("CUS_BC_PL_CONFIGURE")%></li>
        <li data-view="Permissions"><%=Globalizer.GetGlobalizedString("TXT_PERMISSIONS_TAB_NAME")%></li>
        <li data-view="Logs"><%=Globalizer.GetGlobalizedString("CUS_BC_PL_LOGS")%></li>
    </ul>
</div>
<div id="bcPLErrorContainer" style="display: none" class="feedbackError">
</div>
<div id="divViewContainer">
    <div id="bcPLDefaultView">
        <ul style="list-style-type: none;">
            <li>
                <label for="bcPLUserName">
                    <%= Globalizer.GetGlobalizedString("CUS_BC_PL_USERNAME_LABEL_TEXT")%></label>
                <input type="text" id="bcPLUserName" name="bcPLUserName" />
            </li>
            <li id="bcPLRequirePassword" <%= EnablePw ? "" : "style='display:none;'"   %>>
                <label for="bcPLPassword">
                    <%= Globalizer.GetGlobalizedString("CUS_BC_PL_PASSWORD_LABEL_TEXT")%></label>
                <input type="password" id="bcPLPassword" name="bcPLPassword" />
            </li>
            <li>
                <label for="bcPLReason">
                    <%= Globalizer.GetGlobalizedString("CUS_BC_PL_REASON_LABEL_TEXT")%></label>
                <input type="text" id="bcPLReason" name="bcPLReason" />
            </li>
            <li>
                <input type="button" id="bcPLProxy" name="bcPLProxy" value="<%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOGIN")%>" />
            </li>
        </ul>
    </div>
    <div id="bcPLConfigureView">
        <h4>General Setup</h4>
        <ul id="ulConfig" class="ulPLSetup">
            <li>
                <label>Require the user to enter their password again before proxying?</label>
                <div>
                    <label for="rdEnablePWYes">Yes</label>
                    <input type="radio" value="Y" id="rdEnablePWYes" name="rdEnablePW">
                    <label for="rdEnablePWNo">No</label>
                    <input type="radio" value="N" id="rdEnablePWNo" name="rdEnablePW" checked="checked">
                </div>
            </li>
            <li>
                <label>Log IP address of proxy attempts?</label>
                <div>
                    <label for="rdLogIPYes">Yes</label>
                    <input type="radio" value="Y" id="rdLogIPYes" name="rdLogIP" checked="checked">
                    <label for="rdLogIPNo">No</label>
                    <input type="radio" value="N" id="rdLogIPNo" name="rdLogIP">
                </div>
            </li>
            <li>
                <label>Log failed attempts?</label>
                <div>
                    <label for="rdLogFailuresYes">Yes</label>
                    <input type="radio" value="Y" id="rdLogFailuresYes" name="rdLogFailures" checked="checked">
                    <label for="rdLogFailuresNo">No</label>
                    <input type="radio" value="N" id="rdLogFailuresNo" name="rdLogFailures">
                </div>
            </li>
            <li>
                <label>Log pages visited while proxying?</label>
                <div>
                    <label for="rdLogPagesYes">Yes</label>
                    <input type="radio" value="Y" id="rdLogPagesYes" name="rdLogPages" checked="checked">
                    <label for="rdLogPagesNo">No</label>
                    <input type="radio" value="N" id="rdLogPagesNo" name="rdLogPages">
                </div>
            </li>
            <li>
                <label>Enable Sidebar Control?</label>
                <div>
                    <label for="rdEnableSidebarYes">Yes</label>
                    <input type="radio" value="Y" id="rdEnableSidebarYes" name="rdEnableSidebar" checked="checked">
                    <label for="rdEnableSidebarNo">No</label>
                    <input type="radio" value="N" id="rdEnableSidebarNo" name="rdEnableSidebar">
                </div>
            </li>
            <li>
                <label>Enable Resume Functionality? (Warning: Resuming a proxied login does not require the user to re-enter the password as set above)</label>
                <div>
                    <label for="rdEnableResumeYes">Yes</label>
                    <input type="radio" value="Y" id="rdEnableResumeYes" name="rdEnableResume" checked="checked">
                    <label for="rdEnableResumeNo">No</label>
                    <input type="radio" value="N" id="rdEnableResumeNo" name="rdEnableResume">
                </div>
            </li>
            <li>
                <label>Should deny take precedence in determining permissions:</label>
                <div>
                    <label for="rdLessPermissiveYes">Yes</label>
                    <input type="radio" value="Y" id="rdLessPermissiveYes" name="rdLessPermissive" checked="checked">
                    <label for="rdLessPermissiveNo">No</label>
                    <input type="radio" value="N" id="rdLessPermissiveNo" name="rdLessPermissive">
                </div>
            </li>
        </ul>
        <div id="divReports" class="reports" runat="server">
            <h4>Usage Reports</h4>
            <ul id="ulScheduledReports" class="ulPLSetup">

                <li>
                    <label>Enable periodic reports of proxy activity?</label>
                    <div>
                        <label for="rdEnableReportsYes">Yes</label>
                        <input type="radio" value="Y" id="rdEnableReportsYes" name="rdEnableReports">
                        <label for="rdEnableReportsNo">No</label>
                        <input type="radio" value="N" id="rdEnableReportsNo" name="rdEnableReports" checked="checked">
                    </div>
                </li>
                <li>
                    <label>How often should the reports be sent out?</label>
                    <div>
                        <label for="chkReportDaily">Daily</label>
                        <input type="checkbox" id="chkReportDaily" name="chkReportDaily">
                        <label for="chkReportWeekly">Weekly</label>
                        <input type="checkbox" id="chkReportWeekly" name="chkReportWeekly">
                    </div>
                </li>
                <li>
                    <label>If Page Logging is Enabled, Include in report?</label>
                    <div>
                        <label for="rdReportLogPagesYes">Yes</label>
                        <input type="radio" value="Y" id="rdReportLogPagesYes" name="rdReportLogPages" checked="checked">
                        <label for="rdReportLogPagesNo">No</label>
                        <input type="radio" value="N" id="rdReportLogPagesNo" name="rdReportLogPages">
                    </div>
                </li>
                <li>
                    <label>Who should this report be sent to? (use ";" to seperate emails)</label>
                    <div>
                        <input type="text" id="tbReportEmail" name="tbReportEmail" size="40">
                    </div>
                </li>
                <li>
                    <label>E-Mail Subject:</label>
                    <div>
                        <input type="text" id="tbReportSubject" name="tbReportSubject" size="40">
                    </div>
                </li>
                <li>
                    <label>Extra Message in E-mail Body:</label>
                </li>
                <li>
                    <textarea id="tbReportBody" name="tbReportBody" rows="5" cols="60"></textarea>
                </li>
                <li>
                    <input type="button" id="bcPLTestReport" value="Test Report" disabled="disabled">
                </li>
            </ul>
        </div>
        <input type="button" id="bcPLSave" value="Save">
        <span id="spanSaveMessage">Save Successful!</span>
    </div>

    <div id="bcPLPermissionsView">
        <label for="bcPLRoles"><%= Globalizer.GetGlobalizedString("TXT_ROLE")%>:</label>
        <select id="bcPLRoles">
            <option value=""><%= Globalizer.GetGlobalizedString("TXT_LOADING")%>...</option>
        </select>
        <table id="tblBCPLPermissions">
            <thead>
                <tr>
                    <th><%= Globalizer.GetGlobalizedString("TXT_ROLE")%></th>
                    <th><%= Globalizer.GetGlobalizedString("CUS_BC_PL_ALLOW")%></th>
                    <th><%= Globalizer.GetGlobalizedString("CUS_BC_PL_DENY")%></th>
                    <th><%= Globalizer.GetGlobalizedString("CUS_BC_PL_IGNORE")%></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <input type="button" id="bcPLSavePermissions" value="<%= Globalizer.GetGlobalizedString("TXT_SAVE") %>" />
        <span id="spanSavePermissions">Save Successful!</span>
    </div>
    <div id="bcPLLogsView" style="display: none">
        <br />
        <span class="logsNote"><%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOGS_MESSAGE")%></span><br />
        <table id="logList">
            <thead>
                <tr>
                    <th><%= Globalizer.GetGlobalizedString("TXT_ID")%></th>
                    <th>
                        <%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOG_SOURCE_USER")%>
                    </th>
                    <th>
                        <%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOG_TARGET_USER")%>
                    </th>
                    <th>
                        <%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOG_ACTION")%>
                    </th>
                    <th>
                        <%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOG_DATE")%>
                    </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.VersionInfo.MainView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<h4><%= Globalizer.GetString("TXT_PORTAL_VERSION_INFO")%></h4>
<fieldset>
    <table>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_BASE_JICS_PORTAL")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litPortal" />
            </td>
            <td rowspan="11" class="text"class="text">
                <div style="margin-left: 50px;" class="hint versionInfoHint">
                    <p><b>Time for an upgrade?</b></p>
                    <p>You can check <a href="http://www.myjenzabar.net/ics">MyJenzabar.net</a> for the most recent versions of these components and their installers.</p>
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Literal runat="server" id="litLmsName" />
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litLms" />
            </td>
        </tr>
        <tr>
            <th>
                <asp:Literal runat="server" id="litMobileName" />
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litMobile" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_ADM_OFFICER")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litAdmOfficer" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_ADV_OFFICER")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litAdvOfficer" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_CANDIDATE")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litCandidate" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_CONSTITUENT")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litConstituent" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_FACULTY")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litFaculty" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_RMS")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litRms" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_STAFF")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litStaff" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_CRM_STUDENT")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litStudent" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_ONLINE_MEETINGS")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litOnlineMeetings" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_JENZABAR_APPOINTMENTS")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litJenzabarAppointments" />
            </td>
        </tr>
        <tr>
            <th>
                <%= Globalizer.GetLabel("TXT_JENZABAR_DATA_PROVIDER_XITRACS")%>
            </th>
            <td class="text">
                <asp:Literal runat="server" id="litXitracs" />
            </td>
        </tr>
    </table>
</fieldset>
<asp:Panel ID="CustomizationPanel" runat="server" Visible="false" >
<h4><%= Globalizer.GetString("TXT_CUSTOMIZATIONS_AND_HOTFIXES")%></h4>
<div class="pSection">
    <table class="groupedGrid">
        <thead>
            <tr>
                <th><%= Globalizer.GetString("TXT_NAME") %></th>
                <th><%= Globalizer.GetString("TXT_VERSION") %></th>
                <th><%= Globalizer.GetString("TXT_NOTE") %></th>
            </tr>
        </thead>
        <tbody>
            <asp:Literal ID="CustomizationRowsLiteral" runat="server" />
        </tbody>
    </table>
</div>
</asp:Panel>
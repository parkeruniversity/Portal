<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBarLoggerControl.ascx.cs"
    Inherits="BCProxyLogin.SideBarLoggerControl" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<asp:Panel ID="pnlProxyLogin" runat="server" Visible="false">
    <div class="sideSection proxySideBar">
        <h2><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_HEADER")%></h2>
        <div>
            <div id="bcPLSidebarError" class="feedbackError" style="display: none;"></div>
            <label for="bcPLSidebarUsername"><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_USERNAME_LABEL_TEXT")%></label>
            <input type="text" id="bcPLSidebarUsername" name="bcPLSidebarUsername" />
            <br />
            <asp:Panel ID="pnlPassword" runat="server" Visible="false">
                <label for="bcPLSidebarPassword"><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_PASSWORD_LABEL_TEXT")%></label>
                <input type="password" id="bcPLSidebarPassword" name="bcPLSidebarPassword" />
                <br />
            </asp:Panel>
            <label for="bcPLSidebarReason"><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_REASON_LABEL_TEXT")%></label>
            <input type="text" id="bcPLSidebarReason" name="bcPLSidebarReason" />
            <br />
            <input type="button" id="bcPLSidebarLoginBtn" value="<%= Globalizer.GetGlobalizedString("CUS_BC_PL_LOGIN")%>" />
        </div>
        <div runat="server" ID="divResume" Visible="False">
            <h2>
                <%= Globalizer.GetGlobalizedString("CUS_BC_PL_RESUME_HEADER") %>
            </h2>
            <label id="lblResumeText"><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_USERNAME_LABEL_TEXT")%><%= HttpContext.Current.Session["ProxyLoginLastUser"] %></label>
            <br />
            <input type="button" id="bcPLSidebarResume" value="<%= Globalizer.GetGlobalizedString("CUS_BC_PL_RESUME") %>"/>
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnlProxyRelogger" runat="server" Visible="false">
    <div class="sideSection proxySideBar">
        <h2><%= Globalizer.GetGlobalizedString("CUS_BC_PL_SIDEBAR_HEADER")%></h2>
        <div>
            <ul id="ProxyLoginLinks">
                <li>
                    <asp:GlobalizedLinkButton runat="server" ID="lnbRelog" TextKey="CUS_BC_PL_RELOGIN"></asp:GlobalizedLinkButton></li>
                <li>
                    <asp:GlobalizedLinkButton runat="server" ID="lnbLogback" TextKey="CUS_BC_PL_LOGBACK"></asp:GlobalizedLinkButton></li>
                <li runat="server" id="plLsr">
                    <input type="button" value="<%= Globalizer.GetGlobalizedString("CUS_BC_PL_SHOW_LSR_VALUES")%>" id="bcPLShowLSRValues" name="bcPLShowLSRValues" />
                </li>
            </ul>
        </div>
    </div>
</asp:Panel>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Head.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.Head" EnableViewState="false" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web" %>
<script type="text/javascript">
    window.jenzabar = {};
    window.userSettings = {
        culture:    '<%= JavaScriptGlobalizer.GetCulture() %>',
        language:   '<%= JavaScriptGlobalizer.GetLanguage() %>',
        dateFormat: '<%= JavaScriptGlobalizer.GetDateFormat() %>'
    };
    jenzabar.userSettings = window.userSettings;
</script>
<asp:Literal ID="litHtmlHeadElements" runat="server" />
<asp:PlaceHolder ID="phCss" runat="server"><%: Styles.Render("~/UI/Common/Styles/site-bundle.css") %></asp:PlaceHolder>
<asp:Literal ID="litPortletCss" runat="server" />
<asp:PlaceHolder ID="phPrint" runat="server">
<link rel="stylesheet" type="text/css" media="print" href="<%= ResolveUrl("~/UI/Common/Styles/print.css")%>" />
</asp:PlaceHolder>
<% if (LoadJcsfl()) { %>
<script type="text/javascript" src="<%= ResolveUrl("~/UI/Common/Scripts/jcsfl.js")%>"></script>
<% } %>
<%: Scripts.Render("~/UI/Common/Scripts/site-bundle.js") %>
<asp:Literal ID="litAfterFrameworkHtmlHeadElements" runat="server" />
<asp:Literal ID="litClientGlobalization" runat="server" />
<!--[if IE]>
<style type="text/css" media="all">@import url( UI/Common/Styles/IEOnly.css );</style>
<script type="text/javascript" language="JavaScript" src="UI/Common/Scripts/IEOnly.js"></SCRIPT>
<![endif]-->
<% if (LoadJcsfl()) { %>
<script type="text/javascript">
    window.Portal =
    {
        url: '<%= UrlUtility.GetFullAppUrl %>/',
        uid: <%= ((Jenzabar.Portal.Framework.PortalUser.Current.IsGuest) ? "null" : ("\"" + Jenzabar.Portal.Framework.PortalUser.Current.ID.AsGuid) + "\"") %>,
        timeout: <%= this.Session.Timeout %>,
        SessionMonitor: JCSL.JICS.get_session_monitor()
        <%
        if (this.IsDebug)
        {
            Response.Write(",debug_mode:\t\ttrue");
        }
    %>
    };
</script>
<% } %>
<% if (!Jenzabar.Portal.Framework.PortalUser.Current.IsGuest) { %>
<script type="text/javascript">
    jQuery(function () {
        jenzabar.framework.timeoutWarning.create();
    });
</script>
<% } %>
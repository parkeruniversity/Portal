<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestAnalysisView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.TestAnalysisView" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<div class="cwkBorderButtonBar top" id="divTopBorder" runat="server">
    <div class="cwkBorderButtonBar mainScreenLink">
      <framework:PortalImageAndHyperLink ID="lnkBack" TextKey="MSG_CWK_CONTINUE_BACK_TO_ASSIGNMENT" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
    </div>
</div>
<div id="divAnalysisLoading"></div>
<div id="divAnalysis" style="margin:20px;"></div>
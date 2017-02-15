<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DirectLink.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePortlet.DirectLink" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
    <div><%=Globalizer.GetGlobalizedString("LBL_URL")%></div>
    <div><a target="_blank" runat="server" ID="aUrl" /></div>
    <div style="padding-bottom:10px;"><cmn:Hint ID="Hint1" runat="server" TextKey="MSG_PORTLET_DIRECT_LINK_URL" /></div>
    <div><%=Globalizer.GetGlobalizedString("LBL_IFRAME_HTML")%></div>
    <div><asp:TextBox Width="100%" Wrap="true" TextMode=MultiLine runat="server" ID="txtIframeHtml" /></div>
    <div><cmn:Hint ID="Hint2" runat="server" TextKey="MSG_PORTLET_DIRECT_LINK_IFRAME_HTML" /></div>
</div>
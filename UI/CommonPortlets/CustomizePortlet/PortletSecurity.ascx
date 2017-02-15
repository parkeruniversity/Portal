<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PortletSecurity.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePortlet.PortletSecurity" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<cmn:Subheader id="hdr" runat="server" TextKey="TXT_DEFINE_PERMISSIONS" />
<div class="pSection">
<p id="lblNoOperations" runat="server"><cmn:GlobalizedLiteral TextKey="TXT_NO_OPERATIONS_FOR_PORTLET" runat="server" /></p>
<jenz:SecurityGrid id="SecGrid" runat="server" />
</div>
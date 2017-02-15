<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GlobalSettingsView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.GlobalSettingsView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server" /></div>
<cmn:Subheader id="subHeader" textKey="TXT_PORTLETS" runat="server" />

<div class="pSection">
	<cmn:Hint id="hntInstructions" runat="server" TextKey="TXT_GLOBAL_OPERATIONS_CHOOSE_PORTLET" />
	<p><cmn:GlobalizedLinkButton ID="btnGradebook" TextKey="TXT_GRADEBOOK" Runat="server" /></p>
	<p><cmn:GlobalizedLinkButton ID="btnCourseEval" TextKey="HDR_AMS_COURSEVAL_CONNECTOR" Runat="server" /></p>
</div>

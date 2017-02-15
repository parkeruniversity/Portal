<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustSettings.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
    
<p class="hint"><asp:Label id="lblSettingsHint" visible="True" runat="server">Change portlet settings.</asp:Label></p>
<P><asp:Label id="lblSettingsMessage" visible="False" enableviewstate="False" runat="server" cssclass="ApplicationError"></asp:Label></P>
<P><asp:PlaceHolder id="plhPortletSettings" runat="server"></asp:PlaceHolder></P>
<div class="pActionsTransp">
<asp:Button ID="btnSaveSettings"  Runat="server"></asp:Button>
</div>
</div>
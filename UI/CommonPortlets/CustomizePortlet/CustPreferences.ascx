<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustPreferences.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustPreferences" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div class="pSection">
    
<p class="hint"><asp:Label id="lblPreferencesHint" visible="True" runat="server">Change portlet preferences.</asp:Label></p>
<P><asp:Label id="lblPreferencesMessage" visible="False" enableviewstate="False" runat="server" cssclass="ApplicationError"></asp:Label></P>
<P><asp:PlaceHolder id="plhPortletPreferences" runat="server"></asp:PlaceHolder></P>
<div class="pActionsTransp">
<asp:Button ID="btnSavePreferences" Runat="server"></asp:Button>
</div>
</div>
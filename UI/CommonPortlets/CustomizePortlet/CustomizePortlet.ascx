<%@ Register TagPrefix="cust" tagname="Security" src="~/UI/CommonPortlets/CustomizePortlet/PortletSecurity.ascx" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustomizePortlet.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizePortletView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<cmn:ErrorDisplay id="ctlError" runat=server />

<cmn:TabGroup id="tabs" runat="server">


<cmn:Tab id="tabPreferences" runat="server" text="Preferences">
<div class="pSection">
<p class="hint"><asp:Label id="lblPreferencesHint" visible="True" runat="server">Change portlet preferences.</asp:Label></p>
<P><asp:Label id="lblPreferencesMessage" visible="False" enableviewstate="False" runat="server" cssclass="ApplicationError"></asp:Label></P>
<P><asp:PlaceHolder id="plhPortletPreferences" runat="server"></asp:PlaceHolder></P>
<div class="pActionsTransp">
<asp:Button ID="btnSavePreferences" Runat="server"></asp:Button>
</div>
</div>
</cmn:Tab>



<cmn:Tab id="tabSettings" runat="server" text="Settings">
<div class="pSection">
<p class="hint"><asp:Label id="lblSettingsHint" visible="True" runat="server">Change portlet settings.</asp:Label></p>
<P><asp:Label id="lblSettingsMessage" visible="False" enableviewstate="False" runat="server" cssclass="ApplicationError"></asp:Label></P>
<P><asp:PlaceHolder id="plhPortletSettings" runat="server"></asp:PlaceHolder></P>
<div class="pActionsTransp">
<asp:Button ID="btnSaveSettings" Runat="server"></asp:Button>
</div>
</div>
</cmn:Tab>



<cmn:Tab id="tabSecurity" runat="server" text="Security">
	<cust:Security id="ctlSecurity" runat="server" />
</cmn:Tab>


</cmn:TabGroup>



<div class="pActions">
<asp:Button id="btnCancel" runat="server" CausesValidation="False" text="Cancel" />
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardPortlet.Setup" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div id="divError" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>

<h4><cmn:globalizedliteral id="glitPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS"></cmn:globalizedliteral></h4>

<div class="pSection">
	<jenzabar:hint id="lblPortalSettingsHint" Visible="True" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>
	<table cellPadding="3" width="100%">
		<tr>
			<td valign="top">
				<asp:CheckBox ID="RequireApproval" Runat="server" />
			</td>
			<td valign="top">
				<cmn:FormLabel id="RequireApprovalLabel" TextKey="TXT_REQUIRE_TIMECARD_APPROVAL" ForControl="RequireApproval" Runat="server" /> - 
				<cmn:FormLabel ID="RequireApprovalNote" TextKey="MSG_TIMECARDPORTLET_REQUIRETIMECARDAPPROVAL" ForControl="RequireApproval" Runat="server" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<cmn:GlobalizedButton ID="btnSave" Runat="server" TextKey="TXT_SAVE"></cmn:GlobalizedButton>
	&nbsp;&nbsp;
	<cmn:GlobalizedButton ID="btnCancel" Runat="server" TextKey="TXT_CANCEL"></cmn:GlobalizedButton>
</div>

<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SetOptions.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacilitiesSchedulePortlet.SetOptions" %>
<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
<H4><jenzabar:GlobalizedLiteral id="litHeader" runat="server" TextKey="TXT_PORTAL_USER_OPTIONS"></jenzabar:GlobalizedLiteral></H4>
<div class="pSection">
<jenzabar:hint id="hntDefaultCampus" TextKey="TXT_PORTAL_USER_OPTIONS_HINT" runat="server"></jenzabar:hint>

<table cellSpacing="1" cellPadding="3" width="100%">
	<tr>
		<th noWrap align="right" width="10%">
			<jenzabar:GlobalizedLabel id="lblDefaultCampus" TextKey="TXT_FS_DEFAULT_CAMPUS" Runat="server"></jenzabar:GlobalizedLabel>:</th>
		<td align="left" width="90%"><asp:dropdownlist id="ddlCampus" DataTextField="Description" DataValueField="ERPCampusKey" Runat="server"></asp:dropdownlist></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colSpan="2"><jenzabar:GlobalizedButton TextKey="TXT_SAVE" id="btnSave" Runat="server"></jenzabar:GlobalizedButton>
			<jenzabar:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" Runat="server"></jenzabar:GlobalizedButton></td>
	</tr>
</table>
</div>

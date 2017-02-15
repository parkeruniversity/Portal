<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet.Setup" %>
<cmn:subheader ID="subPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS" />
<div class="pSection" id="divHint" runat="server"><cmn:Hint id="hntPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT" /></div>
<div class="psection" id="divJenzabarControls" runat="server" visible="true">
	<jenzabar:errordisplay id="error" Runat="server" visible="false"></jenzabar:errordisplay>
	<asp:Label id="lblMessage" Runat="server" Visible="False"></asp:Label>
</div>
<div class="pSection" id="divDataGrid" runat="server">
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<td colSpan="2"></td>
		</tr>
	</TABLE>
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<th colspan="3">
				<asp:label id="lblDisplayNotes" Runat="server"></asp:label></th>
		</tr>
		<tr>
			<td width="2%">&nbsp;</td>
			<td width="1%" valign="top"><asp:checkbox id="chkDisplayNotes" Runat="server"></asp:checkbox></td>
			<td width="97%" valign="top"><asp:Label id="lblDisplayNotesDesc" Runat="server"></asp:Label></td>
		</tr>
	</TABLE>
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<th colspan="3">
			</th>
		</tr>
		<tr>
			<td width="2%">&nbsp;</td>
			<td width="10%" valign="top">
				<asp:TextBox ID="txtCustomReportLinkText" Columns="40" Runat="server" Visible="False"></asp:TextBox>
			</td>
			<td width="88%" valign="top">
			</td>
		</tr>
		<tr>
			<td colSpan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colSpan="2">
				<asp:Button ID="btnSave" Runat="server" Visible="False"></asp:Button>&nbsp;
				<asp:Button ID="btnCancel" Runat="server" Visible="False"></asp:Button>
			</td>
		</tr>
	</TABLE>
</div>

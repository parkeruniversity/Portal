<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.UnofficialTranscriptPortlet.Setup" %>
<cmn:subheader ID="subPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS" />
<div class="pSection" id="divHint" runat="server"><cmn:Hint id="hntPortalSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT" /></div>
<div class="pSection" id="divDataGrid" runat="server">
	<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
	<asp:Label id="lblMessage" Runat="server"></asp:Label>
	
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<th colSpan="3">
				<asp:label id="lblDisplayNotes" Runat="server"></asp:label></th></tr>
		<tr>
			<td width="2%">&nbsp;</td>
			<td width="1%" valign="top"><asp:checkbox id="chkDisplayNotes" Runat="server"></asp:checkbox></td>
			<td width="97%"><asp:Label id="lblDisplayNotesDesc" Runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="3">&nbsp;</td>
		</tr>
		<tr>
			<th colSpan="3">
				<asp:label id="lblDisplaySummary" Runat="server"></asp:label></th></tr>
		<tr>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="chkDisplaySummary" Runat="server"></asp:CheckBox></td>
			<td><asp:Label id="lblDisplaySummaryDesc" Runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="3">&nbsp;</td>
		</tr>
		<tr>
			<th colspan="3">
				<asp:Label ID="lblDisplayTermTotal" Runat="server"></asp:Label></th>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="chkDisplayTermTotal" Runat="server"></asp:CheckBox></td>
			<td><asp:Label id="lblDisplayTermTotalDesc" Runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="3">&nbsp;</td>
		</tr>
		<tr>
			<th colspan="3">
				<asp:Label ID="lblDisplayCareerTotal" Runat="server"></asp:Label></th>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td valign="top"><asp:CheckBox ID="chkDisplayCareerTotal" Runat="server"></asp:CheckBox></td>
			<td><asp:Label id="lblDisplayCareerTotalDesc" Runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="2">&nbsp;</td>
		</tr>
	</TABLE>
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<th colspan="3">
				<asp:Label ID="lblReportsToView" Runat="server"></asp:Label></th>
		</tr>
		<tr>
			<td width="2%">&nbsp;</td>
			<td width="8%" valign="top">
				<asp:DropDownList ID="ddlCustomReportLinkText" Runat="server"></asp:DropDownList>
			</td>
			<td width="90%" valign="top">
				<asp:Label ID="lblReportsToViewDesc" Runat="server"></asp:Label>
			</td>
		</tr>
		<tr>
			<td colSpan="2">&nbsp;</td>
		</tr>
	</TABLE>
	<TABLE cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr>
			<th colspan="3">
				<asp:Label ID="lblCustomReportLinkText" Runat="server"></asp:Label></th>
		</tr>
		<tr>
			<td width="2%">&nbsp;</td>
			<td width="10%" valign="top">
				<asp:TextBox ID="txtCustomReportLinkText" Runat="server" MaxLength="100"></asp:TextBox>
			</td>
			<td width="88%" valign="top">
				<asp:Label ID="lblCustomReportLinkTextDesc" Runat="server"></asp:Label>
			</td>
		</tr>
		<tr>
			<td colSpan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colSpan="2">
				<asp:Button ID="btnSave" Runat="server" Visible="False" onclick="btnSave_Click"></asp:Button>&nbsp;
				<asp:Button ID="btnCancel" Runat="server" Visible="False" onclick="btnCancel_Click"></asp:Button>
			</td>
		</tr>
	</TABLE>
</div>

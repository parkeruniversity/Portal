<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SetOptions.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.SetOptions" %>
<h4><asp:Label id="lblHeading" runat="server" Visible="True"></asp:Label></h4>
<DIV class="pSection">
	<jenzabar:hint id="lblPortalUserHint" Visible="True" runat="server" TextKey="TXT_PORTAL_USER_OPTIONS_HINT"></jenzabar:hint>
	<h6><asp:Label id="lblSubheading" runat="server" Visible="True"></asp:Label></h6>
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div class="pSection" id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td align="right" width="10%"><asp:checkbox id="cbxPhoneticMatch" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblPhoneticMatch" runat="server"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td align="right" width="10%"><asp:checkbox id="cbxPrimaryName" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblPrimaryName" runat="server"></asp:label></td>
						<td width="50%"><jenzabar:hint id="lblInstruction" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
					<tr>
						<td align="right" width="10%"><asp:checkbox id="cbxAlternateNameType" runat="server" Checked="True"></asp:checkbox></td>
						<td width="40%"><asp:label id="lblAlternateNameType" runat="server"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</TABLE>
</DIV>

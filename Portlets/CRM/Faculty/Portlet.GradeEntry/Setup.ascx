<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.Setup" %>
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<h4><jenzabar:globalizedliteral id="gePageSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS"></jenzabar:globalizedliteral></h4>
<div id="divDetail" class="pSection" visible="True" runat="server">
	<jenzabar:hint id="hintTitle" runat="server"></jenzabar:hint>
	<table runat="server" cellpadding="3" cellspacing="3">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:label id="lblMidterms" runat="server" Font-Bold="True"></asp:label></td>
		</tr>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxMidterms" runat="server"></asp:checkbox></td>
						<td>
							<asp:label id="lblMidtermsDesc" runat="server"></asp:label>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblAllowAbsenceEntry" runat="server" Font-Bold="True"></asp:label></TD>
		</TR>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxAllowAbsenceEntry" runat="server"></asp:checkbox></td>
						<td><asp:label id="lblAllowAbsenceEntryDesc" runat="server"></asp:label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblAllowClockHoursEntry" runat="server" Font-Bold="True"></asp:label></TD>
		</TR>
		<TR>
			<td>
				<table cellSpacing="3" cellPadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxAllowClockHoursEntry" runat="server"></asp:checkbox></td>
						<td><asp:label id="lblAllowClockHoursEntryDesc" runat="server"></asp:label></td>
					</tr>
				</table>
			</td>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblAllowLDoAEntry" runat="server" Font-Bold="True"></asp:label></TD>
		</TR>
		<TR>
			<td>
				<table cellSpacing="3" cellPadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxAllowLDoAEntry" AutoPostback="true" runat="server" /></td>
						<td><asp:label id="lblAllowLDoAEntryDesc" runat="server"></asp:label></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:RadioButton ID="rbLDoAOptional" runat="server" GroupName="LDoAOption" /></td>
						<td><asp:Label ID="lblLDoAOptionalDesc" runat="server" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:RadioButton ID="rbLDoARequired" runat="server" GroupName="LDoAOption" /></td>
						<td><asp:Label ID="lblLDoARequiredDesc" runat="server" /></td>
					</tr>
				</table>
		</td> </TR>
		<tr>
		</tr>
		<tr>
			<td>&nbsp;
				<TABLE id="Table2" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td><asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button></td>
					</tr>
				</TABLE>
			</td>
		</tr>
	</table>
</div>

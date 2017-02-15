<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.Setup" %>
<Div class="psection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div class="pSection" id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div class="pSection" id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
			</TD>
		</TR>
		<tr>
			<td><jenzabar:hint id="lblHeading" Visible="True" runat="server"></jenzabar:hint></td>
		</tr>
		<tr>
			<td><jenzabar:hint id="lblSubheading" Visible="True" runat="server"></jenzabar:hint></td>
		</tr>
		<tr>
			<td><table cellspacing="0" cellpadding="25" border="0">
					<tr>
						<td vAlign="top"><jenzabar:hint id="lblInstruction" Visible="True" runat="server"></jenzabar:hint>
						</td>
					</tr>
				</table>
			</td>
		<tr>
			<TD>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblStudentTermLife" runat="server"></asp:label></td>
						<td><asp:dropdownlist id="ddlStudentTermLife" runat="server"></asp:dropdownlist></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnSave" runat="server" Width="75px" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False" onclick="btnCancel_Click"></asp:button></td>
						<td></td>
					</tr>
				</table>
			</TD>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>
			</TD>
		</TR>
	</TABLE>
</Div>

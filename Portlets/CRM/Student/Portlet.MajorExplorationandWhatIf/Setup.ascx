<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.MajorExplorationandWhatIfPortlet.Setup" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
<h4><asp:label id="lblTitle" runat="server"></asp:label></h4>
<Div class="pSection">
	<jenzabar:hint id="lblHeading" Visible="True" runat="server"></jenzabar:hint>
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;&nbsp;<asp:label id="lblAllowWhatIf" runat="server" Font-Bold="True"></asp:label></td>
		</tr>
		<tr>
			<td>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxAllowWhatIf" runat="server"></asp:checkbox></td>
						<td><asp:label id="lblAllowWhatIfDesc" runat="server"></asp:label></td>
					</tr>
					<TR>
						<TD>&nbsp;
						</TD>
						<TD></TD>
					</TR>
				</table>
				<table cellspacing="3" cellpadding="3" border="0">
					<TR>
						<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button>
						</TD>
					</TR>
				</table>
			</td>
		</tr>
	</TABLE>
</Div>

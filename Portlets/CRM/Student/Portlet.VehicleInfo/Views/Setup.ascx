<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.VehicleInfoPortlet.Setup" %>
<Div class="psection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div class="pSection" id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div class="pSection" id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
			</TD>
		</TR>
		<tr>
			<td>
				<asp:Label id="lblDisplayYN" runat="server"></asp:Label></td>
			<td>
				<asp:RadioButton id="rbYes" runat="server" GroupName="displayyn"></asp:RadioButton>
				<asp:RadioButton id="rbNo" runat="server" Checked="True" GroupName="displayyn"></asp:RadioButton></td>
		</tr>
		<tr>
			<td>
				<asp:Label id="lblInstruction" runat="server"></asp:Label>
			</td>
			<td>
				<asp:TextBox id="txtInstruction" runat="server" Width="463px" Height="216px" TextMode="MultiLine"
					MaxLength="999999999"></asp:TextBox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>
				<asp:button id="btnSave" runat="server" Width="75px" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False" onclick="btnCancel_Click"></asp:button>
			</TD>
		</TR>
	</TABLE>
</Div>

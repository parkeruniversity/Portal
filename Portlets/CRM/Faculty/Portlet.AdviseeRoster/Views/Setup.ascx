<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.Setup" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<h4><jenzabar:globalizedliteral id="caPageSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS"></jenzabar:globalizedliteral></h4>
<div id="divDetail" class="pSection" visible="True" runat="server">
	<jenzabar:hint id="lblInstruction" runat="server" Visible="True"></jenzabar:hint>
    <h5><jenzabar:GlobalizedLiteral ID="glitAdvStatus" runat="server" TextKey="TXT_ADVISEE_STATUS_SETTINGS"></jenzabar:GlobalizedLiteral></h5>
	<table runat="server" cellpadding="3" cellspacing="3" ID="Table1">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxActiveAdvisees" runat="server" ></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblActiveAdvisees" runat="server" ></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxCurrentlyRegistered" runat="server" ></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblCurrentlyRegistered" runat="server" ></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxInactiveAdvisees" runat="server" ></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblInactiveAdvisees" runat="server" ></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxNeedAdvisorApproval" runat="server" ></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblNeedAdvisorApproval" runat="server"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxNeedRegClearance" runat="server"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblNeedRegClearance" runat="server"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxNewStudents" runat="server" ></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblNewStudents" runat="server"></asp:label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<asp:checkbox id="cbxNotYetRegistered" runat="server"></asp:checkbox>
			</td>
			<td>
				<asp:label id="lblNotYetRegistered" runat="server"></asp:label>
			</td>
		</tr>
	</table>
	<P>&nbsp;
		<TABLE id="Table2" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
			<TR>
				<TD><asp:button id="btnSave" runat="server" Width="75px" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False" onclick="btnCancel_Click"></asp:button>
				</TD>
			</TR>
		</TABLE>
	</P>
</div>

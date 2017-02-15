<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.GradeReportPortlet.Setup" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:Label ID="lblMessage" Runat="server"></asp:Label></div>
<h4><asp:label id="lblHeading" runat="server"></asp:label></h4>
<Div class="pSection">
	<jenzabar:hint id="lblSubHeading" Visible="True" runat="server"></jenzabar:hint>
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<tr>
			<td><asp:label id="lblMidterms" runat="server" Font-Bold="True"></asp:label></td>
		</tr>
		<tr>
			<td>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="cbxMidterms" runat="server"></asp:checkbox></td>
						<td><asp:label id="lblMidtermsDesc" runat="server"></asp:label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD><asp:label id="lblReportsToView" runat="server" Font-Bold="True"></asp:label></TD>
		</TR>
		<tr>
			<TD>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:dropdownlist id="ddlReportsToView" runat="server" Width="160px" AutoPostBack="True"></asp:dropdownlist></td>
						<td><asp:label id="lblRptToViewDesc" runat="server"></asp:label></td>
					</tr>
				</table>
			</TD>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD><asp:label id="lblCustomRptLink" runat="server" Font-Bold="True"></asp:label></TD>
		</TR>
		<tr>
			<td>
				<table cellspacing="3" cellpadding="3" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:textbox id="txtCustomRptLink" runat="server" Width="250px" MaxLength="50"></asp:textbox></td>
						<td><asp:label id="lblCustomDesc" runat="server"></asp:label></td>
					</tr>
				</table>
			</td>
		</tr>
		<TR>
			<TD>
				<asp:button id="btnSave" runat="server" Width="75px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False"></asp:button>
			</TD>
		</TR>
	</TABLE>
</Div>

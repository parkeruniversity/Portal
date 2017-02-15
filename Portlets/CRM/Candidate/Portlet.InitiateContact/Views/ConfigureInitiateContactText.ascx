<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ConfigureInitiateContactText.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.InitiateContactPortlet.ConfigureInitiateContactText" %>
<asp:label id="lblError" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<asp:label id="lblMessage" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td><asp:label id="lblConfigureDescText" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<th vAlign="top" align="right">
			<asp:label id="lblRequestaContact" Runat="server"></asp:label></th>
		<td noWrap align="left"><asp:textbox id="txtRequestaContactText" Runat="server" Height="100" Rows="10" Columns="60" Wrap="True"
				MaxLength="3000" Width="434px" TextMode="MultiLine"></asp:textbox></td>
	</tr>
	<tr>
		<th vAlign="top" align="right">
			<asp:label id="lblScheduleaVisit" Runat="server"></asp:label></th>
		<td noWrap align="left"><asp:textbox id="txtScheduleaVisit" Runat="server" Height="100" Rows="10" Columns="60" Wrap="True"
				Width="434px" MaxLength="3000" TextMode="MultiLine"></asp:textbox></td>
	</tr>
</table>
<table align="center">
	<tr>
		<td noWrap height="40"><asp:button id="btnSave" Runat="server" Width="88px" onclick="btnSave_Click"></asp:button></td>
		<td noWrap height="40"><asp:button id="btnCancel" Runat="server" Width="88px" onclick="btnCancel_Click"></asp:button></td>
	</tr>
</table>

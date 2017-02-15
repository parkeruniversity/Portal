<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="RequestaContact.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.InitiateContactPortlet.RequestaContact" %>
<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailAddressText"
	ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br>
<asp:label id="lblError" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td><asp:label id="lblRequestContactDescriptiveText" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<th align="right" width="10%">
			<asp:label id="lblSubject" Runat="server"></asp:label></th>
		<td noWrap align="left" width="446"><asp:label id="lblSubjectText" Runat="server"></asp:label></td>
		<td noWrap width="202">&nbsp;</td>
		<td width="40%">&nbsp;</td>
	</tr>
	<tr>
		<th vAlign="top" nowrap align="right" width="30%">
			<asp:label id="lblEmailAddress" Runat="server"></asp:label></th>
		<td noWrap align="left" width="446"><asp:textbox id="txtEmailAddressText" Runat="server" Width="55%" MaxLength="255"></asp:textbox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator2" ErrorMessage="*Required" runat="server" ControlToValidate="txtEmailAddressText"></asp:RequiredFieldValidator>
		</td>
		<td width="202">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr valign="top">
		<th align="right">
			<asp:label id="lblType" Runat="server"></asp:label>
		</th>
		<td noWrap align="left" width="446"><asp:dropdownlist id="ddlTypeText" Runat="server">
				<asp:ListItem Value="Phone" Selected="True">Phone</asp:ListItem>
				<asp:ListItem Value="Email">Email</asp:ListItem>
			</asp:dropdownlist>
			<i>
				<asp:label id="lblTypeInfo" Runat="server" Width="376px"></asp:label>
			</i>
		</td>
	</tr>
	<TR>
		<th vAlign="top" align="right">
			<asp:label id="lblMessage" Runat="server"></asp:label></th>
		<td noWrap align="left" valign="top" width="446"><asp:textbox id="txtMessageText" Runat="server" Height="100" Rows="10" Width="87%" TextMode="MultiLine"></asp:textbox></td>
		<td align="left" valign="top" width="202">
			<jenzabar:hint id="hintMessageInfo" Runat="server"></jenzabar:hint>
		</td>
	</TR>
	<tr>
		<td>
			&nbsp;</td>
		<td colspan="2" noWrap align="left"><asp:label id="lblSubmitMessage" Runat="server"></asp:label></td>
	</tr>
</table>
<table align="center">
	<tr>
		<td noWrap height="40"><asp:button id="btnSubmit" Runat="server"></asp:button></td>
		<td noWrap height="40"><asp:button id="btnCancel" Runat="server" CausesValidation="False"></asp:button></td>
	</tr>
</table>

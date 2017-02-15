<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DetailConstituent.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.DetailConstituent" %>
<jenzabar:errordisplay id="error" Runat="server" />
<jenzabar:subheader id="lblIndivProfile" Runat="server" />
<table width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<asp:image id="Photo" Width="100" Height="100" ImageAlign="Top" Runat="server"></asp:image>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<th width="15%" align="left">
			<asp:Label ID="lblName" Runat="server"></asp:Label>
		</th>
		<td width="35%" nowrap align="left"><asp:Label ID="lblNameText" Runat="server"></asp:Label></td>
		<td width="15%" nowrap>&nbsp;</td>
		<td width="35%">&nbsp;</td>
	</tr>
	<tr>
		<th align="left" valign="top">
			<asp:Label ID="lblAddress" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblAddressText" Runat="server"></asp:Label></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th align="left">
			<asp:Label ID="lblMajor" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblMajorText" Runat="server"></asp:Label></td>
		<th align="left">
			<asp:Label ID="lblEmail" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblEmailText" Runat="server"></asp:Label></td>
	</tr>
	<tr>
		<th align="left">
			<asp:Label ID="lblClassYear" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblClassYearText" Runat="server"></asp:Label></td>
		<th align="left">
			<asp:Label ID="lblPhone" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblPhoneText" Runat="server"></asp:Label></td>
	</tr>
	<tr>
		<th align="left">
			<asp:Label ID="lblEmployer" Runat="server"></asp:Label>
		</th>
		<td nowrap align="left"><asp:Label ID="lblEmployerText" Runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td nowrap height="40" align="left"><asp:Button ID="btnBack" Runat="server" /></td>
	</tr>
	<tr>
		<td noWrap><asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label></td>
	</tr>
</table>

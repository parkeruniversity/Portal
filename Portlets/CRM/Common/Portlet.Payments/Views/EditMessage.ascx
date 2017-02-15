<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EditMessage.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.EditMessage" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table height="40" cellSpacing="3" cellPadding="3" width="704">
	<tr>
		<td colSpan="2"><asp:label id="lblMessage" runat="server" CssClass="PortletItemStatus"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="2"><asp:label id="lblEditMessage" runat="server" CssClass="PortletItemTitle"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblMessageDesc" runat="server"></asp:label></td>
		<td><asp:textbox id="txtMessageDesc" runat="server" tabIndex="10" MaxLength="255" Width="408px"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:label id="lblMessageText" runat="server"></asp:label></td>
		<td><asp:textbox id="txtMessageText" runat="server" Rows="6" TextMode="MultiLine" Width="408px" tabIndex="20"></asp:textbox></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><asp:button id="btnSave" runat="server" tabIndex="30" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" tabIndex="40" onclick="btnCancel_Click"></asp:button></td>
	</tr>
</table>
<script language="JavaScript">
function textCounter(field, maxlimit) {
	if (field.value.length > maxlimit)
		field.value = field.value.substring(0, maxlimit);
}
</script>

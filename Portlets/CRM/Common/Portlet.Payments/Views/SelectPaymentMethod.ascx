<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SelectPaymentMethod.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.SelectPaymentMethod" %>
<script language="javascript" type="text/javascript">function initIETOC(){}; function resizeTheDiv(){};</script>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table height="40" cellSpacing="3" cellPadding="3">
	<tr>
		<td><asp:label id="lblMessage" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><asp:radiobutton id="rbCC" runat="server" GroupName="PaymentMethod" Checked="True" Visible="False"></asp:radiobutton><asp:label id="lblSpacer" runat="server" Visible="False"></asp:label><asp:radiobutton id="rbECheck" runat="server" GroupName="PaymentMethod" Visible="False"></asp:radiobutton></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><asp:button id="btnContinue" runat="server" onclick="btnContinue_Click"></asp:button>&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>


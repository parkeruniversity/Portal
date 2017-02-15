<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartialPayment.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.PartialPayment" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<jenzabar:HighlightedHint id="hntMessage"  Runat="server"></jenzabar:HighlightedHint>
<table cellSpacing="3" cellPadding="3">
	<tr>
		<td><jenzabar:GlobalizedLabel id="lblTotalPaymentLabel" Runat="server" TextKey="LBL_TOTAL_PAYMENT" /></td>
        <td><asp:Label id="lblTotalPayment" runat="server" /></td>
	</tr>
	<tr>
		<td><jenzabar:GlobalizedLabel id="lblAvaliableFundsLabel" Runat="server" TextKey="LBL_AVALIABLE_FUNDS" /></td>
        <td><asp:Label id="lblAvaliableFunds" runat="server" /></td>
	</tr>
	<tr>
		<td><asp:PlaceHolder id="plcInfo" runat="server"></asp:PlaceHolder></td>
	</tr>
    <tr>
		<td><strong><jenzabar:GlobalizedLabel id="lblRemainingBalanceLabel" Runat="server" TextKey="LBL_REMAINING_BALANCE" /></strong></td>
        <td><strong><asp:Label id="lblRemainingBalance" runat="server" /></strong></td>
	</tr>
</table>
<table cellSpacing="3" cellPadding="3">
	<tr>
		<td><jenzabar:GlobalizedLabel id="lblInstructions" runat="server" TextKey="TXT_PAYMENT_PARTIAL_PAYMENT_INSTRUCTIONS"></jenzabar:GlobalizedLabel></td>
	</tr>
	<tr>
		<td><jenzabar:GlobalizedRadioButton ID="rbCancelPayment" checked="true" TextKey="TXT_PAYMENT_CANCEL_PAYMENT" runat="server" GroupName="PartialPayment" /></td>
	</tr>
	<tr>
		<td><jenzabar:GlobalizedRadioButton ID="rbAddCard" TextKey="TXT_PAYMENT_ADD_CARD" runat="server" GroupName="PartialPayment" /></td>
	</tr>
	<tr>
		<td><asp:button id="btnContinue" runat="server" Text="Continue" ></asp:button>&nbsp;&nbsp;&nbsp;
            <asp:Button id="btnCancel" runat="server" Text="Cancel" ></asp:Button></td>
	</tr>
</table>
<jenzabar:HighlightedHint ID="hntBottomWarning" Runat="server" /></jenzabar:HighlightedHint>


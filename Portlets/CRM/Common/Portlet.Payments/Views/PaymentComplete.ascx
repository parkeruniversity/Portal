<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PaymentComplete.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.PaymentComplete" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />

<table cellSpacing="3" cellPadding="3">
	<tr>
		<th><asp:label id="lblMessage" runat="server"></asp:label></th>
	</tr>
</table>
<table id="transactionSummary" runat="server" width="100%" cellSpacing="3" cellPadding="3">
	<tr>
		<td width="20%"><jenzabar:GlobalizedLabel id="lblTranDateText" TextKey="TXT_PAYMENTS_COMPLETE_TRANSACTION_DATE" runat="server" /></td>
		<td ><asp:label id="lblTranDate" runat="server"></asp:label></td>
	</tr>
	</tr>
	<tr>
		<td width="20%"><jenzabar:GlobalizedLabel ID="lblPaymentAmtText" TextKey="TXT_PAYMENTS_COMPLETE_TOTAL_AMOUNT_PAID"
                runat="server" /></td>
		<td ><asp:label id="lblPaymentAmt" runat="server"></asp:label></td>
	</tr>
    <tr>
        <td><jenzabar:GlobalizedLabel id="lblTypeText" TextKey="TXT_PAYMENTS_COMPLETE_METHOD_OF_PAYMENT" runat="server"/></td>
 	    <td><asp:Label id="lblType" runat="server" ></asp:Label></td>
    </tr>
	<tr>
		<td><jenzabar:GlobalizedLabel id="lblAppliedToText" TextKey="TXT_PAYMENTS_COMPLETE_PAYMENT_APPLIED_TO" runat="server"/></td>
		<td ><asp:label id="lblAppliedTo" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><jenzabar:GlobalizedLabel id="lblPaymentDescText" TextKey="TXT_PAYMENTS_COMPLETE_DESCRIPTION" runat="server"/></td>
		<td ><asp:label id="lblPaymentDesc" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table width="100%" cellSpacing="3" cellPadding="3">
    <asp:Repeater id="rptPaymentInfo" runat="server">
        <ItemTemplate>
              <tr>
		        <td colspan="2">
			        <h5><asp:label id="lblHeader" runat="server"></asp:label></h5>
		        </td>
	        </tr>
          <tr>
            <td width="50%" valign="top">
            <table cellSpacing="3" cellPadding="3">
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblAmountText" TextKey="TXT_PAYMENTS_VERIFICATION_AMOUNT" runat="server" visible="false"/></td>
        		<td>
        			<asp:Label id="lblAmount" runat="server" Visible="false"></asp:Label></td>
	        </tr>
	        <tr>
        		<td><asp:label id="lblLabel1Text" runat="server"></asp:label></td>
        		<td>
        			<asp:Label id="lblLabel1" runat="server"></asp:Label></td>
	        </tr>
	        <tr>
        		<td><asp:label id="lblLabel2Text" runat="server"></asp:label></td>
        		<td>
        			<asp:Label id="lblLabel2" runat="server"></asp:Label></td>
	        </tr>
	        <tr>
        		<td><asp:label id="lblLabel3Text" runat="server"></asp:label></td>
        		<td>
        			<asp:Label id="lblLabel3" runat="server"></asp:Label></td>
	        </tr>
            </table>
            </td>
            <td>
            <table cellSpacing="3" cellPadding="3">
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblNameText" runat="server" TextKey="TXT_PAYMENTS_COMPLETE_NAME"/></td>
        		<td>
        			<asp:Label id="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.FirstName")+" "+DataBinder.Eval(Container.DataItem, "BillingAddress.LastName")%>' ></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblCompanyNameText" runat="server" TextKey="TXT_PAYMENTS_COMPLETE_COMPANY_NAME"/></td>
        		<td>
        			<asp:Label id="lblCompanyName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.CompanyName")%>' ></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblAddressText" runat="server" TextKey="TXT_PAYMENTS_COMPLETE_ADDRESS"/></td>
        		<td>
        			<asp:Label id="lblAddress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.AddrLine")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblCityStateZipText" runat="server" TextKey="TXT_PAYMENTS_COMPLETE_CITY_STATE_ZIP"/></td>
        		<td>
        			<asp:Label id="lblCityStateZip" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.City")+", "+DataBinder.Eval(Container.DataItem, "BillingAddress.State")+" "+DataBinder.Eval(Container.DataItem, "BillingAddress.Zip")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:GlobalizedLabel id="lblCountryText" runat="server" TextKey="TXT_PAYMENTS_COMPLETE_COUNTRY"/></td>
        		<td>
        			<asp:Label id="lblCountry" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.Country")%>'></asp:Label></td>
	        </tr>
            </table>
            </td>
            </tr>
        </ItemTemplate>
	</asp:Repeater>
    	<tr>
		<td><asp:LinkButton id="lnkReturnLink" runat="server" onclick="lnkReturnLink_Click"></asp:LinkButton></td>
	</tr>
</table>

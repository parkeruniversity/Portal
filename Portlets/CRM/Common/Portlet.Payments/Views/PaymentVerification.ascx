<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PaymentVerification.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.PaymentVerification" %>
<jenzabar:ErrorDisplay id="error" Runat="server"></jenzabar:ErrorDisplay>
<table cellSpacing="3" cellPadding="3">
	<tr>
		<td><asp:label id="lblMessage" runat="server"></asp:label></td>
	</tr>
</table>
<table width="100%" cellSpacing="3" cellPadding="3">
	<tr>
		<td colspan="2">
			<h4><asp:label id="lblHeader1" runat="server"></asp:label></h4>
		</td>
	</tr>
	<tr>
		<td width="20%"><asp:label id="lblPaymentAmtText" runat="server"></asp:label></td>
		<td ><asp:label id="lblPaymentAmt" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblPaymentDescText" runat="server"></asp:label></td>
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
			        <div id="divRptrSubheader" runat="server" visible="false"><h4><asp:label id="lblHeader1Sub" runat="server" ></asp:label></h4></div>
		        </td>
	        </tr>
           <tr>
            <td width="50%" valign="top">
            <table cellSpacing="3" cellPadding="3">
            <tr>
		        <td colspan="2">
			        <h5><asp:label id="lblHeader2" runat="server"></asp:label></h5>
		        </td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblAmountText" TextKey="TXT_PAYMENTS_VERIFICATION_AMOUNT" runat="server" visible="false"></jenzabar:globalizedlabel></td>
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
	        <tr>
        		<td><asp:label id="lblLabel4Text" runat="server"></asp:label></td>
        		<td>
        			<asp:Label id="lblLabel4" runat="server"></asp:Label></td>
	        </tr>
	        <tr>
        		<td><asp:label id="lblAccountNameText" runat="server" Visible="False"></asp:label></td>
        		<td>
        			<asp:Label id="lblAccountName" runat="server" Visible="False"></asp:Label></td>
	        </tr>
            </table>
            </td>
            <td>
            <table cellSpacing="3" cellPadding="3">
	        <tr>
		        <td colSpan="2" valign="top">
			        <h5><asp:label id="lblHeader3" runat="server"></asp:label></h5>
		        </td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblNameText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_NAME"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.FirstName")+" "+DataBinder.Eval(Container.DataItem, "BillingAddress.LastName")%>' ></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblCompanyNameText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_COMPANY_NAME"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblCompanyName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.CompanyName")%>' ></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblAddressText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_ADDRESS"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblAddress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.AddrLine")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblCityStateZipText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_CITY_STATE_ZIP"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblCityStateZip" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.City")+", "+DataBinder.Eval(Container.DataItem, "BillingAddress.State")+" "+DataBinder.Eval(Container.DataItem, "BillingAddress.Zip")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblCountryText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_COUNTRY"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblCountry" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.Country")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblPhoneText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_PHONE"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblPhone" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.Phone")%>'></asp:Label></td>
	        </tr>
	        <tr>
        		<td><jenzabar:globalizedlabel id="lblEmailText" runat="server" TextKey="TXT_PAYMENTS_VERIFICATION_EMAIL"></jenzabar:globalizedlabel></td>
        		<td>
        			<asp:Label id="lblEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BillingAddress.EMail")%>'></asp:Label></td>
	        </tr>
            </table>
            </td>
            </tr>
 	        <tr>
        		<td colSpan="2"></td>
        	</tr>
       </ItemTemplate>
	</asp:Repeater>
	<tr>
		<td colspan="2" ><asp:button id="btnContinue" runat="server" onclick="btnContinue_Click"></asp:button>&nbsp;&nbsp;&nbsp;
			<asp:Button id="btnCancel" runat="server" onclick="btnCancel_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
			<asp:button id="btnBack" runat="server" onclick="btnBack_Click"></asp:button></td>
	</tr>
</table>
<jenzabar:HighlightedHint ID="hntBottomWarning" Runat="server" Visible="false" /></jenzabar:HighlightedHint>
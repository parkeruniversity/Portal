<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ViewTransactions.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.ViewTransactions" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="System.Threading" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class=pSection>
<table cellSpacing=3 cellPadding=3 width="100%">
	<tr>
		<th noWrap>
			&nbsp;
			<jenzabar:GlobalizedLabel id="lblPosition" TextKey="TXT_ACCOUNT_INFO_POSITION_TO_ACCOUNT" Runat="server"></jenzabar:GlobalizedLabel>&nbsp;
			<asp:dropdownlist id="ddlAccount" Runat="server"></asp:dropdownlist>
		</th>
	</tr>
	<tr>
		<td>
				<jenzabar:groupedgrid id=dgTransactions runat="server" CellPadding="0" renderGroupHeaders="true" AllowSorting="true">
					<GroupHeaderTemplate><a name='<%#DataBinder.Eval(Container.DataItem, "AccountCode")%>'></a>
						<%#String.Format(Globalizer.GetGlobalizedString("TXT_ACCOUNT_INFO_ACCOUNT"), DataBinder.Eval(Container.DataItem, "AccountDesc"))%>
					</GroupHeaderTemplate>
					<Columns>
						<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_ACCOUNT_INFO_TRANSACTION_DESCRIPTION" DataField="TransactionDescription" SortExpression="TransactionDescription Asc"></jenzabar:GlobalizedBoundColumn>
						<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_ACCOUNT_INFO_TRANSACTION_DATE" DataField="TransactionDate" SortExpression="TransactionDateSort Desc"></jenzabar:GlobalizedBoundColumn>
						<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ACCOUNT_INFO_TRANSACTION_AMOUNT" SortExpression="TransactionAmountSort Asc">
							<ItemTemplate>
								<asp:Literal ID="litTransAmount" Runat="server" Text='<%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TransactionAmount")).ToString("C", Thread.CurrentThread.CurrentCulture)%>'>
								</asp:Literal>
							</ItemTemplate>
						</jenzabar:GlobalizedTemplateColumn>
						<jenzabar:GlobalizedTemplateColumn ItemStyle-VerticalAlign="Top">
							<ItemTemplate>
								<asp:Literal ID="litSpecialMessage" Runat="server" Text='<%#(((Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.AccountTransactions)Container.DataItem).TransactionMessage != null) ? getSpecialMessage(((Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.AccountTransactions)Container.DataItem).TransactionMessage[0]) : ""%>'>
								</asp:Literal>
							</ItemTemplate>
						</jenzabar:GlobalizedTemplateColumn>
					</Columns>
					<GroupFooterTemplate>
						<b><%#DataBinder.Eval(Container.DataItem, "AccountDesc")%> <%#Globalizer.GetGlobalizedString("TXT_ACCOUNT_INFO_BALANCE")%></b> <%# Convert.ToDecimal((DataBinder.Eval(Container.DataItem, "AccountBalance")=="") ? 0 : DataBinder.Eval(Container.DataItem, "AccountBalance")).ToString("C", Thread.CurrentThread.CurrentCulture)%>
					</GroupFooterTemplate>
				</jenzabar:groupedgrid>
		</td>
	</tr>
	<tr>
		<td>
			<jenzabar:globalizedlinkbutton id="lnkMakeAPayment" runat="server" TextKey="TXT_ACCOUNT_INFO_MAKE_A_PAYMENT" onclick="lnkMakeAPayment_Click" />
		</td>
	</tr>
	<tr><td><asp:table id="tblPaymentPlan" runat="server" /></td></tr>
</table>
</div>
<SCRIPT language="JavaScript">
function gotoAnchor(control) {
	window.location.hash=control.options[control.selectedIndex].value;
	return false;
}
function gotoTop() {

	window.location.hash="_Top";
	return false;
}
</SCRIPT>
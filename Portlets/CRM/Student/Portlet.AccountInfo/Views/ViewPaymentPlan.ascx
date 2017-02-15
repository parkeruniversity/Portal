<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ViewPaymentPlan.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.ViewPaymentPlan" %>
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
			<div id="divDatagrid" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: block; MARGIN: 10px; OVERFLOW: auto; BORDER-LEFT: 0px; WIDTH: auto; BORDER-BOTTOM: 0px; POSITION: relative; HEIGHT: 300px; align: left">
				<jenzabar:groupedgrid id=dgPaymentPlans runat="server" CellPadding="0" renderGroupHeaders="true">
					<GroupHeaderTemplate><a name='<%#DataBinder.Eval(Container.DataItem, "AccountCode")%>'></a>
						<%#String.Format(Globalizer.GetGlobalizedString("TXT_ACCOUNT_INFO_ACCOUNT"), DataBinder.Eval(Container.DataItem, "AccountDesc"))%>
					</GroupHeaderTemplate>
					<Columns>
						<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_ACCOUNT_INFO_PAYMENT_PLAN_DESCRIPTION" DataField="AccountPaymentPlanDesc"></jenzabar:GlobalizedBoundColumn>
						<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_ACCOUNT_INFO_PAYMENT_PLAN_DUE_DATE" DataField="AccountPaymentPlanDueDate"></jenzabar:GlobalizedBoundColumn>
						<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ACCOUNT_INFO_PAYMENT_PLAN_AMOUNT">
							<ItemTemplate>
								<asp:Literal ID="litPaymentPlanAmount" Runat="server" Text='<%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "AccountPaymentPlanAmount")).ToString("C", Thread.CurrentThread.CurrentCulture)%>'>
								</asp:Literal>
							</ItemTemplate>
						</jenzabar:GlobalizedTemplateColumn>
					</Columns>
				</jenzabar:groupedgrid>
			</div>
		</td>
	</tr>
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
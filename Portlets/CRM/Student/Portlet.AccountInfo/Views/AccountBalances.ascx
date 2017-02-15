<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AccountBalances.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.AccountBalances" %>
<div id="divError" runat="server" visible="False"><jenzabar:errordisplay id="ctlError" RunAt="server" /></div>
<jenzabar:subheader id=lblTitle runat="server" />
<div class="pSection">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td><asp:table id=tblBalances runat="server" CellSpacing="3" CellPadding="3"></asp:table></td></tr>
		<tr>
			<td><jenzabar:globalizedlinkbutton id=lnkMakeAPayment runat="server" TextKey="TXT_ACCOUNT_INFO_MAKE_A_PAYMENT" onclick="lnkMakeAPayment_Click"></jenzabar:globalizedlinkbutton></td></tr>
		<tr>
			<td><jenzabar:globalizedlinkbutton id=lnkCourseAndFeeStatement runat="server" TextKey="TXT_ACCOUNT_INFO_COURSE_AND_FEE_STATEMENT_LINK" onclick="lnkCourseAndFeeStatement_Click"></jenzabar:globalizedlinkbutton></td></tr>
		<tr>
			<td><jenzabar:globalizedlinkbutton id=lnkPayMustPayCourses runat="server" TextKey="TXT_ACCOUNT_INFO_PAY_MUST_PAY_COURSES" onclick="lnkPayMustPayCourses_Click"></jenzabar:globalizedlinkbutton></td></tr>
	</table>
 </div>

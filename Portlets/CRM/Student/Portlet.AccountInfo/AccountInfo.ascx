<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AccountInfo.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.AccountInfo" %>
<div id="divError" runat="server" visible="False"><jenzabar:errordisplay id="ctlError" RunAt="server" /></div>
<div class="pSection">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td><jenzabar:globalizedlinkbutton id="lnkAccountBalances" runat="server" TextKey="TXT_ACCOUNT_INFO_MY_ACCOUNT_BALANCES_LINK"></jenzabar:globalizedlinkbutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedlinkbutton id="lnkCourseAndFeeStatement" runat="server" TextKey="TXT_ACCOUNT_INFO_COURSE_AND_FEE_STATEMENT_LINK"></jenzabar:globalizedlinkbutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedlinkbutton id="lnkPayMustPayCourses" runat="server" TextKey="TXT_ACCOUNT_INFO_PAY_MUST_PAY_COURSES"
					Visible="False"></jenzabar:globalizedlinkbutton></td>
		</tr>
	</table>
</div>

<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseAndFeeStatement.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.CourseAndFeeStatement" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td>
				<jenzabar:globalizedlinkbutton id="lnkGenerateStatement" runat="server" TextKey="TXT_ACCOUNT_INFO_GENERATE_STATEMENT" onclick="lnkGenerateStatement_Click" />
			</td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltPDFLink" runat="server" Visible="False"></jenzabar:globalizedliteral></td>
		</tr>
	</table>
</div>

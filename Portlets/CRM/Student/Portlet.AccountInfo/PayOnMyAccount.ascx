<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PayOnMyAccount.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AccountInfoPortlet.PayOnMyAccount" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divDetail" visible="True" runat="server">
	<table cellSpacing="3" cellPadding="3" runat="server">
		<tr>
			<td><asp:table id="tblBalances" runat="server" CellPadding="3" CellSpacing="3"></asp:table></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<jenzabar:globalizedbutton id="btnSubmit" runat="server" TextKey="TXT_SUBMIT" Width="75px"></jenzabar:globalizedbutton>&nbsp;
				<jenzabar:globalizedbutton id="btnCancel" runat="server" TextKey="TXT_CANCEL" Width="75px" CausesValidation="False"></jenzabar:globalizedbutton>
			</td>
		</tr>
	</table>
</div>

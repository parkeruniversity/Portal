<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CreditCardConfiguration.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.PaymentsPortlet.CreditCardConfiguration" %>
<table width="704" cellpadding="3" cellspacing="3" height="40">
	<tr>
		<td>
			<asp:Label id="lblMessage" runat="server" CssClass="PortletItemStatus"></asp:Label></td>
	</tr>
	<tr>
		<td>
			<ul>
				<li>
					<asp:LinkButton id="lnkAddCC" runat="server" onclick="lnkAddCC_Click"></asp:LinkButton>
					<asp:Label id="lblAddCC" runat="server"></asp:Label>
				<li>
					<asp:LinkButton id="lnkModifyCC" runat="server" onclick="lnkModifyCC_Click"></asp:LinkButton>
					<asp:Label id="lblModifyCC" runat="server"></asp:Label>
				<li>
					<asp:LinkButton id="lnkRemoveCC" runat="server" onclick="lnkRemoveCC_Click"></asp:LinkButton>
					<asp:Label id="lblRemoveCC" runat="server"></asp:Label>
				<li>
					<asp:LinkButton id="lnkExitCCAdmin" runat="server" onclick="lnkExitCCAdmin_Click"></asp:LinkButton>
					<asp:Label id="lblExitCCAdmin" runat="server"></asp:Label></li>
			</ul>
		</td>
	</tr>
</table>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SetupOptionsView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.SetupOptions" %>
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table width="100%" cellpadding="3" cellspacing="0">
	<tr>
		<td><asp:LinkButton ID="lnkEditTabs" Runat="server">edit</asp:LinkButton></td>
	</tr>
	<tr>
		<td><asp:LinkButton ID="lnkAddTabs" Runat="server">add</asp:LinkButton></td>
	</tr>
	<tr>
		<td><asp:LinkButton ID="lnkOrderTabs" Runat="server">order</asp:LinkButton></td>
	</tr>
	<tr>
	    <td><div id="divAdminLink" runat="server" visible="false"><asp:LinkButton ID="linkBtnAdmFB" Runat="server" /></div></td>
	</tr>
</table>
<br />
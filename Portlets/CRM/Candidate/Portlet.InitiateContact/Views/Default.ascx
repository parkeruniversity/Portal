<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.InitiateContactPortlet.Default" %>
<asp:label id="lblError" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
<table cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<td width="85%"><asp:linkbutton id="lnkRequestAContact" Runat="server" Visible="False"></asp:linkbutton></td>
	</tr>
	<tr>
		<td>
			<asp:Label ID="lblNeedToLogon" Runat="server" Visible="False"></asp:Label>
		</td>
	</tr>
	<tr>
		<td width="85%"><asp:linkbutton id="lnkScheduleAVisit" Runat="server" Visible="False"></asp:linkbutton></td>
	</tr>
</table>

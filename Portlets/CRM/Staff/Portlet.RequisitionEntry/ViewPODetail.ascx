<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewPODetail.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.ViewPODetail" %>
<asp:label id="lblError" runat="server" Height="22px"></asp:label>
<table height="100%" cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<td colSpan="1"><asp:label id="lblPONumber" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPONumber" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="1"><asp:label id="lblPODate" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPODate" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="1"><asp:label id="lblPOExpDate" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPOExpDate" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="1"><asp:label id="lblPODateToOrder" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPODateToOrder" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="1"><asp:label id="lblPODesiredShipDate" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPODesiredShipDate" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td colSpan="1"><asp:label id="lblPOShipToLocation" Runat="server"></asp:label></td>
		<td colSpan="1"><asp:textbox id="colPOShipToLocation" Runat="server"></asp:textbox></td>
	</tr>
</table>

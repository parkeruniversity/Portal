<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ContributionHistoryPortlet.Default" %>
<div class="pSection">
<table cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<td colSpan="2"><asp:label id="lblTitle" Runat="server" ForeColor="Red"></asp:label></td>
	</tr>
	<tr>
		<td noWrap width="110"><asp:label id="lblTotalCont" Runat="server"></asp:label></td>
		<td noWrap width="85%"><asp:label id="txtTotalCont" Runat="server"></asp:label></td>
		<td noWrap width="110"><asp:label id="lblCashGifts" Runat="server"></asp:label></td>
		<td noWrap width="85%"><asp:label id="txtCashGifts" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td noWrap width="110"><asp:label id="lblPromisesMade" Runat="server"></asp:label></td>
		<td noWrap width="85%"><asp:label id="txtPromisesMade" Runat="server"></asp:label></td>
	</tr>
</table>
<P><asp:linkbutton id="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:linkbutton></P>
<P><asp:linkbutton id="LinkButton2" runat="server" onclick="LinkButton2_Click"></asp:linkbutton></P>
<P>
	<asp:LinkButton id="LinkButton3" runat="server" onclick="LinkButton3_Click"></asp:LinkButton></P>
<P>
	<asp:LinkButton id="LinkButton4" runat="server" onclick="LinkButton4_Click"></asp:LinkButton></P>
</div>
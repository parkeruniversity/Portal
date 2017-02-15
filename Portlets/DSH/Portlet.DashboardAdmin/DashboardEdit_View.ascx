<%@ Register
	Tagprefix="common"
	Assembly="Jenzabar.Common"
	Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DashboardEdit_View.ascx.cs" Inherits="DashboardAdminPortlet.DashboardEdit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table border="0" width="99%">
	<TBODY>
		<tr>
			<td colspan="4"><common:errordisplay id="errDisp" runat="server"></common:errordisplay></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblName" Runat="server" >Dashboard Name:</asp:label></th>
			<td colSpan="3"><asp:textbox ID="tbDashboardName" Runat="server" AutoPostBack=True Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDescription" Runat="server">Description:</asp:label></th>
			<td colSpan="3"><asp:textbox ID="tbDescription" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblTitle" Runat="server">Title:</asp:label></th>
			<td colSpan="3"><asp:textbox ID="tbTitle" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<td></td>
			<td colSpan="2"><asp:button id="btnSave" Runat="server" Width="56px" Text="Save"></asp:button>&nbsp;<asp:button id="btnSaveClose" Runat="server" Text="Save and Close"></asp:button>&nbsp;<asp:button id="btnCancel" Runat="server" Width="56px" Text=" Cancel "></asp:button>
				<asp:button id="btnRefresh" Runat="server" Text="Refresh"></asp:button></td>
		</tr>
	</TBODY>
</table>

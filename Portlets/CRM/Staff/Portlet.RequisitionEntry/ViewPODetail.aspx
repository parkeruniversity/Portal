<%@ Page language="c#" Codebehind="ViewPODetail.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Applications.CRM.Portlets.Staff.RequisitionEntryPortlet.ViewPODetail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>View Purchase Order Details</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table height="100%" cellSpacing="3" cellPadding="3" width="100%">
				<tr>
					<td colSpan="1"><asp:label id="lblPONumber" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPONumber" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td colSpan="1"><asp:label id="lblPODate" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPODate" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td colSpan="1"><asp:label id="lblPOExpDate" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPOExpDate" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td colSpan="1"><asp:label id="lblPODateToOrder" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPODateToOrder" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td colSpan="1"><asp:label id="lblPODesiredShipDate" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPODesiredShipDate" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td colSpan="1"><asp:label id="lblPOShipToLocation" Runat="server"></asp:label></td>
					<td colSpan="1"><asp:textbox id="colPOShipToLocation" Runat="server" Enabled="False"></asp:textbox></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

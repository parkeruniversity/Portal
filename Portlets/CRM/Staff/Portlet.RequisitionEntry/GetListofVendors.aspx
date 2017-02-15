<%@ Page language="c#" Codebehind="GetListofVendors.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Applications.CRM.Portlets.Staff.RequisitionEntryPortlet.GetListofVendors" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ViewPODetail</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:label id="lblError" runat="server" Height="22px"></asp:label>
			<table height="100%" cellSpacing="3" cellPadding="3" width="100%">
				<tr>
					<td colSpan="3">
						<asp:RadioButton OnCheckedChanged="RBSelectionChanged" id="RBSelectVendor" runat="server"></asp:RadioButton>
						<asp:textbox id="colVendors" Runat="server"></asp:textbox>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

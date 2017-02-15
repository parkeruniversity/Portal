<%@ Page language="c#" Codebehind="GetVendorName.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Applications.CRM.Portlets.Staff.RequisitionEntryPortlet.GetVendorName" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<head>
		<title>Jenzabar University Portal</title> 
		<meta http-equiv="Content-Type" CONTENT="text/html; charset=UTF-8">
		<link href="...../UI/Common/Styles/portletStyle.css" rel="stylesheet" type="text/css">
		<link href="../clientconfig/HtmlContent/custom.css" rel="stylesheet" type="text/css">
	</head>
	<body MS_POSITIONING="GridLayout" onLoad="SetControlFocus();">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
				<td width="100%">
					<h4><asp:label id="lblError" runat="server"></asp:label></h4>
				</td>
				</tr>
				<tr>
				<td align="center">
					<asp:label id="lbltext" Runat="server"></asp:label><asp:textbox id="colSearch" Runat="server"></asp:textbox>
					<asp:button id="Button_search" Runat="server"></asp:button><asp:button id="Button_new_search" Runat="server"></asp:button>
				</td>
				</tr>
				
			</table>
			<table>
				<asp:DataGrid id="dgListOfVendors" runat="server" Width="100%" BorderStyle="Solid" AutoGenerateColumns="False"
					GridLines="None" >
					<EditItemStyle CssClass="alt" BackColor="#E0E0E0"></EditItemStyle>
					<AlternatingItemStyle CssClass="alt" BackColor="#E0E0E0"></AlternatingItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:RadioButton ID="RB_Button" Runat="server" AutoPostBack="True"></asp:RadioButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="VendorName"></asp:BoundColumn>
						<asp:BoundColumn DataField="VendorID"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid></table>
		</form>
	</body>
</HTML>

<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Page language="c#" Codebehind="GetInventoryInfo.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.Applications.CRM.Portlets.Staff.RequisitionEntryPortlet.GetInventoryInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<head>
		<title>Jenzabar University Portal</title> 
		<meta http-equiv="Content-Type" CONTENT="text/html; charset=UTF-8">
		<link href="...../UI/Common/Styles/portletStyle.css" rel="stylesheet" type="text/css">
		<link href="../clientconfig/HtmlContent/custom.css" rel="stylesheet" type="text/css">
	</head>
	<body MS_POSITIONING="GridLayout" onLoad="SetControlFocus();">
		<form id="Form1" method="post" runat="server" >
			<div align="center">
				<asp:label id="lblError" runat="server" Height="22px"></asp:label>
				<br>
				<br>
				<asp:label id="lbltext" Runat="server"></asp:label>
				<asp:textbox id="colSearch" Runat="server"></asp:textbox>
				<asp:button id="Button_search" Runat="server"></asp:button>
				<asp:button id="Button_new_search" Runat="server"></asp:button>
				<br>
			</div>
			<table>
				<asp:datagrid id="dgGetInventory" runat="server" Width="100%" AutoGenerateColumns="False" BorderStyle="Solid"
					GridLines="None">
					<AlternatingItemStyle CssClass="alt" BackColor="#E0E0E0"></AlternatingItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:RadioButton ID="RB_Button" Runat="server" AutoPostBack="True"></asp:RadioButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="ItemCode"></asp:BoundColumn>
						<asp:BoundColumn DataField="ItemRequested"></asp:BoundColumn>
						<asp:BoundColumn DataField="UnitPrice"></asp:BoundColumn>
						<asp:BoundColumn DataField="CatalogNumber"></asp:BoundColumn>
						<asp:BoundColumn DataField="Unit"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
			</table>
		</form>
	</body>
</HTML>

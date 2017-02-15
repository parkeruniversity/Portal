<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContactDetailView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.ContactDetailView" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<table cellSpacing="0" cellPadding="0" width="100%" border="0" class="groupedGrid">
	<tr>
		<td><h4><asp:label id="lblContact" Runat="server"></asp:label></h4>
		</td>
	</tr>
	<tr>
		<td valign="middle" width="100%" class="header">&nbsp;<asp:label id="lblConstName" Font-Bold="True" Runat="server"></asp:label>&nbsp;-
			<asp:label id="lblID" Font-Bold="True" Runat="server"></asp:label><asp:label id="lblConstID" Font-Bold="True" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:datagrid id="dgCurrentValue" Runat="server" BorderWidth="0" ShowHeader="False" AutoGenerateColumns="False"
				CssClass="GroupedGrid" AlternatingItemStyle-CssClass="alt" CellSpacing="2" CellPadding="2">
				<Columns>
					<asp:BoundColumn DataField="Label" ItemStyle-Font-Bold="True"></asp:BoundColumn>
					<asp:BoundColumn DataField="Value"></asp:BoundColumn>
				</Columns>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td><asp:label id="lblComments" Font-Bold="True" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:textbox id="txtComments" Columns="100" TextMode="MultiLine" Rows="6" ReadOnly="True" Runat="server"></asp:textbox></td>
	</tr>
</table>

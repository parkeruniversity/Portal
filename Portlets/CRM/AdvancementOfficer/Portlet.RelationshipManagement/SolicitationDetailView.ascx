<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SolicitationDetailView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.SolicitationDetailView" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<table cellSpacing="4" cellPadding="0" width="100%" border="0" class="groupedGrid">
		<tr>
			<td><h4><asp:label id="lblSolicitation" Runat="server"></h4></asp:label>
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
				</asp:datagrid><hr>
			</td>
		</tr>
		
		
		<tr>
			<td  class="header"><asp:label id="lblContacts" Runat="server"></asp:label>
			</td>
		</tr>
		
		
		<tr>
				<td><asp:datagrid id="dgContacts" Runat="server" BorderWidth="0" ShowHeader="False" AutoGenerateColumns="False"
						CssClass="GroupedGrid" AlternatingItemStyle-CssClass="alt" CellSpacing="2" CellPadding="2"></asp:datagrid></td>
			</tr></TR>
		
</table>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditDependentInfo.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.StaffPortletPortlet.EditDependentInfo" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<table>
	<tr>
		<td><asp:label id="lblError" Visible="False" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><asp:label id="lblFirstName" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbFirstName" Runat="server"></asp:textbox></td>
					<td><asp:label id="lblMiddleName" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbMiddleName" Runat="server"></asp:textbox></td>
					<td><asp:label id="lblLastName" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbLastName" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblRelationship" Runat="server"></asp:label></td>
					<td><asp:dropdownlist id="ddlbRelationship" Runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td><asp:label id="lblHomePhone" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbHomePhone" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblWorkPhone" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbWorkPhone" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblDOB" Runat="server"></asp:label></td>
					<!-- <td><asp:textbox id="tbDOB" Runat="server"></asp:textbox></td> -->
					<td colspan="4"><jenzabar:DatePicker ID="dpDOB" Runat="server"></jenzabar:DatePicker></td>
				</tr>
				<tr>
					<td><asp:label id="lblStudent" Runat="server"></asp:label></td>
					<td><asp:checkbox id="cbxStudent" Runat="server" Checked="False"></asp:checkbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblHandicapped" Runat="server"></asp:label></td>
					<td><asp:checkbox id="cbxHandicapped" Runat="server" Checked="False"></asp:checkbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblAddress" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbAddress" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblCity" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbCity" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblState" Runat="server"></asp:label></td>
					<td><asp:dropdownlist id="ddlbState" Runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td><asp:label id="lblZip" Runat="server"></asp:label></td>
					<td><asp:textbox id="tbZip" Runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:label id="lblCountry" Runat="server"></asp:label></td>
					<td colspan="3"><asp:dropdownlist id="ddlbCountry" Runat="server"></asp:dropdownlist></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<asp:TextBox ID="tbUniqueIdentifier" Runat="server" Visible="False"></asp:TextBox>
			<asp:TextBox ID="tbSSN" Runat="server" Visible="False"></asp:TextBox>
			<asp:button id="btnSave" Runat="server"></asp:button>
			<asp:button id="btnDelete" Runat="server"></asp:button>
		</td>
	</tr>
</table>

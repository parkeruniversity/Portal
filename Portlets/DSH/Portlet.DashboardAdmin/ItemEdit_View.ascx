<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ItemEdit_View.ascx.cs" Inherits="DashboardAdminPortlet.ItemEdit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register
	Tagprefix="common"
	Assembly="Jenzabar.Common"
	Namespace="Jenzabar.Common.Web.UI.Controls" %>
<table border="0">
	<TBODY>
		<tr>
			<td colspan="4"><common:errordisplay id="errDisp" runat="server"></common:errordisplay></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDashboard" Runat="server">Dashboard:</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlDashboard" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblType" Runat="server">Type:</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlType" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblLabel" Runat="server">Label:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbLabel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDescription" Runat="server">Description:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbDescription" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblFilename" Runat="server">Filename:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbFilename" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDefaultLevel" Runat="server">Default&nbsp;Level:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbDefaultLevel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<td></td>
			<td colSpan="2"><asp:button id="btnSave" Runat="server" Width="56px" Text="Save"></asp:button>&nbsp;<asp:button id="btnSaveClose" Runat="server" Text="Save and Close"></asp:button>&nbsp;<asp:button id="btnCancel" Runat="server" Width="56px" Text=" Cancel "></asp:button></td>
			<td colSpan="1"><asp:button id="btnRefresh" Runat="server" Text="Refresh"></asp:button></td>
		</tr>
		<tr>
			<td style="HEIGHT: 21px"></td>
			<th align="center" width="100%">
				<asp:label id="lblAvailableDataPoints" Runat="server">Available&nbsp;Data&nbsp;Points</asp:label></th>
			<td></td>
			<td align="left" width="100%"><b><asp:label id="lblSelectedDataPoints" Runat="server">Current&nbsp;Data&nbsp;Points</asp:label></b></td>
		</tr>
		<tr>
			<td></td>
			<td width="50%"><asp:listbox id="lbAvailableDataPoints" Runat="server" CssClass="UserSelectorListBox" SelectionMode="Multiple"
					Height="140px" Width="144px"></asp:listbox></td>
			<td>
				<table border="0">
					<tr>
						<td style="HEIGHT: 40px" align="center"><asp:button id="btnDataPointSelect" Runat="server" Text=">" ToolTip="Add Selected DataPoints"></asp:button></td>
					</tr>
					<tr>
						<td style="HEIGHT: 40px"><asp:button id="btnEditDataPoint" Runat="server" Text="Edit -->" ToolTip="Edit First Highlighted Selected DataPoint"></asp:button></td>
					</tr>
					<tr>
						<td style="HEIGHT: 40px" align="center"><asp:button id="btnDataPointUnselect" Runat="server" Text="<" ToolTip="Remove Selected Datapoints"></asp:button></td>
					</tr>
				</table>
			</td>
			<td width="50%"><asp:listbox id="lbSelectedDataPoints" Runat="server" CssClass="UserSelectorListBox" SelectionMode="Multiple"
					Height="140px" Width="600px"></asp:listbox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblVariables" Runat="server">Variables</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlVariableList" Runat="server"></asp:dropdownlist><asp:linkbutton id="lbAdd" Runat="server">Add</asp:linkbutton></td>
		</tr>
		<tr>
			<th>
				<td colSpan="3"><common:groupedgrid id="dgItemVariables" Runat="server" datakeyfield="ID">
						<tableheadertemplate>
							DashboardItemVariables
						</tableheadertemplate>
						<Columns>
							<asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<HeaderTemplate>test</HeaderTemplate>
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"name") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Description" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"description") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<common:EditButtonColumn />
							<common:DeleteButtonColumn />
						</Columns>
					</common:groupedgrid></td>
		</tr>
	</TBODY>
</table>
</TR></TBODY></TABLE></TR></TBODY></TABLE>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UsersMain_View.ascx.cs" Inherits="DashboardAdminPortlet.UsersMain_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register
	Tagprefix="common"
	Assembly="Jenzabar.Common"
	Namespace="Jenzabar.Common.Web.UI.Controls" %>
<asp:Label ID="lbCurrentPage" Runat="server"></asp:Label>
<table border="0">
	<TBODY>
		<tr>
			<td colSpan="4"><common:errordisplay id="errDisp" runat="server"></common:errordisplay></td>
		</tr>
		<tr>
			<th>
			</th>
			<td colSpan="3"><asp:linkbutton id="lbAllUsers" Runat="server">All Users</asp:linkbutton>&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:linkbutton id="lbExistingUsers" Runat="server"> Existing DashboardUser Users</asp:linkbutton></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblUser" Runat="server">User:</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlUser" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDashboard" Runat="server">Dashboard:</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlDashboard" Runat="server"></asp:dropdownlist><asp:linkbutton id="lbAddDashboard" Runat="server">Add</asp:linkbutton></td>
		</tr>
		<TR>
			<TH>
				<td colSpan="3"><common:groupedgrid id="dgDashboards" Runat="server" RenderTableHeaders="True" RenderTableFooters="True"
						HideTableHeadersWhenGridIsEmpty="True" HideTableFootersWhenGridIsEmpty="True" datakeyfield="ID" CaptionAlign="Left"
						BorderColor="Black" BackColor="#80FF80">
						<tableheadertemplate>Dashboards Assigned to this User</tableheadertemplate>
						<ItemStyle HorizontalAlign="Left"></ItemStyle>
						<Columns>
							<asp:TemplateColumn HeaderText="Dashboard Name" FooterText="Dashboard Name">
								<HeaderStyle Width="100px"></HeaderStyle>
								<ItemStyle VerticalAlign="Top"></ItemStyle>
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"name") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Dashboard Description" FooterText="Dashboard Description">
								<HeaderStyle Width="100px"></HeaderStyle>
								<ItemStyle VerticalAlign="Top"></ItemStyle>
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"description") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<common:EditButtonColumn ToolTipKey="" TextKey="" HeaderText="Edit" FooterText="Edit"></common:EditButtonColumn>
							<common:DeleteButtonColumn ToolTipKey="" TextKey="" HeaderText="Remove" FooterText="Remove"></common:DeleteButtonColumn>
						</Columns>
						<EmptyTableTemplate>
			No Dashboards are currently assigned to this User
		</EmptyTableTemplate>
					</common:groupedgrid></td>
		</TR>
		<tr>
			<th>
				<asp:label id="lblDashboardName" Runat="server">Name:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbDashboardName" Runat="server" Width="99%" Enabled="False" BorderStyle="None"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDashboardDescription" Runat="server">Description:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbDashboardDescription" Runat="server" Width="99%" Enabled="False" BorderStyle="None"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblStylesheet" Runat="server">Stylesheet:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbStylesheet" Runat="server" Width="99%" ToolTip="Default comes from FWK_SiteSetting table"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblHelpFile" Runat="server">Help File:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbHelpFile" Runat="server" Width="99%" ToolTip="Default comes from DSH_DashboardUser.HELP default setting"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblItems" Runat="server">Items</asp:label></th>
			<td colSpan="3"><asp:dropdownlist id="ddlNewItems" Runat="server"></asp:dropdownlist><asp:linkbutton id="lbAddItems" Runat="server">Add</asp:linkbutton></td>
		</tr>
		<tr>
			<th>
				<td colSpan="3"><common:groupedgrid id="ggItems" Runat="server" RenderTableHeaders="true" datakeyfield="ID">
						<tableheadertemplate>Dashboard Items Assigned to this User</tableheadertemplate>
						<Columns>
							<asp:TemplateColumn HeaderText="Description" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"description") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Level" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"Dashboard_level") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Position" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"dashboard_position") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<common:EditButtonColumn HeaderText="Edit"></common:EditButtonColumn>
							<common:DeleteButtonColumn HeaderText="Remove"></common:DeleteButtonColumn>
						</Columns>
					</common:groupedgrid></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblDescription" Runat="server">Description:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbDescription" Runat="server" Width="99%" Enabled="False" BorderStyle="None"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblLabel" Runat="server">Label:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbLabel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblLevel" Runat="server">Level:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbLevel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblPosition" Runat="server">Position:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbPosition" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblPreviousLevel" Runat="server">Previous&nbsp;Level:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbPreviousLevel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<th>
				<asp:label id="lblNextLevel" Runat="server">Next&nbsp;Level:</asp:label></th>
			<td colSpan="3"><asp:textbox id="tbNextLevel" Runat="server" Width="99%"></asp:textbox></td>
		</tr>
		<tr>
			<td></td>
			<td colSpan="2"><asp:button id="btnSave" Runat="server" Width="56px" Text="Save"></asp:button>&nbsp;<asp:button id="btnSaveClose" Runat="server" Text="Save and Close"></asp:button>&nbsp;<asp:button id="btnCancel" Runat="server" Width="56px" Text=" Cancel "></asp:button></td>
			<td colSpan="1"><asp:button id="btnRefresh" Runat="server" Text="Refresh"></asp:button></td>
		</tr>
	</TBODY>
</table>
</TR></TBODY></TABLE></TR></TBODY></TABLE>

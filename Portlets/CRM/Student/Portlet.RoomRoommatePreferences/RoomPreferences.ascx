<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RoomPreferences.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.RoomPreferences" %>
<h4><asp:label id="lblTitle" runat="server"></asp:label></h4>
<DIV class="pSection">
	<TABLE id="Table1" height="0" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" runat="server" visible="false"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<TD><h6><asp:literal id="lblNewRoomPref" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table5" height="0" cellSpacing="5" cellPadding="5" width="100%" border="0">
					<tr>
						<td width="60%">
							<TABLE id="Table2" height="0" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<tr>
									<td noWrap align="right" width="45%"><asp:label id="lblSelectCampusBuilding" runat="server"></asp:label></td>
									<td><asp:dropdownlist id="ddlSelectCampusBuilding" runat="server" Width="260px" AutoPostBack="True"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td align="right" width="45%"><asp:label id="lblSelectRoom" runat="server"></asp:label></td>
									<td><asp:dropdownlist id="ddlSelectRoom" runat="server" Width="260px"></asp:dropdownlist><asp:label id="lblPriority" runat="server" Visible="False"></asp:label>
										<asp:textbox id="txtPriority" runat="server" Width="25px" MaxLength="2" Visible="False"></asp:textbox></td>
								</tr>
								<tr>
									<td></td>
									<td><asp:button id="btnAddRoom" runat="server"></asp:button></td>
								</tr>
							</TABLE>
						</td>
						<td width="40%"><jenzabar:hint id="lblNewRoomPrefInst" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD><h6><asp:literal id="lblCurrentRoomPref" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table3" height="0" cellSpacing="5" cellPadding="5" width="100%" border="0">
					<tr>
						<td><jenzabar:hint id="lblCurrentRoomPrefInst" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
					<tr>
						<td><asp:datagrid id="dgCurrentRoomPref" Runat="server" Width="100%" ShowFooter="False" ShowHeader="True"
								AutoGenerateColumns="false" DataKeyField="ERPSLTermRoomKey" CssClass="groupedGrid" FooterStyle-CssClass="alt"
								AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header" BorderWidth="0">
								<Columns>
									<asp:BoundColumn DataField="SLTermCampusCode" ItemStyle-Width="10%" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="SLTermBuildingDesc" ItemStyle-Width="30%" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="SLTermRoomCode" ItemStyle-Width="10%" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="Priority" ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
									<asp:TemplateColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center">
										<ItemTemplate>
											<asp:textbox id="txtReorder" runat="server" Width="25px" MaxLength="2" CommandName="Reorder"></asp:textbox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center">
										<ItemTemplate>
											<asp:ImageButton ID="btnDelete" CommandName="DeleteItem" Runat="server"></asp:ImageButton>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></td>
					</tr>
					<TR>
						<TD><asp:button id="btnSave" runat="server" Width="105px"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" Width="105px" CausesValidation="False"></asp:button>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD><div id="divLnkPrefChoices" runat="server">&nbsp;&nbsp;&nbsp;<asp:linkbutton id="lnkPrefChoices" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<div id="divLnkRoommatePref" runat="server">&nbsp;&nbsp;&nbsp;<asp:linkbutton id="lnkRoommatePref" runat="server"></asp:linkbutton></div>
			</TD>
		</TR>
	</TABLE>
</DIV>

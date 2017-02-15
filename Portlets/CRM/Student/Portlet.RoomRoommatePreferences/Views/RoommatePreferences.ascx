<%@ Control Language="c#" AutoEventWireup="True" Codebehind="RoommatePreferences.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.RoomRoommatePreferencesPortlet.RoommatePreferences" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
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
			<TD><h6><asp:literal id="lblNewRoommatePref" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table5" height="0" cellSpacing="0" cellPadding="5" width="100%" border="0">
					<tr>
						<td width="30%">
							<TABLE id="Table2" height="0" cellSpacing="0" cellPadding="5" width="100%" border="0">
								<tr>
									<td noWrap><asp:label id="lblLastName" runat="server"></asp:label><asp:textbox id="txtLastName" runat="server" Width="125px"></asp:textbox></td>
								</tr>
								<tr>
								<td><asp:label id="lblFirstName" runat="server"></asp:label><asp:textbox id="txtFirstName" runat="server" Width="125px"></asp:textbox><asp:textbox id="txtIDNumber" runat="server" Width="125px" Visible="False"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:button id="btnAddRoommate" runat="server" Width="205px" onclick="btnAddRoommate_Click"></asp:button></td>
								</tr>
								<tr>
									<td><asp:linkbutton id="lnkAdvNameSearch" runat="server" onclick="lnkAdvNameSearch_Click"></asp:linkbutton></td>
								</tr>
							</TABLE>
						</td>
						<td width="70%"><jenzabar:hint id="lblNewRoommatePrefInst" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD><h6><asp:literal id="lblCurrentRoommatePref" runat="server" Visible="True"></asp:literal></h6>
				<TABLE id="Table3" height="0" cellSpacing="5" cellPadding="5" width="100%" border="0">
					<tr>
						<td><jenzabar:hint id="lblCurrentRoommatePrefInst" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
					<tr>
						<td><asp:datagrid id="dgCurrentRoommatePref" Runat="server" Width="100%" ShowFooter="False" ShowHeader="True"
								AutoGenerateColumns="false" DataKeyField="RoommatePrefID" CssClass="groupedGrid" FooterStyle-CssClass="alt"
								AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header" BorderWidth="0">
								<Columns>
									<asp:BoundColumn DataField="RoommatePrefStatus" Visible="False"></asp:BoundColumn>
									<asp:TemplateColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center">
										<ItemTemplate>
											<asp:Label ID="lblPrefStatus" Runat="server"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="RoommatePrefName" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="Message" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:TemplateColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center">
										<ItemTemplate>
											<asp:ImageButton ID="btnDelete" CommandName="DeleteItem" Runat="server"></asp:ImageButton>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></td>
					</tr>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD><h6><asp:literal id="lblAcceptRoommate" runat="server" Visible="True"></asp:literal></h6>
				<TABLE height="0" cellSpacing="5" cellPadding="5" width="100%" border="0">
					<tr>
						<td><jenzabar:hint id="lblAcceptRoommateInst" runat="server" Visible="True"></jenzabar:hint></td>
					</tr>
					<tr>
						<td><asp:datagrid id="dgAcceptRoommate" Runat="server" Width="100%" ShowFooter="False" ShowHeader="True"
								AutoGenerateColumns="false" DataKeyField="RoommatePrefID" CssClass="groupedGrid" FooterStyle-CssClass="alt"
								AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header" BorderWidth="0">
								<Columns>
									<asp:BoundColumn DataField="RoommatePrefStatus" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="RoommatePrefName" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="Message" ItemStyle-Wrap="False"></asp:BoundColumn>
									<asp:TemplateColumn ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Center">
										<ItemTemplate>
											<asp:ImageButton ID="btnAccept" CommandName="AcceptItem" Runat="server"></asp:ImageButton>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></td>
					</tr>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD>
				<asp:button id="btnCancel" runat="server" Width="75px" CausesValidation="False" onclick="btnCancel_Click"></asp:button>
			</TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<TR>
			<TD>
				<div id="divLnkPrefChoices" runat="server"><asp:linkbutton id="lnkPrefChoices" runat="server" onclick="lnkPrefChoices_Click"></asp:linkbutton></div>
			</TD>
		</TR>
		<TR>
			<TD>
				<div id="divLnkRoomPref" runat="server"><asp:linkbutton id="lnkRoomPref" runat="server" onclick="lnkRoomPref_Click"></asp:linkbutton></div>
			</TD>
		</TR>
	</TABLE>
</DIV>

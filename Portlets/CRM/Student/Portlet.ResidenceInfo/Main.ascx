<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.ResidenceInfoPortlet.Main" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<DIV class="psection">
	<div id="divHeader" runat="server" Visible="false"><h4><jenzabar:GlobalizedLiteral id="litForAdvisee" visible="False" runat="server"></jenzabar:GlobalizedLiteral></h4></div>
	<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
			<td></td>
		</TR>
		<tr>
			<td><asp:label id="lblAdviseeName" runat="server" Font-Bold="True" Visible="False"></asp:label></td>
			<td></td>
		</tr>
		<tr>
			<td><asp:label id="lblLineBreak" runat="server" Font-Bold="True" Visible="False"></asp:label></td>
			<td></td>
		</tr>
		<TR>
			<TD width="20%">&nbsp;<asp:label id="lblSession" runat="server" Font-Bold="True"></asp:label></TD>
			<TD><asp:dropdownlist id="ddlSession" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id="lblSessionDesc" runat="server" Visible="False"></asp:label></TD>
		</TR>
		<tr>
			<td>&nbsp;</td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;<asp:label id="lblAddress" runat="server" Font-Bold="True"></asp:label></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;<asp:label id="lblRoomAssignment" runat="server"></asp:label></td>
			<td><asp:label id="lblRoomAssignDetail" runat="server"></asp:label></td>
			</TD></tr>
		<tr>
			<td>&nbsp;<asp:label id="lblRoomType" runat="server"></asp:label></td>
			<td><asp:label id="lblRoomTypeDetail" runat="server"></asp:label></td>
			</TD></tr>
		<tr>
			<td>&nbsp;<asp:label id="lblMailingAddress" runat="server"></asp:label></td>
			</TD>
			<td><asp:label id="lblMailingAddrDetail" runat="server"></asp:label></td>
			</TD></tr>
		<tr>
			<td>&nbsp;<asp:label id="lblPhone" runat="server"></asp:label></td>
			</TD>
			<td><asp:label id="lblPhoneDetail" runat="server"></asp:label></td>
			</TD></tr>
	</TABLE>
	<TABLE>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;<asp:label id="lblRoommates" runat="server" Font-Bold="True" Visible="False"></asp:label></td>
		</tr>
		<TR>
			<td><asp:datagrid id="dgResidenceInfo" Runat="server" ShowFooter="False" ShowHeader="False" AutoGenerateColumns="false"
					CssClass="groupedGrid" BorderWidth="0" Width="100%" GridLines="Both">
					<Columns>
						<asp:TemplateColumn>
							<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
							<ItemTemplate>
								<asp:Label ID="lblRoommateName" Runat="server" Visible="False">
									<%# DataBinder.Eval(Container.DataItem,"RoommateName") %>
								</asp:Label>
								<asp:HyperLink ID="hlnkRoommateName" Runat="server" Visible="False" NavigateUrl='<%# "mailto:"+DataBinder.Eval(Container.DataItem,"RoommateEmail") %>'>
									<%# DataBinder.Eval(Container.DataItem,"RoommateName") %>
								</asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></td>
		</TR>
		<TR>
			<TD>&nbsp;<asp:button id="btnBack" runat="server" Visible="False"></asp:button></TD>
		</TR>
	</TABLE>
</DIV>

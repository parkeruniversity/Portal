<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.VehicleInfoPortlet.Main" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<DIV class="psection">
	<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
		<TR>
			<TD>
				<div id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
				<div id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<td><asp:datagrid id="dgVehicleInfo" Runat="server" ShowFooter="False" ShowHeader="True" AutoGenerateColumns="false"
					CssClass="groupedGrid" FooterStyle-CssClass="alt" AlternatingItemStyle-CssClass="alt" HeaderStyle-CssClass="header"
					BorderWidth="0" Width="100%">
					<Columns>
						<asp:BoundColumn DataField="VehicleDescription"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkingLocation"></asp:BoundColumn>
						<asp:BoundColumn DataField="TypeOfPermit"></asp:BoundColumn>
						<asp:BoundColumn DataField="PermitNumber"></asp:BoundColumn>
						<asp:BoundColumn DataField="PermitExpirationDate"></asp:BoundColumn>
						<asp:BoundColumn DataField="LicensePlateNumber" ItemStyle-Wrap="False"></asp:BoundColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:LinkButton ID="lnkViolations" CommandName="Violations" Runat="server"></asp:LinkButton>
								<asp:Label ID="lblViolations" Runat="server"></asp:Label>
							</ItemTemplate>
							<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
							<HeaderStyle HorizontalAlign="Left" Wrap="True"></HeaderStyle>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></td>
		</TR>
		<TR>
			<TD><asp:button id="btnBack" runat="server" Visible="False"></asp:button></TD>
		</TR>
		<tr>
			<td>
				<asp:Label id="lblInstructions" runat="server"></asp:Label></td>
		</tr>
	</TABLE>
</DIV>

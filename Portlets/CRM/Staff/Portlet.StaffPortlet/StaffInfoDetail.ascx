<%@ Control Language="c#" AutoEventWireup="false" Codebehind="StaffInfoDetail.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.StaffPortletPortlet.StaffInfoDetail" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="uc" TagName="accrual" Src="UCTimeOffAccrual.ascx" %>
<jenzabar:tabgroup id="tgStaffInfoDetail" runat="server">
	<jenzabar:Tab id="tDeductionInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggDeductionInfo" runat="server" RenderTableHeaders="True"></jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblDedError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tPositionInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggPositionInfo" runat="server" RenderTableHeaders="True">
						<Columns>
							<asp:BoundColumn DataField="PositionName" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="RegularAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						</Columns>
					</jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblPosError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tTaxInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<jenzabar:GroupedGrid id="ggTaxInfo" runat="server" RenderTableHeaders="True">
						<Columns>
							<asp:BoundColumn DataField="TaxName" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="FilingStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Exemptions" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="AdditionalAmount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDWithheld" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
							<asp:BoundColumn DataField="YTDTaxableWages" HeaderStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
						</Columns>
					</jenzabar:GroupedGrid>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblTaxError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tDependentInfo" runat="server">
		<table>
			<tr>
				<td>
					<br>
					<asp:DataGrid id="dgDependentInfo" runat="server" ShowHeader="True" AutoGenerateColumns="False" GridLines="None">
						<Columns>
							<asp:BoundColumn DataField="Name" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="Relationship" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="PhoneNumber" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:BoundColumn DataField="DOB" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
							<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:CheckBox ID="cbxStudent" Runat="server" Enabled="False"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:CheckBox ID="cbxHandicapped" Runat="server" Enabled="False"></asp:CheckBox>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:Button ID="btnEdit" Runat="server"></asp:Button>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:BoundColumn DataField="Dummy" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="FirstName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="MiddleName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="LastName" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="HomePhone" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="WorkPhone" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="City" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="State" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Zip" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="Country" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="UniqueIdentifier" Visible="False"></asp:BoundColumn>
							<asp:BoundColumn DataField="SSN" Visible="False"></asp:BoundColumn>
						</Columns>
					</asp:DataGrid>
				</td>
			</tr>
			<tr>
				<td align="center">
					<asp:Button ID="btnAddNewDependent" Runat="server" Visible="False"></asp:Button>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblDepError" Runat="server" Visible="False"></asp:Label>
				</td>
			</tr>
		</table>
	</jenzabar:Tab>
	<jenzabar:Tab id="tTimeOffAccrual" runat=server>
		<uc:accrual id="accrual1" runat="server"/> 
	</jenzabar:Tab>
</jenzabar:tabgroup>

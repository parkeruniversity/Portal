<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewActivityPortlet.Main" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD>
			<asp:Label id="lblActivityfor" runat="server"></asp:Label></TD>
	</TR>
	<TR>
		<TD>
			<table id="Table3" width="100%" border="0">
				<tr>
					<td width="5%"></td>
					<td>
						<asp:Label id="lblCandidatesAssigned" runat="server"></asp:Label>
						<table width="100%" border="0">
							<tr>
								<td width="5%"></td>
								<td>
									<asp:DataGrid id="dgCandidates" runat="server" CellSpacing="5" AutoGenerateColumns="False" ShowHeader="False"
										GridLines="None">
										<Columns>
											<asp:BoundColumn DataField="StageName"></asp:BoundColumn>
											<asp:BoundColumn DataField="StageCount">
												<HeaderStyle Width="50px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:DataGrid></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="5%"></td>
					<td>
						<asp:LinkButton id="lnkViewCandidate" runat="server"></asp:LinkButton>
					</td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD>
			<table id="Table4" width="100%" border="0">
				<tr>
					<td width="5%"></td>
					<td>
						<asp:Label id="lblTerritoryAssigned" runat="server"></asp:Label>
						<table width="100%" border="0">
							<tr>
								<td width="5%"></td>
								<td>
									<asp:DataGrid id="dgTerritory" runat="server" CellSpacing="3" AutoGenerateColumns="False" ShowHeader="False"
										GridLines="None">
										<Columns>
											<asp:BoundColumn DataField="ComponentName"></asp:BoundColumn>
											<asp:BoundColumn DataField="ComponentItem"></asp:BoundColumn>
										</Columns>
									</asp:DataGrid></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD>
			<table width="100%" border="0">
				<tr>
					<td width="5%"></td>
					<td>
						<asp:DataGrid id="dgAssigned" runat="server" CellSpacing="3" AutoGenerateColumns="False" ShowHeader="False"
							GridLines="None">
							<Columns>
								<asp:TemplateColumn>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<asp:Label ID="lblColumn1" Runat="server" Visible="False">
											<%# DataBinder.Eval(Container.DataItem,"Column1") %>
										</asp:Label>
										<asp:Label ID="lblEmpty" Runat="server" Visible="False">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
										<asp:LinkButton ID="lnkColumn1" Runat="server" Visible="False" CommandName="Column1" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Column2") %>'>
											<%# Convert.ToString(System.Web.UI.DataBinder.Eval(Container.DataItem,"Column1")).Substring(6) %>
										</asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="Column2"></asp:BoundColumn>
							</Columns>
						</asp:DataGrid></td>
				</tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD>
			<asp:Label id="lblError" runat="server"></asp:Label>
		</TD>
	</TR>
</TABLE>

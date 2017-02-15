<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.PlannedGivingPortlet.Main" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<div class="pSection">
	<asp:Table ID="tblError" Runat="server" Visible="False" Width="100%">
		<asp:TableRow>
			<asp:TableCell>
				<asp:Label ID="lblError" CssClass="PortletError" Runat="server"/>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<asp:Table Runat="server" ID="tblTopHeader" GridLines="None" Visible="False" CellPadding="0"
		CellSpacing="0" Width="100%" BorderStyle="None">
		<asp:TableRow CssClass="crmheader">
			<asp:TableCell Width="33%" HorizontalAlign="Center">
				<%=Globalizer.GetGlobalizedString("TXT_NAME")%>
			</asp:TableCell>
			<asp:TableCell Width="33%" HorizontalAlign="Center">
				<%=Globalizer.GetGlobalizedString("TXT_STATUS")%>
			</asp:TableCell>
			<asp:TableCell Width="34%" HorizontalAlign="Center">
				<%=Globalizer.GetGlobalizedString("TXT_STEW_MAN_AMT")%>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow>
			<asp:TableCell ColumnSpan="3">
				<asp:Repeater ID="rptMain" Runat="server">
					<ItemTemplate>
						<asp:Table Runat="server" GridLines="None" CellPadding="0" CellSpacing="1" Width="100%" BorderStyle="None">
							<asp:TableRow>
								<asp:TableCell CssClass="crmsubheader">
									<asp:Label Runat="server" ID="lblInstName">
										<%# DataBinder.Eval( Container.DataItem, "PGTypeName" )%>
									</asp:Label>
								</asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell>
									<asp:DataGrid ID="dgMain" Runat="server" GridLines="None" Width="100%"
										CellPadding="0" CellSpacing="1" ShowHeader="False" OnItemCommand="dgMain_ItemCommand"
										DataKeyField="PGKeyInformation" AlternatingItemStyle-CssClass="alt"
										AutoGenerateColumns="False">
										<Columns>
											<asp:TemplateColumn ItemStyle-Width="33%">
												<ItemTemplate>
													<asp:LinkButton ID="lnkPG" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "PGKeyInformation")%>' CommandName="PGKeyInformation">
														<%#DataBinder.Eval(Container.DataItem, "ConstituentName")%>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn ItemStyle-Width="33%" DataField="CurrentPGStatus" />
											<asp:BoundColumn ItemStyle-Width="34%" DataField="PGAmount" ItemStyle-HorizontalAlign="Right" />
										</Columns>
									</asp:DataGrid>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</ItemTemplate>
				</asp:Repeater>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
</div>

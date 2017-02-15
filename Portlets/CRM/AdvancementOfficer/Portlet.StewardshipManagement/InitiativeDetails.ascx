<%@ Control Language="c#" AutoEventWireup="false" Codebehind="InitiativeDetails.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.StewardshipManagementPortlet.InitiativeDetails" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<div class="pSection">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td vAlign="top" width="48%">
				<table cellSpacing="1" cellPadding="0" width="100%" border="0">
					<tr class="crmheader">
						<td align="center" width="40%"><asp:label id="lblIni" Runat="server"></asp:label></td>
						<td align="center" width="30%"><asp:label id="lblCamp" Runat="server"></asp:label></td>
						<td align="center" width="30%" colSpan="2"><asp:label id="lblGoal" Runat="server"></asp:label></td>
					</tr>
					<asp:Repeater id="rptInitiative" Runat="server">
						<ItemTemplate>
							<tr>
								<td class="crmsubheader" colspan="4">
									<asp:Label ID="lblGroupHeader" Runat="server">
										<%#DataBinder.Eval(Container.DataItem, "ZoneDesc")%>&nbsp;-&nbsp;
										<%#DataBinder.Eval(Container.DataItem, "ChannelDesc")%>
									</asp:Label>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<asp:DataGrid ID="dgInitiative" Runat="server" Width="100%" CellPadding="0" CellSpacing="1" ShowHeader="False"
										OnItemCommand="dgInitiative_ItemCommand" DataKeyField="InitiativeKey" BorderWidth="0" AlternatingItemStyle-CssClass="alt"
										AutoGenerateColumns="False" GridLines="None">
										<Columns>
											<asp:TemplateColumn ItemStyle-Width="40%">
												<ItemTemplate>
													<asp:LinkButton ID="lnkInitiativeName" Runat="server" Visible="True" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "InitiativeKey")%>' CommandName="InitiativeName">
														<%#DataBinder.Eval(Container.DataItem, "InitiativeName")%>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="30%" DataField="CampaignDesc"></asp:BoundColumn>
											<asp:BoundColumn ItemStyle-VerticalAlign="Top" ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Right"
												DataField="GoalAmount"></asp:BoundColumn>
											<asp:TemplateColumn ItemStyle-Width="5%">
												<ItemTemplate>
													<asp:Image ID="Arrow" Runat="server" Visible="False" />
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
									</asp:DataGrid>
								</td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
				</table>
			</td>
			<td width="1%">&nbsp;</td>
			<td vAlign="top" width="51%">
				<h4><asp:Label ID="lblIniDtls" Runat="server"></asp:Label></h4>
				<table cellSpacing="0" cellPadding="0" width="100%" border="0">
					<tr>
						<th>
							<asp:Label ID="lblIniName" Runat="server"></asp:Label>
						</th>
					</tr>
				</table>
				<hr>
				<asp:DataGrid id="dgInitiativeDetails" Runat="server" AutoGenerateColumns="False" GridLines="None"
					AlternatingItemStyle-CssClass="alt" BorderWidth="0" ShowHeader="False" CellSpacing="1" CellPadding="0"
					Width="100%">
					<Columns>
						<asp:BoundColumn DataField="Name" ItemStyle-HorizontalAlign="Right" />
						<asp:BoundColumn DataField="Value" />
					</Columns>
				</asp:DataGrid>
				<table cellSpacing="0" cellPadding="0" width="100%" border="0">
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
				<asp:DataGrid id="dgGrant" Runat="server" AutoGenerateColumns="False" GridLines="None" AlternatingItemStyle-CssClass="alt"
					BorderWidth="0" ShowHeader="True" CellSpacing="1" CellPadding="0" Width="100%" DataKeyField="GrantKey"
					OnItemCommand="dgGrant_ItemCommand">
					<Columns>
						<asp:TemplateColumn HeaderStyle-CssClass="crmheader">
							<ItemTemplate>
								<asp:LinkButton ID="lnkGrant" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "GrantKey")%>' CommandName="cnGrant">
									<%#DataBinder.Eval(Container.DataItem, "GrantmakerName")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="GrantStatusDesc"></asp:BoundColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"
							DataField="GrantAwardAmount"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
				<asp:DataGrid id="dgPatrons" Runat="server" AutoGenerateColumns="False" GridLines="None" AlternatingItemStyle-CssClass="alt"
					BorderWidth="0" ShowHeader="True" CellSpacing="1" CellPadding="0" Width="100%" DataKeyField="PatronKey"
					OnItemCommand="dgPatrons_ItemCommand">
					<Columns>
						<asp:TemplateColumn HeaderStyle-CssClass="crmheader">
							<ItemTemplate>
								<asp:LinkButton ID="lnkPatron" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "PatronKey")%>' CommandName="cnPatron">
									<%#DataBinder.Eval(Container.DataItem, "PatronName")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="EntityTypeDesc"></asp:BoundColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="PatronBeginDate"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
				<asp:DataGrid id="dgStaff" Runat="server" AutoGenerateColumns="False" GridLines="None" AlternatingItemStyle-CssClass="alt"
					BorderWidth="0" ShowHeader="True" CellSpacing="1" CellPadding="0" Width="100%" DataKeyField="StaffKey"
					OnItemCommand="dgStaff_ItemCommand">
					<Columns>
						<asp:TemplateColumn HeaderStyle-CssClass="crmheader">
							<ItemTemplate>
								<asp:LinkButton ID="lnkStaff" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "StaffKey")%>' CommandName="cnStaff">
									<%#DataBinder.Eval(Container.DataItem, "StaffName")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="StaffRoleDesc"></asp:BoundColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="Specialty"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
				<asp:DataGrid id="dgRequisites" Runat="server" AutoGenerateColumns="False" GridLines="None" AlternatingItemStyle-CssClass="alt"
					BorderWidth="0" ShowHeader="True" CellSpacing="1" CellPadding="0" Width="100%">
					<Columns>
						<asp:TemplateColumn HeaderStyle-CssClass="crmheader">
							<ItemTemplate>
								<asp:Label ID="lblCriteria" Runat="server">
									<%#DataBinder.Eval(Container.DataItem, "RequisiteTypeDesc") + "<br/>" + DataBinder.Eval(Container.DataItem, "RequisiteDetails")%>
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="RequiredPreferred" ItemStyle-VerticalAlign="Top"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
				<asp:DataGrid id="dgRecipients" Runat="server" AutoGenerateColumns="False" GridLines="None" AlternatingItemStyle-CssClass="alt"
					BorderWidth="0" ShowHeader="True" CellSpacing="1" CellPadding="0" Width="100%" DataKeyField="RecipientKey"
					OnItemCommand="dgRecipients_ItemCommand">
					<Columns>
						<asp:TemplateColumn HeaderStyle-CssClass="crmheader">
							<ItemTemplate>
								<asp:LinkButton ID="lnkRecipient" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "RecipientKey")%>' CommandName="cnRecipient">
									<%#DataBinder.Eval(Container.DataItem, "RecipientName")%>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="AcademicYear"></asp:BoundColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="Session"></asp:BoundColumn>
						<asp:BoundColumn HeaderStyle-CssClass="crmheader" DataField="RecipientAwardAmount" HeaderStyle-HorizontalAlign="Right"
							ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
					</Columns>
				</asp:DataGrid>
			</td>
		</tr>
	</table>
</div>

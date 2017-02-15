<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DashboardMain_View.ascx.cs" Inherits="DashboardAdminPortlet.DashboardMain_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register
	Tagprefix="common"
	Assembly="Jenzabar.Common"
	Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="transactionHistory" runat="server">
	<table class="dataGrid" cellSpacing="3" cellPadding="0">
		<tbody class="ghead">
			<tr>
				<td colspan="4"><common:errordisplay id="errDisp" runat="server"></common:errordisplay></td>
			</tr>
			<tr>
				<td align="left">
					<common:GroupedGrid id="dgDashboard" Runat="server" datakeyfield="ID">
						<tableheadertemplate>
							DashboardItems
						</tableheadertemplate>
						<Columns>
							<asp:TemplateColumn HeaderText="Dashboard" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"name") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<common:EditButtonColumn />
						</Columns>
						<EmptyTableTemplate>
							<%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
						</EmptyTableTemplate>
					</common:GroupedGrid>
				</td>
			</tr>
		</tbody>
	</table>
</div>

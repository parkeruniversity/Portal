<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ItemMain_View.ascx.cs" Inherits="DashboardAdminPortlet.ItemMain_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
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
					<common:GroupedGrid id="dgDashboardItems" Runat="server" datakeyfield="ID">
						<tableheadertemplate>
							DashboardItems
						</tableheadertemplate>
						<Columns>
							<asp:TemplateColumn HeaderText="Dashboard Item" HeaderStyle-Width="100" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<b>
										<%# DataBinder.Eval(Container.DataItem,"label") %>
									</b>
								</ItemTemplate>
							</asp:TemplateColumn>
							<common:EditButtonColumn />
							<common:DeleteButtonColumn />
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

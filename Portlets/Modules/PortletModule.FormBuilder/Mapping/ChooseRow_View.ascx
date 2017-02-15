<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ChooseRow_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Mapping.ChooseRow_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<cmn:superbreadcrumbs id="brdCrumbs" runat="server"/>
		<h5><b><%= Globalizer.GetGlobalizedString("TXT_CHOOSE_ROW")%></b></h5>
		<cmn:ErrorDisplay id="errorDisplay" runat="server" visible="False" />
		<div class="pSection">
			<div>
				<asp:Literal ID="litQuestion" Runat="server" />
			</div>
			<br>
			<div>
				<asp:Literal ID="litTable" Runat="server" />
			</div>
			<br>
			<cmn:hint id=hntTables runat=server TextKey="MSG_FB_CHOOSE_ROW" />
			<asp:Repeater id="rptRows" runat="server">
				<HeaderTemplate>
					<table class="GridStyle" cellSpacing="0" cellPadding="0">
						<thead>
							<tr>
								<td colspan="2">
										<i><%= Globalizer.GetGlobalizedString("LBL_ROWS_IN_TABLE") %></i> <asp:Literal ID="litTableName" Runat="server" />
								</td>
							</tr>
							<tr>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_COMPLEX_ROW") %>
								</th>
								<th class="RightTableCell">
									<%= Globalizer.GetGlobalizedString("TXT_QUESTIONS_CURRENTLY_ASSIGNED") %>
								</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr <%= RowClass %>>
						<td>
							<a id="lnkMapData" runat="server" />
						</td>
						<td class="RightTableCell">
							<%# DataBinder.Eval(Container.DataItem, "Label") %>
						</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
						</tbody>
					</table> 
				</FooterTemplate>
			</asp:Repeater>
			<div>
				<a id="lnkNewRow" runat="server"><img src=<%= this.ResolveUrl("~/UI/Common/Images/PortletImages/Icons/add.gif")%> /> 
					<%= Globalizer.GetGlobalizedString("TXT_FB_CREATE_NEW_ROW")%>
				</a>
			</div>
			<br>
			<div>
				<a href="<%= ParentPortlet.GetNextScreenURL("FormBuilder//Main_View//" + formID) %>">
					<%= Globalizer.GetGlobalizedString("TXT_BACK_TO_MAIN") %>
				</a>
			</div>
		</div>
	</div>
</div>
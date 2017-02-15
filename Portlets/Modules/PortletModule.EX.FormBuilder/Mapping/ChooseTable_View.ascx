<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ChooseTable_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Mapping.ChooseTable_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<cmn:superbreadcrumbs id="brdCrumbs" runat="server"/>
		<h5><b><%= Globalizer.GetGlobalizedString("TXT_MAPPING_STEP_ONE_DETAIL") %></b></h5>
		<cmn:ErrorDisplay id="errorDisplay" runat="server" visible="False" />
		<div class="pSection">
			<div>
				<asp:Literal ID="litQuestion" Runat="server" />
			</div>
			<cmn:hint id=hntTables runat=server TextKey="MSG_FB_CHOOSE_TABLE" />
			<asp:Repeater id="rptTables" runat="server">
				<HeaderTemplate>
					<table cellSpacing="0" cellPadding="0" width="100%" style="display:<%=displayPaginationRpt%>;">
						<tr>
							<td width="250" align="right"><%=paginateBeginAscx%> | <%=paginateEndAscx%></td>
							<td width="250" align="right"><%=nextPrevLink%></td>
						</tr>
					</table>
					<table class="GridStyle" cellSpacing="0" cellPadding="0" width="100%">
						<thead>
							<tr>
								<td colspan="3">
									<%= Globalizer.GetGlobalizedString("TXT_AVAILABLE_TABLES") %>
								</td>
							</tr>
							<tr>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_DISPLAY_NAME") %>
								</th>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_ACTUAL_NAME") %>
								</th>
								<th class="RightTableCell">
									<%= Globalizer.GetGlobalizedString("TXT_DESCRIPTION") %>
								</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr <%= RowClass %>>
						<td>
							<a href="<%# ParentPortlet.GetNextScreenURL("FormBuilder//Mapping\\" 
								+ DataBinder.Eval(Container.DataItem, "Screen") + "_View//" 
								+ DataBinder.Eval(Container.DataItem, "Form") + "//"
								+ DataBinder.Eval(Container.DataItem, "Question") + "//"
								+ DataBinder.Eval(Container.DataItem, "ID") + "//" 
								+ DataBinder.Eval(Container.DataItem, "Row")) %>">
								<%# DataBinder.Eval(Container.DataItem, "FriendlyName") %>
							</a>
						</td>
						<td>
							<%# DataBinder.Eval(Container.DataItem, "Name") %>
						</td>
						<td class="RightTableCell">
							<%# DataBinder.Eval(Container.DataItem, "Desc") %>
						</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
						</tbody>
					</table>
					<table cellSpacing="0" cellPadding="0" width="500" style="display:<%=displayPaginationRpt%>;">
						<tr>
							<td width="250" align="right"><%=paginateBeginAscx%> | <%=paginateEndAscx%></td>
							<td width="250" align="right"><%=nextPrevLink%></td>
						</tr>
					</table>
				</FooterTemplate>
			</asp:Repeater>
			<asp:Repeater ID="rptTablesNoDesc" Runat="server" Visible="False">
				<HeaderTemplate>
					<table cellSpacing="0" cellPadding="0" width="100%" style="display:<%=displayPaginationRptNoDesc%>;">
						<tr>
							<td width="250" align="right"><%=paginateBeginAscx%> | <%=paginateEndAscx%></td>
							<td width="250" align="right"><%=nextPrevLink%></td>
						</tr>
					</table>
					<table class="GridStyle" cellSpacing="0" cellPadding="0" width="100%">
						<thead>
							<tr>
								<td colspan="2">
									<%= Globalizer.GetGlobalizedString("TXT_AVAILABLE_TABLES") %>
								</td>
							</tr>
							<tr>
								<th>
									<%= Globalizer.GetGlobalizedString("TXT_DISPLAY_NAME") %>
								</th>
								<th class="RightTableCell">
									<%= Globalizer.GetGlobalizedString("TXT_ACTUAL_NAME") %>
								</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr <%= RowClass %>>
						<td>
							<a href="<%# ParentPortlet.GetNextScreenURL("FormBuilder//Mapping\\" 
								+ DataBinder.Eval(Container.DataItem, "Screen") + "_View//" 
								+ DataBinder.Eval(Container.DataItem, "Form") + "//"
								+ DataBinder.Eval(Container.DataItem, "Question") + "//"
								+ DataBinder.Eval(Container.DataItem, "ID") + "//" 
								+ DataBinder.Eval(Container.DataItem, "Row")) %>">
								<%# DataBinder.Eval(Container.DataItem, "FriendlyName") %>
							</a>
						</td>
						<td class="RightTableCell">
							<%# DataBinder.Eval(Container.DataItem, "Name") %>
						</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
						</tbody>
					</table>
					<table cellSpacing="0" cellPadding="0" width="500" style="display:<%=displayPaginationRptNoDesc%>;">
						<tr>
							<td width="250" align="right"><%=paginateBeginAscx%> | <%=paginateEndAscx%></td>
							<td width="250" align="right"><%=nextPrevLink%></td>
						</tr>
					</table>
				</FooterTemplate>
			</asp:Repeater>
			<a href="<%= ParentPortlet.GetNextScreenURL("FormBuilder//Main_View//" + formID) %>">
				<%= Globalizer.GetGlobalizedString("TXT_BACK_TO_MAIN") %>
			</a>
		</div>
	</div>
</div>
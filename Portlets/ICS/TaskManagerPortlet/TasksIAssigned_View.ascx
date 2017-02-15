<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TasksIAssigned_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.TasksIAssigned_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="task" namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" Assembly="Portlet.TaskManager" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" %>

<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>

<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />

	<task:TaskSearchPanel ID="ctlSearchPanel" runat=server></task:TaskSearchPanel>
	<p></p>
	<div><cmn:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
	<cmn:groupedgrid id="ItemsGrid" runat="server" allowsorting="True" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID">
		<GroupHeaderTemplate>
		</GroupHeaderTemplate>
		<Columns>
			<cmn:CheckBoxColumn />
			<asp:TemplateColumn HeaderText="Task" SortExpression="Name">
				<ItemTemplate>
					<asp:LinkButton id="lnkViewDetails" runat="server" CommandName="ViewAssignedTask" CausesValidation="False">
						<%# ((Task)Container.DataItem).Name %>
					</asp:LinkButton>
					<span>
						<asp:ImageButton ID="EditItemLink" CommandName="EditItem" Runat="server" Visible="False" />
						<asp:ImageButton ID="DeleteItemLink" CommandName="DeleteItem" Runat="server" Visible="False" />
					</span>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Status" SortExpression="CompleteStatus">
				<ItemTemplate>
					<%# String.Format(Globalizer.GetGlobalizedString("TXT_FORMAT_PERCENTAGE_COMPLETE"), ((Task)Container.DataItem).CompleteStatus) %>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Priority" SortExpression="Priority">
				<ItemTemplate>
					<div class="<%# ((Task)Container.DataItem).Priority %>"><%# ((Task)Container.DataItem).Priority %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DueDate" SortExpression="DueDate">
				<ItemTemplate>
					<div class='<%# ((Task)Container.DataItem).DueDate<DateTime.Now? "PastDueDate" : "" %>'><%# TMUtilities.FormatDueDate(((Task)Container.DataItem).DueDate)%></div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
		
	<asp:PlaceHolder ID="pnEdit" runat="server" Visible="True">
		<TABLE width="100%" class="hint">
			<TR>
				<TD width="70%">
				<asp:Button ID="btnDelete" Runat="server" />
				</td>
			</tr>
		</table>
	</asp:PlaceHolder>
	<p></p>
	<div align="right">
	<asp:ImageButton id="imbAddNewTask" Runat="server" CommandName="AssignTask"></asp:ImageButton>&nbsp;
	<asp:LinkButton ID="lnkAddNewTask" CommandName="AssignTask" Runat="server"></asp:LinkButton>
	</div>
	<p></p>
</div>

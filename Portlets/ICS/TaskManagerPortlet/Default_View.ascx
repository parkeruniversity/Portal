<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="task" namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" Assembly="Portlet.TaskManager" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" %>

<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>

<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />

	<task:TaskSearchPanel ID="ctlSearchPanel" DateFilter="Hidden" runat=server SelectCurrentContext="False"/>

	<cmn:groupedgrid id="ItemsGrid" runat="server" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="TaskID" allowsorting="true">
		<GroupHeaderTemplate>
		</GroupHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="Task" SortExpression="Name">
				<ItemTemplate>
					<asp:LinkButton id="lnkViewDetails" runat="server" CommandName="ViewItem" CausesValidation="False">
						<%# ((UserTask)Container.DataItem).Name %>
					</asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DueDate" SortExpression="DueDate DESC">
				<ItemTemplate>
					<div class='<%# ((UserTask)Container.DataItem).DueDate<DateTime.Now? "PastDueDate" : "" %>'><%# TMUtilities.FormatDueDate(((UserTask)Container.DataItem).DueDate) %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
	<p></p>
	<div align="right">
	<asp:ImageButton id="imbAddNewTask" Runat="server" CommandName="AddItem"></asp:ImageButton>&nbsp;
	<asp:LinkButton ID="lnkAddNewTask" CommandName="AddItem" Runat="server"></asp:LinkButton>
	</div>
	<p></p>
</div>
<div class="buttonBar">
	<asp:LinkButton ID="lnkGoToMain" Runat="server"/></asp:LinkButton>
</div>

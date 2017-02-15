<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MyToDoList_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.MyToDoList_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Portal.Framework.Data" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="task" namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" Assembly="Portlet.TaskManager" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet" %>

<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>

<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />
	<task:TaskSearchPanel ID="ctlSearchPanel" runat=server></task:TaskSearchPanel>
	<p></p>
	<div><cmn:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
	<cmn:groupedgrid id="ItemsGrid" runat="server" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="TaskID" allowsorting="true">
		<GroupHeaderTemplate>
		</GroupHeaderTemplate>
		<Columns>
			<cmn:CheckBoxColumn />
			<asp:TemplateColumn HeaderText="Task" SortExpression="Name">
				<ItemTemplate>
					<asp:LinkButton id="lnkViewDetails" runat="server" CommandName="ViewItem" CausesValidation="False">
						<%# ((UserTask)Container.DataItem).Name %>
					</asp:LinkButton>
						<span>
							<asp:ImageButton ID="EditItemLink" CommandName="EditItem" Runat="server" Visible="False" />
							<asp:ImageButton ID="DeleteItemLink" CommandName="DeleteItem" Runat="server" Visible="False" />
						</span>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="CreatedBy" SortExpression="CreatedBy">
				<ItemTemplate>
					<framework:MyInfoPopup id="MyInfoLink" runat="server" UserId="<%#((UserTask)Container.DataItem).CreatedBy.ToString()%>">
						<%# PortalUser.FindByID(new ObjectIdentifier(((UserTask)Container.DataItem).CreatedBy)).NameDetails.ToString() %> 
					</framework:MyInfoPopup>
					&nbsp;&nbsp;
					<%#(((UserTask)Container.DataItem).Context.IsRoot || ((UserTask)Container.DataItem).CreatedBy==PortalUser.Current.ID.AsGuid || ((UserTask)Container.DataItem).Context.DefaultPage==null)? "" : "<br><a href=\"" + JCUtilities.ResolveUrl(((UserTask)Container.DataItem).Context.URL) + "\">" + ((UserTask)Container.DataItem).Context.DisplayName + "</a>" %>
					  
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Status" SortExpression="Status">
				<ItemTemplate>
					<asp:DropDownList id="ddlUserTaskStatus" runat="Server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Priority" SortExpression="Priority">
				<ItemTemplate>
					<div class="<%# ((UserTask)Container.DataItem).Priority %>"><%# ((UserTask)Container.DataItem).Priority %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DueDate" SortExpression="DueDate">
				<ItemTemplate>
					<div class='<%# ((UserTask)Container.DataItem).DueDate<DateTime.Now? "PastDueDate" : "" %>'><%# TMUtilities.FormatDueDate(((UserTask)Container.DataItem).DueDate) %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
	<asp:PlaceHolder ID="pnEdit" runat="server" Visible="True">
		<TABLE class="hint" width="100%">
			<TR>
				<TD width="70%">
					<asp:Label ID="lblMarkSelected" Runat="server" />
					<asp:DropDownList ID="ddlStatus" runat="server"/>&nbsp;&nbsp;	
					<asp:Button ID="btnSetStatusMultiple" Runat="server" />
				</td>
				<td>
					<asp:Button ID="btnSave" Runat="server" />
				</td>
			</tr>
		</table>
	</asp:PlaceHolder>
	<br>
	<div align="right">
	
	<asp:ImageButton id="imbAddNewTask" Runat="server" CommandName="AddItem"></asp:ImageButton>&nbsp;
	<asp:LinkButton ID="lnkAddNewTask" CommandName="AddItem" Runat="server"></asp:LinkButton>
	</div>
	<p></p>
</div>


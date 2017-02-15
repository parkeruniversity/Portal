<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewTaskIAssigned_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.TaskManagerPortlet.ViewTaskIAssigned_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<cmn:errordisplay id=ctlError runat="server"></cmn:ErrorDisplay>
<cmn:subheader id=subHeader runat="server"></cmn:Subheader>
<div class=pSection>
<asp:PlaceHolder ID="pnEdit" Runat="server" Visible="False"></asp:PlaceHolder>
<div align="right">
	<asp:imagebutton id=imbEditItem Runat="server"  CommandName="EditItem"></asp:ImageButton>
	<asp:linkbutton id="lnkEditItem" Runat="server" CommandName="EditItem"></asp:LinkButton>
</div>
</asp:PlaceHolder>

<fieldset>
<table>
	<tr>
		<th>
			<cmn:GlobalizedLiteral runat="server" textkey="LBL_PRIORITY" />
		</th>
		<td width="70%">
			<asp:label id=lblPriority Runat="Server"></asp:Label>
		</td>
		<td rowspan="4">
			<table class="TaskStatusTable">
			<tr class="TaskStatusHeader">
				<td><strong><cmn:GlobalizedLiteral runat="server" textkey="TXT_TASK_STATUS"/></strong>
				</th>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lblTaskStatusInfo" Runat="server"/>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>
			<cmn:GlobalizedLiteral runat="server" textkey="LBL_DUE_DATE"/>
		</th>
		<td>
			<asp:label id="lblDueDate" Runat="Server"></asp:Label>
		</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><asp:label id=lblDescription Runat="Server"></asp:Label>
		</td>
	</tr>
	<tr>
		<th>
			<cmn:GlobalizedLiteral runat="server" textkey="LBL_SHOW"/>
		</th>
		<td><asp:DropDownList id="ddlContexts" AutoPostBack="True" Runat="Server"></asp:DropDownList>
		</td>
	</tr>	
  </TABLE>
  <p></p>
    <div><cmn:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
  	<cmn:groupedgrid id="ItemsGrid" runat="server" allowsorting="True" RenderGroupHeaders="True" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<%# ((PortalContext)Container.DataItem).DisplayName%> 
		</GroupHeaderTemplate>
		<GroupHeaderColumns>
			<cmn:ExpandCollapseGroupedGridColumn separatorbefore="true"></cmn:ExpandCollapseGroupedGridColumn>
		</GroupHeaderColumns>
		<GroupSubHeaderTemplate>
			<asp:Label ID="CompletedStatus" Runat="server"/>
		</GroupSubHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="Name" SortExpression="User.NameDetails">
				<ItemTemplate>
					<framework:MyInfoPopup id="MyInfoLink" runat="server" UserId="<%#((UserTask)Container.DataItem).User.ID.AsGuid.ToString()%>"/></div>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Status" SortExpression="Status">
				<ItemTemplate>
					<div nowrap><%# PortletUtilities.GetTextFromEnumValue(((UserTask)Container.DataItem).Status) %></div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>
	</cmn:groupedgrid>
</FIELDSET> 
</DIV>
<div class="buttonBar">
	<asp:LinkButton ID="lnkBack" Runat="server"/></asp:LinkButton>
</div>
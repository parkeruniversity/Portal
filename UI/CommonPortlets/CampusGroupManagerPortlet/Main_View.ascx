<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.Main_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>

<div class="pSection">

<common:GroupedGrid ID="CurrentMembers" RenderGroupHeaders="True" DataKeyField="ID" runat="server">
	<TableHeaderTemplate><asp:Literal ID="CurrentMembersHeader" Runat="server" /></TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn HeaderText="Name">
			<ItemTemplate><framework:MyInfoPopup ID="CurrentName" UserID="<%# ((CampusGroupUser)Container.DataItem).User.ID.AsGuid %>" runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Role">
			<ItemTemplate>
				<asp:DropDownList ID="Role" Runat="server" />
				<asp:LinkButton ID="DropMemberButton" CommandName="DropMember" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Date Joined">
			<ItemTemplate><asp:Label ID="lblStartDate" Runat=server></asp:Label></ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<TableFooterTemplate>
		<asp:Button ID="SaveChangesButton" CommandName="SaveChanges" Runat="server" />
	</TableFooterTemplate>
</common:GroupedGrid>

<common:GroupedGrid ID="ProspectiveMembers" RenderGroupHeaders="True" DataKeyField="ID" runat="server">
	<TableHeaderTemplate><asp:Literal ID="ProspectiveMembersHeader" Runat="server" /></TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate><asp:CheckBox ID="IsChecked" Runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Name">
			<ItemTemplate><framework:MyInfoPopup ID="ProspectiveName" UserID="<%# ((CampusGroupUser)Container.DataItem).User.ID.AsGuid %>" runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Application">
			<ItemTemplate><asp:LinkButton ID="ReviewApplicationButton" CommandName="ReviewApplication" Runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Decision">
			<ItemTemplate>
				<asp:LinkButton ID="AcceptButton" CommandName="Accept" Runat="server" />
				<asp:LinkButton ID="DeclineButton" CommandName="Decline" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<TableFooterTemplate>
		<asp:Button ID="AcceptSelectedButton" CommandName="AcceptSelected" Runat="server" />
		<asp:Button ID="DeclineSelectedButton" CommandName="DeclineSelected" Runat="server" />
	</TableFooterTemplate>
</common:GroupedGrid>

<common:GroupedGrid ID="InvitedMembers" RenderGroupHeaders="True" DataKeyField="ID" runat="server">
	<TableHeaderTemplate><asp:Literal ID="InvitedMembersHeader" Runat="server" /></TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate><asp:CheckBox ID="IsChecked" Runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Name">
			<ItemTemplate><framework:MyInfoPopup ID="InvitedName" UserID="<%# ((CampusGroupUser)Container.DataItem).User.ID.AsGuid %>" runat="server" />
			            <em><asp:Literal ID="EmailComment" runat="server" /></em>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Action">
			<ItemTemplate>
				<asp:LinkButton ID="RemoveButton" CommandName="Remove" Runat="server" />
				<asp:LinkButton ID="ReinviteButton" CommandName="Reinvite" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<TableFooterTemplate>
		<asp:Button ID="RemoveSelectedButton" CommandName="RemoveSelected" Runat="server" />
		<asp:Button ID="ReinviteSelectedButton" CommandName="ReinviteSelected" Runat="server" />
	</TableFooterTemplate>
</common:GroupedGrid>
</div>
<div class="buttonBar">
	<asp:Button ID="InviteButton" Runat="server" />
	<common:GlobalizedButton ID="ExitButton" TextKey="TXT_EXIT_GROUP_MANAGER" runat="server" />
</div>



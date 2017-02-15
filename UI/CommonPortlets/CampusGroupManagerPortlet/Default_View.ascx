<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.Default_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>

<style>
	.decisionButton { padding-right: 10px; }
	.CGMButtonBar { border-top: 1px solid #000000; font-size: 80%; text-align: right; padding: 5px; }
</style>

<common:GroupedGrid ID="CurrentMembers" RenderGroupHeaders="True" runat="server">
	<TableHeaderTemplate>Current Members</TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn HeaderText="Name">
			<ItemTemplate><framework:MyInfoPopup ID="CurrentName" UserID="<%# ((CampusGroupUser)Container.DataItem).User.ID.AsGuid %>" runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Date Joined">
			<ItemTemplate><%# ((CampusGroupUser)Container.DataItem).StartDate.ToShortDateString() %></ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</common:GroupedGrid>

<common:GroupedGrid ID="ProspectiveMembers" RenderGroupHeaders="True" DataKeyField="ID" runat="server">
	<TableHeaderTemplate>Prospective Members</TableHeaderTemplate>
	<Columns>
		<asp:TemplateColumn HeaderText="Name">
			<ItemTemplate><framework:MyInfoPopup ID="ProspectiveName" UserID="<%# ((CampusGroupUser)Container.DataItem).User.ID %>" runat="server" /></ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Decision">
			<ItemTemplate>
				<asp:LinkButton ID="AcceptButton" CommandName="Accept" CssClass="decisionButton" Runat="server" />
				<asp:LinkButton ID="DeclineButton" CommandName="Decline" CssClass="decisionButton" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</common:GroupedGrid>

<div class="CGMButtonBar"><asp:LinkButton ID="InviteButton" Runat="server" /></div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.AnnouncementPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.AnnouncementPortlet" %>
<%@ Import namespace="Jenzabar.ICS" %>

<style>
	.groupedGrid { margin-bottom: 15px; }
</style>

<div class="pSection">
<common:groupedgrid id="InboxGrid" RenderGroupHeaders="True" AllowSorting="True" DataKeyField="ID" runat="server">
	<GROUPHEADERTEMPLATE>
		<%# Container.DataItem.ToString() %>
		<asp:DropDownList id="GroupBy" Visible="False" Runat="server"></asp:DropDownList>
	</GROUPHEADERTEMPLATE>
	<SUBGROUPHEADERTEMPLATE>
		<%# Container.DataItem.ToString() %>
	</SUBGROUPHEADERTEMPLATE>
	<COLUMNS>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:Label ID="lblIsSelectedInbox" AssociatedControlID="IsSelectedInbox" CssClass="accessibility" Runat=server>Select this row</asp:Label>
				<asp:CheckBox id="IsSelectedInbox" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
		<common:expandcollapsecolumn HeaderText="Subject" SortExpression="Title" DataTextField="Title"></common:expandcollapsecolumn>
		<ASP:TEMPLATECOLUMN HeaderText="Author" SortExpression="Author.NameDetails">
			<ITEMTEMPLATE>
				<framework:MyInfoPopup ID="MyInfoLink" UserID="<%# DisplayAuthorID((Announcement)Container.DataItem) %>" 
						visible="<%# !((Announcement)Container.DataItem).IsAnonymous %>" runat="server" />
				<common:GlobalizedLabel ID="AnonymousLabel" Visible="<%# ((Announcement)Container.DataItem).IsAnonymous %>" TextKey="TXT_ANONYMOUS" runat="server" />
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		<ASP:BOUNDCOLUMN HeaderText="Date" SortExpression="StartDate" DataField="StartDate"></ASP:BOUNDCOLUMN>
	</COLUMNS>
	<subitemtemplate>
		<%# ((Announcement)Container.DataItem).Details %>
	</subitemtemplate>
	<TABLEFOOTERTEMPLATE>
		<asp:LinkButton id="RemoveMultipleButton" Runat="server" CommandName="RemoveMultiple"><%= Globalizer.GetGlobalizedString("TXT_REMOVE_SELECTED") %></asp:LinkButton>
	</TABLEFOOTERTEMPLATE>
	<EmptyGroupTemplate><%# Globalizer.GetGlobalizedString("MSG_ANNOUNCEMENT_NO_ANNOUNCEMENTS") %></EmptyGroupTemplate>
</common:groupedgrid>

<common:PageNavigator ID="InboxPaging" AutoBind="false" runat="server" />

<common:groupedgrid id="OutboxGrid" RenderGroupHeaders="True" AllowSorting="True" DataKeyField="ID" runat="server">
	<ITEMSTYLE Width="100%"></ITEMSTYLE>
	<GROUPHEADERTEMPLATE>
		<%# Container.DataItem.ToString() %>
	</GROUPHEADERTEMPLATE>
	<SUBGROUPHEADERTEMPLATE>
		<%# Container.DataItem.ToString() %>
	</SUBGROUPHEADERTEMPLATE>
	<COLUMNS>
		<ASP:TEMPLATECOLUMN>
			<ITEMTEMPLATE>
			<asp:Label ID="Label1" AssociatedControlID="IsSelectedOutbox" CssClass="accessibility" Runat=server>Select this row</asp:Label>
				<asp:CheckBox id="IsSelectedOutbox" Runat="server" />
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		<common:expandcollapsecolumn HeaderText="Subject" SortExpression="Title" DataTextField="Title"></common:expandcollapsecolumn>
		<ASP:TEMPLATECOLUMN>
        	<HeaderTemplate>Date</HeaderTemplate>
			<ITEMTEMPLATE>
				<asp:Label ID="StartDate" Runat="server" >
					<%# DataBinder.Eval(Container.DataItem, "StartDate")%>
				</asp:Label>
 				<common:globalizedlabel id="NoStartDate" runat="server" TextKey="TXT_ANNOUNCEMENTPORTLET_NO_DATE_SET" visible="false"></common:globalizedlabel>
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		<common:ImageCommandColumn CommandName="EditAnnouncement" ImageUrl="edit.gif"></common:ImageCommandColumn>
		<common:ImageCommandColumn CommandName="DeleteAnnouncement" ImageUrl="delete.gif"></common:ImageCommandColumn>
	</COLUMNS>
	<subitemtemplate>
		<%# ((Announcement)Container.DataItem).Details %>
	</subitemtemplate>
	<TABLEFOOTERTEMPLATE>
		<asp:LinkButton id="DeleteMultipleButton" Runat="server" CommandName="DeleteMultiple"><%= Globalizer.GetGlobalizedString("TXT_DELETE_SELECTED") %></asp:LinkButton>
	</TABLEFOOTERTEMPLATE>
</common:groupedgrid>

<common:groupedgrid id="AllAnnouncementsGrid" runat="server" RenderGroupHeaders="True" AllowSorting="True" DataKeyField="ID" AllowChecks="true" visible="false">
	<ITEMSTYLE Width="100%"></ITEMSTYLE>
	<GroupHeaderTemplate><%# Container.DataItem.ToString() %></GroupHeaderTemplate>
	<COLUMNS>
		<ASP:TEMPLATECOLUMN>
			<ITEMTEMPLATE>
			<asp:Label ID="Label2" AssociatedControlID="IsSelectedAll" CssClass="accessibility" Runat=server>Select this row</asp:Label>
				<asp:CheckBox id="IsSelectedAll" Runat="server"></asp:CheckBox>
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		<common:expandcollapsecolumn HeaderText="Subject" SortExpression="Title" DataTextField="Title"></common:expandcollapsecolumn>
		<ASP:TEMPLATECOLUMN HeaderText="Author" SortExpression="Author.NameDetails">
			<ITEMTEMPLATE>
				<framework:MyInfoPopup ID="AllAnnMyInfoLink" UserID="<%# DisplayAuthorID((Announcement)Container.DataItem) %>" 
						visible="<%# !((Announcement)Container.DataItem).IsAnonymous %>" runat="server" />
				<common:GlobalizedLabel ID="AllAnnAnonymousLabel" Visible="<%# ((Announcement)Container.DataItem).IsAnonymous %>" TextKey="TXT_ANONYMOUS" runat="server" />
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		<ASP:BOUNDCOLUMN HeaderText="Date" SortExpression="StartDate" DataField="StartDate"></ASP:BOUNDCOLUMN>
		<common:ImageCommandColumn CommandName="EditAnnouncement" ImageUrl="edit.gif"></common:ImageCommandColumn>
		<common:ImageCommandColumn CommandName="DeactivateAnnouncement" ImageUrl="delete.gif"></common:ImageCommandColumn>
	</COLUMNS>
	<subitemtemplate>
		<%# ((Announcement)Container.DataItem).Details %>
	</subitemtemplate>
	<TABLEFOOTERTEMPLATE>
		<asp:LinkButton id="DeactivateMultipleButton" Runat="server" CommandName="DeactivateMultiple"></asp:LinkButton>
	</TABLEFOOTERTEMPLATE>
</common:groupedgrid>
</div>
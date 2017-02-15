<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.AnnouncementPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.ICS" %>

<style>
	ul.defaultAnnouncements { padding: 0px; }
	ul.defaultAnnouncements li { padding: 5px 0px; }
	ul.defaultAnnouncements .author { font-size: 80%; }
</style>

<div class="pSection">

	<asp:Repeater ID="InboxAnnouncements" Runat="server">
		<HeaderTemplate>
			<ul class="defaultAnnouncements">
		</HeaderTemplate>
		<ItemTemplate>
		<li>
			<div class="title"><asp:LinkButton ID="Title" CommandName="ViewAnnouncement" Runat="server"><%# ((Announcement)Container.DataItem).Title %></asp:LinkButton></div>
			<div id="Author" class="author" runat="server" />
		</li>
		</ItemTemplate>
		<FooterTemplate>
			</ul>
		</FooterTemplate>
	</asp:Repeater>

	<div id="NoAnnouncementsText" visible="false" runat="server" />

</div>

<div class="buttonBar">
	<asp:LinkButton ID="ShowAllButton" Runat="server" />
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="BrowseGroups_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet.BrowseGroups_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>

<div class="pSection">

<div id="KeywordSearchBar" class="keywordSearch" runat="server">
	<common:FormLabel ID="KeywordSearchLabel" ForControl="KeywordSearch" Runat="server" />
	<asp:TextBox ID="KeywordSearch" Runat="server" />
	<asp:Button ID="KeywordSearchButton" Runat="server" />
</div>

<common:GroupedGrid ID="CampusGroupsGrid" DataKeyField="ID" runat="server">
	<GroupHeaderTemplate><%# ((Header)Container.DataItem).Name %></GroupHeaderTemplate>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="CampusGroupButton" CommandName="ViewCampusGroup" Runat="server"><%# ((CampusGroup)Container.DataItem).Name %></asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="Status" CommandName="JoinGroup" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<EmptyTableTemplate><common:GlobalizedLabel ID="NoGroupsExistText" TextKey="MSG_CAMPUSGROUP_NO_GROUPS_EXIST" Runat="server" /></EmptyTableTemplate>
</common:GroupedGrid>
</div>
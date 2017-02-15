<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>
<div class="pSection">
<common:GroupedGrid id="CampusGroupsGrid" DataKeyField="ID" runat="server">
	<tableheadertemplate><asp:Literal ID="lblMyGroups" Runat="server" /></tableheadertemplate>
	<COLUMNS>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="GroupButton" CommandName="ViewGroup" Runat="server"><%# ((CampusGroup)Container.DataItem).Name %></asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<common:GlobalizedLinkButton ID="DropGroupButton" Runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</COLUMNS>
	<EmptyTableTemplate><asp:Literal ID="lblNoGroups" Runat="server" /></EmptyTableTemplate>
</common:GroupedGrid>
<p><asp:LinkButton ID="BrowseGroups" Runat="server" /></p>
<p><asp:LinkButton ID="CreateNewGroup" Runat="server" /></p>
</div>
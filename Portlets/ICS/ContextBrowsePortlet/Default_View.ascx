<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ContextBrowsePortlet.Default_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>

<table id="ContextList" runat="server">
	<tr>
		<td valign="top">
			<asp:Repeater ID="LeftColumn" Runat="server">
				<HeaderTemplate><ul></HeaderTemplate>
				<ItemTemplate>
					<li><a href="<%# ((PortalContext)Container.DataItem).URL %>"><%# ((PortalContext)Container.DataItem).DisplayName %></a></li>
				</ItemTemplate>
				<FooterTemplate></ul></FooterTemplate>
			</asp:Repeater>
		</td>
		<td valign="top">
			<asp:Repeater ID="RightColumn" Runat="server">
				<HeaderTemplate><ul></HeaderTemplate>
				<ItemTemplate>
					<li><a href="<%# ((PortalContext)Container.DataItem).URL %>"><%# ((PortalContext)Container.DataItem).DisplayName %></a></li>
				</ItemTemplate>
				<FooterTemplate></ul></FooterTemplate>
			</asp:Repeater>
		</td>
	</tr>
</table>

<div id="NoContextsSection" class="pSection" visible="false" runat="server">
	<common:GlobalizedLabel ID="NoContextsMessage" TextKey="MSG_BROWSE_NO_SUBCONTEXTS" runat="server" />
</div>

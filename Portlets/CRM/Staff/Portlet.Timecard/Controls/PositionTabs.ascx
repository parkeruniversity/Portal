<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PositionTabs.ascx.cs" Inherits="Portlet.Timecard.Controls.PositionTabs" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<common:GlobalizedLinkButton ID="MoreLink" TextKey="MSG_TIMECARDPORTLET_OTHER_POSITIONS" Visible="false" CssClass="tcMorePositionsLink" runat="server" />
<asp:Repeater ID="PositionList" runat="server">
	<HeaderTemplate>
		<div class="contentTabs">
			<ul>
				<li style="visibility:hidden;margin:0;padding:0;">&nbsp</li>
	</HeaderTemplate>
	<ItemTemplate>
		<li id="PositionItem" runat="server"><asp:LinkButton ID="PositionLink" CausesValidation="false" runat="server" /></li>
	</ItemTemplate>
	<FooterTemplate>
			</ul>
		</div>
	</FooterTemplate>
</asp:Repeater>

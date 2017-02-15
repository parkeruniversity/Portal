<%@ Control Language="c#" AutoEventWireup="True" Codebehind="PayGroupPeriodDisplay.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.PayGroupPeriodDisplay" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>

<asp:Repeater ID="ActivePeriods" runat="server">
<HeaderTemplate>
	<table class="tabularData">
		<thead>
			<tr class="header">
				<td colspan="3">
					<span id="Header" runat="server" style="float:left;" />
					<span style="float:right; padding-left:30px;">
						<asp:DropDownList ID="DisplayPeriod" AutoPostBack="true" style="margin:0px; padding:0px;" runat="server" />
					</span>
					<div style="clear: both"></div>
				</td>
			</tr>
			<tr>
				<th><common:GlobalizedLabel ID="lblPayGroup" TextKey="TXT_PAY_GROUP" runat="server" /></th>
				<th><%= Globalizer.GetGlobalizedString((this.DisplayFormat == DisplayFormatType.Minimal) ? "TXT_PERIOD_END" : "TXT_ACTIVE_PERIODS")%></th>
				<th><common:GlobalizedLabel ID="lblStatus" TextKey="TXT_STATUS" runat="server" /></th>
			</tr>
		</thead>
		<tr id="NoDataRow" visible="false" runat="server">
			<td colspan="3">
				<common:GlobalizedLabel ID="NoPayGroupsMessage" TextKey="MSG_TCAPPROVALPORTLET_NO_PAY_GROUPS_FOR_PERIOD" runat="server" />
			</td>
		</tr>
		<tbody>
</HeaderTemplate>
<ItemTemplate>
			<tr class="<%# (Container.ItemIndex % 2 == 1) ? "alt" : "" %>">
				<td valign="top">
					<asp:LinkButton ID="PayGroupButton" runat="server" />
				</td>
				<td valign="top">
					<asp:Repeater id="PeriodList" runat="server">
						<HeaderTemplate><ul></HeaderTemplate>
						<ItemTemplate>
							<li>
								<framework:PortalImageAndTextButton ID="PeriodLink" 
										ImageCategory="PortletIcon" ImageUrl="view-icon.gif" runat="server" />
							</li>
						</ItemTemplate>
						<FooterTemplate></ul></FooterTemplate>
					</asp:Repeater>
					<common:GlobalizedLabel ID="NoPeriodsMessage" Visible="false" TextKey="TXT_NO_ACTIVE_PAY_PERIODS" runat="server" />
				</td>
				<td valign="top">
					<asp:Repeater id="PeriodStatusList" runat="server">
						<HeaderTemplate><ul></HeaderTemplate>
						<ItemTemplate><li><asp:Label ID="PeriodStatus" runat="server" /></li></ItemTemplate>
						<FooterTemplate></ul></FooterTemplate>
					</asp:Repeater>
				</td>
			</tr>
</ItemTemplate>
<FooterTemplate>
		</tbody>
	</table>
</FooterTemplate>
</asp:Repeater>

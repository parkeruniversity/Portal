<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ReadingPortlet" %> 
<div class="pSection">
	<div><jenzabar:PageNavigator id="pNav" AutoBind="False" runat="server" /></div>
	<jenzabar:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" GroupKeyField="ID" HideTableHeadersWhenGridIsEmpty="True" EnableAutoConfirmation="False" CellPadding="0">
		<GroupHeaderTemplate>
			<div class="PortletSetTitle"><%# ((Header)Container.DataItem).Name %></div>
		</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<div class="PortletSetDescription"><%# ((Header)Container.DataItem).Description %></div>
		</GroupSubHeaderTemplate>			
		<GroupHeaderColumns>
			<jenzabar:ExpandCollapseGroupedGridColumn separatorbefore="true"></jenzabar:ExpandCollapseGroupedGridColumn>
		</GroupHeaderColumns>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
				<span class="PortletItemTitle">
						<asp:LinkButton id="lnkViewDetails" runat="server" CommandName="ViewItem" CausesValidation="False">
							<%# ((Reading)Container.DataItem).Title %>
						</asp:LinkButton></span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="PortletItemDescription"><%# (((Reading)Container.DataItem).Pages=="") ? "" : String.Format(Globalizer.GetGlobalizedString("TXT_FORMAT_PAGES_ABBR"), ((Reading)Container.DataItem).Pages) %></span>
				<div class="PortletItemDescription"><%# ((Reading)Container.DataItem).Author %></div>
				<div class="PortletItemDescription"><%# ((Reading)Container.DataItem).Edition %></div>
				<div class="PortletItemDescription"><%# (((Reading)Container.DataItem).URL=="") ? "" : "<a href='"+((Reading)Container.DataItem).URL + "' target='_blank'>" + ((Reading)Container.DataItem).URLLabel + "</a>" %></div>
				<div class="PortletItemStatus"><%# PortletUtilities.GetTextFromEnumValue(((Reading)Container.DataItem).Status) %></div>
			</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_READINGS_FOR_PORTLET")%></EmptyTableTemplate>
	</jenzabar:groupedgrid>
</div>

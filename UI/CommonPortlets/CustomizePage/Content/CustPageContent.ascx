<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustPageContent.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustPageContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<div class="pSection" id="divMainContent" runat="Server">
	<!-- Begin Page View All Portlets --><cmn:subheader id="shPortletsOnPage" runat="server" textKey="TXT_PORTLETS_ON_THIS_PAGE"></cmn:subheader><cmn:groupedgrid id="ggViewAllPortlets" runat="server" HideTableHeadersWhenGridIsEmpty="True" EnableAutoConfirmation="False"
		GroupKeyField="ID" DataKeyField="ID">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN>
				<ITEMTEMPLATE>
			<%# ((Portlet)Container.DataItem).DisplayName %>
			&nbsp;&nbsp;
			(<%# (((Portlet)Container.DataItem).PortletTemplate==null)? "": ((Portlet)Container.DataItem).PortletTemplate.DisplayName %>)
		</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
				<ITEMTEMPLATE>
					<asp:ImageButton ID="btnRenameItem" Runat="server" />
					&nbsp;
					<asp:ImageButton ID="btnDeleteItem" Runat="server" />
		</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<EmptyTableTemplate>
			<%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
		</EmptyTableTemplate>
	</cmn:groupedgrid>
	<table width="100%">
		<tr>
			<td><asp:linkbutton id="btnCreatePortlet" Runat="server"></asp:linkbutton></td>
		</tr>
		<tr>
			<td><asp:linkbutton id="btnCreateCustomPortlet" Runat="server"></asp:linkbutton>
			</td>
		</tr>
		<tr>
			<td><asp:linkbutton id="btnReorder" runat="server"></asp:linkbutton></td>
		</tr>
	</table>
	<!-- End Page View All Portlets -->
	<!-- Start View All Portlet Shortcuts --><cmn:subheader id="shPortletOnOtherPages" runat="server" textKey="TXT_PORTLETS_ON_OTHER_PAGES"></cmn:subheader><cmn:groupedgrid id="ggViewAllShortcuts" runat="server" HideTableHeadersWhenGridIsEmpty="True" EnableAutoConfirmation="False"
		GroupKeyField="ID" DataKeyField="ID">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN>
				<ITEMTEMPLATE>
					<%# ((PortletDisplay)Container.DataItem).Portlet==null? ((PortletDisplay)Container.DataItem).DisplayName + " - " + Globalizer.GetGlobalizedString("ORPHAN_SHORTCUT_PORTLET") : PortletUtilities.GetPortletDisplayFullName(((PortletDisplay)Container.DataItem).Portlet) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
				<ITEMTEMPLATE>
					<asp:ImageButton ID="btnShortcutDeleteItem" Runat="server" />
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<EmptyTableTemplate>
			<%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
		</EmptyTableTemplate>
	</cmn:groupedgrid>
	<table width="100%">
		<tr>
			<td>
				<asp:LinkButton ID="btnCreateShortcut" Runat="server" />
			</td>
		</tr>
	</table>
	<!--End Page view all Portlet Shortcuts --></div>

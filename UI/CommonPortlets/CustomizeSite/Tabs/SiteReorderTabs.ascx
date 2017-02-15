<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteReorderTabs.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteReorderTabs" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
<table align="center" width="80%"><tr><td>
	<cmn:groupedgrid id="ItemsGrid" runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID">
		<COLUMNS>
		<ASP:TEMPLATECOLUMN SortExpression="">
			<ITEMTEMPLATE>
				<asp:TextBox ID="NewOrder" MaxLength="3" Width="30" Text='<%# ((PortalContext)Container.DataItem).Order %>' Runat="server" />
				<%# ((PortalContext)Container.DataItem).DisplayName %>
				<input id="OldOrder" type="hidden" value='<%# ((PortalContext)Container.DataItem).Order %>' runat="server" NAME="OldOrder">
			</ITEMTEMPLATE>
		</ASP:TEMPLATECOLUMN>
		</COLUMNS>
	</cmn:groupedgrid>
	<div class="pActionsTransp">
		<asp:Button id="btnSave" runat="server" />
		&nbsp;
		<asp:Button id="btnCancel" runat="server" />
	</div>
</td></tr></table>
</div>

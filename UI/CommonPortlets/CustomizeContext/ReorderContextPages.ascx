<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReorderContextPages.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ReorderContextPages" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<script language="JavaScript" src="UI/Common/Scripts/PortletUtils.js"></script>
<div class="pSection">
<div>
	<jenzabar:groupedgrid id="ItemsGrid" runat="server" HideTableHeadersWhenGridIsEmpty="True" CellPadding="0" DataKeyField="ID" GroupKeyField="ID" rendertableheaders="True" EnableAutoConfirmation="False" allowsorting="false">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="SidebarOrder">
				<ITEMTEMPLATE>
					<asp:TextBox ID="tbNewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "SidebarOrder")%>' Runat="server" />
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="PageName">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "DisplayName" )%>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
				<ITEMTEMPLATE>
					<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "SidebarOrder")%>' runat="server" NAME="OldOrder">
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
	</jenzabar:groupedgrid>
</div>

	<asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" />

</div>
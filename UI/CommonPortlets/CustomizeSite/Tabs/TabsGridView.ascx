<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TabsGridView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.TabsGridView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@Import namespace="Jenzabar.ICS.Web.Portlets.Common"%>
<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
<p></p>
<cmn:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" HideTableHeadersWhenGridIsEmpty="True" GroupKeyField="ID" rendertableheaders="True" EnableAutoConfirmation="False" allowsorting="true">
<COLUMNS>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="TabName">
		<ITEMTEMPLATE><%# ((PortalContext)Container.DataItem).DisplayName %>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
		<ITEMTEMPLATE>
					<asp:ImageButton ID="imbEditItem" CommandName="<%#Constants.EDIT_ITEM_CMD%>" Runat="server" Visible="False"></asp:ImageButton>
					&nbsp;
					<asp:ImageButton ID="imbDeleteItem" CommandName="<%#Constants.DELETE_ITEM_CMD%>" Runat="server" Visible="False"></asp:ImageButton>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
</COLUMNS>
<EmptyTableTemplate><%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>

</cmn:groupedgrid>
</p>
<table>
	<tr>
		<td><asp:LinkButton ID="lnkCreateItem" CommandName="AddItem" Runat="server"></asp:LinkButton>
		</td>
		<td><asp:LinkButton ID="lnkReorderTabs" CommandName="ReorderTabs" Runat="server"></asp:LinkButton>
		</td>
	</tr>
</table>
</div>
</p>

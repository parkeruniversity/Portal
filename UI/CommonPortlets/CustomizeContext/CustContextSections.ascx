<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustContextSections.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustContextSections" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@Import namespace="Jenzabar.Common.Globalization"%>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
<p></p>
<cmn:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" GroupKeyField="ID" rendertableheaders="True" allowsorting="true" EnableAutoConfirmation="False"  HideTableHeadersWhenGridIsEmpty="True">
<COLUMNS>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="Name">
		<ITEMTEMPLATE>
					<%# ((PortalContext)Container.DataItem).DisplayName %>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
		<ITEMTEMPLATE>
					<asp:ImageButton ID="imbRenameItem" CommandName="RenameItem" Runat="server" Visible="False"></asp:ImageButton>
					&nbsp;
					<asp:ImageButton ID="imbDeleteItem" CommandName="DeleteItem" Runat="server" Visible="False"></asp:ImageButton>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
</COLUMNS>
<EmptyTableTemplate><%= Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY") %></EmptyTableTemplate>
</cmn:groupedgrid>
<p>
<table width="100%">
	<tr>
		<td>
			<asp:ImageButton ID="imbCreateItem" CommandName="AddItem" Runat="server"></asp:ImageButton>
			&nbsp;
			<asp:LinkButton ID="lnkCreateItem" CommandName="AddItem" Runat="server"></asp:LinkButton>
		</td>
		<td>
			<asp:ImageButton ID="imbReorder" CommandName="Reorder" Runat="server"></asp:ImageButton>
			&nbsp;
			<asp:LinkButton ID="lnkReorder" CommandName="Reorder" Runat="server"></asp:LinkButton>
		</td>
		<td align=right>
			<asp:CheckBox ID="chbAddToSideBar" AutoPostBack="True" Runat="server"></asp:CheckBox>
		</td>
	</tr>
</table></p></div>

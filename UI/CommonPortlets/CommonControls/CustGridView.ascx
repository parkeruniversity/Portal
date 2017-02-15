<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.ICS.Web.Portlets.Common"%>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustGridView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustGridView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
<p></p>
<cmn:groupedgrid id="ItemsGrid" runat="server" HideTableHeadersWhenGridIsEmpty="True" DataKeyField="ID" GroupKeyField="ID" rendertableheaders="True" allowsorting="true">
<COLUMNS>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="Name">
		<ITEMTEMPLATE>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
	<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
		<ITEMTEMPLATE>
					<asp:ImageButton ID="imbRenameItem" CommandName="<%#Constants.EDIT_ITEM_CMD%>" Runat="server" Visible="False"></asp:ImageButton>
					&nbsp;
					<asp:ImageButton ID="imbDeleteItem" CommandName="<%#Constants.DELETE_ITEM_CMD%>" Runat="server" Visible="False"></asp:ImageButton>
		</ITEMTEMPLATE>
	</ASP:TEMPLATECOLUMN>
</COLUMNS>
<EmptyTableTemplate><%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%></EmptyTableTemplate>

</cmn:groupedgrid>
<p>
<table width="100%">
	<tr>
		<td><asp:ImageButton ID="imbCreateItem" CommandName="AddItem" Runat="server"></asp:ImageButton>
			&nbsp;
			<asp:LinkButton ID="lnkCreateItem" CommandName="AddItem" Runat="server"></asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td><asp:ImageButton ID="imbReorder" CommandName="Reorder" Runat="server"></asp:ImageButton>
		&nbsp;
		<asp:LinkButton ID="lnkReorder" CommandName="Reorder" Runat="server"></asp:LinkButton>
		</td>
	</tr>
</table>
<asp:Button ID="btnSave" Runat="server" Enabled="False"></asp:Button></p></div>

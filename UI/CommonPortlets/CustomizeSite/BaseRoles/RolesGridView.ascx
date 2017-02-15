<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RolesGridView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.RolesGridView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@Import namespace="Jenzabar.Common.Globalization"%>
<%@Import namespace="Jenzabar.ICS.Web.Portlets.Common"%>
<%@Import namespace="Jenzabar.Portal.Framework"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<cmn:Subheader id="subHeader" runat="server"></cmn:Subheader>
<div class="pSection">
	<p></p>
	<cmn:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" HideTableHeadersWhenGridIsEmpty="True"
		GroupKeyField="ID" rendertableheaders="True" EnableAutoConfirmation="False" allowsorting="true">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="Role" SortExpression="">
				<ITEMTEMPLATE>
					<%# ((PortalGroup)Container.DataItem).DisplayName %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="" SortExpression="">
				<ITEMTEMPLATE>
<ASP:IMAGEBUTTON id=imbEditItem visible="<%# ! ((PortalGroup)Container.DataItem).ReadOnly %>" Runat="server" CommandName="<%#Constants.EDIT_ITEM_CMD%>" />&nbsp; 
<ASP:IMAGEBUTTON id=imbDeleteItem visible="<%# ((PortalGroup)Container.DataItem).Removable %>" Runat="server" CommandName="<%#Constants.DELETE_ITEM_CMD%>" /></ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<EMPTYTABLETEMPLATE>
			<%#Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
		</EMPTYTABLETEMPLATE>
	</cmn:groupedgrid>
	<p>
		<table>
			<tr>
				<td><asp:ImageButton ID="imbCreateItem" CommandName="AddItem" Runat="server" />
					&nbsp;
					<asp:LinkButton ID="lnkCreateItem" CommandName="AddItem" Runat="server"></asp:LinkButton>
				</td>
			</tr>
		</table>
	</p>
</div>

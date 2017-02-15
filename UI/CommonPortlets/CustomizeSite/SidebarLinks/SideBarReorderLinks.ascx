<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SideBarReorderLinks.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SidebarLinks.SidebarReorderLinks" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="pSection">
<div>
	<jenzabar:groupedgrid id=QuickLinksOrder runat="server" HideTableHeadersWhenGridIsEmpty="True" CellPadding="0" DataKeyField="ID" GroupKeyField="ID"  rendertableheaders="True" EnableAutoConfirmation="False" allowsorting="false">
		<COLUMNS>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="Sidebar Order">
				<ITEMTEMPLATE>
					<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "SidebarOrder") %>' Runat="server" />
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="Quick Link">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "Name" )%>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN SortExpression="" HeaderText="">
				<ITEMTEMPLATE>
					<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "SidebarOrder") %>' runat="server" NAME="OldOrder">
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
	</jenzabar:groupedgrid>
</div>

<div>
	<asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" />
</div>

</div>
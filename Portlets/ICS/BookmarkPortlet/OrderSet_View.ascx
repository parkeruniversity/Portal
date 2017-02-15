<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.OrderSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="pSection">
<div>
	<jenzabar:groupedgrid id=HeaderOrder runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Runat="server" />
			<%# DataBinder.Eval( Container.DataItem, "Name" )%>
			<asp:ImageButton ID="AddBookmarkLink" CommandName="AddBookmark" Runat="server" />			
			<asp:ImageButton ID="EditHeaderLink" CommandName="EditHeader" Runat="server" />	
			<asp:ImageButton ID="DeleteHeaderLink" CommandName="DeleteHeader" Runat="server" />
			<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' runat="server" NAME="OldOrder">
		</GroupHeaderTemplate>
	</jenzabar:groupedgrid>
</div>

<div>
	<asp:ImageButton id="AddNewSet" Visible="False" Runat="server" CommandName="AddSet" />
	<secured:slinkbutton id="lnkAddSet" runat="server" IsSecured="True" AccessCheckType="Union" OperationNames="CanManageSets" />
</div>

<div>
	<asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" />
</div>

</div>

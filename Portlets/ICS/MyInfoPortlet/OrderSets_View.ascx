<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderSets_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.OrderSets_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div>
	<jenzabar:groupedgrid id="HeaderOrder" runat="server" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' runat="server" NAME="OldOrder">
			<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Runat="server" />
			<b><%# DataBinder.Eval(Container.DataItem, "Name") %></b>
			<asp:ImageButton ID="AddUserInfoButton" CommandName="AddUserInfo" Runat="server" />
			<asp:ImageButton ID="EditHeaderButton" CommandName="EditHeader" Runat="server" />
			<asp:ImageButton ID="DeleteHeaderButton" CommandName="DeleteHeader" Runat="server" />
		</GroupHeaderTemplate>
	</jenzabar:groupedgrid>
</div>
<p><asp:linkbutton id="AddSet" Runat="server"></asp:linkbutton></p>
<div><asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" /></div>
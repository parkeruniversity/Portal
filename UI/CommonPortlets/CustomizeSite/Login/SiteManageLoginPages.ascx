<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteManageLoginPages.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteManageLoginPages" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">

	<asp:linkbutton id="AddLoginPage" Runat="server"></asp:linkbutton>
	<jenzabar:groupedgrid id="LoginPageOrder" runat="server" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' runat="server" NAME="OldOrder">
			<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Runat="server" />
			<b><%# DataBinder.Eval(Container.DataItem, "Name") %></b>
			<asp:ImageButton ID="EditLoginPageButton" CommandName="EditLoginPage" Runat="server" Visible=<%# !(bool)DataBinder.Eval(Container.DataItem, "ReadOnly") ? true : false %>  />
			<asp:ImageButton ID="DeleteLoginPageButton" CommandName="DeleteLoginPage" Runat="server" Visible=<%# !(bool)DataBinder.Eval(Container.DataItem, "ReadOnly") ? true : false %> />
		</GroupHeaderTemplate>
	</jenzabar:groupedgrid>

	<br>
	<asp:Button ID="SaveButton" Runat="server" />
</div>
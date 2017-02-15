<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.HandoutPortlet.OrderSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table cellpadding="3" cellspacing="0" width="100%">
<tr><td>
	<jenzabar:groupedgrid id=HeaderOrder runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID">


<GroupHeaderTemplate>
			<asp:TextBox ID="NewOrder" MaxLength="3" Width="25px" Text='<%# DataBinder.Eval(Container.DataItem, "Order") %>' Runat="server" />
			<%# DataBinder.Eval( Container.DataItem, "Name" )%>
			<asp:ImageButton ID="AddHandoutLink" CommandName="AddHandout" Runat="server" />			
			<asp:ImageButton ID="EditHeaderLink" CommandName="EditHeader" Runat="server" />	
			<asp:ImageButton ID="DeleteHeaderLink" CommandName="DeleteHeader" Runat="server" />
			<br>
			<%# DataBinder.Eval( Container.DataItem, "Description" )%>	
			<input id="OldOrder" type="hidden" value='<%# DataBinder.Eval(Container.DataItem, "Order") %>' runat="server" NAME="OldOrder">
</GroupHeaderTemplate>
</jenzabar:groupedgrid>
</td></tr>
	<tr>
		<td>
<asp:ImageButton id="AddNewSet" Visible="False" Runat="server" CommandName="AddSet"></asp:ImageButton>
&nbsp;<secured:slinkbutton id="lnkAddSet" runat="server" IsSecured="True" AccessCheckType="Union" OperationNames="CanAddSets"></secured:slinkbutton></td>
	</tr>
	<tr>
		<td><asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" /></td>
	</tr>
</table>

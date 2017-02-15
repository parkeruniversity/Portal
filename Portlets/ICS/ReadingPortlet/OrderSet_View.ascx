<%@ Import namespace="Jenzabar.ICS" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="OrderSet_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.OrderSet_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<jenzabar:ErrorDisplay id="ctlError" runat=server />
<div class="pSection">
<fieldset>
<table cellpadding="3" cellspacing="0" width="100%">
	<tr>
		<td>
			<jenzabar:groupedgrid id="HeaderOrder" runat="server" CellPadding="0" DataKeyField="ID" EnableAutoConfirmation="False" GroupKeyField="ID">
				<GroupHeaderTemplate>
					<asp:TextBox ID="NewOrder" MaxLength="3" Size="2" Text='<%# ((Header)Container.DataItem).Order %>' Runat="server" />
					<%# ((Header)Container.DataItem).Name %>
					<asp:ImageButton ID="AddItemLink" CommandName="AddItem" AlternateText="add item" Runat="server" />
					<asp:ImageButton ID="EditHeaderLink" CommandName="EditSet" AlternateText="edit set" Runat="server" />
					<asp:ImageButton ID="DeleteHeaderLink" CommandName="DeleteSet" AlternateText="delete set" Runat="server" />
					<br>
					<%# ((Header)Container.DataItem).Description %>
					<input id="OldOrder" type="hidden" value='<%# ((Header)Container.DataItem).Order %>' runat="server" NAME="OldOrder">
				</GroupHeaderTemplate>
			</jenzabar:groupedgrid>
		</td>
	</tr>
	<tr>
		<td>
			<asp:ImageButton ID="AddSetLink" CommandName="AddSet" AlternateText="add set" Runat="server" />
			&nbsp;<secured:slinkbutton id="lnkAddSet" runat="server" CommandName="AddSet" IsSecured="True" AccessCheckType="Union" OperationNames="CanAddSets">Add a 
      Set</secured:slinkbutton></td>
	</tr>
	<tr>
		<td><asp:Button ID="SaveButton" Text="Save" Runat="server" /><asp:Button ID="CancelButton" Text="Cancel" Runat="server" /></td>
	</tr>
</table>
</fieldset>
</div>
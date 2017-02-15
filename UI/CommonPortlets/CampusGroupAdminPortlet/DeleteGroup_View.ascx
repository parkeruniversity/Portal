<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DeleteGroup_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.DeleteGroup_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<common:SubHeader ID="DeleteGroupHeader" runat="server" />
<fieldset>
	<div class="pSection">
		<p id="DeleteGroupText" runat="server" />
		<table width="90%">
			<tr>
				<td><common:FormLabel ID="EmailLabel" ForControl="EmailMessage" runat="server" /></td>
			</tr>
			<tr>
				<td><txt:TextEditorControl ID="EmailMessage" Cols="40" runat="server" Width="100%" /></td>
			</tr>
		</table>
	</div>
	<div class="buttonBar">
		<asp:Button ID="DeleteButton" runat="server" />
		<asp:Button ID="CancelButton" runat="server" />
	</div>
</fieldset>

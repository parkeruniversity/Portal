<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditMessages_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.EditMessages_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="EditMessagesHeader" runat="server" />

<div class="pSection">
	<h5><common:FormLabel ID="ApplicationConfirmationLabel" ForControl="ApplicationConfirmation" Runat="server" /></h5>
		<txt:TextEditorControl ID="ApplicationConfirmation" runat="server" />
	<h5><common:FormLabel ID="CampusGroupAcceptedLabel" ForControl="CampusGroupAccepted" Runat="server" /></h5>
		<txt:TextEditorControl ID="CampusGroupAccepted" runat="server" />
	<h5><common:FormLabel ID="CampusGroupDeclinedLabel" ForControl="CampusGroupDeclined" Runat="server" /></h5>
		<txt:TextEditorControl ID="CampusGroupDeclined" runat="server" />
	<h5><common:FormLabel ID="CampusGroupDeletedLabel" ForControl="CampusGroupDeleted" Runat="server" /></h5>
		<txt:TextEditorControl ID="CampusGroupDeleted" runat="server" />
</div>

<div class="buttonBar">
	<asp:Button ID="SaveButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>

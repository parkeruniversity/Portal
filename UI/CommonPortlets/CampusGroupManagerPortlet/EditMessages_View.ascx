<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditMessages_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.EditMessages_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="EditMessagesHeader" runat="server" />

<div class="pSection">
    <common:Hint ID="Introduction" runat="server" />
	<h5><common:FormLabel ID="GroupMemberAcceptedLabel" ForControl="GroupMemberAccepted" Runat="server" /></h5>
		<txt:TextEditorControl ID="GroupMemberAccepted" runat="server" />
	<h5><common:FormLabel ID="GroupMemberDeclinedLabel" ForControl="GroupMemberDeclined" Runat="server" /></h5>
		<txt:TextEditorControl ID="GroupMemberDeclined" runat="server" />
	<h5><common:FormLabel ID="ApplicationIntroLabel" ForControl="ApplicationIntro" Runat="server" /></h5>
		<asp:Label ID="ApplicationIntroNote" class="fieldNote" Runat="server" />
		<br /><txt:TextEditorControl ID="ApplicationIntro" runat="server" />
	<h5><common:FormLabel ID="ApplicationConfirmationLabel" ForControl="ApplicationConfirmation" Runat="server" /></h5>
		<asp:Label ID="ApplicationConfirmationNote" class="fieldNote" Runat="server" />
		<br /><txt:TextEditorControl ID="ApplicationConfirmation" runat="server" />
	<asp:Panel ID="pnlInvitationToPublic" runat="server">
	<h5><common:FormLabel ID="InvitationTextLabel" ForControl="InvitationText" Runat="server" /></h5>
		<asp:Label ID="InvitationTextNote" class="fieldNote" Runat="server" />
		<br /><txt:TextEditorControl ID="InvitationText" runat="server" />
	</asp:Panel>
    <asp:Panel ID="pnlAddedUserToPrivate" runat="server">
    <h5><common:FormLabel ID="AddedToPrivateTextLabel" ForControl="AddedToPrivateText" Runat="server" /></h5>
		<asp:Label ID="AddedToPrivateTextNote" class="fieldNote" Runat="server" />
		<br /><txt:TextEditorControl ID="AddedToPrivateText" runat="server" />
	</asp:Panel>
</div>

<div class="buttonBar">
	<asp:Button ID="SaveButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>

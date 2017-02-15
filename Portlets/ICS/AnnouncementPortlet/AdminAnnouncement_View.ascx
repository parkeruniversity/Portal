<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminAnnouncement_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.AnnouncementPortlet.AdminAnnouncement_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<style>
	.annDetailsInput { height: 8em; width: 50em; }
</style>

<div class="pSection">
<fieldset>
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	
	<div id="AdministratorNote" runat="server" visible="false" class="hint" />
	<table>
		<tr>
			<th><common:FormLabel id="TitleLabel" ForControl="Title" Runat="server"></common:FormLabel></th>
			<td>
				<asp:textbox id="Title" Runat="server"></asp:textbox>
				<asp:RequiredFieldValidator ID="TitleRequired" ControlToValidate="Title" EnableClientScript="False" Text="*" Runat="server" />
			</td>
		</tr>
		<tr>
				<th class="psTitleCell"><common:FormLabel id="SendToLabel" ForControl="Recipients" Runat="server"></common:FormLabel></th>
				<td class="psCell">
					<framework:PrincipalSelector id="Recipients" runat="server" />
				</td>
		</tr>
		<tr>
			<th><common:FormLabel id="DetailsLabel" ForControl="Details" Runat="server"></common:FormLabel></th>
			<td><jenz:TextEditorControl id="Details" Cols="60" Width="100%" MaxLength="6000" Runat="server" /></td>
		</tr>
		<tr>
			<td colSpan="2"><common:DisplayIndicator id="DisplayRange" ShowTime="True" AutoValidate="true" runat="server" /></td>
		</tr>
		<tr id="IsAnonymousRow" visible="false" runat="server">
			<th><common:FormLabel id="IsAnonymousLabel" ForControl="IsAnonymous" runat="server"></common:FormLabel></th>
			<td><asp:Checkbox ID="IsAnonymous" Checked="False" Runat="server" /></td>
		</tr>
		<tr>
			<th></th>
			<td>
				<asp:button id="SaveButton" Runat="server"></asp:button>
				<asp:button id="CancelButton" CausesValidation="False" Runat="server"></asp:button>
			</td>
		</tr>
	</table>
</fieldset>
</div>

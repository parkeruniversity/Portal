<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReviewApplication_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.ReviewApplication_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="ReviewApplicationHeader" runat="server" />

<div class="pSection">

<div class="applicationPhotoSection">
	<asp:Image ID="UserPhoto" Runat="server" style="float:left; display:block; padding-right: 15px;" />
	<fieldset>
	<table>
		<tr>
			<th><asp:Label ID="NameLabel" Runat="server" /></th>
			<td class="text"><framework:MyInfoPopup ID="Name" runat="server" /></td>
		</tr>
		<tr id="EmailRow" runat="server">
			<th><asp:Label ID="EmailLabel" Runat="server" /></th>
			<td class="text"><asp:Literal ID="EmailAddress" Runat="server" /></td>
		</tr>
		<tr id="PhoneRow" runat="server">
			<th><asp:Label ID="PhoneLabel" Runat="server" /></th>
			<td class="text"><asp:Literal ID="PhoneNumber" Runat="server" /></td>
		</tr>
	</table>
	</fieldset>
</div>

<h5 id="ReasonLabel" runat="server" />
<p id="Reason" runat="server" />
</div>
<div class="buttonBar">
	<asp:Button ID="AcceptButton" Runat="server" />
	<asp:Button ID="DeclineButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>
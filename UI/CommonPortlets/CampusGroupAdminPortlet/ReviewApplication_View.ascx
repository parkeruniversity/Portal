<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReviewApplication_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.ReviewApplication_View" %>
<%@ Register TagPrefix="portal" namespace="Jenzabar.Portal.Web.UI.Controls" assembly="Jenzabar.Portal.Web" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>

<common:Subheader ID="ApplicationHeader" runat="server" />

<div class="pSection">
	<table>
		<tr>
			<td><asp:Label ID="GroupNameLabel" Runat="server" /></td>
			<td class="groupName"><asp:Literal ID="GroupName" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="SubmittedByLabel" Runat="server" /></td>
			<td><framework:MyInfoPopup ID="SubmittedBy" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="CategoryLabel" Runat="server" /></td>
			<td><asp:Literal ID="Category" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="AvailabilityLabel" Runat="server" /></td>
			<td><asp:Literal ID="Availability" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="MembershipLabel" Runat="server" /></td>
			<td><asp:Literal ID="Membership" Runat="server" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="MaxMembersLabel" Runat="server" /></td>
			<td><asp:Literal ID="MaxMembers" Runat="server" /></td>
		</tr>
	</table>
	
	<h5><asp:Label ID="DescriptionLabel" Runat="server" /></h5>
	<asp:Literal ID="Description" Runat="server" />
	
	<h5><asp:Label ID="ReasonLabel" Runat="server" /></h5>
	<asp:Literal ID="Reason" Runat="server" />
</div>
	
<div class="buttonBar">
	<asp:Button ID="CreateGroupButton" runat="server" />
	<asp:Button ID="DeclineGroupButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>

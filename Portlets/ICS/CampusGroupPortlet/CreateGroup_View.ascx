<%@ Import namespace="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CreateGroup_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet.CreateGroup_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<style>
	.newGroupForm TH { WIDTH: 180px; white-space: normal; }
	.noteInput { width: 600px; }
	.noteInput INPUT { FLOAT: left; MARGIN-RIGHT: 10px }
	.noteInput LABEL { FONT-SIZE: 80%; FLOAT: left; FONT-STYLE: italic }
</style>
<div id="NewGroupApplication" runat="server">
	<common:Subheader id="NewGroupHeader" runat="server" />
	<div class="pSection">
	
		<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	
		<fieldset>
			<common:hint id="NewGroupInstructions" runat="server" />
			<table class="newGroupForm">
				<tr>
					<th>
						<common:FormLabel id="GroupNameLabel" ForControl="GroupName" runat="server" /></th>
					<td><asp:TextBox ID="GroupName" Columns="30" MaxLength="50" runat="server" />
						<asp:RequiredFieldValidator ID="GroupNameRequired" Text="*" ControlToValidate="GroupName" CssClass="validationMsgError" Display="Dynamic" Runat="server" ValidationGroup="newgroup" /></td>
				</tr>
				<tr>
					<th>
						<common:FormLabel id="CategoryLabel" ForControl="Category" runat="server" /></th>
					<td>
						<asp:DropDownList ID="Category" runat="server"></asp:DropDownList>
						<asp:RequiredFieldValidator ID="CategoryRequired" Text="*" ControlToValidate="Category" CssClass="validationMsgError" Display="Dynamic" Runat="server" ValidationGroup="newgroup" />
					</td>
				</tr>
				<tr>
					<th><common:FormLabel id="DescriptionLabel" ForControl="Description" runat="server" /></th>
					<td>
					    <div id="_divErrDescription" runat="server">
					        <asp:Label ID="_lblErrDescription" CssClass="validationMsgError" runat="server" />
					    </div>
						<common:TextEditorControl ID="Description" MaxLength="3000" runat="server" />
					</td>
				</tr>
				<tr>
					<th></th>
					<td class="noteInput"><common:FormLabel id="DescriptionNote" ForControl="Description" runat="server" /></td>
				</tr>
				<tr>
					<th><common:FormLabel id="ReasonLabel" ForControl="Reason" runat="server" /></th>
					<td>
					    <div id="_divErrReason" runat="server">
					        <asp:Label ID="_lblErrReason" CssClass="validationMsgError" runat="server" />
					    </div>
					    <common:TextEditorControl ID="Reason" MaxLength="3000" runat="server" />
					</td>
				</tr>
				<tr>
					<th>
						<common:FormLabel id="MaxMembersLabel" ForControl="MaxMembers" runat="server" /></th>
					<td class="noteInput">
						<asp:TextBox ID="MaxMembers" Columns="3" MaxLength="3" runat="server" />
						<asp:RegularExpressionValidator ID="MaxMembersInteger" Text="*" ValidationExpression="[1-9][0-9]*" ControlToValidate="MaxMembers"
							Display="Dynamic" Runat="server" ValidationGroup="newgroup" />
						<div class=""><common:FormLabel ID="MaxMembersNote" ForControl="MaxMembers" Runat="server" /></div>
					</td>
				</tr>
				<tr>
					<th><common:FormLabel id="AvailabililtyLabel" ForControl="Availability" runat="server" /></th>
					<td><asp:RadioButtonList ID="Availability" Runat="server" /></td>
				</tr>
				<tr>
					<th><common:FormLabel id="MembershipLabel" ForControl="Membership" runat="server" /></th>
					<td><asp:RadioButtonList ID="Membership" Runat="server" /></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="buttonBar">
			<asp:Button ID="SubmitButton" Runat="server" CausesValidation="true" ValidationGroup="newgroup"/>
			<asp:Button ID="CancelButton" CausesValidation="False" Runat="server" />
	</div>
</div>
<div id="ApplicationCompleteNote" visible="false" class="pSection" runat="server">
	<p ID="ConfirmedText" class="exaggerated" runat="server" />
	<p ID="ApplicationSentText" runat="server" />
	<asp:LinkButton ID="BackButton" Runat="server" CausesValidation="false" />
</div>

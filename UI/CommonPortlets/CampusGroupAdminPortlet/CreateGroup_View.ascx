<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CreateGroup_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.CreateGroup_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
    <fieldset>
		<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	
		<table>
			<asp:Repeater ID="CreateGroups" Runat="server">
				<ItemTemplate>
					<tr id="NumberRow" visible="false" runat="server">
						<td colspan="2"><%# Container.ItemIndex + 1 %>.</td>
					</tr>
					<tr>
						<th><asp:Label ID="GroupNameLabel" Runat="server" /></th>
						<td class="text">
							<asp:Literal ID="CampusGroupID" Visible="false" Runat="server" />
							<asp:TextBox ID="GroupName" Columns="30" MaxLength="50" runat="server" />
							<asp:RequiredFieldValidator ID="GroupNameRequired" ControlToValidate="GroupName" Text="*" Runat="server" />
							<span class="fieldNote"><common:GlobalizedLiteral ID="GroupNameEditNote" TextKey="TXT_CAMPUSGROUPS_EDIT_GROUP_NAME_IN_CONTEXT_MANAGER" runat="server" Visible="false" /></span>
						</td>
					</tr>
					<tr>
						<th><asp:Label ID="GroupLeaderLabel" Runat="server" /></th>
						<td class="text">
						    <asp:PlaceHolder id="GroupLeaders" runat="server" />
						    <common:GlobalizedLiteral id="NoGroupLeader" TextKey="TXT_NO_GROUP_LEADER" Visible="false" runat="server" />
						</td>
					</tr>
					<tr>
						<th><asp:Label ID="CategoryLabel" Runat="server" /></th>
						<td class="text">
							<asp:DropDownList ID="Category" runat="server" />
							<asp:RequiredFieldValidator ID="CategoryRequired" ControlToValidate="Category" Text="*" Runat="server" />
							<asp:LinkButton ID="NewCategoryButton" CommandName="CreateNewCategory" CausesValidation="False" Runat="server" />
						</td>
					</tr>
					<tr>
						<th><asp:Label ID="AvailabilityLabel" Runat="server" /></th>
						<td class="text"><asp:DropDownList ID="Availability" Runat="server" /></td>
					</tr>
					<tr>
						<th><asp:Label ID="MembershipLabel" Runat="server" /></th>
						<td class="text"><asp:DropDownList ID="Membership" Runat="server" /></td>
					</tr>
					<tr>
						<th><asp:Label ID="MaxMembersLabel" Runat="server" /></th>
						<td class="text">
							<asp:TextBox ID="MaxMembers" Columns="3" MaxLength="3" runat="server" />
							<asp:RegularExpressionValidator ID="MaxMembersNumber" ControlToValidate="MaxMembers" ValidationExpression="[1-9][0-9]*" Text="*" Runat="server" /></td>
					</tr>
					<tr>
						<th><asp:Label ID="DescriptionLabel" Runat="server" /></th>
						<td class="text">
							<txt:TextEditorControl ID="Description" MaxLength="3000" runat="server" />
						</td>
					</tr>
					<tr id="LeaderEmailRow" runat="server">
						<th><asp:Label ID="LeaderEmailLabel" Runat="server" /></th>
						<td class="text"><txt:TextEditorControl ID="LeaderEmailMessage" MaxLength="3000" runat="server" />
                        </td>
					</tr>
				</ItemTemplate>
				<SeparatorTemplate>
					<tr>
						<td colspan="2"><hr style="height: 1px;" /></td>
					</tr>
				</SeparatorTemplate>
			</asp:Repeater>
		</table>
    </fieldset>
</div>
<div id="SingleButtonFooter" class="buttonBar" runat="server">
	<asp:Button ID="CreateGroupButton" Runat="server" />
	<asp:Button ID="CancelGroupButton" CausesValidation="False" Runat="server" />
</div>
<div id="MultipleButtonFooter" class="buttonBar" visible="false" runat="server">
	<asp:Button ID="CreateMultipleGroupsButton" Runat="server" />
	<asp:Button ID="CancelMultipleGroupsButton" CausesValidation="False" Runat="server" />
</div>

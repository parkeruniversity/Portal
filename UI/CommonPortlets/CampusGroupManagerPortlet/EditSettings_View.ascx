<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditSettings_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.EditSettings_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection">
<common:SubHeader ID="MembershipSettingsHeader" runat="server" />
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
    <fieldset>
        <table>
        	<tr>
				<th>
					<common:FormLabel ID="MaxMembersLabel" ForControl="MaxMembers" runat="server" /></th>
				<td>
				    <asp:TextBox ID="MaxMembers" Columns="3" MaxLength="3" Runat="server" />
				    <asp:RegularExpressionValidator ID="MaxMembersValidator" ValidationExpression="[1-9][0-9]*" ControlToValidate="MaxMembers" Text="*" Display="Dynamic" Runat="server" />
				    <asp:Label id="MaxMembersNote" class="fieldNote" runat="server" />
				</td>
			</tr>
			<tr>
				<th><common:FormLabel id="PrivacyLabel" ForControl="Privacy" runat="server" /></th>
				<td><asp:RadioButtonList ID="Privacy" Runat="server" /></td>
			</tr>
			<tr>
				<th><common:FormLabel id="MembershipLabel" ForControl="Membership" runat="server" /></th>
				<td><asp:RadioButtonList ID="Membership" Runat="server" /></td>
			</tr>
		</table>
	</fieldset>
</div>
<div class="buttonBar">
<asp:Button ID="SaveButton" Runat="server" />
<asp:Button ID="CancelButton" Runat="server" />
</div>


<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AcceptMember_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.AcceptMember_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import NameSpace="Jenzabar.ICS" %>

<div class="pSection">

<p><asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" /></p>

<div id="IntroText" runat="server" />

<asp:Repeater ID="ProspectiveMembers" Runat="server">
	<HeaderTemplate>
		<table>
	</HeaderTemplate>
	<ItemTemplate>
		<tr>
			<td class="fieldLabel">
				<asp:Literal ID="UserName" Runat="server" />
				<asp:Literal ID="UserID" Visible="False" Runat="server" />
			</td>
			<td><common:FormLabel ID="RoleLabel" ForControl="Role" Runat="server" /></td>
			<td><asp:DropDownList ID="Role" Runat="server" /></td>
		</tr>
	</ItemTemplate>
	<FooterTemplate>
		</table>
	</FooterTemplate>
</asp:Repeater>

<h5><common:FormLabel id="EmailLabel" ForControl="EmailMessage" runat="server" /></h5>
<asp:Label ID="EmailLabelNote" CssClass="fieldNote" Runat="server" />

<txt:TextEditorControl id="EmailMessage" runat="server" />
</div>

<div class="buttonBar">
	<asp:Button ID="SubmitButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>


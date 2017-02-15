<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="JoinGroup_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupPortlet.JoinGroup_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%><%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>

<common:Subheader ID="JoinGroupHeader" runat="server" />

<div id="JoinScreen"  runat="server">
  <div class="pSection">
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	
	<fieldset>
	<asp:Label ID="JoinGroupDescription" Runat="server" />
	<table>
		<tr>
			<th><asp:Label ID="NameLabel" runat="server" /></th>
			<td class="text"><asp:Label ID="Name" Runat="server" /></td>
		</tr>
		<tr>
			<th><asp:Label ID="EmailAddressLabel" runat="server" /></th>
			<td class="text"><asp:Label ID="EmailAddress" Runat="server" /></td>
		</tr>
		<tr id="PhoneNumberRow" runat="server">
			<th><common:FormLabel ID="PhoneNumberLabel" ForControl="PhoneNumber" runat="server" /></th>
			<td class="text">
				<asp:TextBox ID="PhoneNumber" Runat="server" />
				<asp:Label ID="PhoneNumberNote" CssClass="fieldNote" Runat="server" />
			</td>
		</tr>
		<tr id="ReasonRow" runat="server">
			<th>
				<common:FormLabel ID="ReasonLabel" ForControl="Reason" runat="server" />
			</th>
			<td class="text"><txt:TextEditorControl ID="Reason" MaxLength="3000" runat="server" /></td>
		</tr>
	</table>
	<common:Hint id="JoinWarnText" runat="server" />
	</fieldset>
	</div>
	<div class="buttonBar">
            <asp:Button ID="SubmitButton" Runat="server" />
		    <asp:Button ID="CancelButton" runat="server" />
	</div>
</div>

<div id="ConfirmationScreen" class="pSection" visible="false" runat="server">

	<p id="ConfirmationHeader" class="exaggerated" runat="server" />
	
	<p id="ConfirmationText" runat="server" />
	
	<asp:LinkButton ID="BackButton" Runat="server" />

</div>
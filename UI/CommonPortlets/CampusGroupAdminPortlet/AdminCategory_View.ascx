<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminCategory_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupAdminPortlet.AdminCategory_View" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<common:SubHeader ID="CreateNewCategoryHeader" runat="server" />

<div class="pSection">
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />

	<table>
		<tr>
			<th>
				<asp:Literal ID="NameLabel" Runat="server" /></th>
			<td class="text">
				<asp:TextBox ID="Name" Runat="server" />
				<asp:RequiredFieldValidator ID="NameRequired" Text="*" ControlToValidate="Name" runat="server" />
			</td>
		</tr>
	</table>
</div>
<div class="buttonBar">
	<asp:Button ID="CreateCategoryButton" Runat="server" />
	<asp:Button ID="CancelButton" CausesValidation="False" Runat="server" />
</div>
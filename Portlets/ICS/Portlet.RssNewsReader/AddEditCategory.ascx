<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditCategory.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.AddEditCategory" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<common:SubHeader id="subHeader" runat="server" />
<div class="pSection">
	<table cellSpacing="3" cellPadding="3">
		<tr>
			<td>
				<asp:Label id="lblCategory" runat="server" /></td>
			<td>
				<asp:TextBox id="txtCategory" runat="server" Width="200px" /></td>
			<td>
				<asp:RequiredFieldValidator id="rfvCategory" runat="server" ControlToValidate="txtCategory" EnableClientScript="False" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<asp:Button id="btnSave" runat="server" />&nbsp;
				<asp:Button id="btnCancel" runat="server" /></td>
			<td></td>
		</tr>
	</table>
</div>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditFeed.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.RssNewsReaderPortlet.AddEditFeed" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<common:subheader id="subHeader" Runat="server" />
<div class="pSection">
	<table id="Table1" cellSpacing="3" cellPadding="3">
		<tr>
			<td align="right"><asp:Label ID="lblFeedLocation" Runat="server" /></td>
			<td><asp:Textbox ID="txtFeedLocation" Runat="server" Width="300px" /></td>
			<td>
			  <asp:RequiredFieldValidator ID="rfvFeedLocation" Runat="server" ControlToValidate="txtFeedLocation" EnableClientScript="False" />
			  <asp:RegularExpressionValidator ID="revFeedLocation" Runat="server" ValidationExpression="^((([Hh][Tt]|[Ff])[Tt][Pp]([Ss]?))\://)\S+" ControlToValidate="txtFeedLocation" EnableClientScript="False" />
			</td>
		</tr>
		<tr>
			<td align="right"><asp:Label ID="lblFeedName" Runat="server" /></td>
			<td><asp:Textbox ID="txtFeedName" Runat="server" Width="300px" /></td>
			<td>
			  <asp:RequiredFieldValidator ID="rfvFeedName" Runat="server" ControlToValidate="txtFeedName" EnableClientScript="False" />
			  <asp:RegularExpressionValidator ID="revFeedName" Runat="server" ControlToValidate="txtFeedName" ValidationExpression="(.|[\r\n]){1,50}" />
			</td>
		</tr>
		<tr>
			<td align="right"><asp:Label ID="lblFeedCategory" Runat="server" /></td>
			<td><asp:DropDownList ID="ddlCategories" Runat="server" />&nbsp; <img ID="imgAddCategory" Runat="server" />
			<asp:LinkButton ID="lnkAddCategory" runat="server" />
			
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td><asp:Button ID="btnSave" Runat="server" />&nbsp;
				<asp:Button ID="btnCancel" Runat="server" /></td>
			<td></td>
		</tr>
	</table>
</div>

<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ServerFileAdmin_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.AdminFileContent_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="pSection">
	<p id="pPortletError" class="PortletError" Runat="server" Visible="False"><asp:Label ID="lblErrMessage" Runat="server"></asp:Label></p>
	<table>
		<tr>
			<th>
				<common:FormLabel id="ContentTitleLabel" ForControl="ContentName" Runat="server" /></th>
			<td><asp:TextBox ID="ContentName" Columns="30" MaxLength="50" Runat="server"></asp:TextBox></td>
		</tr>
		<tr>
			<th>
				<asp:Literal ID="ContentLabel" Runat="server" /></th>
			<td>
				<asp:TextBox ID="FileLocation" Columns="30" MaxLength="100" Runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<th>
			</th>
			<td>
				<asp:Button ID="SaveButton" Runat="server" />&nbsp;
				<asp:Button ID="DeleteButton" Visible="False" Runat="server" />&nbsp;
				<asp:Button ID="CancelButton" Runat="server" />
			</td>
		</tr>
	</table>
</div>

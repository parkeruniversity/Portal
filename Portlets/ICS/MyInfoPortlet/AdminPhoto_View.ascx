<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminPhoto_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminPhoto_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<table cellpadding="5" cellspacing="0" border="0">
	<tr>
		<td valign="top">
			<asp:Image ID="Photo" Runat="server" />
			<asp:Panel ID="DeletePhotoPanel" Visible="False" runat="server">
				<BR>
				<asp:LinkButton id="DeletePhotoButton" Runat="server"></asp:LinkButton>
			</asp:Panel>
		</td>
		<td valign="top">
			<table border="0" cellspacing="0">
				<tr id="rowPhotoUpload" runat="server">
					<td>
						<asp:Label ID="AddPhotoLabel" Font-Bold="True" Runat="server" /><br>
						<input type="file" id="PhotoFile" runat="server" />
						<asp:Label ID="AddPhotoNote" Font-Italic="True" Runat="server" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr id="rowButtons" runat="server">
		<td></td>
		<td><asp:Button ID="SaveButton" Runat="server" /><asp:Button ID="CancelButton" Runat="server" /></td>
	</tr>
</table>
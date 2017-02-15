<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FindCandidate.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.FolderItemsPortlet.FindCandidate" %>
<table width="100%" cellpadding="3" cellspacing="3">
	<tr>
		<td width="15%" nowrap>
			<asp:Label ID="lblCandidateID" Runat="server"></asp:Label></td>
		<td width="15%" nowrap><asp:TextBox ID="txtCandidateID" Runat="server"></asp:TextBox></td>
		<td width="70%" nowrap><asp:Button ID="btnGo" Runat="server" Text="Go"></asp:Button></td>
	</tr>
	<tr>
		<td colspan="3"><asp:Label ID="lblError" CssClass="PortletError" Runat="server"></asp:Label></td>
	</tr>
</table>

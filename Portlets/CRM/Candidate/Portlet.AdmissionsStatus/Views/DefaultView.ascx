<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AdmissionsStatusPortlet.DefaultView" %>
<table width="100%" cellpadding="3" cellspacing="3">
	<tr>
		<td>
			<asp:linkbutton id="lnkViewAdmissionsStatus" Runat="server" Visible="False" onclick="lnkViewAdmissionsStatus_Click"></asp:linkbutton>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label ID="lblNeedToLogon" Runat="server" Visible="False"></asp:Label>
		</td>
	</tr>
</table>

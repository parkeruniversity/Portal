<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditTemplateView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AccountNotificationPortlet.EditTemplateView" %>
<%@ Register TagPrefix="Jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<asp:Label id="lblError" CssClass="PortletError" runat="server"/>
<Jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td align="left" width="100%">
			<Jenzabar:EmailTemplate id="emailTemplate" Runat="Server" />
		</td>
	</tr>
</table>


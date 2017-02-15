<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="Default_View.ascx.cs"
    Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.Default_View" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><jenzabar:GlobalizedLabel ID="glblAdmin" runat="server" TextKey="TXT_EA_ADMIN_TEXT" />&nbsp;<jenzabar:globalizedlinkbutton id="glnkAdmin" runat="server" TextKey="TXT_EA_CONFIGURE_SOME_SETTINGS" /></td>
		</tr>
	</table>
</div>
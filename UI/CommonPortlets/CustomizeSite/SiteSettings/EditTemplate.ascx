<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.EditTemplate" %>
<%@ Register TagPrefix="Jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<JENZABAR:ERRORDISPLAY id="errDisplay" Runat="server"></JENZABAR:ERRORDISPLAY>
<div class="pSection" runat=server id="divWarning" Visible="False">
	<asp:Label CssClass="PortletError" ID="lblWarning" Runat=server></asp:Label>
</div>
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td align="left" width="100%"><JENZABAR:EMAILTEMPLATE id="emailTemplate" Runat="Server"></JENZABAR:EMAILTEMPLATE></td>
	</tr>
</table>


<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAdminPortlet.DefaultView" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class=pSection id=contents runat="server">
	<jenzabar:hint id=hntSearch TextKey="TXT_FAA_SEARCH_HINT" runat="server"></jenzabar:hint>
	<table cellSpacing=2 cellPadding=2 border=0>
	<tr>
		<th><jenzabar:globalizedliteral id=lblID 
		TextKey="TXT_ID" 
		runat="server"></jenzabar:globalizedliteral>:</TH>
		<td><asp:textbox id=txtID Runat="server" Columns="10"></asp:textbox></TD>
		<td><jenzabar:globalizedbutton id=btnSearch TextKey="TXT_SEARCH" runat="server"></jenzabar:globalizedbutton></TD></TR>
	<tr>
		<td></TD>
		<td colSpan=2><jenzabar:globalizedlinkbutton id=lnkAdvSearch TextKey="TXT_ADVANCED_SEARCH" runat="server"></jenzabar:globalizedlinkbutton></TD>
	</TR>
	</TABLE>
</DIV>
<script language="javascript">
function validateInput()
{
	if(document.MAINFORM.<%=this.txtID.ClientID%>.value == "")
	{
		alert('<%=Globalizer.GetGlobalizedString("MSG_FAA_NO_ID_ALERT")%>');
		return false;
	}
	return;
}
</script>
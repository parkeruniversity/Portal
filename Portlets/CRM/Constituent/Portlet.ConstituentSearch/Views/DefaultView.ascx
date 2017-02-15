<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Constituent.Web.Portlets.ConstituentSearchPortlet.DefaultView" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<table width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
		<th><asp:Label ID="lblPersonSearch" Runat="server"></asp:Label></th>
	</tr>
	<tr>
		<td width="10%" nowrap align="right"><asp:Label ID="lblLastName" Runat="server" AssociatedControlID="txtLastName"></asp:Label></td>
		<td width="90%"><asp:TextBox ID="txtLastName" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblFirstName" Runat="server" AssociatedControlID="txtFirstName"></asp:Label></td>
		<td><asp:TextBox ID="txtFirstName" Runat="server" /></td>
	</tr>
	<tr>
		<td nowrap align="right"><asp:Label ID="lblMiddleName" Runat="server" AssociatedControlID="txtMiddleName"></asp:Label></td>
		<td><asp:TextBox ID="txtMiddleName" Runat="server" /></td>
	</tr>
</table>
<table id="tblCompanySearch" runat="server" width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
		<th><asp:Label ID="lblCompanySearch" Runat="server"></asp:Label></th>
	</tr>
	<tr>
		<td width="10%" nowrap align="right"><asp:Label ID="lblCompanyName" Runat="server" AssociatedControlID="txtCompanyName"></asp:Label></td>
		<td width="90%"><asp:TextBox ID="txtCompanyName" Runat="server" /></td>
	</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td width="10%" nowrap align="right"><asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" /></td>
		<td width="90%"><asp:LinkButton ID="lnkAdvanceSearch" runat="server" OnClick="lnkAdvanceSearch_Click"></asp:LinkButton></td>
	</tr>
</table>
<script language="JavaScript">
function validate() {
	if (document.MAINFORM.<%=this.txtLastName.ClientID%>.value.length <= 0 &&
		document.MAINFORM.<%=this.txtFirstName.ClientID%>.value.length <= 0 &&
		document.MAINFORM.<%=this.txtMiddleName.ClientID%>.value.length <= 0 &&
		document.MAINFORM.<%=this.txtCompanyName.ClientID%>.value.length <= 0){
		alert('<%=Globalizer.GetGlobalizedString("TXT_CONST_SRCH_EMPTY_CRITERIA")%>');
		return false;
	}
}
</script>

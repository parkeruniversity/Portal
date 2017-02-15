<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SelectQuestionType.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.SelectQuestionType" %>
<jenzabar:ErrorDisplay ID="error" Runat="server" />
<table width="704" cellpadding="3" cellspacing="3" height="40">
	<tr>
		<td colspan="2">
			<asp:Label id="lblMessage" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="123">
			<asp:Label id="lblQuestionType" runat="server"></asp:Label></td>
		<td>
			<asp:DropDownList id="ddlQuestionType" runat="server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td width="123">&nbsp;</td>
		<td>
			<asp:Button id="btnOK" runat="server"></asp:Button>&nbsp;&nbsp;&nbsp;
			<asp:Button id="btnCancel" runat="server"></asp:Button></td>
	</tr>
</table>

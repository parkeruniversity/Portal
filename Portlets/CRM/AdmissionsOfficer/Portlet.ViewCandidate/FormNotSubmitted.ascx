<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormNotSubmitted.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.FormNotSubmitted" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblMessage" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblError" runat="server"></asp:label></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td>
			<asp:Button id="btnOK" runat="server"></asp:Button></td>
	</tr>
</TABLE>

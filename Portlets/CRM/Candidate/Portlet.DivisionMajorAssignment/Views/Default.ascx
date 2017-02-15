<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.DivisionMajorAssignmentPortlet.Default"%>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%">
	<TR>
		<TD>
			<asp:linkbutton id="lnkViewDivisionMajorAssignment" Runat="server" Visible="False" onclick="lnkViewDivisionMajorAssignment_Click"></asp:linkbutton></TD>
	</TR>
	<TR>
		<TD>
			<asp:Label id="lblNeedToLogon" Visible="False" Runat="server"></asp:Label></TD>
	</TR>
	<TR>
		<TD>
			<asp:linkbutton id="lnkViewDivisionMajorUserAssignment" Runat="server" Visible="False" onclick="lnkViewDivisionMajorUserAssignment_Click"></asp:linkbutton></TD>
	</TR>
</TABLE>

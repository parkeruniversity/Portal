<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UpdateEmailAddress.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.UpdateEmailAddress" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" runat="server" ForeColor="#ff0000"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblUpdateEmailAddressTitle" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
</TABLE>
<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblAddressCode" runat="server"></asp:label></TD>
		<TD><asp:label id="lblAddressCodeValue" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblEmailAddress" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtEmailAddress" runat="server" Width="306px" MaxLength="60"></asp:textbox>&nbsp;&nbsp;&nbsp;<asp:regularexpressionvalidator id="revEmailAddress" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
				ControlToValidate="txtEmailAddress"></asp:regularexpressionvalidator></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table3" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
	</TR>
</TABLE>

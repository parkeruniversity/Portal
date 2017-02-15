<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UpdateAddress.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.UpdateAddress" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" runat="server" ForeColor="#ff0000"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblUpdateAddressTitle" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
</TABLE>
<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblAddressCode" runat="server"></asp:label></TD>
		<TD><asp:label id="lblAddressCodeValue" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblAddressLine1" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtAddrLine1" runat="server" MaxLength="60" Width="248px"></asp:textbox></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblAddressLine2" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtAddrLine2" runat="server" MaxLength="60" Width="248px"></asp:textbox></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblCity" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtCity" runat="server" MaxLength="25" Width="248px"></asp:textbox></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblState" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlState" runat="server" Width="253px"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblZip" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtZip" runat="server" Width="147px">&#160;&#160;&#160;</asp:textbox><asp:regularexpressionvalidator id="revZip" runat="server" ValidationExpression="^\d{5}((-|\s)?\d{4})?$" ControlToValidate="txtZip"></asp:regularexpressionvalidator></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblCountry" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlCountry" runat="server" Width="253px"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblPhoneNumber" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtPhoneNumber" runat="server" Width="147px">&#160;&#160;&#160;</asp:textbox><asp:regularexpressionvalidator id="revPhoneNumber" runat="server" ValidationExpression="((\(\d{3}\) ?)|(\d{3}))?-?\d{3}?-?\d{4}"
				ControlToValidate="txtPhoneNumber"></asp:regularexpressionvalidator></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table3" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
	</TR>
</TABLE>

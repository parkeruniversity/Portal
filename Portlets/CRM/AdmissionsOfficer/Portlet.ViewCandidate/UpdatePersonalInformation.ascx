<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UpdatePersonalInformation.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.UpdatePersonalInformation" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblError" runat="server" ForeColor="#ff0000"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblUpatePersInfoTitle" runat="server" Font-Bold="True"></asp:label></TD>
	</TR>
</TABLE>
<TABLE id="Table2" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:label id="lblIDNumber" runat="server"></asp:label></TD>
		<TD><asp:label id="lblIDNumberValue" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblName" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtFirst" runat="server" MaxLength="15"></asp:textbox>&nbsp;&nbsp;
			<asp:textbox id="txtMiddle" runat="server" MaxLength="15"></asp:textbox>&nbsp;&nbsp;
			<asp:textbox id="txtLast" runat="server" MaxLength="30"></asp:textbox></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblPrefName" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtPrefName" runat="server" MaxLength="30"></asp:textbox></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblPrefix" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlPrefix" runat="server" Width="240px"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblSuffix" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlSuffix" runat="server" Width="240px"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblDOB" runat="server"></asp:label></TD>
		<TD><asp:textbox id="txtDOB" runat="server" Width="88px">&nbsp;&nbsp;&nbsp;</asp:textbox><asp:regularexpressionvalidator id="revDOB" runat="server" ValidationExpression="(?=\d)^(?:(?!(?:10\D(?:0?[5-9]|1[0-4])\D(?:1582))|(?:0?9\D(?:0?[3-9]|1[0-3])\D(?:1752)))((?:0?[13578]|1[02])|(?:0?[469]|11)(?!/31)(?!-31)(?!\.31)|(?:0?2(?=.?(?:(?:29.(?!000[04]|(?:(?:1[^0-6]|[2468][^048]|[3579][^26])00))(?:(?:(?:\d\d)(?:[02468][048]|[13579][26])(?!\x20BC))|(?:00(?:42|3[0369]|2[147]|1[258]|09)\x20BC))))))|(?:0?2(?=.(?:(?:\d\D)|(?:[01]\d)|(?:2[0-8])))))([-.\/])(0?[1-9]|[12]\d|3[01])\2(?!0000)((?=(?:00(?:4[0-5]|[0-3]?\d)\x20BC)|(?:\d{4}(?!\x20BC)))\d{4}(?:\x20BC)?)(?:$|(?=\x20\d)\x20))?((?:(?:0?[1-9]|1[012])(?::[0-5]\d){0,2}(?:\x20[aApP][mM]))|(?:[01]\d|2[0-3])(?::[0-5]\d){1,2})?$"
				ControlToValidate="txtDOB"></asp:regularexpressionvalidator></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblEthnicity" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlEthnicity" runat="server" Width="240px"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD><asp:label id="lblGender" runat="server"></asp:label></TD>
		<TD><asp:dropdownlist id="ddlGender" runat="server" Width="240px"></asp:dropdownlist></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table3" cellSpacing="3" cellPadding="3" width="100%" border="0">
	<TR>
		<TD><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
	</TR>
</TABLE>

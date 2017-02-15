<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ScheduleaVisit.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.InitiateContactPortlet.ScheduleaVisit" %>
<asp:regularexpressionvalidator id="RegularExpressionValidator2" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
	ControlToValidate="txtEmailAddressText" runat="server"></asp:regularexpressionvalidator><BR>
<table>
    <tr>
        <td>
            <asp:label id="lblError" Runat="server" Visible="False" CssClass="PortletError"></asp:label>
        </td>
    </tr>
</table>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td><asp:label id="lblScheduleVisitDescriptiveText" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<th align="right" width="10%">
			<asp:label id="lblSubject" Runat="server"></asp:label></th>
		<td noWrap align="left" width="35%"><asp:label id="txtSubjectText" Runat="server"></asp:label></td>
		<td noWrap width="154">&nbsp;</td>
		<td width="40%">&nbsp;</td>
	</tr>
	<tr>
		<th vAlign="top" noWrap align="right" width="30%">
			<asp:label id="lblEmailAddress" Runat="server"></asp:label></th>
		<td noWrap align="left" colSpan="3"><asp:textbox id="txtEmailAddressText" Runat="server" Width="50%" MaxLength="255"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" ControlToValidate="txtEmailAddressText" runat="server"
				ErrorMessage="*Required"></asp:requiredfieldvalidator></td>
	</tr>
	<tr>
		<th vAlign="top" align="right" height="94">
			<asp:label id="lblMessage" Runat="server"></asp:label></th>
		<td vAlign="middle" align="left" colSpan="2" height="94"><asp:textbox id="txtMessageText" Runat="server" Width="85%" Rows="10" Height="100" TextMode="MultiLine"></asp:textbox>
		</td>
		<td vAlign="top" align="left">
			<jenzabar:hint id="hintMessageInfo" Runat="server"></jenzabar:hint>
		</td>
	</tr>
	<tr>
		<th vAlign="middle" align="right">
			<asp:Label ID="lblReq1" runat="server" CssClass="ValidationError" Visible="false">* </asp:Label><asp:label id="lblDate1" Runat="server"></asp:label></th>
		<td><jenzabar:datepicker id="dpDate1" Runat="server" Width="200px" DateChanged="dpDate1_DateChanged1"></jenzabar:datepicker></td>
		<td vAlign="top" align="left" width="286" colSpan="2" rowSpan="3"><jenzabar:hint id="hintDateInfo" Runat="server"></jenzabar:hint></td>
	</tr>
	<tr>
		<th vAlign="top" align="right">
			<asp:Label ID="lblReq2" runat="server" CssClass="ValidationError" Visible="false">* </asp:Label><asp:label id="lblDate2" Runat="server"></asp:label></th>
		<td><jenzabar:datepicker id="dpDate2" Runat="server" Width="200px" DateDisplayFormat="Short" TimeDisplayFormat="None"></jenzabar:datepicker></td>
	</tr>
	<tr>
		<th vAlign="top" align="right">
			<asp:Label ID="lblReq3" runat="server" CssClass="ValidationError" Visible="false">* </asp:Label><asp:label id="lblDate3" Runat="server"></asp:label></th>
		<td><jenzabar:datepicker id="dpDate3" Runat="server" Width="200px" DateDisplayFormat="Short" TimeDisplayFormat="None"></jenzabar:datepicker></td>
	</tr>
	<tr>
		<th noWrap align="right" width="30%">
			<asp:label id="lblGuests" Runat="server"></asp:label></th>
		<td noWrap align="left" colSpan="3"><asp:textbox id="txtGuests" Runat="server" Width="5%" MaxLength="2"></asp:textbox><i>&nbsp;<asp:label id="lblGuestsInfo" Runat="server"></asp:label></i></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan="3" noWrap><asp:label id="lblSubmitMessage" Runat="server"></asp:label>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td noWrap height="40"><asp:button id="btnSubmit" Runat="server"></asp:button></td>
		<td noWrap height="40"><asp:button id="btnCancel" Runat="server" CausesValidation="False"></asp:button></td>
	</tr>
</table>

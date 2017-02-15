<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddOrEditRadioButton.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.AddOrEditRadioButton" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<TABLE cellPadding="3">
	<TR>
		<TD align="left" colSpan="2"><asp:label id="lblScreenMessage" runat="server" CssClass="PortletError"></asp:label></TD>
	</TR>
	<TR>
		<TD noWrap align="left" colSpan="2">&nbsp;</TD>
	</TR>
	<tr>
		<th vAlign="middle" align="left">
			<asp:label id="lblQuestText" runat="server"></asp:label></th>
		<td vAlign="middle" noWrap><asp:textbox id="txtQuestText" runat="server" Width="408px"></asp:textbox><asp:requiredfieldvalidator id="valQuestText" runat="server" Enabled="False" Visible="False" ControlToValidate="txtQuestText"></asp:requiredfieldvalidator></td>
	</tr>
	<tr>
		<td vAlign="middle"><asp:label id="lblReqDataEntry" runat="server"></asp:label></td>
		<td vAlign="middle" noWrap><asp:radiobuttonlist id="rblReqDataEntry" runat="server" RepeatDirection="Horizontal"></asp:radiobuttonlist></td>
	</tr>
	<tr>
		<th vAlign="middle" noWrap align="left">
			<asp:label id="lblTagName" runat="server"></asp:label></th>
		<td vAlign="middle" noWrap><asp:textbox id="txtTagName" runat="server" Width="181px" Visible="False"></asp:textbox><asp:label id="lblTagNameText" runat="server" Visible="False"></asp:label>&nbsp;
			<asp:label id="lblNote" runat="server" Visible="False"></asp:label><asp:requiredfieldvalidator id="valTagName" runat="server" Enabled="False" Visible="False" ControlToValidate="txtTagName"></asp:requiredfieldvalidator></td>
	</tr>
	<tr>
		<th vAlign="middle" align="left">
			<asp:label id="lblTagDesc" runat="server"></asp:label></th>
		<td vAlign="middle" noWrap><asp:textbox id="txtTagDesc" runat="server" Visible="False"></asp:textbox><asp:label id="lblTagDescText" runat="server" Visible="False"></asp:label><asp:requiredfieldvalidator id="valTagDesc" runat="server" Enabled="False" Visible="False" ControlToValidate="txtTagDesc"></asp:requiredfieldvalidator></td>
	</tr>
	<TR>
		<TD noWrap align="left" colSpan="2">&nbsp;</TD>
	</TR>
	<TR>
		<th noWrap align="left" colSpan="2">
			<asp:label id="lblRadioButtonHeader" runat="server"></asp:label></th></TR>
	<TR>
		<TD noWrap align="left" colSpan="2"><asp:table id="tblRadioButtonResponses" runat="server" Width="100%"></asp:table></TD>
	</TR>
	<TR>
		<TD noWrap align="left" colSpan="2"></TD>
	</TR>
	<TR>
		<th noWrap align="left" colSpan="2">
			<asp:label id="lblMapping" runat="server" Visible="False"></asp:label></th></TR>
	<TR>
		<TD noWrap align="left" colSpan="2"></TD>
	</TR>
	<TR>
		<TD noWrap align="left"><asp:label id="lblMapName" runat="server" Visible="False"></asp:label></TD>
		<TD noWrap align="left"><asp:dropdownlist id="ddlMapName" runat="server" Width="408px" Visible="False" OnSelectedIndexChanged="ddlMapName_SelectedIndexChanged"
				AutoPostBack="True"></asp:dropdownlist></TD>
	<TR>
	<TR>
		<TD noWrap align="left" colSpan="2"><asp:table id="tblMapping" runat="server" Width="100%" Visible="False"></asp:table></TD>
	</TR>
	<TR>
		<TD noWrap align="left" colSpan="2"></TD>
	<TR>
		<TD noWrap align="left" colSpan="2"><asp:button id="btnSave" runat="server"></asp:button>&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
	</TR>
	<TR>
		<TD noWrap align="left" colSpan="2"></TD>
	</TR>
</TABLE>

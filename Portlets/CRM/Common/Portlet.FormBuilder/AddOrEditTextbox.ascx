<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddOrEditTextbox.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.AddOrEditTextbox" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:errordisplay id="Errordisplay" Runat="server"></jenzabar:errordisplay>
<TABLE width="100%">
	<TR>
		<TD vAlign="top" noWrap align="left" width="184" colSpan="2"><asp:label id="lblErrorMsg" runat="server" Width="96px" CssClass="PortletError"></asp:label></TD>
	</TR>
	<TR>
		<TD vAlign="top" align="left" width="184" colSpan="2"><asp:label id="lblScreenMessage" runat="server"></asp:label></TD>
	</TR>
	<TR>
		<th vAlign="top" noWrap align="left" width="184">
			<asp:label id="QuestDescLbl" runat="server"></asp:label></th>
		<TD vAlign="top" noWrap align="left" width="80%"><asp:textbox id="QuestDescTxt" runat="server" Width="408px"></asp:textbox><asp:requiredfieldvalidator id="valQuestText" runat="server" ControlToValidate="QuestDescTxt"></asp:requiredfieldvalidator></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"><asp:label id="ReqDataEntryLbl" runat="server"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:radiobuttonlist id="rblReqDataEntry" runat="server" RepeatDirection="Horizontal"></asp:radiobuttonlist></TD>
	</TR>
	<TR>
		<th vAlign="top" noWrap align="left" width="20%">
			<asp:label id="XMLTagNameLbl" runat="server"></asp:label></th>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:textbox id="XMLTagNameTxt" runat="server" Width="181px"></asp:textbox>
			<asp:Label id="lblTagNameText" runat="server" Visible="False"></asp:Label><asp:label id="lblNote" runat="server" Width="144px"></asp:label><asp:requiredfieldvalidator id="valTagName" runat="server" ControlToValidate="XMLTagNameTxt"></asp:requiredfieldvalidator></TD>
	</TR>
	<TR>
		<th vAlign="top" noWrap align="left" width="184">
			<asp:label id="XMLTagDescLbl" runat="server"></asp:label></th>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:textbox id="XMLTagDescTxt" runat="server" Width="408px"></asp:textbox>
			<asp:Label id="lblTagDescText" runat="server" Visible="False"></asp:Label><asp:requiredfieldvalidator id="valTagDesc" runat="server" ControlToValidate="XMLTagDescTxt"></asp:requiredfieldvalidator></TD>
	</TR>
	<TR>
		<th vAlign="top" noWrap align="left" width="184">
			<asp:label id="FieldLenLbl" runat="server"></asp:label></th>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:textbox id="FieldLenTxt" runat="server" Width="56px"></asp:textbox>
			<asp:Label id="lblFieldLenText" runat="server" Visible="False"></asp:Label>
			<asp:RequiredFieldValidator id="valFieldLen" runat="server" ControlToValidate="FieldLenTxt"></asp:RequiredFieldValidator></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"><asp:label id="ReqValLbl" runat="server"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:dropdownlist id="ddlReqVal" runat="server" width="181px"></asp:dropdownlist>
			<asp:Label id="lblReqValText" runat="server" Visible="False"></asp:Label></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184" colSpan="2"></TD>
	</TR>
	<TR>
		<th vAlign="top" noWrap align="left" width="20%" colSpan="2">
			<asp:label id="lblMapping" runat="server" Width="144px" Visible="False"></asp:label></th></TR>
	<TR>
		<TD vAlign="top" noWrap align="left" colSpan="2"></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"><asp:label id="MapTempNameLbl" runat="server" Visible="False"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:dropdownlist id="ddlMapTemp" runat="server" width="408px" Visible="False" OnSelectedIndexChanged="ddlMapTemp_SelectedIndexChanged"
				AutoPostBack="True"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"><asp:label id="TargetDbLbl" runat="server"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:textbox id="TargetDbTxt" runat="server" Width="176px" Visible="False"></asp:textbox></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"><asp:label id="MapTarget1Lbl" runat="server"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%"><asp:textbox id="MapTarget1Txt" runat="server" Width="176px" Visible="False"></asp:textbox></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184" height="29"><asp:label id="MapTarget2Lbl" runat="server"></asp:label></TD>
		<TD vAlign="top" noWrap align="left" width="10%" height="29"><asp:textbox id="MapTarget2Txt" runat="server" Width="176px" Visible="False"></asp:textbox></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="184"></TD>
		<TD vAlign="top" noWrap align="left" width="10%"></TD>
	</TR>
	<TR>
		<TD vAlign="top" noWrap align="left" width="10%" colSpan="2"><asp:button id="btnAdd" runat="server"></asp:button>&nbsp;
			<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
	</TR>
</TABLE>

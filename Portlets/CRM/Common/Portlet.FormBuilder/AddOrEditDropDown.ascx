<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddOrEditDropDown.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.Portlets.FormBuilderPortlet.AddOrEditDropDown" %>
<P>
	<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
	<TABLE cellSpacing="3" cellPadding="3">
		<TR>
			<TD colSpan="2"><asp:label id="lblScreenMessage" runat="server" CssClass="PortletError"></asp:label></TD>
		</TR>
		<tr>
			<th vAlign="middle" align="left">
				<asp:label id="lblQuestText" runat="server"></asp:label></th>
			<td vAlign="middle" noWrap><asp:textbox id="txtQuestText" runat="server" Width="408px"></asp:textbox><asp:requiredfieldvalidator id="valQuestText" runat="server" ControlToValidate="txtQuestText" Visible="False"
					Enabled="False"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<td vAlign="middle"><asp:label id="lblReqDataEntry" runat="server"></asp:label></td>
			<td vAlign="middle" noWrap><asp:radiobuttonlist id="rblReqDataEntry" runat="server" RepeatDirection="Horizontal"></asp:radiobuttonlist></td>
		</tr>
		<tr>
			<th vAlign="middle" noWrap align="left">
				<asp:label id="lblTagName" runat="server"></asp:label></th>
			<td vAlign="middle" noWrap><asp:textbox id="txtTagName" runat="server" Width="181px" Visible="False"></asp:textbox><asp:label id="lblTagNameText" runat="server" Visible="False"></asp:label>&nbsp;
				<asp:Label id="lblNote" runat="server" Visible="False"></asp:Label><asp:requiredfieldvalidator id="valTagName" runat="server" ControlToValidate="txtTagName" Visible="False" Enabled="False"></asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<th vAlign="middle" align="left">
				<asp:label id="lblTagDesc" runat="server"></asp:label></th>
			<td vAlign="middle" noWrap><asp:textbox id="txtTagDesc" runat="server" Visible="False"></asp:textbox><asp:label id="lblTagDescText" runat="server" Visible="False"></asp:label><asp:requiredfieldvalidator id="valTagDesc" runat="server" ControlToValidate="txtTagDesc" Visible="False" Enabled="False"></asp:requiredfieldvalidator></td>
		</tr>
		<TR>
			<TD colSpan="2">&nbsp;</TD>
		</TR>
		<TR>
			<th align="left" colSpan="2">
				<asp:label id="lblDropDownHeader" runat="server"></asp:label></th></TR>
		<TR>
			<TD>
				<asp:Label id="lblSQLType" runat="server"></asp:Label></TD>
			<TD>
				<asp:RadioButton id="rbSimpleSQL" runat="server" GroupName="SQLType" Checked="True"></asp:RadioButton>&nbsp;&nbsp;
				<asp:RadioButton id="rbAdvancedSQL" runat="server" GroupName="SQLType"></asp:RadioButton></TD>
		</TR>
	</TABLE>
	<div id="simple" style="DISPLAY:block">
		<TABLE cellSpacing="3" cellPadding="3">
			<TR>
				<th align="left" colSpan="2">
					<asp:label id="lblSimpleSql" runat="server"></asp:label></th>
			<TR>
			<TR>
				<TD><asp:label id="lblDisplayColumn" runat="server"></asp:label></TD>
				<TD><asp:textbox id="txtDisplayColumn" runat="server" Visible="False"></asp:textbox>
					<asp:Label id="lblDisplayColumnText" runat="server" Visible="False"></asp:Label></TD>
			</TR>
			<TR>
				<TD><asp:label id="lblKeyColumn" runat="server"></asp:label></TD>
				<TD><asp:textbox id="txtKeyColumn" runat="server" Visible="False"></asp:textbox>
					<asp:Label id="lblKeyColumnText" runat="server" Visible="False"></asp:Label></TD>
			</TR>
			<TR>
				<TD><asp:label id="lblTable" runat="server"></asp:label></TD>
				<TD><asp:textbox id="txtTable" runat="server" Visible="False"></asp:textbox>
					<asp:Label id="lblTableText" runat="server" Visible="False"></asp:Label></TD>
			<TR>
			<TR>
				<TD><asp:label id="lblFilterColumn" runat="server"></asp:label></TD>
				<TD><asp:textbox id="txtFilterColumn" runat="server" Visible="False"></asp:textbox>
					<asp:Label id="lblFilterColumnText" runat="server" Visible="False"></asp:Label></TD>
			<TR>
			<TR>
				<TD><asp:label id="lblFilterOperator" runat="server"></asp:label></TD>
				<TD>
					<asp:TextBox id="txtFilterOperator" runat="server" Visible="False"></asp:TextBox>
					<asp:Label id="lblFilterOperatorText" runat="server" Visible="False"></asp:Label></TD>
			<TR>
			<TR>
				<TD>
					<asp:Label id="lblFilterCriteria" runat="server"></asp:Label></TD>
				<TD>
					<asp:TextBox id="txtFilterCriteria" runat="server" Visible="False"></asp:TextBox>
					<asp:Label id="lblFilterCriteriaText" runat="server" Visible="False"></asp:Label></TD>
			</TR>
		</TABLE>
	</div>
	<div id="advance" style="DISPLAY:none">
		<TABLE cellSpacing="3" cellPadding="3">
			<TR>
				<Th align="left" colSpan="2">
					<asp:Label id="lblAdvancedSQL" runat="server"></asp:Label></Th>
			</TR>
			<TR>
				<TD valign="top">
					<asp:Label id="lblCompleteSQL" runat="server"></asp:Label></TD>
				<TD>
					<asp:TextBox id="txtCompleteSQL" runat="server" Width="376px" TextMode="MultiLine" Height="82px"
						Visible="False"></asp:TextBox>
					<asp:Label id="lblCompleteSQLText" runat="server" Visible="False" Height="75px"></asp:Label></TD>
			</TR>
		</TABLE>
	</div>
	<TABLE cellSpacing="3" cellPadding="3">
		<TR>
			<th align="left" colSpan="2">
				<asp:Label id="lblViewResults" runat="server"></asp:Label></th>
		<TR>
		<TR>
			<TD valign="top">
				<asp:Label id="lblSQLResults" runat="server"></asp:Label></TD>
			<TD>
				<asp:DropDownList id="ddlSQLResults" runat="server" Visible="False"></asp:DropDownList>
				<asp:Button id="btnViewResults" runat="server" CausesValidation="False"></asp:Button><br>
				<asp:Label id="lblTestError" runat="server" Visible="False" CssClass="PortletError"></asp:Label></TD>
		<TR>
		<TR>
			<th align="left" colSpan="2">
				<asp:label id="lblMapping" runat="server" Visible="False"></asp:label></th></TR>
		<TR>
			<TD><asp:label id="lblMapName" runat="server" Visible="False"></asp:label></TD>
			<TD><asp:dropdownlist id="ddlMapName" runat="server" Visible="False" OnSelectedIndexChanged="ddlMapName_SelectedIndexChanged"
					AutoPostBack="True"></asp:dropdownlist></TD>
		<TR>
		<TR>
			<TD colSpan="2"><asp:table id="tblMapping" runat="server" Width="100%"></asp:table></TD>
		</TR>
		<TR>
			<TD colSpan="2"><asp:button id="btnSave" runat="server"></asp:button>&nbsp;&nbsp;<asp:button id="btnCancel" runat="server" CausesValidation="False"></asp:button></TD>
		</TR>
	</TABLE>

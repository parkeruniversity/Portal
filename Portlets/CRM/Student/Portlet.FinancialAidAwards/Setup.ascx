<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.FinancialAidAwardsPortlet.Setup"%>
<jenzabar:SubHeader id="hrdSettings" TextKey="TXT_PORTAL_SETTINGS" runat="server"/>
<div class="pSection">
	<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
	<jenzabar:hint id="hntChangeSettings" runat="server" TextKey="TXT_PORTAL_SETTINGS_HINT"></jenzabar:hint>
	<table cellSpacing="2" cellPadding="2" width="100%">
		<tr>
			<th width="100%">
				<jenzabar:globalizedliteral id="ltAlternateURL" runat="server" TextKey="TXT_FAA_ALTERNATE_URL"></jenzabar:globalizedliteral></th></tr>
		<tr>
			<td><asp:textbox id="txtAlternateURL" Runat="server" Columns="35" MaxLength="100"></asp:textbox></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltURLInstruction" runat="server" TextKey="TXT_FAA_ALTERNATE_URL_INSTR"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:globalizedliteral id="ltAwardListHeader" runat="server" TextKey="TXT_FAA_AWARD_LIST_HEADER"></jenzabar:globalizedliteral></th></tr>
		<tr>
			<td noWrap><asp:dropdownlist id="ddlAwardListHeader" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;<asp:imagebutton id="btnAddAwardListHeader" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnEditAwardListHeader" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnDeleteAwardListHeader" Runat="server"></asp:imagebutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltSelectedAwardListHeader" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:globalizedliteral id="ltAwardListFooter" runat="server" TextKey="TXT_FAA_AWARD_LIST_FOOTER"></jenzabar:globalizedliteral></th></tr>
		<tr>
			<td noWrap><asp:dropdownlist id="ddlAwardListFooter" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;<asp:imagebutton id="btnAddAwardListFooter" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnEditAwardListFooter" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnDeleteAwardListFooter" Runat="server"></asp:imagebutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltSelectedAwardListFooter" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:globalizedliteral id="ltAcceptAidHeader" runat="server" TextKey="TXT_FAA_ACCEPT_AID_HEADER"></jenzabar:globalizedliteral></th></tr>
		<tr>
			<td noWrap><asp:dropdownlist id="ddlAcceptAidHeader" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;<asp:imagebutton id="btnAddAcceptAidHeader" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnEditAcceptAidHeader" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnDeleteAcceptAidHeader" Runat="server"></asp:imagebutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltSelectedAcceptAidHeader" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:globalizedliteral id="ltAcceptAidFooter" runat="server" TextKey="TXT_FAA_ACCEPT_AID_FOOTER"></jenzabar:globalizedliteral></th></tr>
		<tr>
			<td noWrap><asp:dropdownlist id="ddlAcceptAidFooter" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;<asp:imagebutton id="btnAddAcceptAidFooter" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnEditAcceptAidFooter" Runat="server"></asp:imagebutton>&nbsp;<asp:imagebutton id="btnDeleteAcceptAidFooter" Runat="server"></asp:imagebutton></td>
		</tr>
		<tr>
			<td><jenzabar:globalizedliteral id="ltSelectedAcceptAidFooter" runat="server"></jenzabar:globalizedliteral></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:GlobalizedLiteral TextKey="TXT_FAA_CONFIRM_AID_HEADER" id="ltConfirmAidHeader" runat="server"></jenzabar:GlobalizedLiteral></th>
		</tr>
		<tr>
			<td nowrap>
				<asp:DropDownList ID="ddlConfirmAidHeader" Runat="server"></asp:DropDownList>&nbsp;&nbsp;
				<asp:ImageButton ID="btnAddConfirmAidHeader" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnEditConfirmAidHeader" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnDeleteConfirmAidHeader" Runat="server"></asp:ImageButton>
			</td>
		</tr>
		<tr>
			<td><jenzabar:GlobalizedLiteral id="ltSelectedConfirmAidHeader" runat="server"></jenzabar:GlobalizedLiteral>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:GlobalizedLiteral TextKey="TXT_FAA_CONFIRM_AID_FOOTER" id="ltConfirmAidFooter" runat="server"></jenzabar:GlobalizedLiteral></th>
		</tr>
		<tr>
			<td nowrap>
				<asp:DropDownList ID="ddlConfirmAidFooter" Runat="server"></asp:DropDownList>&nbsp;&nbsp;
				<asp:ImageButton ID="btnAddConfirmAidFooter" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnEditConfirmAidFooter" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnDeleteConfirmAidFooter" Runat="server"></asp:ImageButton>
			</td>
		</tr>
		<tr>
			<td><jenzabar:GlobalizedLiteral id="ltSelectedConfirmAidFooter" runat="server"></jenzabar:GlobalizedLiteral>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:GlobalizedLiteral TextKey="TXT_FAA_AWARD_CHANGE_RESULTS_HEADER" id="ltChangeResultHeader" runat="server"></jenzabar:GlobalizedLiteral></th>
		</tr>
		<tr>
			<td nowrap>
				<asp:DropDownList ID="ddlChangeResultHeader" Runat="server"></asp:DropDownList>&nbsp;&nbsp;
				<asp:ImageButton ID="btnAddChangeResultHeader" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnEditChangeResultHeader" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnDeleteChangeResultHeader" Runat="server"></asp:ImageButton>
			</td>
		</tr>
		<tr>
			<td><jenzabar:GlobalizedLiteral id="ltSelectedChangeResultHeader" runat="server"></jenzabar:GlobalizedLiteral>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th width="100%">
				<jenzabar:GlobalizedLiteral TextKey="TXT_FAA_AWARD_CHANGE_RESULTS_FOOTER" id="ltChangeResultFooter" runat="server"></jenzabar:GlobalizedLiteral></th>
		</tr>
		<tr>
			<td nowrap>
				<asp:DropDownList ID="ddlChangeResultFooter" Runat="server"></asp:DropDownList>&nbsp;&nbsp;
				<asp:ImageButton ID="btnAddChangeResultFooter" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnEditChangeResultFooter" Runat="server"></asp:ImageButton>&nbsp;
				<asp:ImageButton ID="btnDeleteChangeResultFooter" Runat="server"></asp:ImageButton>
			</td>
		</tr>
		<tr>
			<td><jenzabar:GlobalizedLiteral id="ltSelectedChangeResultFooter" runat="server"></jenzabar:GlobalizedLiteral>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<jenzabar:GlobalizedButton id="btnSave" TextKey="TXT_SAVE" runat="server"></jenzabar:GlobalizedButton>&nbsp;
	<jenzabar:GlobalizedButton id="btnCancel" TextKey="TXT_CANCEL" runat="server"></jenzabar:GlobalizedButton></div>
<script language="javascript">
	function confirmDelete(list)
	{
		if (!checkSelection(list)) return false;
		return confirm('<%=Globalizer.GetGlobalizedString("MSG_DELETE_CONFIRM")%>');
	}
	
	function checkSelection(list)
	{
		if(list.selectedIndex <= 0)
		{
			alert ('<%=Globalizer.GetGlobalizedString("MSG_NO_MESSAGE_SELECTED")%>');
			return false;		
		}
		return true;
	}
</script>

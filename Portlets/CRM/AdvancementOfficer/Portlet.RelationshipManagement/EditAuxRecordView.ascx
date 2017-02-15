<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EditAuxRecordView.ascx.cs" Inherits="Jenzabar.CRM.AdvancementOfficer.Web.Portlets.RelationshipManagementPortlet.EditAuxRecord" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<jenzabar:ErrorDisplay ID="errDisplay" Runat="server" />
<h4><asp:Label ID="lblHeader" Runat="server" /></h4>
<table cellSpacing="0" cellPadding="2" width="100%">
	<tr>
		<td></td>
		<th><asp:Label ID="lblCurrentInfo" Runat="server" /></th>
	</tr>
	<tr>
		<td width="50%" valign="top">
			<table cellSpacing="2" cellPadding="2" width="100%">
				<tr>
					<th noWrap align="right" width="30%">
						<asp:label id="lblConstituent" Runat="server" /></th>
					<td noWrap align="left" width="70%"><asp:label id="lblConstName" Runat="server" /></td>
				</tr>
				<tr>
					<th noWrap align="right">
						<asp:label id="lblID" Runat="server" /></th>
					<td noWrap align="left"><asp:label id="lblConstID" Runat="server" /></td>
				</tr>
				<tr>
					<th noWrap align="right">
						<asp:label id="lblStatus" Runat="server" /></th>
					<td noWrap align="left"><asp:label id="lblConstStatus" Runat="server" /></td>
				</tr>
				<tr>
					<th noWrap align="right">
						<asp:label id="lblDate" Runat="server" /></th>
					<td noWrap align="left"><jenzabar:DatePicker ID="dpDate" DateDisplayFormat="Short" Runat="server" /></td>
				</tr>
			</table>
		</td>
		<td width="50%" valign="top">
			<asp:DataGrid ID="dgCurrentValue" AutoGenerateColumns="False" ShowHeader="False" BorderWidth="0" Runat="server">
				<Columns>
					<asp:BoundColumn DataField="Label" ItemStyle-VerticalAlign="Top" />
					<asp:BoundColumn DataField="Value" ItemStyle-VerticalAlign="Top" />
				</Columns>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<th colSpan="2" align="left">
			<asp:Label ID="lblNewInfo" Runat="server" /></th>
	</tr>
	<tr>
		<td colSpan="2"><asp:textbox id="txtNotes" Runat="server" Columns="100" Rows="8" TextMode="MultiLine" /></td>
	</tr>
	<tr>
		<td><asp:button id="btnSave" Runat="server"></asp:button>&nbsp;<asp:button id="btnCancel" Runat="server" CausesValidation="False" /></td>
	</tr>
</table>
<script language="javascript">
	function validateEditFields()
	{
		var d = document.MAINFORM.<%=this.dpDate.ClientID + "_d"%>;
		var n = document.MAINFORM.<%=this.txtNotes.ClientID%>;
		if (d.value == "")
		{
			alert('<%= Globalizer.GetGlobalizedString("MSG_DATE_REQUIRED") %>');
			d.focus();
			return false;
		}
		if (n.value == "")
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_REL_MGMT_VALIDATE_UPDATE") %>');
			n.focus();
			return false;
		}
		if (n.value.length > 2000)
		{
			alert('<%= Globalizer.GetGlobalizedString("ERR_REL_MGMT_VALIDATE_UPDATE_LENGTH") %>');
			n.focus();
			return false;
		}
		return true;
	}
</script>

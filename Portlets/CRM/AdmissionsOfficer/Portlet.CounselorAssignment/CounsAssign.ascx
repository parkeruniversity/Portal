<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CounsAssign.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.CounselorAssignmentPortlet.CounsAssign" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<jenzabar:errordisplay id="error" Runat="server"></jenzabar:errordisplay>
<input type="hidden" value="0" name="isChanged">
<asp:PlaceHolder id="plhJavaScript" Runat="server"></asp:PlaceHolder>
<div class="pSection">
	<asp:Table ID="tblError" Runat="server" Width="100%">
		<asp:TableRow>
			<asp:TableCell>
				<asp:Label ID="lblError" Runat="server" CssClass="PortletError" Visible="False" />
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<jenzabar:hint id="hintInstructions" runat="server" TextKey="TXT_ADOASSIGNMENT_LABEL_INSTRUCTIONS_SMALL" />
	<table>
		<tr vAlign="middle">
			<th>
				<jenzabar:globalizedlabel id="labelAdmissionsOfficer" runat="server" TextKey="TXT_ADOASSIGNMENT_LABEL_DROPDOWNLIST" AssociatedControlID="DropDownListOfficers"></jenzabar:globalizedlabel></th>
			<td><asp:dropdownlist id="DropDownListOfficers" runat="server" AutoPostBack="True" DataTextField="DisplayName"
					DataValueField="Guid"></asp:dropdownlist></td>
		</tr>
	</table>
	<asp:DataGrid ID="dgCounselors" Runat="server" DataKeyField="OfficerCounselorID" AutoGenerateColumns="False"
		CellSpacing="1" CellPadding="0" ShowHeader="False" GridLines="None" HeaderStyle-CssClass="header"
		AlternatingItemStyle-CssClass="alt" Width="100%">
		<Columns>
			<asp:TemplateColumn HeaderStyle-Width="25%" ItemStyle-Width="25%">
				<HeaderTemplate>
					<asp:CheckBox ID="chkAll49651" Runat="server" OnClick="javascript: return select_deselectAll (this.checked, this.id);" AutoPostBack="False" Text='<%#Globalizer.GetGlobalizedString("TXT_ADOASSIGNMENT_SELECT_DESELECT")%>' />
				</HeaderTemplate>
				<ItemTemplate>
					<asp:CheckBox ID="chkAssign16957" Runat="server" OnClick="javascript: return select_deselectAll (this.checked, this.id);" />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="DisplayName" HeaderStyle-Width="75%" ItemStyle-Width="75%" />
		</Columns>
	</asp:DataGrid>
	<table>
		<tr>
			<td>
				<jenzabar:globalizedbutton id="buttonSave" runat="server" TextKey="TXT_SAVE" visible="false"></jenzabar:globalizedbutton>&nbsp;
				<jenzabar:globalizedbutton id="buttonReset" runat="server" TextKey="TXT_RESET" visible="false"></jenzabar:globalizedbutton>&nbsp;
				<jenzabar:globalizedbutton id="buttonCancel" runat="server" TextKey="TXT_CANCEL" visible="false"></jenzabar:globalizedbutton>
			</td>
		</tr>
	</table>
</div>

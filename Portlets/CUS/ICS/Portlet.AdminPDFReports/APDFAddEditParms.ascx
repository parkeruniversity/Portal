<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="APDFAddEditParms.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.AdminPDFReportsPortlet.APDFAddEditParms" %>
<div class="pSection">
	<h4>Report Parameters for&nbsp;
		<asp:Label ID="lblReportName" Runat="server" /></h4>
	<table>
		<tr>
			<td>Type:</td>
			<td><asp:DropDownList ID="ddType" Runat="server" DataValueField="ID" DataTextField="TypeName" /></td>
		</tr>
		<tr>
			<td>Display to end user:</td>
			<td><asp:CheckBox ID="cbDisplay" Runat="server" /></td>
		</tr>
		<tr>
			<td>Display name:</td>
			<td><asp:TextBox ID="tbDisplayName" Runat="server" MaxLength="60" /></td>
		</tr>
		<tr>
			<td>Display description:</td>
			<td><asp:TextBox ID="tbDisplayDesc" Runat="server" Columns="100" MaxLength="255" /></td>
		</tr>
		<tr>
			<td>Parameter length:</td>
			<td><asp:TextBox ID="tbParmLength" Runat="server" MaxLength="2" /></td>
		</tr>
		<tr>
			<td>Drop Down:</td>
			<td><asp:DropDownList ID="ddDropDown" Runat="server" DataValueField="ID" DataTextField="DropDownName" /></td>
		</tr>
		<tr>
			<td>Allow Wildcard:</td>
			<td><asp:CheckBox ID="cbAllowWildcard" Runat="server" /></td>
		</tr>
		<tr>
			<td valign="top">Default value:</td>
			<td><asp:TextBox ID="tbDefaultValue" Runat="server" MaxLength="20" /><br><div class="hint">If @@HostID, @@Username, @@SessionID or @@UserID is used as the default value then the logged in users information will be passed. Data Type of LONG will be used by force for @@HostID.</div></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><asp:Button ID="btnSave" Runat="server" Text="Save" />&nbsp;<asp:Button ID="btnCancel" Runat="server" Text="Cancel" /></td>
		</tr>
	</table>
</div>

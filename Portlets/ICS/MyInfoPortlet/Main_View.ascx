<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<!-- THE MAIN VIEW APPEARS IN THE ADMINISTRATION TOOL. -->
<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
<cmn:subheader id="shName" runat="server"></cmn:subheader>
<fieldset>
	<div class="pSection">
		<table cellSpacing="0" cellPadding="5" border="0">
			<tr>
				<th>
					<asp:Label ID="PreferredNameLabel" Runat="server"></asp:Label></th>
				<td><asp:TextBox ID="PreferredName" Columns="30" MaxLength="500" Runat="server" /><asp:Literal ID="litPreferredName" Visible="false" Runat="server" /></td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="HideMiddleNameLabel" Runat="server"></asp:Label></th>
				<td><asp:CheckBox ID="HideMiddleName" Runat="server" /></td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="PrefixLabel" Runat="server"></asp:Label></th>
				<td>
					<asp:ListBox ID="Prefix" Rows="1" Runat="server" /><asp:Literal ID="litPrefix" Visible="false" Runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<asp:Label ID="SuffixLabel" Runat="server"></asp:Label></th>
				<td>
					<asp:ListBox ID="Suffix" Rows="1" Runat="server" /><asp:Literal ID="litSuffix" Visible="false" Runat="server" />
				</td>
			</tr>
            <tr>
				<td colspan="2" align="center">
				<td><asp:Button ID="SaveButton" Runat="server" />&nbsp;<asp:Button ID="CancelButton" Runat="server" /></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="5" border="0">
			<tr>
				<td><jenzabar:hint id="lblHint" Visible="True" runat="server"></jenzabar:hint></td>
			</tr>
		</table>
		
	</div>
</fieldset>


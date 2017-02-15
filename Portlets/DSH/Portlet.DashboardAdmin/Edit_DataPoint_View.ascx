<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Edit_DataPoint_View.ascx.cs" Inherits="DashboardAdminPortlet.Edit_DataPoint_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<DIV class="pSection">
	<fieldset>
		<table width="100%">
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblType" Runat="server">Type</asp:label></th>
				<td width="75%"><asp:dropdownlist id="ddType" Runat="server" Width="99%" TabIndex="10"></asp:dropdownlist></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblName" Runat="server">Name:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbName" Runat="server" Width="99%" AutoPostBack="True" TabIndex="20"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblLabel" Runat="server">Label:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbLabel" Runat="server" Width="99%" TabIndex="30"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblDescription" Runat="server">Description:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbDescription" Runat="server" Width="99%" TabIndex="40"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblDataSourceName" Runat="server">Data Source Name:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbDataSourceName" Runat="server" Width="99%" TabIndex="50"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblSQL" Runat="server">SQL:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbSQL" Width="99%" TextMode="MultiLine" Height="297px" runat="server" Wrap="True"
						TabIndex="60"></asp:textbox></td>
			</tr>
			<tr>
				<th vAlign="top" align="left">
					<asp:label id="lblFileName" Runat="server">Filename:</asp:label></th>
				<td vAlign="top"><asp:textbox id="tbFilename" Runat="server" Width="99%" TabIndex="70"></asp:textbox></td>
			</tr>
			<tr>
				<th>
					<td><asp:button id="btnSave" Runat="server" Width="64px" CausesValidation="True" Text="Save" TabIndex="80"></asp:button>&nbsp;
						<asp:button id="btnCancel" Runat="server" Text=" Cancel " TabIndex="90"></asp:button></td>
			</tr>
		</table>
	</fieldset>
</DIV>

<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ItemVariableEdit_View.ascx.cs" Inherits="DashboardAdminPortlet.ItemVariableEdit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>



<table width="100%" border=0>
  <TBODY>
  <tr>
    <th><asp:label id=lblName Runat="server">Name:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbName Runat="server" Width="99%" Enabled="False" BorderStyle="Outset" BorderWidth="5px"></asp:textbox></td></tr>
  <tr>
    <th><asp:label id=lblDescription Runat="server">Description:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbDescription Runat="server" Width="99%" Enabled="False" BorderStyle="Outset" BorderWidth="5px"></asp:textbox></td></tr>
  <tr>
    <th><asp:label id=lblVariableValue Runat="server">Value:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbVariableValue Runat="server" Width="99%" MaxLength="1000"></asp:textbox></td></tr>
  <tr>
    <th><asp:label id=lblDefaultValue Runat="server">Use Default Value:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbDefaultValue Runat="server" Width="99%" Enabled="False" BorderStyle="Outset" BorderWidth="5px"></asp:textbox></td>
    <td><asp:checkbox id=cbUseDefaultValue Runat="server" Text=" "></asp:checkbox></td></tr>
  <tr>
    <th><asp:label id=lblVariableSQL Runat="server">SQL:</asp:label></th>
    <td style="HEIGHT: 20px" colSpan=3><asp:textbox id=tbVariableSQL Runat="server" Width="99%" TextMode="MultiLine" MaxLength="5000"></asp:textbox></td></tr>
  <tr>
    <th style="HEIGHT: 4px"><asp:label id=lblDefaultSQL Runat="server">Use Default SQL:</asp:label></th>
    <td style="HEIGHT: 4px" colSpan=3><asp:textbox id=tbDefaultSQL Runat="server" Width="99%" Enabled="False" TextMode="MultiLine" BorderStyle="Outset" BorderWidth="5px"></asp:textbox></td>
    <td style="HEIGHT: 4px"><asp:checkbox id=cbUseDefaultSQL Runat="server" Height="19px" Width="64px" Text=" "></asp:checkbox></td></tr>
  <tr>
    <th><asp:label id=lblDataSourceID Runat="server">Data Source:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbDataSourceID Runat="server" Width="99%" MaxLength="255"></asp:textbox></td></tr>
  <tr>
    <th><asp:label id=lblDefaultDataSource Runat="server">Use Default Datasource:</asp:label></th>
    <td colSpan=3><asp:textbox id=tbDefaultDatasource Runat="server" Width="99%" Enabled="False" BorderStyle="Outset" BorderWidth="5px"></asp:textbox></td>
    <td><asp:checkbox id=cbUseDefaultDataSource Runat="server" Text=" "></asp:checkbox></td></tr>
  <tr>
    <td></td>
    <td colSpan=2><asp:button id=btnSave Runat="server" Width="56px" Text="Save"></asp:button>&nbsp;<asp:button id=btnSaveClose Runat="server" Text="Save and Close"></asp:button>&nbsp;<asp:button id=btnCancel Runat="server" Width="56px" Text=" Cancel "></asp:button></td>
    <td colSpan=1><asp:button id=btnRefresh Runat="server" Text="Refresh"></asp:button></td></tr></TBODY></table></TR></TBODY></TABLE></TR></TBODY></TABLE>

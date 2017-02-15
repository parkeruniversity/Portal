<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UsersCopy_View.ascx.cs" Inherits="DashboardAdminPortlet.UsersCopy_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" align="center">
	<TBODY>
		<tr>
			<th width="50%"><table width="100%"><tr><td>Copy From:</td><td align=right><asp:CheckBox ID="cbOverride" Runat="server" Text="Copy Settings" Checked="False" 
					Font-Size="8" ToolTip="If Copy To user has Dashboard, override settings with source users settings"  /></td></tr></table>
				 </th>
			<th width="50%">
				<asp:button id="btnCopy" Text="Copy to" Runat="server"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:linkbutton id="lbtnUsers" Runat="server">Users</asp:linkbutton>&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:linkbutton id="lbtnGroups" Runat="server"> Groups </asp:linkbutton></th></tr>
		<tr>
			<td><asp:listbox id="lbUserSource" Rows="20" runat="server"></asp:listbox></td>
			<td><asp:listbox id="lbUserTarget" Rows="20" runat="server" SelectionMode="Multiple"></asp:listbox></td>
		</tr>
	</TBODY>
</table></TD></TR></TBODY></TABLE>

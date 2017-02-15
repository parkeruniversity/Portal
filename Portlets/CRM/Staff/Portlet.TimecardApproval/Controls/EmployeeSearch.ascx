<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EmployeeSearch.ascx.cs" Inherits="Portlet.TimecardApproval.Controls.EmployeeSearch" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<div class="tcaEmployeeSearchBar">
<table runat="server">
    <tr>
    <td>
	<asp:TextBox ID="SearchBox" Width="250" runat="server" />
	</td>
	<td>
	<common:GlobalizedButton ID="SearchButton" runat="server" />
	</td>
	</tr>
</table>
</div>

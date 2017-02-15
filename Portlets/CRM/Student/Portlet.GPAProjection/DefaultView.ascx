<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.GPAProjectionPortlet.DefaultView" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection">
	<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
	<jenzabar:hint id="hntDivDirections" runat="server"></jenzabar:hint>
	<table cellSpacing="2" cellPadding="2" width="100%" border="0" id="tblDivision" runat="server">
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<th noWrap width="5%" valign="top">
				<asp:label id="lblDivision" runat="server"></asp:label></th>
			<td width="95%" valign="top" nowrap>
				<asp:dropdownlist id="ddlDivision" Runat="server"></asp:dropdownlist>
				&nbsp;
				<jenzabar:GlobalizedButton id="btnGo" runat="server" TextKey="TXT_GO"></jenzabar:GlobalizedButton>
			</td>
		</tr>
	</table>
</div>

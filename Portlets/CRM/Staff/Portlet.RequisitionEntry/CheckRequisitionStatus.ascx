<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CheckRequisitionStatus.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.RequisitionEntryPortlet.CheckRequisitionStatus" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cc1" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<table height="100%" cellSpacing="3" cellPadding="3" width="100%">
	<tr>
		<td><asp:label id="lblErrorValidation" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblheader" Runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<tr>
		<td><asp:label id="lblSearchCriteria" Runat="server"></asp:label></td>
	</tr>
</table>
<table cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td width="20%" nowrap><asp:label id="lblReqNum" Runat="server"></asp:label></td>
		<td align="left" width="80%"><asp:textbox id="colReqNum" Runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td nowrap><asp:label id="lblEnteredDate" Runat="server"></asp:label></td>
		<td align="left"><cc1:datepicker id="DatePicker1" runat="server" ></cc1:datepicker></td>
	</tr>
	<tr>
		<td nowrap><asp:label id="lblNeedByDate" Runat="server"></asp:label></td>
		<td align="left"><cc1:datepicker id="Datepicker2" runat="server" ></cc1:datepicker></td>
	</tr>
</table>
<br>
<table cellSpacing="3" cellPadding="3" width="100%" border="0">
	<tr>
		<td colspan="2" nowrap><asp:label id="lblReqStsSearchCriteria" Runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<tr>
		<td  width="5%"><asp:checkbox id="colNotOAT" Runat="server" Checked="True"></asp:checkbox></td>
		<td align="left"  width="95%"><asp:label id="lblNotOAT" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:checkbox id="colStillNeedsApl" Runat="server" Checked="True"></asp:checkbox></td>
		<td align="left"><asp:label id="lblStillNeedsApl" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:checkbox id="colApprovednotPO" Runat="server" Checked="True"></asp:checkbox></td>
		<td align="left"><asp:label id="lblApprovednotPO" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:checkbox id="colApprovedIsaPO" Runat="server" Checked="True"></asp:checkbox></td>
		<td align="left"><asp:label id="lblApprovedIsaPO" Runat="server"></asp:label></td>
	</tr>
	<tr>
		<td><asp:checkbox id="colDenied" Runat="server" Checked="True"></asp:checkbox></td>
		<td align="left"><asp:label id="lblDenied" Runat="server"></asp:label></td>
	</tr>
</table>
<div align="center">
	<table cellPadding="20">
		<tr>
			<td><asp:button id="submit" runat="server" Height="22px"></asp:button></td>
			<td><asp:button id="cancel" runat="server" Height="22px"></asp:button></td>
		</tr>
	</table>
</div>

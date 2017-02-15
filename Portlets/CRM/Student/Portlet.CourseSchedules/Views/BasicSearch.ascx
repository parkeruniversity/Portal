<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="BasicSearch.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.BasicSearch" %>
<div Class="pSection">
	<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
	<table width="100%" cellpadding="2" cellspacing="1">
		<tr>
			<td width="10%" nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblTerm" TextKey="TXT_TERM" Runat="server"></jenzabar:GlobalizedLabel>:</td>
			<td width="90%" align="left"><asp:DropDownList ID="ddlTerm" DataValueField="Key" DataTextField="Description" Runat="server"></asp:DropDownList></td>
		</tr>
		<tr>
			<td nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblDivision" Runat="server"></jenzabar:GlobalizedLabel></td>
			<td align="left"><asp:DropDownList ID="ddlDivision" DataValueField="Code" DataTextField="Description" Runat="server"></asp:DropDownList></td>
		</tr>
		<tr>
			<td nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblDept" TextKey="TXT_DEPARTMENT" Runat="server"></jenzabar:GlobalizedLabel>:</td>
			<td align="left"><asp:DropDownList ID="ddlDept" DataValueField="Code" DataTextField="Description" Runat="server"></asp:DropDownList></td>
		</tr>
		<tr>
			<td nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblCampus" TextKey="TXT_CAMPUS" Runat="server"></jenzabar:GlobalizedLabel>:</td>
			<td align="left"><asp:DropDownList ID="ddlCampus" DataValueField="ERPCampusKey" DataTextField="Description" Runat="server"></asp:DropDownList></td>
		</tr>
		<tr>
			<td nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblCourse" TextKey="LBL_COURSE_CODE" Runat="server"></jenzabar:GlobalizedLabel></td>
			<td align="left" nowrap>
				<asp:DropDownList ID="ddlRestrictor1" Runat="server"></asp:DropDownList>
				<asp:TextBox ID="txtRestrictor1" Runat="server" Columns="25"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblReference" TextKey="LBL_CS_REFERENCE#" Runat="server"></jenzabar:GlobalizedLabel></td>
			<td align="left" nowrap>
				<asp:DropDownList ID="ddlRestrictor2" Runat="server"></asp:DropDownList>
				<asp:TextBox ID="txtRestrictor2" Runat="server" Columns="25"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><jenzabar:GlobalizedButton ID="btnSearch" TextKey="TXT_SEARCH" Runat="server"></jenzabar:GlobalizedButton></td>
		</tr>
		<tr>
			<td></td>
			<td><jenzabar:GlobalizedLinkButton ID="lnkAdvancedSearch" TextKey="TXT_CS_ADVANCED_COURSE_SEARCH" Runat="server"></jenzabar:GlobalizedLinkButton></td>
		</tr>
		<tr>
			<td></td>
			<td><jenzabar:GlobalizedLinkButton ID="lnkAddDrop" TextKey="TXT_CS_ADD_DROP_COURSES" Runat="server"></jenzabar:GlobalizedLinkButton></td>
		</tr>
	</table>
</div>

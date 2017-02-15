<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Search.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacilitiesSchedulePortlet.Search" %>
<div class="pSection">
	<jenzabar:ErrorDisplay id="errDisplay" Runat="server" />
	<jenzabar:hint id="hntSearch" TextKey="TXT_FS_SEARCH_HINT" runat="server"></jenzabar:hint>
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th noWrap align="right">
				<jenzabar:GlobalizedLabel TextKey="TXT_TERM" id="lblTerm" Runat="server"></jenzabar:GlobalizedLabel>:</th>
			<td align="left" colSpan="2"><asp:dropdownlist id="ddlTerm" DataValueField="Key" DataTextField="Description" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th noWrap align="right">
				<jenzabar:GlobalizedLabel id="lblCampus" TextKey="TXT_CAMPUS" Runat="server"></jenzabar:GlobalizedLabel>:</th>
			<td align="left" colSpan="2"><asp:dropdownlist id="ddlCampus" DataValueField="ERPCampusKey" DataTextField="Description" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<th noWrap align="right" width="10%">
				<jenzabar:GlobalizedLabel id="lblBuilding" TextKey="TXT_BUILDING" Runat="server"></jenzabar:GlobalizedLabel>:</th>
			<td align="left" width="10%"><asp:dropdownlist id="ddlBuilding" Runat="server"></asp:dropdownlist></td>
			<td width="80%" align="left"><jenzabar:GlobalizedButton ID="btnGetRooms" TextKey="TXT_FS_RETRIEVE_ROOMS" Runat="server"></jenzabar:GlobalizedButton></td>
		</tr>
	</table>
	<jenzabar:subheader id="hdrRoomSearch" TextKey="TXT_FS_ROOM_SEARCH" runat="server"></jenzabar:subheader>
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td width="1%"><asp:RadioButton ID="rdRoom" Checked="True" GroupName="Search" Runat="server"></asp:RadioButton></td>
			<th noWrap width="9%" align="right">
				<jenzabar:GlobalizedLabel id="lblRoom" TextKey="TXT_ROOM" Runat="server"></jenzabar:GlobalizedLabel>:</th>
			<td align="left" width="90%"><asp:dropdownlist id="ddlRoom" Runat="server"></asp:dropdownlist></td>
		</tr>
		<tr>
			<td><asp:RadioButton ID="rdString" GroupName="Search" Runat="server"></asp:RadioButton></td>
			<th nowrap align="right">
				<jenzabar:GlobalizedLabel ID="lblString" TextKey="TXT_FS_STRING_SEARCH" Runat="server"></jenzabar:GlobalizedLabel>:</th>
			<td align="left" nowrap>
				<asp:DropDownList ID="ddlSearchType" Runat="server"></asp:DropDownList>
				<asp:TextBox ID="txtString" Runat="server" Columns="20"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="left"><jenzabar:GlobalizedButton TextKey="TXT_SEARCH" ID="btnSearch" Runat="server"></jenzabar:GlobalizedButton></td>
		</tr>
	</table>
</div>

<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.TimecardPortlet" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Timecard.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.TimecardPortlet.TimecardEntry"%>
<div id="divError" runat="server" visible="false" class="pSection">
	<jenzabar:errordisplay id="ctlErrorDisplay" RunAt="server"></jenzabar:errordisplay>
</div>
<div id="divWarning" runat="server" visible="false" class="pSection">
	<asp:label id="lblError" Runat="server" CssClass="PortletError"></asp:label>
</div>
<div id="divContent" runat="server" visible="false" class="pSection">
	<table cellSpacing="0" cellPadding="1" width="100%" border="0">
		<tr>
			<td><asp:dropdownlist id="ddlPayGroup" Visible="False" AutoPostBack="True" Runat="server"></asp:dropdownlist><asp:label id="lblPayGroup" Visible="False" Runat="server" CssClass="PortletItemTitle"></asp:label></td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="1" width="100%" border="0">
		<tr vAlign="top">
			<td align="left"><asp:button id="btnPrev" Runat="server" Text="< Prev"></asp:button></td>
			<td align="right"><asp:button id="btnNext" Runat="server" Text="Next >"></asp:button></td>
		</tr>
		<tr vAlign="top">
			<td colSpan="2">
				<asp:datagrid id="dgTimecard" DataKeyField="PositionKey" AutoGenerateColumns="False"
					runat="server" Width="100%" ShowFooter="True">
					<HeaderStyle CssClass="header"></HeaderStyle>
					<FooterStyle CssClass="header"></FooterStyle>
				</asp:datagrid>
			</td>
		</tr>
	</table>
	<table cellSpacing="0" cellPadding="1" width="100%" border="0">
		<tr>
			<td align="left"><asp:button id="btnCollapseExpand" Runat="server" Text="Show Detail"></asp:button><asp:label id="lblSpace1" Runat="server" Text="&nbsp;"></asp:label><asp:button id="btnSave" Runat="server" Text="Save"></asp:button><asp:label id="lblSpace2" Runat="server" Text="&nbsp;"></asp:label><asp:button id="btnCancel" Runat="server" Text="Cancel"></asp:button></td>
		</tr>
	</table>
</div>

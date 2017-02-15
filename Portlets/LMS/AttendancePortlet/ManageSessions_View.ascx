<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ManageSessions_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.ManageSessions_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
	<table width="100%">
		<tr>
			<td>
				<common:GlobalizedLinkButton id="lnkMain" runat="server" textkey="TXT_MAIN_SCREEN" /> 
				>
				<common:GlobalizedLabel id="lblWeeklyView" runat="server" textkey="TXT_VIEW_A_SESSION" />
			</td>
		</tr>
	</table>
</div>
<common:SubHeader ID="hdrAttendance" Runat="server" TextKey="TXT_ALL_SESSIONS" />
<div class="pSection">
	<common:AddImageAndTextButton ID="lnkAddSession" TextKey="TXT_ADD_SESSION" Runat="server" />
</div>
<div class="pSection">
	<table width="100%">
		<tr>
			<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_TOTAL_SESSIONS") %></td>
			<td><strong><asp:Label ID="lblTotalSessions" Runat="server" /></strong></td>
		</tr>
		<asp:PlaceHolder ID="phTotalLength" Runat="server">
			<tr>
				<td width="10%" align="right" nowrap><asp:Label ID="lblTotalLengthDesc" Runat="server" /></td>
				<td><strong><asp:Label ID="lblTotalLength" Runat="server" /></strong></td>
			</tr>
		</asp:PlaceHolder>
	</table>
</div>
<div class="pSection">
	<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_SESSION_RECORD") %>
		</TableHeaderTemplate>
		<TableFooterTemplate>
			<asp:Button ID="btnSave" CommandName="Save" Runat="server" />
			<asp:Button ID="btnCancel" CommandName="Cancel" Runat="server" />
		</TableFooterTemplate>
	</common:GroupedGrid>
	<br>
</div>
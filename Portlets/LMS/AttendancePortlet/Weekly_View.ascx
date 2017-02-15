<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Weekly_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.Weekly_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
	<table width="100%">
		<tr>
			<td>
				<common:GlobalizedLinkButton id="lnkMain" runat="server" textkey="TXT_MAIN_SCREEN" />&gt;
				<common:GlobalizedLabel id="lblWeeklyView" runat="server" textkey="TXT_WEEKLY_VIEW" />
			</td>
			<td align="right">
				<asp:LinkButton ID="lnkPrevWeek" Runat="server" />
				|
				<asp:LinkButton ID="lnkThisWeek" Runat="server" />
				|
				<asp:LinkButton ID="lnkNextWeek" Runat="server" />
			</td>
		</tr>
	</table>
	<br>
	<asp:Literal id="litNoSessions" runat="server" />
	<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid"
		AllowSorting="True" DataKeyField="UserID" runat="server">
		<TableHeaderTemplate>
			<table width="100%">
				<tr>
					<td width="90%">
						<asp:Label ID="lblHeader" Runat="server" />
					</td>
					<td align="right" nowrap="nowrap">
						<common:GlobalizedLinkButton ID="lnkEdit" CommandName="Edit" TextKey="TXT_EDIT_SAVED_ENTRIES" Runat="server" />
					</td>
				</tr>
			</table>
		</TableHeaderTemplate>
		<TableFooterTemplate>
			<table width="100%">
				<tr>
					<td width="90%">
						<asp:Button ID="btnSave" CommandName="Save" Runat="server" />
						<asp:Button ID="btnCancel" CommandName="Cancel" Runat="server" />
						<a ID="lnkExport" Runat="server">
							<%=Globalizer.GetGlobalizedString("TXT_EXPORT_TO_EXCEL")%>
						</a>
					</td>
					<td align="right" nowrap="nowrap">
						<common:GlobalizedLinkButton ID="lnkEdit" CommandName="Edit" TextKey="TXT_EDIT_SAVED_ENTRIES" Runat="server" />
					</td>
				</tr>
			</table>
		</TableFooterTemplate>
	</common:GroupedGrid>
	<br>
</div>

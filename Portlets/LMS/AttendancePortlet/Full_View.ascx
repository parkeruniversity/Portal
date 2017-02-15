<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Full_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.Full_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<common:SubHeader ID="hdrAttendance" Runat="server" TextKey="TXT_ATTENDANCEPORTLET_FULL_ATTENDANCE" />
<div class="pSection">
	<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_ATTENDANCE") %>
		</TableHeaderTemplate>
		<TableFooterTemplate>
			<common:ImageAndTextButton ID="lnkExport" CommandName="ExportToExcel" TextKey="TXT_EXPORT_TO_EXCEL" Runat="server" />
		</TableFooterTemplate>
	</common:GroupedGrid>
</div>
<div class="pSection">
	<common:GroupedGrid ID="gridAttendanceWithdrawn" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_ATTENDANCE_WITHDRAWN") %>
		</TableHeaderTemplate>
		<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_WITHDRAWN_STUDENTS")%></EmptyTableTemplate>
	</common:GroupedGrid>
</div>

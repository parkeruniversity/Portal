<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewSession_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.ViewSession_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
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
			<td align="right">
				<common:GlobalizedLinkButton ID="lnkPrevSession" TextKey="TXT_LT_PREV_SESSION_DAY" Runat="server" />
				|
				<common:GlobalizedLinkButton ID="lnkNextSession" TextKey="TXT_NEXT_SESSION_DAY_GT" Runat="server" />
			</td>
		</tr>
	</table>
</div>
<common:SubHeader ID="hdrAttendance" Runat="server" />
<div class="pSection">
	
	<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_STUDENT_ATTENDANCE") %>
		</TableHeaderTemplate>
		<TableFooterTemplate>
			<table width="100%">
				<tr>
					<td width="90%">
						<asp:Button ID="btnSave" CommandName="Save" Runat="server" />
						<asp:Button ID="btnCancel" CommandName="Cancel" Runat="server" />
					</td>
					<td align="right" nowrap>
						<common:GlobalizedLinkButton ID="lnkEdit" CommandName="Edit" TextKey="TXT_EDIT_SAVED_ENTRIES" Runat="server" />
					</td>
				</tr>
			</table>
		</TableFooterTemplate>
	</common:GroupedGrid>
	<br>
	<common:GlobalizedLinkButton ID="lnkCancelSession" CommandName="Edit" TextKey="TXT_CANCEL_SESSION" Runat="server" />
</div>
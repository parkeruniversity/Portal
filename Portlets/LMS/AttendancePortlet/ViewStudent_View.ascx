<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewStudent_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.ViewStudent_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.LMS" %>
<div id="divHeader" runat="server" class="pSection">
	<table width="100%">
		<tr>
			<td>
				<common:GlobalizedLinkButton id="lnkMain" runat="server" textkey="TXT_MAIN_SCREEN" /> 
				>
				<common:GlobalizedLabel id="lblWeeklyView" runat="server" textkey="TXT_VIEW_A_STUDENT" />
			</td>
			<td align="right">
				<asp:LinkButton ID="lnkPrevStudent" Runat= "server" />
				<asp:Label ID="lblSep" Runat="server">|</asp:Label>
				<asp:LinkButton ID="lnkNextStudent" Runat= "server" />
			</td>
		</tr>
	</table>
</div>
<common:SubHeader ID="hdrAttendance" Runat="server" />
<div class="pSection">
	<table width="100%">
		<tr>
			<td colspan="2"><strong><%= Globalizer.GetGlobalizedString("LBL_ATTENDANCE_STATS") %></strong></td>
		</tr>
		<tr>
			<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_TOTAL_ATTENDANCE") %></td>
			<td><strong><asp:Label ID="lblTotalAttendance" Runat="server" /></strong></td>
		</tr>
		<asp:PlaceHolder ID="phTardy" Runat="server">
			<tr>
				<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_TOTAL_TIMES_TARDY") %></td>
				<td><strong><asp:Label ID="lblTardy" Runat="server" /></strong></td>
			</tr>
		</asp:PlaceHolder>
		<tr>
			<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_ABSENCES_UNEXCUSED") %></td>
			<td><strong><asp:Label ID="lblAbsenceUnexcused" Runat="server" /></strong></td>
		</tr>
		<tr>
			<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_ABSENCES_EXCUSED") %></td>
			<td><strong><asp:Label ID="lblAbsenceExcused" Runat="server" /></strong></td>
		</tr>
		<tr>
			<td width="10%" align="right" nowrap><%= Globalizer.GetGlobalizedString("LBL_TOTAL_MISSED_SESSIONS") %></td>
			<td><strong><asp:Label ID="lblTotalMissed" Runat="server" /></strong></td>
		</tr>
		<asp:PlaceHolder ID="phMinutes" Runat="server">
			<tr>
				<td width="10%" align="right" nowrap><asp:label ID="lblMinutesRatioDesc" Runat="server" /></td>
				<td><strong><asp:Label ID="lblMinutesRatio" Runat="server" /></strong></td>
			</tr>
		</asp:PlaceHolder>
	</table>
</div>
<div class="pSection">
	<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
		    <table width="100%">
				<tr>
					<td width="90%" >
					<%# Globalizer.GetGlobalizedString("TXT_ATTENDANCE_RECORD") %>
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
					</td>
					<td align="right" nowrap>
						<common:GlobalizedLinkButton ID="lnkEdit" CommandName="Edit" TextKey="TXT_EDIT_SAVED_ENTRIES" Runat="server" />
					</td>
				</tr>
			</table>
		</TableFooterTemplate>
	</common:GroupedGrid>
	<br>
</div>
<div class="pSection">
	<common:GroupedGrid ID="gridMakeUp" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid" AllowSorting="True" DataKeyField="ID" runat="server">
		<TableHeaderTemplate>
			<%# Globalizer.GetGlobalizedString("TXT_MAKEUP_TIME") %>
		</TableHeaderTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="Date" SortExpression="MakeUpDate">
				<ItemTemplate><%# GenerateDateString((DateTime)((AttendanceMakeUp)Container.DataItem).MakeUpDate) %></ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Length" SortExpression="Minutes" >
				<ItemTemplate>
					<asp:Literal id="litLength" Runat="server" />
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<div nowrap>
						<asp:ImageButton ID="lnkEditMakeUp" CommandName="Edit" Runat="server" />
						<asp:ImageButton ID="lnkDeleteMakeUp" CommandName="Delete" Runat="server" />
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<EmptyTableTemplate>
			<%=Globalizer.GetGlobalizedString("MSG_NO_MAKEUP") %>
		</EmptyTableTemplate>
		<TableFooterTemplate>
			<common:AddImageAndTextButton ID="addMakeUp" CommandName="Add" TextKey="TXT_ADD_MAKEUP_TIME" Runat="server" />
		</TableFooterTemplate>
	</common:GroupedGrid>
	<br>
</div>
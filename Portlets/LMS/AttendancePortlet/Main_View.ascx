<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="pSection">
	<table id="attHeader" width="100%">
		<tr>
			<td id="attSideBar" width="190">
				<table width="100%">
					<tr>
						<td align="center">
							<asp:LinkButton ID="lnkPrevDate" CssClass="plainLink" Runat="server">&lt;</asp:LinkButton>
							<b>
								<asp:Label ID="lblDate" CssClass="calheader" Runat="server" /></b>
							<asp:LinkButton ID="lnkNextDate" CssClass="plainLink" Runat="server">&gt;</asp:LinkButton>
						</td>
					</tr>
				</table>
				<asp:PlaceHolder ID="phAttCalendar" Runat="server">
					<TABLE id="attCalendar" cellSpacing="0" cellPadding="5" width="100%">
						<TR>
							<TD class="calHeaderLeft" id="calHead1" Runat="server">
								<asp:label id="lblHead1" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead2" Runat="server">
								<asp:label id="lblHead2" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead3" Runat="server">
								<asp:label id="lblHead3" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead4" Runat="server">
								<asp:label id="lblHead4" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead5" Runat="server">
								<asp:label id="lblHead5" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead6" Runat="server">
								<asp:label id="lblHead6" Runat="server"></asp:label></TD>
							<TD class="calHeader" id="calHead7" Runat="server">
								<asp:label id="lblHead7" Runat="server"></asp:label></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay1" Runat="server">
								<asp:LinkButton id="lnkMonthDay1" Runat="server">1</asp:LinkButton></TD>
							<TD id="calMonthDay2" Runat="server">
								<asp:LinkButton id="lnkMonthDay2" Runat="server">2</asp:LinkButton></TD>
							<TD id="calMonthDay3" Runat="server">
								<asp:LinkButton id="lnkMonthDay3" Runat="server">3</asp:LinkButton></TD>
							<TD id="calMonthDay4" Runat="server">
								<asp:LinkButton id="lnkMonthDay4" Runat="server">4</asp:LinkButton></TD>
							<TD id="calMonthDay5" Runat="server">
								<asp:LinkButton id="lnkMonthDay5" Runat="server">5</asp:LinkButton></TD>
							<TD id="calMonthDay6" Runat="server">
								<asp:LinkButton id="lnkMonthDay6" Runat="server">6</asp:LinkButton></TD>
							<TD id="calMonthDay7" Runat="server">
								<asp:LinkButton id="lnkMonthDay7" Runat="server">7</asp:LinkButton></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay8" Runat="server">
								<asp:LinkButton id="lnkMonthDay8" Runat="server">8</asp:LinkButton></TD>
							<TD id="calMonthDay9" Runat="server">
								<asp:LinkButton id="lnkMonthDay9" Runat="server">9</asp:LinkButton></TD>
							<TD id="calMonthDay10" Runat="server">
								<asp:LinkButton id="lnkMonthDay10" Runat="server">10</asp:LinkButton></TD>
							<TD id="calMonthDay11" Runat="server">
								<asp:LinkButton id="lnkMonthDay11" Runat="server">11</asp:LinkButton></TD>
							<TD id="calMonthDay12" Runat="server">
								<asp:LinkButton id="lnkMonthDay12" Runat="server">12</asp:LinkButton></TD>
							<TD id="calMonthDay13" Runat="server">
								<asp:LinkButton id="lnkMonthDay13" Runat="server">13</asp:LinkButton></TD>
							<TD id="calMonthDay14" Runat="server">
								<asp:LinkButton id="lnkMonthDay14" Runat="server">14</asp:LinkButton></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay15" Runat="server">
								<asp:LinkButton id="lnkMonthDay15" Runat="server">15</asp:LinkButton></TD>
							<TD id="calMonthDay16" Runat="server">
								<asp:LinkButton id="lnkMonthDay16" Runat="server">16</asp:LinkButton></TD>
							<TD id="calMonthDay17" Runat="server">
								<asp:LinkButton id="lnkMonthDay17" Runat="server">17</asp:LinkButton></TD>
							<TD id="calMonthDay18" Runat="server">
								<asp:LinkButton id="lnkMonthDay18" Runat="server"> 18</asp:LinkButton></TD>
							<TD id="calMonthDay19" Runat="server">
								<asp:LinkButton id="lnkMonthDay19" Runat="server">19</asp:LinkButton></TD>
							<TD id="calMonthDay20" Runat="server">
								<asp:LinkButton id="lnkMonthDay20" Runat="server">20</asp:LinkButton></TD>
							<TD id="calMonthDay21" Runat="server">
								<asp:LinkButton id="lnkMonthDay21" Runat="server">21</asp:LinkButton></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay22" Runat="server">
								<asp:LinkButton id="lnkMonthDay22" Runat="server">22</asp:LinkButton></TD>
							<TD id="calMonthDay23" Runat="server">
								<asp:LinkButton id="lnkMonthDay23" Runat="server">23</asp:LinkButton></TD>
							<TD id="calMonthDay24" Runat="server">
								<asp:LinkButton id="lnkMonthDay24" Runat="server">24</asp:LinkButton></TD>
							<TD id="calMonthDay25" Runat="server">
								<asp:LinkButton id="lnkMonthDay25" Runat="server">25</asp:LinkButton></TD>
							<TD id="calMonthDay26" Runat="server">
								<asp:LinkButton id="lnkMonthDay26" Runat="server">26</asp:LinkButton></TD>
							<TD id="calMonthDay27" Runat="server">
								<asp:LinkButton id="lnkMonthDay27" Runat="server">27</asp:LinkButton></TD>
							<TD id="calMonthDay28" Runat="server">
								<asp:LinkButton id="lnkMonthDay28" Runat="server">28</asp:LinkButton></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay29" Runat="server">
								<asp:LinkButton id="lnkMonthDay29" Runat="server">29</asp:LinkButton></TD>
							<TD id="calMonthDay30" Runat="server">
								<asp:LinkButton id="lnkMonthDay30" Runat="server">30</asp:LinkButton></TD>
							<TD id="calMonthDay31" Runat="server">
								<asp:LinkButton id="lnkMonthDay31" Runat="server">31</asp:LinkButton></TD>
							<TD id="calMonthDay32" Runat="server">
								<asp:LinkButton id="lnkMonthDay32" Runat="server">32</asp:LinkButton></TD>
							<TD id="calMonthDay33" Runat="server">
								<asp:LinkButton id="lnkMonthDay33" Runat="server">33</asp:LinkButton></TD>
							<TD id="calMonthDay34" Runat="server">
								<asp:LinkButton id="lnkMonthDay34" Runat="server">34</asp:LinkButton></TD>
							<TD id="calMonthDay35" Runat="server">
								<asp:LinkButton id="lnkMonthDay35" Runat="server">35</asp:LinkButton></TD>
						</TR>
						<TR>
							<TD class="calLeft" id="calMonthDay36" Runat="server">
								<asp:LinkButton id="lnkMonthDay36" Runat="server">36</asp:LinkButton></TD>
							<TD id="calMonthDay37" Runat="server">
								<asp:LinkButton id="lnkMonthDay37" Runat="server">37</asp:LinkButton></TD>
							<TD id="calMonthDay38" Runat="server">
								<asp:LinkButton id="lnkMonthDay38" Runat="server">38</asp:LinkButton></TD>
							<TD id="calMonthDay39" Runat="server">
								<asp:LinkButton id="lnkMonthDay39" Runat="server">39</asp:LinkButton></TD>
							<TD id="calMonthDay40" Runat="server">
								<asp:LinkButton id="lnkMonthDay40" Runat="server">40</asp:LinkButton></TD>
							<TD id="calMonthDay41" Runat="server">
								<asp:LinkButton id="lnkMonthDay41" Runat="server">41</asp:LinkButton></TD>
							<TD id="calMonthDay42" Runat="server">
								<asp:LinkButton id="lnkMonthDay42" Runat="server">42</asp:LinkButton></TD>
						</TR>
					</TABLE>
				</asp:PlaceHolder>
				<div><asp:LinkButton ID="lnkWeeklyView" Runat="server"></asp:LinkButton></div>
				<hr>
				<div><common:AddImageAndTextButton ID="lnkAddSession" Runat="server" TextKey="TXT_ATTENDANCEPORTLET_ADD_SESSION" /></div>
				<div><common:ImageAndTextButton ID="lnkManageSessions" Runat="server" TextKey="TXT_ATTENDANCEPORTLET_MANAGE_SESSIONS" /></div>
				<hr>
				<div><asp:LinkButton ID="lnkNotification" Runat="server"></asp:LinkButton></div>
				<div><a ID="lnkExport" Runat="server"><%= Globalizer.GetGlobalizedString("TXT_EXPORT_FULL_VIEW_EXCEL") %></a></div>
			</td>
			<td valign="top">
				<common:GlobalizedLabel id="lblNoSessions" runat="server" textkey="TXT_NO_SESSIONS" />
				<common:GroupedGrid ID="gridAttendance" RenderGroupHeaders="True" CssClass="groupedGrid attGroupedGrid"
					AllowSorting="True" DataKeyField="UserID" runat="server">
					<TableHeaderTemplate>
						<table width="100%">
							<tr>
								<td width="90%">
									<%# Globalizer.GetGlobalizedString("TXT_MOST_RECENT_SESSION") %>
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
								<td align="right" nowrap="nowrap">
									<common:GlobalizedLinkButton ID="lnkEdit" CommandName="Edit" TextKey="TXT_EDIT_SAVED_ENTRIES" Runat="server" />
								</td>
							</tr>
						</table>
					</TableFooterTemplate>
				</common:GroupedGrid>
			</td>
		</tr>
	</table>
</div>

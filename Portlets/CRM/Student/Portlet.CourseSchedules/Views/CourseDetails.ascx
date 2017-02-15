<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseDetails.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseSchedulesPortlet.CourseDetails" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<h4>Course Details</h4>
<div class="pSection" id="divMain" runat="server" visible="true">
	<div id="divCourseDetails" visible="False" runat="server">
		<asp:label id="lblERPCourseKey" Runat="server" Visible="False"></asp:label>
		<asp:label id="lblTermKeyValue" Runat="server" Visible="False"></asp:label>
		<asp:label id="lblDivisionCodeValue" Runat="server" Visible="False"></asp:label>
		<asp:label id="lblDepartmentCode" Runat="server" Visible="False"></asp:label>
		<table  cellpadding="2" border="0" width=100%>
			<tr>
				<td width=70% colspan=3><b><asp:literal id="litCourseDetailsFor" runat="server"></asp:literal></b></td>
				<td valign=bottom><cmn:globalizedlinkbuttonwithicon id="lnkAddCourse" Runat="server" TextKey="TXT_CS_MB_ADDTHISCOURSE" IconSrc="./UI/Common/Images/PortletImages/Icons/add_lg.gif"></cmn:globalizedlinkbuttonwithicon></td>
				<td width=30>&nbsp;</td>
				<td align=right nowrap valign=bottom><cmn:globalizedlinkbuttonwithicon id="lnkBack" Runat="server" TextKey="TXT_BACK" IconSrc="./UI/Common/Images/PortletImages/Icons/go_back.gif"></cmn:globalizedlinkbuttonwithicon></td>
				
				<!--<th align="left"></td>-->
			</tr>

			<tr>
				<td nowrap colspan=6>
					<asp:label id="lblInstructor" Runat="server"></asp:label>
					<asp:Repeater ID=rptInst Runat=server>
						<HeaderTemplate>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:label id="lblInstructorValue" Runat="server" NameFormat="LastNameFirst"></asp:label><framework:MyInfoPopup id="mipInstructorValue" Runat="server" NameFormat="LastNameFirst"></framework:MyInfoPopup ><asp:Label ID="litEmail" Runat="server"></asp:Label><asp:Label ID="lblSeperate1" Runat=server Visible=False></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
						</FooterTemplate>
						
					
					</asp:Repeater>
				</td>
			</tr>				
			<tr><td colspan=6>
				<table class="GrayBordered" border=0 cellpadding=2 width=100%>
					<tr>
						<td width=10% nowrap><asp:label id="lblTermDescValue" Runat="server"></asp:label><asp:label id="lblDivisionDescValue" Runat="server"></asp:label></td>
						<td width=30px align=left>&nbsp;</td>
						<td><asp:label id="lblCreditHoursValue" Runat="server"></asp:Label>&nbsp;<asp:label id="lblCreditHours" Runat="server"></asp:label><asp:label id="lblMethodDescriptionValue" Runat="server"></asp:label></td>
						<td width=30px align=left>&nbsp;</td>

					</tr>
					<tr>
						<td nowrap><asp:Label ID="lblDepartmentText" Runat=server></asp:Label><asp:label id="lblDepartmentValue" Runat="server"></asp:label></td>
						<td align=left>&nbsp;</td>
						<td><asp:label id="lblClockHours" Runat="server"></asp:label><asp:label id="lblClockHoursValue" Runat="server"></asp:label></td>
						<td width=30px align=left>&nbsp;</td>
						

					</tr>
					<tr>
						<td nowrap><asp:label id="lblStatus" Runat="server"></asp:label><asp:label id="lblStatusValue" Runat="server"></asp:Label></td>
						<td align=left>&nbsp;</td>
						<td nowrap><asp:label id="lblReferenceNumber" Runat="server"></asp:label><asp:label id="lblReferenceNumberValue" Runat="server"></asp:label></td>
						<td width=30px align=left>&nbsp;</td>
					</tr>
				</table>

			</td></tr>
			<!--
			<td nowrap><asp:label id="lblLocationText" Runat="server"></asp:label><asp:label id="lblLocationValue" Runat="server"></asp:Label></td>
						<td align=left></td>
						<td nowrap width=10%><asp:label id="lblScheduleValue" Runat="server"></asp:label></td>
						<td align=left>&nbsp;</td>
						<td nowrap><asp:Label ID="lblStartEndText" Runat=server></asp:Label>&nbsp;<asp:label id="lblStartEndValue" Runat="server"></asp:label></td>
						<td align=left>&nbsp;</td>
			<tr>
			<th><cmn:GlobalizedLiteral id="litTitle" TextKey="TXT_TITLE" Runat="server"></cmn:GlobalizedLiteral>:</th>
			<td><asp:label id="lblCourseTitleValue" Runat="server"></asp:label></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			</tr>
			<tr>

			<th align="left"></th>

			</tr>
			<tr>
			<th></th>

			</tr>
			-->

			<tr>
				<td colSpan="6"><asp:label ID="lblCoursePreamble" Runat=server Visible=False></asp:label> <asp:linkbutton id="lnkbCourseRequisites" Runat="server" Visible="False" onclick="lnkbCourseRequisites_Click"></asp:linkbutton></td>
			</tr>
			<tr>
				<td colspan=6>
					<table  cellpadding="2" border="0" width=100%>
						<tr>
							<th width="60"><asp:label id="lblNote" Runat="server"></asp:label></th>
							<td ><asp:label id="lblNotesValue" Runat="server"></asp:label></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan=6>
					<asp:Repeater ID="rptSchedule" runat="server">
					<HeaderTemplate>
						<table width=100% cellpadding=3 border=0 cellspacing=0>
							<tr>
								<td colspan=3  class="BorderTopLeftBottomRight" bgcolor="#CECFCE"><b>Course Schedules</b></td>							
							</tr>
							<tr>
								<td bgcolor="#DEDFDE" class="BorderLeftBottom" >Day & Time</td>		
								<td bgcolor="#DEDFDE" class="BorderLeftBottom">Date(s)</td>	
								<td bgcolor="#DEDFDE" class="BorderLeftRightBottom">Location</td>						
							</tr>
					
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem, "Day")%></td>
							<td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem, "Date")%></td>
							<td class="BorderLeftRightBottom"><%#DataBinder.Eval(Container.DataItem, "Location")%></td>
						</tr>				
					</ItemTemplate>
					<AlternatingItemTemplate>
						<tr>
							<td  class="BorderLeftBottom" bgcolor="#DEDFDE"><%#DataBinder.Eval(Container.DataItem, "Day")%></td>
							<td  class="BorderLeftBottom"bgcolor="#DEDFDE"><%#DataBinder.Eval(Container.DataItem, "Date")%></td>
							<td  class="BorderLeftRightBottom"bgcolor="#DEDFDE"><%#DataBinder.Eval(Container.DataItem, "Location")%></td>
						</tr>	
					
					</AlternatingItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
					
					
					</asp:Repeater>
				
				
				</td>
			
			</tr>
			<tr><td colspan=6><h6><asp:label id="lblCourseDescription" Runat="server"></asp:label></h6></td></tr>
			<tr>

				<td colspan="6"><asp:label id="lblCourseDescValue" Runat="server"></asp:label></td>
			</tr>

			<tr>
				<td colSpan="6"><asp:linkbutton id="lnkbCourseTextBooks" Runat="server" Visible="False" onclick="lnkbCourseTextBooks_Click"></asp:linkbutton></td>
			</tr>
        <tr><td colSpan="6">
        	<asp:table id="tblBookstore" CssClass="hint" visible="false" runat="server" width="100%">
                <asp:tablerow><asp:tablecell colspan="4">
                    <asp:Label ID="lblBookstore" runat="server" ></asp:Label>
                    &raquo <asp:HyperLink ID="lnkBookstore" runat="server" Target="_blank" ></asp:HyperLink>
                </asp:tablecell></asp:tablerow>
            </asp:table>
        </td></tr>
			<tr>
				<td colSpan="6"><asp:literal id="litCatalogLink" Runat="server" Visible="False"></asp:literal></td>
			</tr>
			<tr>
				<td colSpan="6"><asp:linkbutton id="lnkbAllCoursesInDept" Runat="server" Visible="False" onclick="lnkbAllCoursesInDept_Click"></asp:linkbutton></td>
			</tr>
		</table>
	</div>
	<div id="divCrosslistedCourses" visible="False" runat="server">
		<table width="100%">
			<tr>
				<td><cmn:groupedgrid id="ggCrossListedCrs" runat="server" RenderTableHeaders="True" RenderTableFooters="True" DataKey="ERPCrossListedCourseKey">
					<TableHeaderTemplate>
						<cmn:GlobalizedLiteral id="glitCrossListedCourses" runat="server" TextKey="TXT_COURSE_DETAILS_CRS_LISTED_CRS"></cmn:GlobalizedLiteral>
					</TableHeaderTemplate>
					<Columns>
					<cmn:GlobalizedBoundColumn DataField="CrosslistedDisplayedCourseCode" HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
					<cmn:GlobalizedBoundColumn DataField="CrossListedCourseType" HeaderTextKey="TXT_TYPE" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
					<cmn:GlobalizedBoundColumn DataField="CrossListedCourseTitle" HeaderTextKey="TXT_TITLE" HeaderStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Top"></cmn:GlobalizedBoundColumn>
					<cmn:GlobalizedBoundColumn DataField="CrossListedCourseCapacity" HeaderTextKey="TXT_CAPACITY" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></cmn:GlobalizedBoundColumn>
					<cmn:GlobalizedBoundColumn DataField="CrossListedCourseEnrollment" HeaderTextKey="TXT_ENROLLMENT" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></cmn:GlobalizedBoundColumn>
					<cmn:GlobalizedBoundColumn DataField="CrossListedCourseWaitlisted" HeaderTextKey="TXT_WAITLISTED" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"></cmn:GlobalizedBoundColumn>
				</Columns>
			</cmn:groupedgrid>
		</td>
	</tr>
</table>
</div>
</div>

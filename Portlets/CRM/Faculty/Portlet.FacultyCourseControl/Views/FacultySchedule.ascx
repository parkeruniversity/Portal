<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="FacultySchedule.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.FacultySchedule" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<h4><asp:label id="lblCrsListFor" runat="server"></asp:label></h4>
<div class="pSection" id="divTop" visible="False" runat="server">
<cmn:ContentBox ID="FilterBox" runat="server">
<TABLE cellSpacing=3 cellPadding=5 width="100%" border=0>
  <TR>
    <TH  width="5%" nowrap>
<cmn:globalizedliteral id=lblTerm runat="server" TextKey="LBL_TERM"></cmn:globalizedliteral></TH>
    <TD >
<asp:dropdownlist id=ddlTerm Runat="server"></asp:dropdownlist></TD>
    <TH  width="5%" nowrap>
<cmn:globalizedliteral id=lblDivision runat="server" ></cmn:globalizedliteral>:</TH>
    <TD>
<asp:dropdownlist id=ddlDivision Runat="server"></asp:dropdownlist></TD></TR>
  <TR>
    <TD colSpan=4>
<cmn:GlobalizedButton id=btnSearch runat="server" TextKey="TXT_SEARCH"></cmn:GlobalizedButton></TD></TR></TABLE>
</cmn:ContentBox>
</div>
<div class="pSection" id="divMain" visible="False" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0" class="smalltext">
		<tr>
			<td>
				<cmn:GroupedGrid id="ggCourseList" Runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true">
					<TableHeaderTemplate>
						<%= base._tableHeaderText %>
					</TableHeaderTemplate>
					<Columns>
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_COURSE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
							<ItemTemplate>
								<asp:LinkButton ID="lnkCourse" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey" )%>' OnCommand="Course_Click" Runat="server">
									<%# DataBinder.Eval( Container.DataItem, "DisplayedCourseCode" ).ToString() %>
								</asp:LinkButton>
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedBoundColumn DataField="Title" HeaderTextKey="TXT_TITLE" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
						<cmn:GlobalizedBoundColumn DataField="CreditHours" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" 
 HeaderTextKey="TXT_FACT_GE_CREDIT_HOURS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_SEATS_OPEN" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
							<ItemTemplate><%# DataBinder.Eval( Container.DataItem, "AvailableSeats" )%>/<%# DataBinder.Eval( Container.DataItem, "TotalSeats" )%></ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedBoundColumn DataField="CourseStatus" HeaderTextKey="TXT_STATUS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_MEETS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
							<ItemTemplate>
								<ul>
									<asp:Repeater ID="rptSchedule" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
										<ItemTemplate>
											<li>
												<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
												<br><%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
										</ItemTemplate>
									</asp:Repeater>
								</ul>
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_DATES" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
							<ItemTemplate>
								<ul>
									<asp:Repeater ID="rptDates" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
										<ItemTemplate>
											<li>
												<%#DataBinder.Eval(Container.DataItem, "BeginDate")%>
												-<br>
												<%#DataBinder.Eval(Container.DataItem, "EndDate")%>
											</li>
										</ItemTemplate>
									</asp:Repeater>
								</ul>
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_ROOM" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
							<ItemTemplate>
								<ul>
									<asp:Repeater id="rptRoom" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
										<ItemTemplate>
											<li>
												<%#this.renderRoomInfo(DataBinder.Eval(Container.DataItem, "CampusCode").ToString(), DataBinder.Eval(Container.DataItem, "BuildingCode").ToString(), DataBinder.Eval(Container.DataItem, "RoomCode").ToString())%><br>
												<br><br>
											</li>
										</ItemTemplate>
									</asp:Repeater>
								</ul>
							</ItemTemplate>
						</cmn:GlobalizedTemplateColumn>
						<cmn:GlobalizedBoundColumn DataField="MethodCode" HeaderTextKey="TXT_METHOD" HeaderStyle-HorizontalAlign="Center" 
 ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
					</Columns>
				</cmn:GroupedGrid>
			</td>
		</tr>
	</table>
</div>

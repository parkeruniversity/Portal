<%@ Register TagPrefix="fwk" assembly="Jenzabar.Portal.Framework.Web" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="ClassList.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.FacultyCourseControlPortlet.ClassList" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>

<div class="pSection" id="divWarning" runat="server" visible="true"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divHeader" runat="server">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<th vAlign="top" width="10%">
				<cmn:globalizedliteral id="litCourse" runat="server" TextKey="LBL_COURSE"></cmn:globalizedliteral></th>
			<td vAlign="top"><asp:dropdownlist id="ddlCourses" runat="server" DataTextField="DisplayedCourseCode" DataValueField="ERPCourseKey"
					AutoPostBack="True"></asp:dropdownlist></td>
		</tr>
	</table>
	<br>
	<div class="smalltext" id="divDataGrids" runat="server">
		<cmn:groupedgrid id="ggCourseDetail" runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true">
			<TableHeaderTemplate>
			<%=Globalizer.GetGlobalizedString("TXT_COURSE_DETAILS")%>&nbsp;<%= base._tableHeaderText %>
		</TableHeaderTemplate>
			<Columns>
				<cmn:GlobalizedBoundColumn DataField="CatalogCode" HeaderTextKey="TXT_CATALOG" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" Visible="False" />
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_COURSE_DETAILS_CRS_LISTED_CRS" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptCrossCrs" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_CrossListedCourse")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "CrosslistedDisplayedCourseCode")%>
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_FACULTY" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptFaculty" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_FacultyList")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "FacultyName")%>
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_MEETS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptSchedule" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "Weekdays")%>
										&nbsp;<%#DataBinder.Eval(Container.DataItem, "MeetTime")%></li>
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
										-<%#DataBinder.Eval(Container.DataItem, "EndDate")%></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_ROOMS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False">
					<ItemTemplate>
						<ul>
							<asp:Repeater ID="rptRooms" DataSource='<%#DataBinder.Eval(Container.DataItem, "CourseInfo_Schedules")%>' Runat="server">
								<ItemTemplate>
									<li>
										<%#DataBinder.Eval(Container.DataItem, "CampusCode") == "" ? "" : DataBinder.Eval(Container.DataItem, "CampusCode") + "/"%>
										<%#DataBinder.Eval(Container.DataItem, "BuildingCode") == "" ? "" : DataBinder.Eval(Container.DataItem, "BuildingCode") + "/"%>
										<%#DataBinder.Eval(Container.DataItem, "RoomCode")%>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
			</Columns>
		</cmn:groupedgrid>
		<table style="MARGIN-BOTTOM: 3px" cellSpacing="0" cellPadding="0" width="100%" border="0" id="tblExportLinks" runat="server">
			<tr>
				<td>
					<asp:Image ID="imgXLS" Runat="server"></asp:Image>
					<asp:HyperLink ID="hyperLinkXLS" Runat="server"></asp:HyperLink> &nbsp; &nbsp; 
					<asp:LinkButton ID="lnkExportToExcel" Runat="server"></asp:LinkButton>&nbsp; &nbsp;
				</td>
			</tr>
		</table>
		<cmn:GlobalizedLiteral id="litNoStudents" TextKey="TXT_FACT_GE_NO_STUDENTS_REG_FOR_COURSES" runat="server"></cmn:GlobalizedLiteral>
		<cmn:groupedgrid id="ggClassList" runat="server" DataKeyField="ERPStudentCourseKey" RenderTableHeaders="true">
			<TableHeaderTemplate>
			<%=Globalizer.GetGlobalizedString("TXT_CLASS_LIST")%>&nbsp;<%= base._tableHeaderText %>&nbsp;<%= base._studentcount%>
		</TableHeaderTemplate>
			<Columns>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_FCC_FERPA_RESTRICT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="1%">
					<ItemTemplate>
						<asp:Label ID="lblImage" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "FERPARestriction","{0}") == "Y" %>'>
							<asp:Image ID="iFERPA" Runat="server" AlternateText='<%#Globalizer.GetGlobalizedString("TXT_FACT_GE_FERPA_RESTRICTIONS")%>' />
						</asp:Label>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn DataField="FERPARestriction" HeaderTextKey="TXT_FCC_FERPA_RESTRICT" Visible="False" />
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_PHOTO" >
					<ItemTemplate>
						<asp:image id="imgPhoto" ImageAlign="Top" Runat="server"></asp:image>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_STUDENT">
					<ItemTemplate>
						<fwk:MyInfoPopup id="ppMyInfo" NameFormat="LastNameFirst" ERPDisplayName='<%# DataBinder.Eval(Container.DataItem, "StudentName")%>' User='<%#PortalUser.FindByHostID( DataBinder.Eval(Container.DataItem, "StudentID").ToString() )%>' ClickableName="false" runat="server">
						</fwk:MyInfoPopup>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				
				<cmn:GlobalizedBoundColumn DataField="StudentID" HeaderTextKey="TXT_STUDENT_ID" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="StudentName" HeaderTextKey="TXT_STUDENT" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" Visible="False" />
				<cmn:GlobalizedBoundColumn DataField="RegistrationStatus" HeaderTextKey="TXT_STATUS" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="WaitlistedDate" HeaderTextKey="TXT_FCC_WAITLISTED_DATE" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_EMAIL" SortExpression="">
					<HeaderTemplate>
						<input id="SelectAll" runat="server" type="checkbox" onclick="checkAllCheckboxesWithName(this.checked, 'EmailStudent')" NAME="SelectAll" />
						<asp:Label ID="lblStuEmail" Runat="server" Text="Email" /> 
					</HeaderTemplate>
					<ItemTemplate>
						<input id="EmailStudent" runat="server" type="checkbox" name="EmailStudent" value='<%# DataBinder.Eval(Container.DataItem, "StudentID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "StudentName") + ";" + DataBinder.Eval( Container.DataItem, "StudentEmail")%>'><asp:Label ID="lblStudentEmail" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "StudentEmail", "{0}") != "" %>'>
<asp:ImageButton id="imgEmail" runat="server" OnCommand="Email_Click" imageurl="~/UI/Common/Images/PortletImages/Icons/email.gif" ToolTip='<%# DataBinder.Eval(Container.DataItem, "StudentEmail")%>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "StudentID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "StudentName") + ";" + DataBinder.Eval( Container.DataItem, "StudentEmail")%>' /></asp:Label>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_ADVISORS" SortExpression="">
					<ItemTemplate>
						<%# DataBinder.Eval( Container.DataItem, "AdvisorName" )%> <asp:Label ID="lblAdvisorEmail" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "AdvisorEmail", "{0}") != "" %>'><asp:ImageButton id="imgAdvEmail" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AdvisorID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdvisorName") + ";" + DataBinder.Eval( Container.DataItem, "AdvisorEmail")%>' runat="server" OnCommand="Email_Click" imageurl="~/UI/Common/Images/PortletImages/Icons/email.gif" ToolTip='<%# DataBinder.Eval(Container.DataItem, "AdvisorEmail")%>' /></asp:Label>
					</ItemTemplate>
				</cmn:GlobalizedTemplateColumn>
				<cmn:GlobalizedBoundColumn DataField="RegisteredCrossListedCourse" HeaderTextKey="TXT_FCC_CROSSLISTED_COURSE" 
 ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="GradeTypeDesc" HeaderTextKey="TXT_GRADE_TYPE" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="CurrentFinalGradeDesc" HeaderTextKey="TXT_GRADE" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="CreditHours" HeaderTextKey="TXT_CREDIT_HOURS" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="MajorDesc" HeaderTextKey="TXT_MAJOR" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="Graduating" HeaderTextKey="TXT_FACT_GE_GRADUATING" ItemStyle-VerticalAlign="Top" 
 ItemStyle-Wrap="False" />
				<cmn:GlobalizedBoundColumn DataField="ClassCode" HeaderTextKey="TXT_CLASS" ItemStyle-VerticalAlign="Top" />
				<cmn:GlobalizedBoundColumn DataField="Division" HeaderTextKey="TXT_DIVISION" ItemStyle-VerticalAlign="Top" />
			</Columns>
		</cmn:groupedgrid>
		<DIV>
			<asp:linkbutton id="EmailAll" Runat="server" Visible="true" OnCommand="EmailAll_Click" Text="Email Selected Students"></asp:linkbutton>
		</DIV>
</div>
</div>

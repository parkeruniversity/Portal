<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CurrentStudentGradeList.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.CurrentStudentGradeList" %>
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<p>
	<h4>
		<asp:label id="lblStudentListFor" Visible="True" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;<asp:label id="lblStudentListInformation" Visible="True" runat="server" Font-Bold="True"></asp:label>
	</h4>			
</p>
<div id="divCatalog" visible="false" runat="server" class="pSection">
	<table id="table2" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td align="left" width="100%" colSpan="5">
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr id="trCatalog">
						<td align="left" width="50%" colSpan="1"><asp:label id="lblCatalog" Visible="True" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;
							<asp:label id="lblCatalogInfo" Visible="True" runat="server"></asp:label>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div id="divOthersHeaders" visible="True" runat="server" class="pSection">
	<table id="table3" cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td align="left" width="100%" colSpan="5">
				<table cellSpacing="3" cellPadding="3" width="100%" border="0">
					<tr>
						<td align="left" width="50%" colSpan="1"><asp:label id="lblInstructors" Visible="True" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;
							<asp:label id="lblInstructorsInfo" Visible="True" runat="server"></asp:label></td>
					</tr>
					<tr>
						<td align="left" width="2%" colSpan="1"><asp:label id="lblCrossListedCourses" Visible="True" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;
							<asp:label id="lblCrossListedCourseInfo" Visible="True" runat="server"></asp:label></td>
					</tr>
					<tr>
						<td align="left" width="2%" colSpan="1"><asp:label id="lblCourseGradingType" Visible="True" runat="server" Font-Bold="True"></asp:label>&nbsp;&nbsp;<asp:label id="lblCourseGradingTypeInfo" Visible="True" runat="server"></asp:label></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div id="DivSucccessUpdateMessage" visible="false" runat="server" class="pSection">
	<table id="table5" cellSpacing="1" cellPadding="1" width="100%">
		<tr bgcolor="#6699ff">
			<td width="100%" bgColor="#6699ff" height="25"><asp:label id="lblGradesSuccessfullyUpdated" Visible="True" runat="server" Font-Bold="True"></asp:label></td>
		</tr>
	</table>
</div>
<div class="pSection" id="divClassList" runat="server">
	<jenzabar:hint id="hintGradingType" runat="server" Visible="True"></jenzabar:hint>
	<jenzabar:groupedgrid id="dgClassList" Runat="server" OnItemDataBound="dgClassList_ItemDataBound" RenderTableHeaders="true"
		DataKeyField="ERPCourseKey">
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_FERPA_RESTRICT" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Image ID="imgFERPARestriction" Runat="server" Width="5%" ImageAlign="Middle"></asp:Image>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="GradeTypeCode" Visible="False" />
			<jenzabar:GlobalizedBoundColumn DataField="StudentName" HeaderTextKey="TXT_FACT_GE_STUDENT" />
			<jenzabar:GlobalizedBoundColumn DataField="StudentID" HeaderTextKey="TXT_FACT_GE_ID" />
			<jenzabar:GlobalizedBoundColumn DataField="Graduating" HeaderTextKey="TXT_FACT_GE_GRADUATING" />
			<jenzabar:GlobalizedBoundColumn DataField="CurrentMidTermGradeDesc" HeaderTextKey="TXT_FACT_GE_MIDTERM_GRADE" />
			<jenzabar:GlobalizedBoundColumn DataField="CurrentFinalGradeDesc" HeaderTextKey="TXT_FACT_GE_FINAL_GRADE" />
			<jenzabar:GlobalizedBoundColumn DataField="GradeTypeDesc" HeaderTextKey="TXT_FACT_GE_GRADING_TYPE" />
			<jenzabar:GlobalizedBoundColumn DataField="LastDateOfAttendance" HeaderTextKey="TXT_FACT_GE_LDOA" />
			<jenzabar:GlobalizedBoundColumn DataField="Absences" HeaderTextKey="TXT_FACT_GE_ABSENCES" />
			<jenzabar:GlobalizedBoundColumn DataField="ClockHours" HeaderTextKey="TXT_FACT_GE_CLOCK_HOURS" />
			<jenzabar:GlobalizedBoundColumn DataField="DevPerformanceDescr" HeaderTextKey="TXT_FACT_GE_DEV_PERFORMANCE_TEXT" />
			<jenzabar:GlobalizedBoundColumn DataField="RegisteredCrossListedCourse" HeaderTextKey="TXT_FACT_GE_CROSSLISTED_COURSE" />
			<jenzabar:GlobalizedBoundColumn DataField="GradeNotes" HeaderTextKey="TXT_FACT_GE_GRADE_NOTES" />
			<jenzabar:GlobalizedBoundColumn DataField="ERPStudentCourseKey" Visible="False" />
			<jenzabar:GlobalizedBoundColumn DataField="ClassCode" HeaderTextKey="TXT_CLASS" />
			<jenzabar:GlobalizedBoundColumn DataField="Division" HeaderTextKey="TXT_DIVISION" />
			
			
			
		</Columns>
	</jenzabar:groupedgrid>
</div>
<div class="pSection" id="divButtons" runat="server">
	<table>
		<tr>
			<td>
				<asp:imagebutton id="ibPrtFriendlyRept" visible="False" runat="server"></asp:imagebutton>&nbsp;				
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</table>
</div>

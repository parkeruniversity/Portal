<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseList.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet.CourseList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.CRM.Faculty.Web.Portlets.CourseAuthorizationPortlet" %>
<%@ Register TagPrefix="crm" namespace="Jenzabar.CRM.Utility" assembly="CRM" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection" id="divError" runat="server" visible="False"><common:errordisplay id="ctlError" RunAt="server"></common:errordisplay></div>
<div class="pSection" id="divWarning" runat="server" visible="true"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<div class="pView" xmlns:common="http://schemas.jenzabar.com/JICS/CommonControls">
	<div class="pSection">
	
		<common:hint id="Instructions" TextKey="MSG_COURSEAUTHORIZATION_DEFAULT_INSTRUCTIONS" runat="server" />

		<div class="pSection">
			<common:FormLabel ID="TermLabel" TextKey="LBL_TERM" Runat="server" Style="margin-right:8px" />
			<asp:DropDownList id="ddlTerm" runat="server" AutoPostBack="True" />
		</div>
		
		<common:ContentBox ID="cntFilter" Runat="server" TextKey="TXT_SHOW">
			<div class="pSection">
				<table runat="server" cellpadding="3" cellspacing="3" ID="Table1">
					 <tr>
						<td width="25%" align="left"  >
							<common:GlobalizedRadioButton id="radTeaching" runat="server" TextKey="TXT_COURSES_I_AM_TEACHING" GroupName="Courses" checked="true" AutoPostBack="True" OnCheckedChanged="radTeaching_CheckChanged" ></common:GlobalizedRadioButton> 
						</td>	
						<td width="15%" align = "right" >&nbsp;</td>					
						<td width="25%" align="left">
							<common:GlobalizedRadioButton id="radAll" runat="server" TextKey="TXT_ALL_COURSES_I_CAN_AUTHORIZE" GroupName="Courses" AutoPostBack="True" OnCheckedChanged="radAll_CheckChanged"></common:GlobalizedRadioButton> 
						</td>
						<td width="5%">	&nbsp;</td>
					</tr>
					<tr>
						<td width="25%" >&nbsp;</td>
						<td width="15%" align = "right" >
						<asp:label id="lblDivision" runat="server" Enabled="False"></asp:label>
						</td>
						<td width="25%" align="left" nowrap  >							
							<asp:DropDownList ID="ddlDivisions" Runat="server" Style="margin-right:8px" Enabled="False" />
						</td>
						<td width="5%">	&nbsp;	</td>
					</tr>	
					<tr>
						<td width="25%" >&nbsp;</td>
						<td width="15%" align = "right"   >
						<asp:label id="lblDepartment" runat="server" Enabled="False"></asp:label>						
						</td>					
						<td width="25%" align="left" nowrap > 							
							<asp:DropDownList ID="ddlDepartments" Runat="server" Style="margin-right:8px" Enabled="False" />
						</td>
						<td width="10%" align="left">
							<common:GlobalizedButton id="btnGo" Runat="server" TextKey="TXT_CONST_SRCH_SEARCH" Width="80%" Enabled="False"  />
						</td> 
						
					</tr>									
				</table>
			</div>
		</common:ContentBox>

				
		<div class="pSection">
			<common:GroupedGrid ID="CourseGrid" RenderGroupHeaders="True" runat="server">
				<TableHeaderTemplate>
					<common:FormLabel ID="FacultyLabel" TextKey="TXT_COURSES_AVAILABLE_FOR_AUTHORIZATIONS" Runat="server" />
				</TableHeaderTemplate>
				<EmptyTableTemplate>
					<common:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="MSG_COURSEAUTHORIZATION_NO_AUTHORIZATIONS"></common:GlobalizedLiteral>
				</EmptyTableTemplate>
				<Columns>
					<asp:TemplateColumn Visible="false">
						<ItemTemplate>
							<div id="ERPCourseKey" runat="server"><%# CourseAuthorizationPortlet.GetXmlValue((System.Xml.XmlElement)Container.DataItem, "ERPCourseKey") %></div>
						</ItemTemplate>
					</asp:TemplateColumn>
					<crm:XmlButtonColumn HeaderText="Course" DataXmlField="DisplayedCourseCode" CommandName="DisplayCourse" />
					<crm:XmlBoundColumn HeaderText="" DataXmlField="DivisionCode" />
					<crm:XmlBoundColumn HeaderText="Catalog" DataXmlField="CatalogCode" />
					<crm:XmlBoundColumn HeaderText="Requisites" DataXmlField="RequisitesAuthorizedCount" />
					<crm:XmlBoundColumn HeaderText="Section Requirements" DataXmlField="RequirementsAuthorizedCount" />
					<crm:XmlBoundColumn HeaderText="Capacity" DataXmlField="CapacityAuthorizedCount" />
					<crm:XmlBoundColumn HeaderText="Schedule Conflict" DataXmlField="ScheduleConflictAuthorizedCount" />
				</Columns>
			</common:GroupedGrid>
		</div>

	</div>
</div>
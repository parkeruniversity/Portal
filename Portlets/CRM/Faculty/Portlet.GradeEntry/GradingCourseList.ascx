<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GradingCourseList.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.Main" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection" id="divError" runat="server" visible="False"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" runat="server" visible="true"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" runat="server" visible="False"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<p>
	<h4>
		<cmn:globalizedliteral id="lblCourseFor" runat="server" Visible="True" TextKey="TXT_FACT_GE_COURSE_LIST_FOR"></cmn:globalizedliteral>&nbsp;&nbsp;
		<asp:label id="lblFacultyMemberName" runat="server" Font-Bold="True" Visible="True"></asp:label>
	</h4>
</P>	
<div class="pSection" id="Div1" runat="server">
	<cmn:hint id="lblInstructionText" runat="server" Visible="True"></cmn:hint>
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<th align="left" width="278" colSpan="3">
				<cmn:globalizedliteral id="lblSearchCriteria" runat="server" Visible="True" TextKey="TXT_FACT_GE_SEARCH_CRITERIA"></cmn:globalizedliteral></th>
		</tr>
		<tr>
			<td>
				<table cellSpacing="3" cellPadding="3" width="100%">
					<tr>
						<td>&nbsp;</td>
						<td align="left" width="18%"><cmn:globalizedliteral id="lblDivision" runat="server" Visible="True" ></cmn:globalizedliteral>
						<td align="left" width="25%"><asp:dropdownlist id="ddlbDivision" runat="server" Visible="True" Width="200px" AutoPostBack="false"></asp:dropdownlist></td>
						<td	width="7%"><cmn:globalizedliteral id="lblTerm" runat="server" Visible="True" TextKey="TXT_FACT_GE_TERM"></cmn:globalizedliteral></td>
						<td align="left" width="10%"><asp:dropdownlist id="ddlbTerm" runat="server" Visible="True" Width="240px" AutoPostBack="false"></asp:dropdownlist></td>
						<td vAlign="middle" align="right"><cmn:globalizedbutton id="btnSearch" runat="server" Visible="True" TextKey="TXT_FACT_GE_SEARCH"></cmn:globalizedbutton></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="divCourses" runat="server">
	<cmn:groupedgrid id="dgCourses" Runat="server" OnItemDataBound="dgCourses_ItemDataBound" OnItemCommand="dgCourses_ItemCommand"
		DataKeyField="ERPCourseKey" RenderTableHeaders="true">
		<COLUMNS>
			<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_COURSE" >
				<ITEMTEMPLATE>
					<asp:LinkButton id=lnkCourse Runat="server" OnCommand="Course_Click" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "ERPCourseKey") + "|" + DataBinder.Eval( Container.DataItem, "FacultyGradeAccess") + "|" + DataBinder.Eval( Container.DataItem, "EditMidTermGrades" ) +  "|" + DataBinder.Eval( Container.DataItem, "EditFinalGrades")%>' >
						<%# DataBinder.Eval(Container.DataItem,"DisplayedCourseCode")%>
					</asp:LinkButton>
				</ITEMTEMPLATE>
			</cmn:GlobalizedTemplateColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_CATALOG" DataField="CatalogCode"></cmn:GlobalizedBoundColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_TITLE" DataField="Title"></cmn:GlobalizedBoundColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_CREDIT_HOURS" DataField="CreditHours"></cmn:GlobalizedBoundColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_CLOCK_HOURS" DataField="ClockHours"></cmn:GlobalizedBoundColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_MIDTERM" DataField="EditMidTermGrades"></cmn:GlobalizedBoundColumn>
			<cmn:GlobalizedBoundColumn HeaderTextKey="TXT_FACT_GE_FINAL" DataField="EditFinalGrades"></cmn:GlobalizedBoundColumn>
		</COLUMNS>
	</cmn:groupedgrid>
</div>
<div id="divNoRows" runat="server" visible="false">
	<table cellSpacing="5" cellPadding="5" width="100%">
		<tr>
			<th align="left" colSpan="4">
				&nbsp;&nbsp;&nbsp;<cmn:globalizedliteral id="GlobalizedliteralMessage" runat="server" Visible="True" TextKey="MSG_NO_FACULTY_COURSES"></cmn:globalizedliteral>&nbsp;
			</th>
		</tr>
	</table>
</div>
<table>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>

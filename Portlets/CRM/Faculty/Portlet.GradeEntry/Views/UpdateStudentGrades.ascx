<%@ Control Language="c#" AutoEventWireup="True" Codebehind="UpdateStudentGrades.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.UpdateStudentGrades" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/Portlets/CRM/Faculty/Portlet.GradeEntry/Scripts/GradeEntry.js") %>"></script>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection DisplayNone divWarning" id="divWarning" runat="server"><asp:label id="lblWarning" Runat="server" CssClass="PortletError WarningMessage"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>

<input type="hidden" id="LDoAEntryType"  value="<%=LDoAEntryType%>" />
<input type="hidden" id="LDoAGradeList"  value="<%=LDoAGradeList%>" />
<input type="hidden" id="AllowLDoAEntry"  value="<%=AllowLDoAEntry%>" />
<input type="hidden" id="MainClass"  value="<%=MainClass%>" />
<input type="hidden" value="0" name="isChanged" /> 
<input type="hidden" value="0" id="changeFlag" name="hiddenChangeFlag" runat="server" />
<input type="hidden" id="CompareDate" class="CompareDate" runat="server" />
<input type="hidden" id="LimitForUg" class="LimitForUg" runat="server" />
<input type="hidden" id="ReasonReq" class="ReasonReq" runat="server" />
<input type="hidden" id="StartTerm" class="StartTerm" runat="server" />
<input type="hidden" id="StartYear" class="StartYear" runat="server" />
<input type="hidden" id="UseLimits" class="UseLimits" runat="server" />
<input type="hidden" id="UseWfDate" class="UseWfDate" runat="server" />
<input type="hidden" id="WarningStop" class="WarningStop" runat="server" />
<input type="hidden" id="WdCrsInclud" class="WdCrsInclud" runat="server" />
<input type="hidden" id="CensusDte" class="CensusDte" runat="server" />
<input type="hidden" id="LastWithdrawPassDte" class="LastWithdrawPassDte" runat="server" />

<div id="modal"></div>

<asp:placeholder id="plhJavaScript" Runat="server"></asp:placeholder>
<p>
	<h4>
		<asp:label id="lblCourseHeaderText" runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;&nbsp;-&nbsp;&nbsp;
		<asp:label id="lblCourseHeaderStatic" runat="server" Font-Bold="True" Visible="True"></asp:label>
	</h4>
<P></P>
<div class="pSection" id="divStudInfo" visible="True" runat="server">
	<table cellSpacing="1" cellPadding="1" width="100%">
		<tr>
			<td align="left" colSpan="5"><asp:label id="lblStudentListFor" runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;<asp:label id="lblStudentListInformation" runat="server" Font-Bold="True" Visible="True" ></asp:label>&nbsp;
			<asp:dropdownlist id="ddlbCourse" runat="server" Visible="True" AutoPostBack="True"></asp:dropdownlist>
			</td>
		</tr>
	</table>
</div>
<div class="pSection" id="divCatalog" visible="false" runat="server">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr id="trCatalog">
			<td align="left" width="207" colSpan="1"><asp:label id="lblCatalog" runat="server" Font-Bold="True" Visible="True"></asp:label><asp:label id="lblCatalogInfo" runat="server" Visible="True"></asp:label></td>
		</tr>
	</table>
</div>
<div class="pSection" id="divOthersHeaders" visible="True" runat="server">
	<table cellSpacing="3" cellPadding="3" width="100%">
		<tr>
			<td align="left" colSpan="4"><asp:label id="lblInstructors" runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;&nbsp;
				<asp:label id="lblInstructorsInfo" runat="server" Visible="True"></asp:label></td>
		</tr>
		<tr>
			<td align="left" width="2%" colSpan="4"><asp:label id="lblCrossListedCourses" runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;&nbsp;
				<asp:label id="lblCrossListedCourseInfo" runat="server" Visible="True"></asp:label></td>
		</tr>
		<tr>
			<td align="left" width="100%" colSpan="4" nowrap><asp:label id="lblCourseGradingType" runat="server" Font-Bold="True" Visible="True" ></asp:label>&nbsp;&nbsp;
				<asp:label id="lblCourseGradingTypeInfo" runat="server" Visible="True"></asp:label>&nbsp;&nbsp;
				<asp:label id="lblDefaultGrade" Runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;&nbsp;
				<asp:dropdownlist id="ddlbDefaultGrade" runat="server" Visible="True" Width="25%" AutoPostBack="True"></asp:dropdownlist>&nbsp;&nbsp;
				<jenzabar:globalizedbutton id="btnSetDefaultGrade" runat="server" Visible="True" Width="20%" TextKey="TXT_FACT_GE_SET_DEFAULT_GRADE"
					Enabled="false"></jenzabar:globalizedbutton></td>
		</tr>
		<tr>
		    <td align="left" width="100%" colspan="4" >
            	<jenzabar:hint id="hintDefaultButton" runat="server" Visible="True"></jenzabar:hint>
		    </td>
		</tr>
        <div class="pSection" id="divLDoA" visible="true" runat="server">
    		<tr>
	    	    <td align="left" width="100%" colspan="4" nowrap>
	    	    <asp:Label ID="lblDateofLastAttendance" runat="server" Font-Bold="true" Visible="true" />&nbsp;&nbsp;
		        <jenzabar:datepicker id="dpLDoA" runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" Size="12"></jenzabar:datepicker>
		        <jenzabar:globalizedbutton id="btnSetDefaultLDoA" runat="server" visible="true" width="20%" TextKey="TXT_FACT_GE_SET_LDOA" /></td>
		    </tr>
		    <tr>
		        <td align="left" width="100%" colspan="4" >
                	<jenzabar:hint id="hintLDoADefaultButton" runat="server" Visible="True"></jenzabar:hint>
	    	    </td>
    		</tr>
		</div>
		<tr>
			<td align="left" width="100%">
				<asp:label ID="lblERPCourseKey" Runat="server" Visible="False"></asp:label>
			</td>
		</tr>
	</table>
	<jenzabar:hint id="hintGradingType" runat="server" Visible="True"></jenzabar:hint>
	<jenzabar:hint id="hintDevPerformance" runat="server" Visible="False"></jenzabar:hint>
</div>
<div class="pSection" id="divClassList" runat="server">
    <jenzabar:groupedgrid id="dgClassList" Runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true" CssClass="ClassListDataGrid">
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_FERPA_RESTRICT" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Image ID="imgFERPARestriction" Runat="server" Visible="false"></asp:Image>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn ItemStyle-CssClass="StudentName" HeaderTextKey="TXT_FACT_GE_STUDENT" >
				<ItemTemplate>
    			    <asp:Label id="lblStudentName" CssClass="StudentNameLabel" runat="server" Visible="True" Text='<%#DataBinder.Eval(Container.DataItem, "StudentName")%>'></asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn ItemStyle-CssClass="StudentId" DataField="StudentID" HeaderTextKey="TXT_FACT_GE_ID" />
			<jenzabar:GlobalizedBoundColumn DataField="Graduating" HeaderTextKey="TXT_FACT_GE_GRADUATING" />
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_MIDTERM_GRADE" ItemStyle-CssClass="MidTermGradeColumn" ItemStyle-Wrap="False" 
				ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
                    <asp:LinkButton ID="lnkViewWithdrawDetailsMid" CssClass="WithdrawalDetail DisplayNone floatLeft" runat="server"><asp:Image id="imgWithdrawalDetailsMid" runat="server" /></asp:LinkButton>
					<asp:Label ID="lblCurrentMidTermGradeDisplay" Runat="server" Visible="True" Text='<%# DataBinder.Eval(Container.DataItem, "CurrentMidTermGradeDesc").ToString() %>'></asp:Label>								
					<asp:DropDownList ID="ddlbCurrentMidTerm" CssClass="MidtermGrade" Runat="server"  Visible="False" DataTextField="GradeDesc" DataValueField="GradeCode" OnChange="javascript: return ValueChanged() ;" ></asp:DropDownList>
                    <input type="hidden" id="WithdrawalGradeMid" class="WithdrawalGrade" runat="server" />
                    <asp:Label ID="lblCurrentMidTermGradeKey" Runat="server" Visible="false" Text='<%#  DataBinder.Eval(Container.DataItem, "CurrentMidTermGrade").ToString() %>'></asp:Label>								
					<asp:Label ID="lblCurrentMidTermGrade" Runat="server" CssClass="MidtermGradeLabel" Visible="False" Text='<%#DataBinder.Eval(Container.DataItem, "CurrentMidTermGradeDesc")%>'></asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_FINAL_GRADE" ItemStyle-CssClass="FinalGradeColumn" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
                    <asp:LinkButton ID="lnkViewWithdrawDetails" CssClass="WithdrawalDetail DisplayNone floatLeft" runat="server"><asp:Image id="imgWithdrawalDetails" runat="server" /></asp:LinkButton>
					<asp:Label ID="lblCurrentFinalGradeDisplay" Visible="True"  Runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "CurrentFinalGradeDesc").ToString()%>'></asp:Label>
				    <asp:DropDownList ID="ddlbCurrentFinalGrade" CssClass="FinalGrade" Visible="False" DataTextField="GradeDesc" DataValueField="GradeCode" Runat="server" OnChange="javascript: return ValueChanged() ;" ></asp:DropDownList>
                    <input type="hidden" id="WithdrawalGradeFinal" class="WithdrawalGrade" runat="server" />
					<asp:Label ID="lblCurrentFinalGradeKey" Visible="false"  Runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "CurrentFinalGrade").ToString()%>'></asp:Label>
					<asp:Label ID="lblCurrentFinalGrade" Visible="False" CssClass="FinalGradeLabel" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CurrentFinalGradeDesc")%>'></asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_GRADING_TYPE">
				<ItemTemplate>
					<asp:Label ID="lblGradeType" Width="60%" Visible="False" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "GradeTypeDesc")%>'>
					</asp:Label>
					<asp:Label ID="lblGradeTypeCode" Width="60%" Visible="False" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "GradeTypeCode")%>'>
					</asp:Label>
					<asp:Label ID="lblMidTermGradeTypeCode" Width="0%" Visible="False" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MidTermGradeTypeCode")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_LDOA">
				<ItemTemplate>
					<jenzabar:datepicker ID="dpStuLDoA" Runat="server" Visible="False" Size="12" OnChange="dpStuLDoA_DateChanged" />
                    <asp:Label ID="lblStuLDoA" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "LastDateOfAttendance")%>' />
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_ABSENCES">
				<ItemTemplate>
					<asp:TextBox ID="txtAbsences" CssClass="Absences" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "Absences")%>' OnChange="javascript: return ValueChanged() ;" />
					<asp:Label ID="lblAbsences" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "Absences")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_CLOCK_HOURS">
				<ItemTemplate>
					<asp:TextBox ID="txtClockHours" CssClass="ClockHours DisplayNone" Runat="server" Width="68%" Text='<%#DataBinder.Eval(Container.DataItem, "ClockHours")%>' OnChange="javascript: return ValueChanged() ;" />
					<asp:Label ID="lblClockHours" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "ClockHours")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderText="WithdrawalReason">
                <ItemTemplate>
                    <input type="hidden" id="withdrawalReason" runat="server" class="WithdrawalReasonText" value='<%#DataBinder.Eval(Container.DataItem, "CurrentWithdrawalReasonDefAppId")%>' />
                </ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
            <jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_DEV_PERFORMANCE_TEXT">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlbDevPerformance" CssClass="DevPerformance" Visible="False" DataTextField="GradeDesc" DataValueField="DevPerformanceAppid" Runat="server"></asp:DropDownList>
                    <asp:Label ID="lblDevPerformance" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "DevPerformanceDescr")%>'>
					</asp:Label>
                </ItemTemplate>
            </jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="ERPStudentCourseKey" HeaderText="ERPStudentCourseKey" />
			<jenzabar:GlobalizedBoundColumn DataField="RegisteredCrossListedCourse" HeaderTextKey="TXT_FACT_GE_CROSSLISTED_COURSE" />
			<jenzabar:GlobalizedBoundColumn DataField="GradeNotes" HeaderTextKey="TXT_FACT_GE_GRADE_NOTES" />
			<jenzabar:GlobalizedBoundColumn DataField="ClassCode" HeaderTextKey="TXT_CLASS" />
			<jenzabar:GlobalizedBoundColumn DataField="Division" HeaderTextKey="TXT_DIVISION" />
            <jenzabar:GlobalizedTemplateColumn HeaderText="AddToWithdrawDrop">
                <ItemTemplate>
                    <input type="hidden" id="addToWithdrawDrop" runat="server" class="AddToWithdrawDropText" value='<%#DataBinder.Eval(Container.DataItem, "AddToWithdrawDrop")%>' />
                </ItemTemplate>
            </jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderText="WithdrawalDte">
				<ItemTemplate>
					<jenzabar:datepicker ID="dpStuWD" Runat="server" Size="12" OnChange="dpStuWD_DateChanged" />
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="ExcludeFromDropLimit" HeaderText="ExcludeFromDropLimit" />
            <jenzabar:GlobalizedTemplateColumn HeaderText="NumericGrade">
                <ItemTemplate>
                    <input type="hidden" id="NumericGradeReq" runat="server" class="NumericGradeReq" value='<%#DataBinder.Eval(Container.DataItem, "NumericGradeReq")%>' />
                    <input type="hidden" id="NumericGrade" runat="server" class="NumericGrade" value='<%#DataBinder.Eval(Container.DataItem, "NumericGrade")%>' />
                </ItemTemplate>
            </jenzabar:GlobalizedTemplateColumn>
		</Columns>
	</jenzabar:groupedgrid></div>
<div class="pSection" id="divButtons" runat="server">
	<table cellSpacing="3" cellPadding="3" runat="server">
		<tr>
			<td><jenzabar:globalizedbutton ID="btnSave" CssClass="SaveButton" Runat="server" Visible="True" TextKey="TXT_FACT_GE_SAVE"></jenzabar:globalizedbutton>&nbsp;&nbsp;
				<jenzabar:globalizedbutton id="btnCancel" Runat="server" Visible="True" Width="75px" TextKey="TXT_FACT_GE_CANCEL"></jenzabar:globalizedbutton></td>
		</tr>
		<tr>
			<td>
				<asp:imagebutton id="ibPrtFriendlyRept" visible="False" runat="server"></asp:imagebutton>&nbsp;
				<asp:linkbutton id="lnkPrtFriendlyRept" visible="False" runat="server"></asp:linkbutton>
			</td>
		</tr>
		<tr>
			<td width="100%" colSpan="4"><jenzabar:hint id="lblInstructionText" runat="server" Visible="False"></jenzabar:hint></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</table>
</div>

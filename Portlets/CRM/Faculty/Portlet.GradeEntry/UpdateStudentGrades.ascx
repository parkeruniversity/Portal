<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UpdateStudentGrades.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.GradeEntryPortlet.UpdateStudentGrades" %>
<div class="pSection" id="divError" visible="False" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>
<input type="hidden" value="0" name="isChanged"> <input type="hidden" value="0" id="changeFlag" name="hiddenChangeFlag" runat="server">
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
			<td align="left" colSpan="5"><asp:label id="lblStudentListFor" runat="server" Font-Bold="True" Visible="True"></asp:label>&nbsp;<asp:label id="lblStudentListInformation" runat="server" Font-Bold="True" Visible="True" Width="55%"></asp:label>&nbsp;&nbsp;
				<asp:dropdownlist id="ddlbCourse" runat="server" Visible="True" Width="40%" AutoPostBack="True"></asp:dropdownlist></td>
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
</div>
<div class="pSection" id="divClassList" runat="server"><jenzabar:groupedgrid id="dgClassList" Runat="server" DataKeyField="ERPCourseKey" RenderTableHeaders="true">
		<Columns>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_FERPA_RESTRICT" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Image ID="imgFERPARestriction" Runat="server" Visible="false"></asp:Image>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="StudentName" HeaderTextKey="TXT_FACT_GE_STUDENT" ItemStyle-Wrap="False" />
			<jenzabar:GlobalizedBoundColumn DataField="StudentID" HeaderTextKey="TXT_FACT_GE_ID" />
			<jenzabar:GlobalizedBoundColumn DataField="Graduating" HeaderTextKey="TXT_FACT_GE_GRADUATING" />
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_MIDTERM_GRADE" ItemStyle-Wrap="False" 
 ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<table cellSpacing="1" cellPadding="1" width="100%" >
						<tr id="midtermrow" runat="server">
							<td align="left" nowrap width="50%" >
								<asp:Label ID="lblCurrentMidTermGradeDisplay" Runat="server" Visible="True" Text='<%#  DisplayUpdate(DataBinder.Eval(Container.DataItem, "CurrentMidTermGradeDesc").ToString()) %>'>
								</asp:Label>								
							</td>							
							<td align="right" nowrap width="50%">
								<asp:DropDownList ID="ddlbCurrentMidTerm" Runat="server" Visible="False" DataSource='<%#DataBinder.Eval(Container.DataItem, "AvailableMidtermGrades")%>' DataTextField="GradeDesc" DataValueField="GradeCode" OnChange="javascript: return ValueChanged() ;" >
								</asp:DropDownList>
							</td>
							<td align="left" nowrap width="50%" >
								<asp:Label ID="lblCurrentMidTermGradeKey" Runat="server" Visible="false" Text='<%#  DisplayUpdate(DataBinder.Eval(Container.DataItem, "CurrentMidTermGrade").ToString()) %>'>
								</asp:Label>								
							</td>																			
						</tr>
					</table>
					<asp:Label ID="lblCurrentMidTermGrade" Runat="server" Visible="False" Text='<%#DataBinder.Eval(Container.DataItem, "CurrentMidTermGradeDesc")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_FINAL_GRADE" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<table cellSpacing="1" cellPadding="1" width="100%">
						<tr id="FinalTermRow" runat="server">
							<td align="left" nowrap width="50%">
								<asp:Label ID="lblCurrentFinalGradeDisplay" Visible="True" Runat="server" Text= '<%# DisplayUpdate(DataBinder.Eval(Container.DataItem, "CurrentFinalGradeDesc").ToString())%>'>
								</asp:Label>								
							</td>
							<td align="right" nowrap width="50%">
								<asp:DropDownList ID="ddlbCurrentFinalGrade" Visible="False" DataSource='<%#DataBinder.Eval(Container.DataItem, "AvailableFinalGrades")%>' DataTextField="GradeDesc" DataValueField="GradeCode" Runat="server" OnChange="javascript: return ValueChanged() ;" >
								</asp:DropDownList>
							</td>
							<td align="left" nowrap width="50%">
								<asp:Label ID="lblCurrentFinalGradeKey" Visible="false" Runat="server" Text= '<%# DisplayUpdate(DataBinder.Eval(Container.DataItem, "CurrentFinalGrade").ToString())%>'>
								</asp:Label>								
							</td>
						</tr>
					</table>
					<asp:Label ID="lblCurrentFinalGrade" Visible="False" Runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CurrentFinalGradeDesc")%>'>
					</asp:Label>
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
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_ABSENCES">
				<ItemTemplate>
					<asp:TextBox ID="txtAbsences" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "Absences")%>' OnChange="javascript: return ValueChanged() ;" />
					</asp:TextBox>
					<asp:Label ID="lblAbsences" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "Absences")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_FACT_GE_CLOCK_HOURS">
				<ItemTemplate>
					<asp:TextBox ID="txtClockHours" Runat="server" Visible="False" Width="68%" Text='<%#DataBinder.Eval(Container.DataItem, "ClockHours")%>' OnChange="javascript: return ValueChanged() ;" />
					<asp:Label ID="lblClockHours" Runat="server" Visible="False" Width="60%" Text='<%#DataBinder.Eval(Container.DataItem, "ClockHours")%>'>
					</asp:Label>
				</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
			<jenzabar:GlobalizedBoundColumn DataField="RegisteredCrossListedCourse" HeaderTextKey="TXT_FACT_GE_CROSSLISTED_COURSE" />
			<jenzabar:GlobalizedBoundColumn DataField="GradeNotes" HeaderTextKey="TXT_FACT_GE_GRADE_NOTES" />
			<jenzabar:GlobalizedBoundColumn DataField="ERPStudentCourseKey" Visible="False" />
			<jenzabar:GlobalizedBoundColumn DataField="ClassCode" HeaderTextKey="TXT_CLASS" />
		</Columns>
	</jenzabar:groupedgrid></div>
<div class="pSection" id="divButtons" runat="server">
	<table cellSpacing="3" cellPadding="3" runat="server">
		<tr>
			<td><jenzabar:globalizedbutton id="btnSave" Runat="server" Visible="True" Width="75px" TextKey="TXT_FACT_GE_SAVE"></jenzabar:globalizedbutton>&nbsp;&nbsp;
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

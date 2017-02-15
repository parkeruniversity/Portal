<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ErpGradeEntryGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.ErpGradeEntryGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<div class="pSection" id="divError" visible="False" runat="server"><common:errordisplay id="ctlError" RunAt="server" /><common:Hint id="ctlHint" runat="server" visible=""></common:Hint></div>
<style>

</style>
<asp:Literal ID="litJavascript" Runat="server" />
<SCRIPT language="javascript">

function checkAll(object, repeater) {
    var inputs = document.getElementsByTagName("input");
    var val = document.getElementById(object);
    for (var i=0; i<inputs.length; i++)
    {
    var exclude = inputs[i].id.indexOf("cbSelect");
    var include2 = inputs[i].id.indexOf(repeater);
    var sub = repeater.toString().indexOf("Submitted");
        if (inputs[i].type == "checkbox" && exclude == -1 && include2 != -1)
        {
           if ((sub == -1 && inputs[i].id.indexOf("Submitted") == -1) || (sub != -1 && inputs[i].id.indexOf("Submitted") != -1))
            {inputs[i].checked = val.checked;}
        }
    }
}
function showHideForm(obj, anchor) {
	oDiv = document.getElementById(obj);
	hideForm();
	//window.alert(anchor);
	var divAnchor = document.getElementById(anchor);
	//window.alert(divAnchor);
	var xlocation = findPos(divAnchor)[0];
	var ylocation = findPos(divAnchor)[1];

    moveIt(obj, ylocation - 25, xlocation - 25);
	if(oDiv.style.display=='block')
	{
		oDiv.style.display='none';
		return false;
	}
	else
	{
		oDiv.style.display='block';
		return false;
	}
}


function hideForm(){
    var inputs = document.getElementsByTagName("div");
    for (var i=0; i<inputs.length; i++)
    {
        var exclude = inputs[i].id.indexOf("divData");
        if (exclude != -1)
        {
				inputs[i].style.display = 'none';
        }
    }

    for (var i=0; i<inputs.length; i++)
    {
        var exclude = inputs[i].id.indexOf("divAbsences");
        if (exclude != -1)
        {
				inputs[i].style.display = 'none';
        }
    }
    for (var i=0; i<inputs.length; i++)
    {
        var exclude = inputs[i].id.indexOf("divLDOA");
        if (exclude != -1)
        {
				inputs[i].style.display = 'none';
        }
    }

}
function moveIt(obj, mvTop, mvLeft) {
oDiv = document.getElementById(obj);
	oDiv.style.position = "absolute";
	oDiv.style.top = mvTop;
	oDiv.style.left = mvLeft;
}


function findPos(obj) {
	var curleft = 0;
    var curtop = 0;
    if (obj.offsetParent) {
	    curleft = obj.offsetLeft;
	    curtop = obj.offsetTop;
		while (obj = obj.offsetParent) {
		    curleft += obj.offsetLeft;
		    curtop += obj.offsetTop;
		}
	}
	return [curleft,curtop];
}

</SCRIPT>
<DIV id="Layer1">
	<TABLE width="100%">
		<TR>
			<TD noWrap align="right" width="15%"><common:GlobalizedLabel LabelKey="TXT_COURSE" runat="server" /></TD>
			<TD align="left"><B><asp:Literal id="litCourseName" Runat="server"></asp:Literal></B></TD>
		</TR>
		<TR>
			<TD noWrap align="right" width="15%"><common:GlobalizedLabel LabelKey="TXT_INSTRUCTOR(S)" runat="server" /></TD>
			<TD align="left"><B><asp:Literal id="litInstructors" Runat="server"></B></asp:Literal></TD>
		</TR>
		<tr>
			<td width="15%" align="right" nowrap><common:GlobalizedLabel LabelKey="TXT_GRADING_TYPE" runat="server" /></td>
			<td align="left"><b><asp:Literal ID="litGradingType" Runat="server"></asp:Literal></b></td>
		</tr>
	</TABLE>
	<common:contenttabgroup id="DefaultPageTabs" runat="server">
		<common:ContentTab id="tabMidtermGrades" runat="Server">
			<div id="divNYSMid" style="MARGIN-BOTTOM: 3px" runat="server" visible="true" width="100%">
				<table width="100%">
					<tr>
						<td width="75%">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr align="left" class="TableStyle">
									<td colspan="6" id="Th2104" runat="server" class="BottomLeftDarkerGray">
										<b><common:globalizedliteral id="Globalizedliteral6" textKey="TXT_GRADEBOOK_NOT_YET_SUBMITTED" runat="Server" /></b>
									</td>
								</tr>
								<TR class="TableStyle">
									<TD id="Th210" runat="server" class="BottomLeftDarkGray">
										<asp:CheckBox ID="cbSelectAllMid" Runat="server"></asp:CheckBox>
									</TD>
									<TD id="Th1" runat="server" class="BottomLeftDarkGray">
										&nbsp;
									</TD>
									<TD id="Th211" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral111" textKey="TXT_GRADEBOOK_STUDENT_NAME" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="Th215" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral115" textKey="TXT_GRADEBOOK_MIDTERM_GRADE" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="colMidtermAbsencesHeader" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral116" textKey="TXT_GRADEBOOK_ABSENCES" runat="Server"></common:globalizedliteral>
									</TD>
									<TD runat="server" class="BottomLeftDarkGray" id="colMidtermLDOAHeader">
										<common:globalizedliteral id="Globalizedliteral117" textKey="TXT_GRADEBOOK_LAST_DATE_OF_ATTENDANCE" runat="Server"></common:globalizedliteral>
									</TD>
								</TR>
								<asp:Repeater id="rptMidtermGrade" runat="server">
									<ItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeft">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeft">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeft" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" />
											</td>
											<td class="BottomLeft" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeft" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeft" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server" />
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeftLightGray">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeftLightGray">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeftLightGray" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeftLightGray" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</AlternatingItemTemplate>
									<FooterTemplate>
										<tr>
											<td colspan="10" align="left" class="BackgroundDarkGray">
												<asp:Button ID="butSubmitMidterm" Runat="server"></asp:Button>
											</td>
										</tr>
									</FooterTemplate>
								</asp:Repeater>
							</TABLE>
						</td>
						<td width="2%">&nbsp;</td>
						<td width="23%" valign="top">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr>
									<td class="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/nys-green_check.gif" /></td>
									<td class="BackgroundLightGray" valign="top"><b>
											<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_READY_TO_SUBMIT" ID="Globalizedliteral2" /></b></td>
								</tr>
								<tr>
									<td class="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/nys-red_excl.gif" /></td>
									<td class="BackgroundLightGray" valign="top">
										<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_NEEDS_INPUT" ID="Globalizedliteral3" /></td>
								</tr>
							</TABLE>
						</td>
					</tr>
				</table>
			</div>
			<br>
			<br>
			<div id="divSubmittedMid" style="MARGIN-BOTTOM: 3px" runat="server" visible="true" width="100%">
				<table width="100%">
					<tr>
						<td width="75%">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr align="left" class="TableStyle">
									<td colspan="6" id="Th2104345" runat="server" class="BottomLeftDarkerGray"><b>
											<common:globalizedliteral id="Globalizedliteral6345" textKey="TXT_GRADEBOOK_SUBMITTED" runat="Server"></common:globalizedliteral></b></td>
								</tr>
								<TR class="TableStyle">
									<TD id="Th210345" runat="server" class="BottomLeftDarkGray">
										<asp:CheckBox ID="cbSelectAllMidSubmitted" Runat="server"></asp:CheckBox>
									</TD>
									<TD id="Th1345" runat="server" class="BottomLeftDarkGray">
										&nbsp;
									</TD>
									<TD id="Th211345" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral111345" textKey="TXT_GRADEBOOK_STUDENT_NAME" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="Th215345" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral115345" textKey="TXT_GRADEBOOK_MIDTERM_GRADE" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="colMidtermSubmittedAbsencesHeader" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral116345" textKey="TXT_GRADEBOOK_ABSENCES" runat="Server"></common:globalizedliteral>
									</TD>
									<TD runat="server" class="BottomLeftDarkGray" id="colMidtermSubmittedLDOAHeader">
										<common:globalizedliteral id="Globalizedliteral117345" textKey="TXT_GRADEBOOK_LAST_DATE_OF_ATTENDANCE" runat="Server"></common:globalizedliteral>
									</TD>
								</TR>
								<asp:Repeater id="rptMidtermGradeSubmitted" runat="server">
									<ItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeft">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeft">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																	)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeft" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" nowrap />
											</td>
											<td class="BottomLeft" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeft" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeft" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeftLightGray">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeftLightGray" >
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeftLightGray" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeftLightGray" id="colLDOA" runat="server" >
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</AlternatingItemTemplate>
									<FooterTemplate>
										<tr>
											<td colspan="10" align="left" class="BackgroundDarkGray">
												<asp:Button ID="butSubmitMidtermSubmitted" Runat="server"></asp:Button>
											</td>
										</tr>
									</FooterTemplate>
								</asp:Repeater>
							</TABLE>
						</td>
						<td width="2%">&nbsp;</td>
						<td width="23%" valign="top">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle" id="tblMidtermMessage" runat="server">
								<tr>
									<td class="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/as-yellow_excl.gif" /></td>
									<td class="BackgroundLightGray" valign="top">
										<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_GRADE_CHANGED" ID="Globalizedliteral1" /></td>
								</tr>
							</TABLE>
						</td>
					</tr>
				</table>
			</div>
		</common:ContentTab>
		<common:ContentTab id="tabFinalGrades" runat="Server">
			<div id="divNYSFinal" style="MARGIN-BOTTOM: 3px" runat="server" visible="true" width="100%">
				<table width="100%">
					<tr>
						<td width="75%">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr align="left" class="TableStyle">
									<td colspan="6" id="Th21304" runat="server" class="BottomLeftDarkerGray"><b>
											<common:globalizedliteral id="Globalizedliteral63" textKey="TXT_GRADEBOOK_NOT_YET_SUBMITTED" runat="Server"></common:globalizedliteral></b></td>
								</tr>
								<TR class="TableStyle">
									<TD runat="server" class="BottomLeftDarkGray">
										<asp:CheckBox ID="cbSelectAllFinal" Runat="server"></asp:CheckBox>
									</TD>
									<TD runat="server" class="BottomLeftDarkGray">
										&nbsp;
									</TD>
									<TD runat="server"  class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral11341" textKey="TXT_GRADEBOOK_STUDENT_NAME" runat="Server"></common:globalizedliteral>
									</TD>
									<TD runat="server"  class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral13415" textKey="TXT_GRADEBOOK_FINAL_GRADE" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="colFinalAbsencesHeader" runat="server"  class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral13416" textKey="TXT_GRADEBOOK_ABSENCES" runat="Server"></common:globalizedliteral>
									</TD>
									<TD runat="server"  class="BottomLeftDarkGray" id="colFinalLDOAHeader">
										<common:globalizedliteral id="Globalizedliteral34517" textKey="TXT_GRADEBOOK_LAST_DATE_OF_ATTENDANCE" runat="Server"></common:globalizedliteral>
									</TD>
								</TR>
								<asp:Repeater id="rptFinalGrade" runat="server">
									<ItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeft">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeft">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeft" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" nowrap />
											</td>
											<td class="BottomLeft" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeft" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeft" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeftLightGray">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeftLightGray" >
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																	)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeftLightGray" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colGrades" runat="server" >
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeftLightGray" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</AlternatingItemTemplate>
									<FooterTemplate>
										<tr>
											<td colspan="10" align="left" class="BackgroundDarkGray">
												<asp:Button ID="butSubmitFinal" Runat="server"></asp:Button>
											</td>
										</tr>
									</FooterTemplate>
								</asp:Repeater>
							</TABLE>
						</td>
						<td width="2%">&nbsp;</td>
						<td width="23%" valign="top">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr>
									<td class="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/nys-green_check.gif" /></td>
									<td class="BackgroundLightGray" valign="top"><b>
											<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_READY_TO_SUBMIT" ID="Globalizedliteral24324" /></b></td>
								</tr>
								<tr>
									<td class="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/nys-red_excl.gif" /></td>
									<td class="BackgroundLightGray" valign="top">
										<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_NEEDS_INPUT" ID="Globalizedliteral33453" /></td>
								</tr>
							</TABLE>
						</td>
					</tr>
				</table>
			</div>
			<br>
			<br>
			<div id="divSubmittedFinal" style="MARGIN-BOTTOM: 3px" runat="server" visible="true"
				width="100%">
				<table width="100%">
					<tr>
						<td width="75%">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle">
								<tr align="left" class="TableStyle">
									<td colspan="6" id="Td1" runat="server" class="BottomLeftDarkerGray"><b>
											<common:globalizedliteral id="Globalizedliteral5" textKey="TXT_GRADEBOOK_SUBMITTED" runat="Server"></common:globalizedliteral></b></td>
								</tr>
								<TR class="TableStyle">
									<TD id="Th3" runat="server" class="BottomLeftDarkGray">
										<asp:CheckBox ID="cbSelectAllFinalSubmitted" Runat="server"></asp:CheckBox>
									</TD>
									<TD id="Th2" runat="server" class="BottomLeftDarkGray">
										&nbsp;
									</TD>
									<TD id="Th4" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral7" textKey="TXT_GRADEBOOK_STUDENT_NAME" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="Th5" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral8" textKey="TXT_GRADEBOOK_FINAL_GRADE" runat="Server"></common:globalizedliteral>
									</TD>
									<TD id="colFinalSubmittedAbsencesHeader" runat="server" class="BottomLeftDarkGray">
										<common:globalizedliteral id="Globalizedliteral9" textKey="TXT_GRADEBOOK_ABSENCES" runat="Server"></common:globalizedliteral>
									</TD>
									<TD runat="server" class="BottomLeftDarkGray" id="colFinalSubmittedLDOAHeader">
										<common:globalizedliteral id="Globalizedliteral10" textKey="TXT_GRADEBOOK_LAST_DATE_OF_ATTENDANCE" runat="Server"></common:globalizedliteral>
									</TD>
								</TR>
								<asp:Repeater id="rptFinalGradeSubmitted" runat="server">
									<ItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeft">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeft">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeft" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" nowrap />
											</td>
											<td class="BottomLeft" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeft" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeft" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<tr id="trRow" runat="Server" class="TableStyle">
											<td class="BottomLeftLightGray">
												<asp:CheckBox ID="cbSubmit" Runat="server" />
											</td>
											<td class="BottomLeftLightGray">
												<asp:Image id="imgMatch" runat="server" class="hand" />
												<div runat="server" id="divData">
													<table>
														<tr>
															<td align="left">
																<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfoDiv" runat="server" /></td>
															<td align="right">
																<asp:Image id="imgCancel" onclick="hideForm();" Runat="server" class="hand" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><i>(
																	<asp:literal ID="litGradeType" Runat="server" />,
																	<asp:literal ID="litClockHours" Runat="server" />
																)</i></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litCommonMessageLine" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2"><b>
																	<asp:Literal ID="litMessageLineTwo" Runat="server" /></b></td>
														</tr>
														<tr>
															<td colspan="2">
																<asp:Literal ID="litMessageLineThree" Runat="server" /></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="BottomLeftLightGray" nowrap>
												<framework:MyInfoPopup ClickableName="false" NameFormat="LastNameFirst" id="MyInfo" runat="server" nowrap />
											</td>
											<td class="BottomLeftLightGray" id="colGrades" runat="server">
												<asp:DropDownList id="ddlGrades" runat="server" />
											</td>
											<td class="BottomLeftLightGray" id="colAbsences" runat="server">
												<asp:TextBox ID="tbAbsences" Runat="server" Visible="true" Width="24" />
											</td>
											<td class="BottomLeftLightGray" id="colLDOA" runat="server">
												<common:datepicker id="dpLastDate" runat="Server"></common:datepicker>
											</td>
											<td visible="false">
												<asp:Literal ID="litDateSubmitted" Runat="server" />
												<asp:literal id="litERPCourseKey" runat="server" />
												<asp:literal id="litERPStudentCourseKey" runat="server" />
												<asp:Literal ID="litGBKAbsences" Runat="server" />
												<asp:Literal ID="litGBKLDoA" Runat="server" />
												<asp:Literal ID="litGBKGrade" Runat="server" />
											</td>
										</tr>
									</AlternatingItemTemplate>
									<FooterTemplate>
										<tr>
											<td colspan="10" align="left" color="BackgroundDarkGray">
												<asp:Button ID="butSubmitFinalSubmitted" Runat="server"></asp:Button>
											</td>
										</tr>
									</FooterTemplate>
								</asp:Repeater>
							</TABLE>
						</td>
						<td width="2%">&nbsp;</td>
						<td width="23%" valign="top">
							<TABLE cellSpacing="0" cellPadding="5" width="100%" class="TableStyle" id="tblFinalMessage" runat="server">
								<tr>
									<td color="BackgroundLightGray" valign="top"><img src="UI/Common/Images/PortletImages/Icons/as-yellow_excl.gif" /></td>
									<td color="BackgroundLightGray" valign="top">
										<common:globalizedliteral runat="server" TextKey="TXT_GRADEBOOK_GRADE_CHANGED" ID="Globalizedliteral4" /></td>
								</tr>
							</TABLE>
						</td>
					</tr>
				</table>
			</div>
		</common:ContentTab>
	</common:contenttabgroup>
